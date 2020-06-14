import pandas as pd

def storesListings(storeCategory):
    # print(category)
    allStores = pd.read_csv('yelp_stores.csv')
    print(allStores.head(10))

    # storesBasedOnCategory = []
    #
    # for row in allStores:
    #     if allStores['category'] == storeCategory:
    #         storesBasedOnCategory.append(row)
    #
    # for i in storesBasedOnCategory:
    #     print(i)


    return storeCategory

# main()