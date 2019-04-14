
ds = datastore('house_prices_data_training_data.csv','TreatAsMissing','NA',.....
    'MissingValue',0,'ReadSize',25000);
T = read(ds);
m=length(T{:,1});
x=T{:,4:21};
epselon=0.001
xtrain=T{1:16000,4:21};
xtest=T{16000:18000,4:21};

Ytrain=T{1:16000,3};
Ytest=T{16000:18000,3};

S = std(x);
M=mean(x);
X=x(9999,:);

N=normcdf(X,M,S);

anomely=prod(N)

if anomely<epselon || anomely>1-epselon
    0
else 
    1
end
