
function projection = myProjection1 ( image , x1 , y1 , x2 , y2 , ...
x3 , y3 , x4 , y4 , M , N , method )
projection = zeros (N , M ); % allocate new image of correct size
% calculate projection matrix
xy = [x1, y1;
    x2, y2;
    x3, y3;
    x4, y4]
uv = [ 1, 1;
       N , 1 ;
       N , M ;
       1 , M ];
   
X = createProjectionMatrix(xy, uv)


 P = [mod((0:1:M*N-1), M)+1 ; floor((0:1:M*N-1)/M)+1 ; (1:1:M*N)*0+1]
    N = X \ P;
    size(N)
    Psize = size(P);
    for i = 1:Psize(2)
        N(1,i)/N(3,i);
        N(2,i)/N(3,i);
         projection(P(2,i), P(1,i)) = pixelValue(image, N(2,i)/N(3,i), N(1,i)/N(3,i), method, 'constant');
    end
   



end