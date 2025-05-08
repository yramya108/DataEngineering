import pandas as pd
import numpy as np

customer_shopping_data=pd.read_csv("C:/Users/eyamram/OneDrive - Ericsson/Documents/Ramya_study/EduKron/Python/Python_Datasets/customer_shopping_data.csv")
df = pd.DataFrame(customer_shopping_data)
#print(df)
#print(customer_shopping_data.head(5))

df.info() # will print all the data types

# for col in df.columns:
#     print(f"Column:{col}: {df[col].dtype}")
print()
print(df["gender"].unique())
print(f"MaxAge:{df["age"].max()} : MinAge:{df["age"].max()}")

df_describe = df.describe()
max_Age = df_describe.loc['max','age']
min_Age = df_describe.loc['min','age']

print(f"MaxAge:{max_Age} : MinAge:{min_Age}")

# count null values in each column

# for col in df.columns:
#     print(f"Column:{col}: {df[col].isna().sum()}")
    
# for col in df.columns:
#     print(f"Column:{col}: {df[col].isnull().sum()}")
#df['payment_method'] = df['payment_method'].str.strip()
cash_txn = df[df['payment_method'] == 'Cash']
#print(cash_txn)

#df['shopping_mall'] = df['shopping_mall'].str.strip()
shopping_mall = df[df['shopping_mall'] == 'Metrocity']
#print(shopping_mall)

#Count the number of customers by gender.

gender_count = df.groupby('gender')['customer_id'].count()
print(f"gendercount: {gender_count} ")

df.rename(columns={"invoice_no":"invoice_number"},inplace=True)
print(df)

df['total_price'] = df['quantity']* df['price']
print(df)

print(f"Avg price : {df.groupby('category')['price'].mean().reset_index()}")

print(f"sum by category : {df.groupby('payment_method')['quantity'].sum().reset_index()}")

print(f"Age group by gender : {df.groupby('gender')['age'].mean()}")

#print(f"Invoice group by customerid : {df.groupby('customer_id')['invoice_no'].sum()}")
df.sort_values(by=['price'], ascending=False).head(5)
print(f"print top 5 rows of customers by total price: {df.sort_values(by=['price'], ascending=False).head(5)}")
#sumofcustomers = df.groupby('category')['price'].sum().sort_values( ascending=False)
print(f"print top 3 Most purchased category value: {df.groupby('category')['price'].sum().sort_values( ascending=False).head(3)}")
print()

df['invoice_date'] = pd.to_datetime(df['invoice_date'],dayfirst=True)
#print(df)

df['month'] = pd.to_datetime(df['invoice_date']).dt.month


print(f"print customer who spent most: {df.sort_values(by='price', ascending=False).head(1)}")

df['weekend_days_count'] = pd.to_datetime(df['invoice_date']).dt.day_of_week.isin([5,6])
weekend_tnxs = df['weekend_days_count'].sum()
print(f"Count no of transations made on weekend: {weekend_tnxs}")
print(df)
#df['december_data'] = (pd.to_datetime(df['invoice_date']).dt.month)==12

df_sales = df[df['month'] ==12]
print(df_sales)
december_sales = df_sales.groupby('shopping_mall')['total_price'].sum().sort_values(ascending=False).head(1)
print(december_sales)

december_sales1 = df_sales.groupby('shopping_mall')['total_price'].sum()
highest_sales_mall = december_sales1.idxmax()
highest_sales_value = december_sales1.max()


print(f"The shopping mall with the highest sales in December is {highest_sales_mall} with sales of {highest_sales_value}.")
print(f"print avg tranction value : {df['price'].mean()}")

pivot_table = pd.pivot_table(
    df,
    values = 'price',
    index = 'category',
    columns = 'gender',
    aggfunc='mean'    
)
print(pivot_table)

df['date'] = pd.to_datetime(df['invoice_date'])
df['day_of_week'] = df['date'].dt.dayofweek
print(df.head(5))

bins1 = [0,20,40,60,100]
lables1 = ['0-20','21-40','41-60','61+']
df['age_bins'] = pd.cut(df['age'],bins=bins1, labels=lables1)
print(df['age_bins'] )
df['is_weekend'] = df['invoice_date'].dt.day_of_week.isin([5,6])
print(df['is_weekend'])
print(df.head(5))
payment_method = df_sales.groupby(['shopping_mall','payment_method']).size().reset_index(name = 'count')
print(payment_method.loc[payment_method.groupby("shopping_mall")["count"].idxmax()])


most_popular_payment = (
    df.groupby('shopping_mall')['payment_method']
    .agg(lambda x: x.value_counts().idxmax())
)

print(most_popular_payment)

