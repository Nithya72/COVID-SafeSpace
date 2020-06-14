import pandas as pd

def storesListings(storeCategory):
    allStores = pd.read_csv('yelp_stores.csv')
    df = allStores[allStores['category'] ==storeCategory]

    stores = df.values
    print(len(stores))
    return stores

# main()