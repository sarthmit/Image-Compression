function [centroids] = compute_Centroids(X,centroids,index)

K = size(centroids,1);

avg = zeros(1,size(X,2));

for i=1:K
	s=find(index==i);
	avg=mean(X(s,:));
	centroids(i,:)=avg;
end
