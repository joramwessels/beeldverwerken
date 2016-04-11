function test = myProjection(image, m , n , method)
imshow(image);
xy = ginput(4);

r = myProjection1 ( image , xy(1,1) , xy(1,2) , xy(2,1) , xy(2,2) , ...
xy(3,1) , xy(3,2) , xy(4,1) , xy(4,2) , m , n , method)

I = im2double(r);
imshow(I, []);
end