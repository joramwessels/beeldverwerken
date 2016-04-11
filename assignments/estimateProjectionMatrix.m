function M = estimateProjectionMatrix(xy, XYZ)
% calculation of projection matrix
X = XYZ (: , 1);
Y = XYZ (: , 2);
Z = XYZ(: , 3);
% we cannot use x and y in Matlab because  means transposed
x = xy (: , 1);
y = xy (: , 2);

o = ones ( size ( X ));
n = zeros ( size ( X ));
Aoddrows = [X , Y , Z , o , n , n , n , n , -x .* X , -x .* Y , -x .*Z, -x ];
Aevenrows = [n , n , n ,n , X , Y ,Z , o , -y .* X , -y .* Y , -y .*Z, -y];
A = [ Aoddrows ; Aevenrows ];
% Do Singular Value Decomposition to obtain m
[~ , ~ , V ] = svd ( A );
m = V (: , end )
% reshape m into the 3x4 projection matrix M
M = reshape (m , 4 , 3)';

end 