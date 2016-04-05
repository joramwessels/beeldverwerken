% Selects the frame indicated by the given coordinates from the image.
function r = myAffine(image, x1, y1, x2, y2, x3, y3, M, N, method)
    r = zeros(N, M);
    % B = X A
    A = [0, M, 0; 0, 0, N; 1, 1, 1];
    B = [x1, x2, x3; y1, y2, y3];
    X = B / A;
    P = [mod((0:1:M*N-1), M)+1 ; floor((0:1:M*N-1)/M)+1 ; (1:1:M*N)*0+1];
    N = X * P;
    Psize = size(P);
    for i = 1:Psize(2)
        r(P(1,i), P(2,i)) = pixelValue(image, N(1,i), N(2,i), method, 'constant');
    end
    imshow(r);
end