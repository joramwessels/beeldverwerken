function G = Gauss1(sigma)

% create appropriate ranges for x and y
M = round(2*sigma);
N = 1;
x = -M : M; 
% create a sampling grid
[X, N] = meshgrid (x, N);
% determine the scale
%%sigma = iets met kleur;
% calculate the Gaussian function
G = (1/(sqrt(2*pi)*sigma))*exp(-abs(X.^2)/(2*sigma.^2));
end


%% I = imread('cameraman.tif')
%% tic ;
%% H = imfilter (I , Gauss ( 3 ) , 'conv' , 'replicate' );
%% elapsedTime = toc ;