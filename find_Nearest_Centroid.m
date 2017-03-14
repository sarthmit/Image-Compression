function [index, centroids, K] = find_Nearest_Centroid(X,centroids)

K = size(centroids,1);

[m, n] = size(X);

s=0;
t=0;
A=[];

for i=1:K
	for j = i+1:K
		if(centroids(i,:)==centroids(j,:))
			t=t+1;
			A(t)=j;
		end
	end
end

centroids(A,:)=[];
K=K-t;

s=0;
for i=1:m
	for j =1:K
		r = norm(X(i,:)-centroids(j,:));
		if (s>=r || j==1)
			s=r;
			index(i,1)=j;
		end
	end
	s=0;
end

centroids = centroids(1:K,:);

end