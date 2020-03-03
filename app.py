import os

from flask import Flask
from flask import render_template
from flask import request
from flask_script import Manager
from flask_migrate import Migrate, MigrateCommand

from flask_sqlalchemy import SQLAlchemy

project_dir = os.path.dirname(os.path.abspath(__file__))
database_file = "sqlite:///{}".format(os.path.join(project_dir, "cruddatabase.db"))

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = database_file

db = SQLAlchemy(app)
migrate = Migrate(app, db)

manager = Manager(app)
manager.add_command('db', MigrateCommand)

class Crud(db.Model):
    name = db.Column(db.String(80), unique=True, nullable=False, primary_key=True)
    color = db.Column(db.String(80))
    animals = db.Column(db.String(80))

    def __repr__(self):
        return "<Title: {}>".format(self.title)

@app.route("/", methods=["GET", "POST"])
def home():
#   return "My flask app" # first version
    if request.form:
        crud = Crud(name=request.form.get("name"),
	color=request.form.get("color"),
	animals=request.form.get("animals"))
        db.session.add(crud)
        db.session.commit()
    people = Crud.query.all()
    return render_template("home.html", people=people)
  
if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=80)
