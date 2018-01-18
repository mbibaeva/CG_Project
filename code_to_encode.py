import pandas as pd
from sklearn.preprocessing import LabelEncoder
df = pd.read_csv('./all_data.csv', sep=';', encoding='windows-1251')
df.head()
print(df.head())
ndf = df.fillna(0)
ndf = df.apply(LabelEncoder().fit_transform)
ndf.head()
le = LabelEncoder()
print('this is target')
print(ndf)
ndf['Target'] = le.fit_transform(ndf['Target'])
ndf['Subject'] = le.fit_transform(ndf['Subject'])
ndf['Number'] = le.fit_transform(ndf['Number'])
ndf['Gender'] = le.fit_transform(ndf['Gender'])
ndf['Animacy'] = le.fit_transform(ndf['Animacy'])
ndf['Verb'] = le.fit_transform(ndf['Verb'])
ndf['Verb_of_speech'] = le.fit_transform(ndf['Verb_of_speech'])
ndf['Verb_time'] = le.fit_transform(ndf['Verb_time'])
ndf['Object'] = le.fit_transform(ndf['Object'])
ndf['Protiv1'] = le.fit_transform(ndf['Protiv1'])
ndf['Protiv2'] = le.fit_transform(ndf['Protiv2'])

from sklearn import preprocessing
#instantiate
enc = preprocessing.OneHotEncoder()

#fit
enc.fit(ndf)

#transform
onehotlabels = enc.transform(ndf).toarray()
onehotlabels.shape
ndf.to_csv('encode.csv')