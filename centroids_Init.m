function [centroids] = centroids_Init(X,K)

random = randperm(size(X,1));
centroids = X(random(1:K),:);

