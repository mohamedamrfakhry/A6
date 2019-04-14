function centroids = KmeansFun (X,m)

m=16000;
n=length(X(1,:));
K=0;
% ----normalization----
for w=2:n
    if max(abs(X(:,w)))~=0
    X(:,w)=(X(:,w)-mean((X(:,w))))./std(X(:,w));
    end
end

for counter=1:10
    K=counter
    centroids = rand(K, n);
indices=0;
oldcentroids=0;

    while norm(sum(sum(oldcentroids-centroids)))>0.01;
norm(sum(sum(oldcentroids-centroids)));
oldcentroids=centroids;

for i=1:m
k = 1;
    min_dist = sum((X(i,:) - centroids(1,:)) .^ 2);
    for j=2:K
        dist = sum((X(i,:) - centroids(j,:)) .^ 2);
        if(dist < min_dist)
          min_dist = dist;
          k = j;
        end
    end
indices(i) = k;    
end

for k=1:K   
xi = X(indices==k,:);
ck = size(xi,1);

centroids(k,:) = mean(xi)
       
end
numberOfClusters(counter)=counter;

for i=1:K
error(counter)=(1/i) * (sum(X(i)-centroids(i)))^2;

end
    end
end
figure(2)
plot(numberOfClusters,error)


end