from db import db
from flask import Flask, request
import json
from db import Tracker, Day, CustomRecord, Template
import os


app = Flask(__name__)
db_filename = "track.db"

app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///%s" % db_filename
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["SQLALCHEMY_ECHO"] = True

db.init_app(app)
with app.app_context():
    db.create_all()


def success_response(data, code=200):
    return json.dumps({"success": True, "data": data}), code


def failure_response(message, code=404):
    return json.dumps({"success": False, "error": message}), code


@app.route("/api/trackers/")
def get_all_trackers():
    return success_response([t.serialize() for t in Tracker.query.all()])


@app.route("/api/trackers/", methods=["POST"])
def create_tracker():
    body = json.loads(request.data)
    name = body.get('name')
    templateName = body.get('templateName')
    templateType = body.get('templateType')
    new_tracker = Tracker(name=name)
    template = Template(templateName=templateName,
                        templateType=templateType, tracker_id=new_tracker.id)
    if name is None:
        return failure_response("Name not provided.")

    db.session.add(new_tracker)
    db.session.commit()
    return success_response(new_tracker.serialize())


@app.route("/api/trackers/<int:tracker_id>/")
def get_tracker(tracker_id):
    tracker = Tracker.query.filter_by(id=tracker_id).first()
    if tracker is None:
        return failure_response("Tracker not found.")
    return success_response(tracker.serialize())


@app.route("/api/trackers/<int:tracker_id>/", methods=["DELETE"])
def delete_tracker(tracker_id):
    tracker = Tracker.query.filter_by(id=tracker_id).first()
    if tracker is None:
        failure_response("Tracker not found.")
    db.session.delete(tracker)
    db.session.commit()
    return success_response(tracker.serialize())


@app.route("/api/record/<int:record_id>/")
def get_record(record_id):
    record = CustomRecord.query.filter_by(id=record_id).first()
    if record is None:
        return failure_response("Record not found.")
    return success_response(record.serialize())

# add multiple records to a tracker
# needs more debugging
@app.route("/api/trackers/add/", methods=["POST"])
def add_record_to_tracker():
    body = json.loads(request.data)
    try:
        tracker_id = body.get('tracker_id')
        date = body.get('date')
        # array of details (name, type, value)
        details = body.get('details')
    except:
        return failure_response("information not enough.")
    tracker = Tracker.query.filter_by(id=tracker_id).first()
    if tracker is None:
        return failure_response("tracker not found.")
    day = Day.query.filter_by(tracker_id=tracker_id, date=date).first()
    if day is None:
        day = Day(date=date, tracker_id=tracker_id)
        db.session.add(day)
    for detail in details:
        detailName = detail.get('detailName')
        detailType = detail.get('detailType')
        detailValue = detail.get('detailValue')
        detail = CustomRecord(detailName=detailName, detailType=detailType,
                              detailValue=detailValue, day_id=day.id)
        db.session.add(detail)
        day.records.append(detail)

    templateName = body.get('templateName')
    templateType = body.get('templateType')
    if templateName == None and templateType == None:
        db.session.commit()
        return success_response(tracker.serialize())
    # template provided
    template = Template(templateName=templateName, templateType=templateType,
                        tracker_id=tracker_id)
    db.session.add(template)
    tracker.template.append(template)
    db.session.commit()
    return success_response(tracker.serialize())


@app.route("/api/record/<int:record_id>/", methods=["DELETE"])
def delete_record_from_tracker(record_id):
    record = CustomRecord.query.filter_by(id=record_id).first()
    if record is None:
        failure_response("Record not found.")
    db.session.delete(record)
    db.session.commit()
    return success_response(record.serialize())


@app.route("/api/day/<string:date>/")
def get_day_records(date):
    days = Day.query.filter_by(date=date).all()
    if days == []:
        return failure_response("No records found from "+date)
    data = []
    for d in days:
        data.append(d.serialize2())
    return success_response(data)


@app.route("/api/trackers/<int:tracker_id>/day/<string:date>/")
def get_day_records_from_tracker(tracker_id, date):
    days = Day.query.filter_by(tracker_id=tracker_id, date=date).all()
    if days == []:
        return failure_response("No records found from "+date)
    data = []
    for d in days:
        data.append(d.serialize())
    return success_response(data)


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
