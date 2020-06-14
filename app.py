from flask import Flask, render_template, request
from rating import ratingLogic
from rating import storesList
app = Flask(__name__)

@app.route("/rating")
def rating():
    return render_template("rating.html")

@app.route("/safetyratings", methods=['POST'])
def safetyratings():
    dist = request.form['dist']
    sanitize = request.form['sanitize']
    avail = request.form['avail']
    precaution = request.form['precaution']
    density = request.form['density']
    specialhr = request.form['specialhr']
    aisle = request.form['aisle']

    ratingform = [["dist", dist], ["sanitize",sanitize], ["avail",avail], ["precaution",precaution], ["density",density], ["specialhr",specialhr], ["aisle",aisle]]

    stores = ratingLogic.processRatings(ratingform)
    return render_template("index.html", title='Home', noHomePageLink=True)


@app.route("/storesList/<category>")
def stores_list(category):
    stores = storesList.storesListings(category)
    return render_template("stores.html", title="Stores List", stores=stores)

@app.route("/")
def home():
    return render_template("index.html", title='Home', noHomePageLink=True)

if __name__ == '__main__':
    app.run()
