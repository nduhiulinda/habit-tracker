from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


class Tracker(db.Model):
    __tablename__ = "tracker"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, nullable=False)
    template = db.relationship("Template", cascade="delete")
    days = db.relationship("Day", back_populates="tracker", cascade="delete")

    def __init__(self, **kwargs):
        self.name = kwargs.get('name')

    def serialize(self):
        if self.template == []:
            template = []
        else:
            template = self.template[len(self.template)-1].serialize()
        return {
            'id': self.id,
            'name': self.name,
            'template': template,
            'days': [d.serialize() for d in self.days]
        }


class Day(db.Model):
    __tablename__ = 'day'
    id = db.Column(db.Integer, primary_key=True)
    date = db.Column(db.String, nullable=False)
    tracker_id = db.Column(db.Integer, db.ForeignKey('tracker.id'))
    records = db.relationship(
        "CustomRecord", back_populates="day", cascade="delete")
    tracker = db.relationship('Tracker', back_populates="days")

    def __init__(self, **kwargs):
        self.date = kwargs.get('date')
        self.tracker_id = kwargs.get('tracker_id')

    def serialize(self):
        return {
            'date': self.date,
            'records': [r.serialize() for r in self.records],
        }

    def serialize2(self):
        return {
            'date': self.date,
            'tracker': self.tracker.name,
            'records': [r.serialize() for r in self.records],
        }


class CustomRecord(db.Model):
    __tablename__ = 'customrecord'
    id = db.Column(db.Integer, primary_key=True)
    detailName = db.Column(db.String, nullable=False)
    detailType = db.Column(db.String, nullable=False)
    detailValue = db.Column(db.String, nullable=False)
    day_id = db.Column(db.Integer, db.ForeignKey('day.id'))
    day = db.relationship('Day', back_populates="records", cascade="delete")

    def __init__(self, **kwargs):
        self.detailName = kwargs.get('detailName')
        self.detailType = kwargs.get('detailType')
        self.detailValue = kwargs.get('detailValue')
        self.day_id = kwargs.get('day_id')

    def serialize(self):
        return {
            'detailName': self.detailName,
            'detailType': self.detailType,
            'detailValue': self.detailValue,
        }


class Template(db.Model):
    __tablename__ = 'template'
    id = db.Column(db.Integer, primary_key=True)
    templateName = db.Column(db.String, nullable=False)
    templateType = db.Column(db.String, nullable=False)
    tracker_id = db.Column(db.Integer, db.ForeignKey('tracker.id'))

    def __init__(self, **kwargs):
        self.templateName = kwargs.get('templateName')
        self.templateType = kwargs.get('templateType')
        self.tracker_id = kwargs.get('tracker_id')

    def serialize(self):
        return {
            'templateName': self.templateName,
            'templateType': self.templateType
        }
