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
    if category == "Restaurants":
        return render_template("resturant_rating.html", category=category, store_id=store_id)
    elif category == "Department Stores_Grocery":
        return render_template("grocery_rating.html", category=category, store_id=store_id)
    else:
        return render_template("grocery_rating.html", category=category, store_id=store_id)


@app.route("/safetyratings", methods=['POST'])
def safetyratings():
    store_id = request.form['store_id']
    category = request.form['category']

    ft_dist = request.form['ft_dist']
    gm_precautions = request.form['gm_precautions']
    density_control = request.form['density_control']
    overall_rating = request.form['overall_rating']
    transport_mode = request.form['transport_mode']

    cart_sanitize = None
    ess_avail = None
    curbside_pickup = None
    table_sanitize = None

    if category == "Restaurants":
        table_sanitize = request.form['table_sanitize']
        curbside_pickup = request.form['curbside_pickup']
    else:
        cart_sanitize = request.form['cart_sanitize']
        ess_avail = request.form['ess_avail']

    ratingform = [["ft_dist", ft_dist], ["cart_sanitize",cart_sanitize], ["gm_precautions",gm_precautions], ["ess_avail",ess_avail], ["density_control",density_control],
                  ["overall_rating",overall_rating], ["transport_mode",transport_mode], ["curbside_pickup",curbside_pickup], ["table_sanitize",table_sanitize]]

    print(ratingform)

    if density_control == 'yes':
        overall_rating = float(overall_rating) * 1.05
        if overall_rating > 5:
            overall_rating = 5

    print("store_id", store_id)

    try:
        insert_sql = "INSERT INTO ratings (store_id, ft_dist, cart_sanitize, gm_precautions, ess_avail, density_control, overall_rating, table_sanitize, curbside_pickup) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)"
        conn = mysql.connect()
        cursor = conn.cursor()
        cursor.execute(insert_sql, (store_id, ft_dist, cart_sanitize, gm_precautions, ess_avail, density_control, overall_rating, table_sanitize, curbside_pickup))
        conn.commit()

        select_sql = "SELECT * FROM Ratings WHERE store_id = %s ORDER BY rating_id DESC"
        cursor.execute(select_sql, store_id)

        # Fetching latest 5 records to re-calulate rating average
        rating_data = cursor.fetchmany(5)
        rating = 0
        count = 0
        sd_rating = 0
        precaution_rating = 0

        for row in rating_data:
            # print(row)
            rating = rating+row[2]
            sd_rating = sd_rating + row[3]
            precaution_rating = precaution_rating + row[5]
            count=count+1

        avg_rating = rating/count
        sd_rating = sd_rating/count
        precaution_rating = precaution_rating/count

        print("avg_rating", avg_rating)
        print("sd_rating", sd_rating)
        print("precaution_rating", precaution_rating)
        print("count", count)

        update_sql = "UPDATE Stores SET star_rating= %s, sd_rating=%s, precaution_rating=%s  WHERE store_id = %s"
        cursor.execute(update_sql, (avg_rating, sd_rating, precaution_rating, store_id))

    except Exception as ex:
        print("Problem Executing SQL queries: " + str(ex))
    finally:
        cursor.close()
        conn.commit()
        conn.close()

    return redirect(url_for('stores_list', category=category))


@app.route("/storesList/<category>")
def stores_list(category):
    print (category)
    conn = mysql.connect()
    cursor = conn.cursor()
    cursor.execute('''SELECT * FROM Stores WHERE category = %s ORDER BY star_rating DESC''', category)
    stores = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template("stores.html", title="Stores List", stores=stores)

@app.route("/")
def home():
    return render_template("index.html", title='Home', noHomePageLink=True)

if __name__ == '__main__':
    app.run()
