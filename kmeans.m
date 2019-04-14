ds = datastore('house_prices_data_training_data.csv','TreatAsMissing','NA',.....
    'MissingValue',0,'ReadSize',25000);
T = read(ds);
m=length(T{:,1});

X=T{:,3:21};

KmeansFun (X,m)
