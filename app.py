from flask import Flask, render_template, request, jsonify, redirect, url_for
from flaskext.mysql import MySQL
from rating import storesList
# import mysql.connector

app = Flask(__name__)

app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'nursery'
app.config['MYSQL_DATABASE_DB'] = 'places'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'

mysql = MySQL()
mysql.init_app(app)

@app.route("/rating/<category>/<store_id>")
def rating(category, store_id):
    return render_template("rating.html", category=category, store_id=store_id)

@app.route("/safetyratings", methods=['POST'])
def safetyratings():
    store_id = request.form['store_id']
    category = request.form['category']
    ft_dist = request.form['ft_dist']
    cart_sanitize = request.form['cart_sanitize']
    gm_precautions = request.form['gm_precautions']
    ess_avail = request.form['ess_avail']
    density_control = request.form['density_control']
    overall_rating = request.form['overall_rating']
    ratingform = [["ft_dist", ft_dist], ["cart_sanitize",cart_sanitize], ["gm_precautions",gm_precautions], ["ess_avail",ess_avail], ["density_control",density_control], ["overall_rating",overall_rating]]

    print(ratingform)

    if density_control == 'yes':
        overall_rating = float(overall_rating) * 1.05
        if overall_rating > 5:
            overall_rating = 5

    print("store_id",store_id)

    insert_sql = "INSERT INTO ratings (store_id, ft_dist, cart_sanitize, gm_precautions, ess_avail, density_control, overall_rating) VALUES (%s, %s, %s, %s, %s, %s, %s)"
    conn = mysql.connect()
    cursor = conn.cursor()
    cursor.execute(insert_sql, (store_id, ft_dist, cart_sanitize, gm_precautions, ess_avail, density_control, overall_rating))
    cursor.close()
    conn.commit()
    conn.close()

    return redirect(url_for('stores_list', category=category))


@app.route("/storesList/<category>")
def stores_list(category):
    print (category)
    conn = mysql.connect()
    cursor = conn.cursor()
    cursor.execute('''SELECT * FROM Stores WHERE category = %s''', category)
    stores = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template("stores.html", title="Stores List", stores=stores)

@app.route("/")
def home():
    return render_template("index.html", title='Home', noHomePageLink=True)

if __name__ == '__main__':
    app.run()
