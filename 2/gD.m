function GD = gD( f , sigma , xorder , yorder)

M = round(2*sigma);
N = round(2*sigma);
X = -M : M; 
Y = -N : N;
%l = [X , Y ] = meshgrid (x , y )
% determine the scale

% calculate the Gaussian function
GD = Gauss1(sigma);

if(xorder == 1 && yorder == 0)
        GD = ((-X/(4*(sigma^2)))'*GD);
    elseif(xorder == 2 && yorder == 0)
        GD = (-X/(4*(sigma^2))^2)'*GD;
    elseif(xorder == 0 && yorder == 1)
        GD = ((-Y/(4*(sigma^2)))'*GD)';
    elseif(xorder == 0 && yorder == 2) 
        GD = ((-Y/(4*(sigma^2))^2)'*GD)';
    elseif(xorder == 1 && yorder == 1)
        GDx = ((-X/(4*(sigma^2)))'*GD);
        GDy = ((-Y/(4*(sigma^2)))'*GD)';
        GD = GDx*GDy;
end

%{
GDx = GD;
GDy = GD;
for i = 1:xorder
    GDx = (-X/(4*(sigma^2)))'*GDx;
end
for i = 1:yorder
    GDy = (-Y/(4*(sigma^2)))'*GDy;
end
if(xorder ~= 0)
    GD = GDx;
    if(yorder ~= 0)
        GD = GDx*GDy'
    end
end
if(yorder ~= 0)
    GD = GDy';
end
%}
B = imfilter(f, GD, 'conv', 'replicate');
imshow(B, []);

end








