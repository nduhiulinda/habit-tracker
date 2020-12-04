from db import db
from flask import Flask, request
import json
from db import Tracker, Day, CustomRecord
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
    if name is None:
        return failure_response("Name not provided.")
    new_tracker = Tracker(name=name)
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


@app.route("/api/trackers/add/", methods=["POST"])
def add_record_to_tracker():
    body = json.loads(request.data)
    try:
        tracker_id = body.get('tracker_id')
        date = body.get('date')
        detailName = body.get('detailName')
        detailType = body.get('detailType')
        detailValue = body.get('detailValue')
    except:
        return failure_response("information not enough.")
    tracker = Tracker.query.filter_by(id=tracker_id).first()
    if tracker is None:
        return failure_response("tracker not found.")
    day = Day.query.filter_by(tracker_id=tracker_id, date=date).first()
    if day is None:
        day = Day(date=date, tracker_id=tracker_id)
        db.session.add(day)
    detail = CustomRecord(detailName=detailName, detailType=detailType, detailValue=detailValue, day_id=day.id)
    db.session.add(detail)
    day.records.append(detail)
    db.session.commit()
    return success_response(tracker.serialize())


if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(host='0.0.0.0', port=port)