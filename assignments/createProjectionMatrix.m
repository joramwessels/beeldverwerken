function projMatrix = createProjectionMatrix ( xy , uv )
% calculation of projection matrix
x = xy (: , 1);
y = xy (: , 2);
% we cannot use x and y in Matlab because  means transposed
u = uv (: , 1);
v = uv (: , 2);
o = ones ( size ( x ));
z = zeros ( size ( x ));
Aoddrows = [x , y , o , z , z , z , -u .* x , -u .* y , -u ];
Aevenrows = [z , z , z , x , y , o , -v .* x , -v .* y , -v ];
A = [ Aoddrows ; Aevenrows ];
projMatrix = null(A);
projMatrix = reshape(projMatrix, [3, 3])';
return ;
