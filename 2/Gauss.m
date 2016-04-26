function G = Gauss(sigma)

% create appropriate ranges for x and y
M = round(2*sigma);
N = round(2*sigma);
x = -M : M; 
y = -N : N;
% create a sampling grid
[X , Y ] = meshgrid (x , y );
% determine the scale
%%sigma = iets met kleur;
% calculate the Gaussian function
G = (1/(sqrt(2*pi)*sigma).^2)*exp(-abs(X.^2+Y.^2)/(2*sigma.^2));

%I = imread('cameraman.tif');
%H = imfilter (I , Gauss ( sigma ) , 'conv' , 'replicate' );
%elapsedTime = toc ;

%imshow(H);
end

