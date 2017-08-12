clear; close all; clc;

pkg load image;

img = imread('image-3.jpg');
img1 = imresize(img, [256 256]);
img = double(img1)/255;

X = reshape(img, size(img,1)*size(img,2),3);

K = 8;

[m,n] = size(X);

max_iter=10;
min=0;
idx = zeros(m,1);

for i=1:3
	fprintf('Random Initialization: %d\n', i);
	centroids = centroids_Init(X,K);
	for j=1:max_iter
		fprintf('\t Sub-Iteration: %d \n', j);
		[index, centroids, K] = find_Nearest_Centroid(X,centroids);
		centroids = compute_Centroids(X,centroids,index);
	end
	s = sqrt(sum(norm(X-centroids(index,:),'rows').^2));
	if(i==1 || s<min)
		min = s;
		cent = centroids;
		idx = index;
	end
end

X = reshape(X,size(img,1),size(img,2), 3);

X_compressed = cent(idx,:);
X_compressed = reshape(X_compressed,size(img,1),size(img,2), 3);

subplot(1,2,1);
imagesc(X);
title('Original');

subplot(1,2,2);
imagesc(X_compressed);
title(sprintf('Compressed, with %d colors.', K));

pause;