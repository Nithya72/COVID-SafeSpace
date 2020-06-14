from flask import Flask, render_template, request
from rating import ratingLogic
from rating import storesList
app = Flask(__name__)


@app.route("/storesList/<category>")
def stores_list(category):
    catString = storesList.storesListings(category)
    return render_template("stores.html", title="Stores List", catString=catString)

@app.route("/")
def home():
    return render_template("index.html", title='Home', noHomePageLink=True)

if __name__ == '__main__':
    app.run()
