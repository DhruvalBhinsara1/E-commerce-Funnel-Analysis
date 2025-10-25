import pandas as pd

# Only read first 20 rows to check
sample = pd.read_csv(r'E:\E-commerce Funnel Analysis\Data Set\2019-Nov.csv', nrows=20)
print(sample.head())
print(sample.columns)
print(sample.apply(lambda x: x.astype(str).str.len().max()))


