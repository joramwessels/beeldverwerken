% Times a rotation using the given interpolation method.
% linear:  0.6783
% nearest: 0.5562
function time = timeRotation(image, method)
    tic;
    rotateImage(image, pi/6, method);
    time = toc;
end