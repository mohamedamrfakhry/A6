
ds = datastore('house_prices_data_training_data.csv','TreatAsMissing','NA',.....
    'MissingValue',0,'ReadSize',25000);
T = read(ds);
m=length(T{:,1});
X=T{:,4:21};
n=length(X(1,:));
% ----normalization----

for w=2:n
    if max(abs(X(:,w)))~=0
    X(:,w)=(X(:,w)-mean((X(:,w))))./std(X(:,w));
    end
end

xtrain=X(1:16000,:);
xtest=X(16000:18000,:);
x=X;
Ytrain=T{1:16000,3};
Ytest=T{16000:18000,3};

Corr_x = corr(x) ;
%17998,17999
x_cov=cov(x) ; 

[U S V] =  svd(x_cov);
Lamda=max(S);
K=0;
a=1;
while a
alpha=1-(sum(Lamda(1:K))/sum(Lamda));
if alpha<=0.001
    a=0;
    break
end
K=K+1;
end

R=U(:,1:K)'*x';
R=R';
v = R(1, :);
%xrec=v' * ;
z=R.';
uu= U(1:K,1:K);
xapp=uu*z;
error=(1/m)*sum(R-xapp');
Rtrain=R(1:16000,1:K);
Theta1=LinearRegression (xtrain,Ytrain,m);
Theta2=LinearRegression (Rtrain,Ytrain,m);

%  KmeansFun(R,m)

S = std(R);
M=mean(R);
X=R(9999,:);

N=normcdf(X,M,S);

anomely=prod(N)
