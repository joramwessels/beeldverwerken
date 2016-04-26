function rotatedImage = rotateImage ( image , angle , method )

% Rotation- and translation matrix
    isize = size(image);
    t1 = isize(1)/2;
    t2 = isize(2)/2;
    R = [cos(angle), -sin(angle),t1;
         sin(angle), cos(angle),t2;
         0,0,1];
    T = [1, 0, -t1;
         0, 1, -t2;
         0, 0,  1 ];
     
% adding black border to image
    image = addBlackBorder(image, R * T);

% Recalculating size and matrices
    isize = size(image);
    t1 = isize(1)/2;
    t2 = isize(2)/2;
    R = [cos(angle), -sin(angle),t1;
         sin(angle), cos(angle),t2;
         0,0,1];
    T = [1, 0, -t1;
         0, 1, -t2;
         0, 0,  1 ];
 
% Obtain indices needed for interpolation
    a = isize(1);
    b = isize(2);
    [Y,X,Z] = meshgrid(1:a,1:b,1:1);
    size1 = isize(1)*isize(2);
    X = reshape(X, [1, size1]);
    Y = reshape(Y, [1, size1]);
    Z = reshape(Z, [1, size1]);

    L = [X ; Y ; Z];
    P =  R * T * L;

    % TODO matrix multiplication instead of for-loop?
    % TODO rotates in the wrong direction
    for i = 1:size1
       color(i) = pixelValue( image , P(1,i),  P(2,i),  method, 'constant'); 
    end 
    rotatedImage = reshape(color, [isize(1), isize(2)]);
    imshow(rotatedImage);
end