function color = pixelValue( image, x ,y, method, border)
    size = size(image);
if inImage(size, x, y)
    switch(method)
        case 'nearest'
            Rx = floor(x + 0.5);
            Ry = floor(y + 0.5);

            color = image(Rx, Ry);
            return;
        case 'linear'
            k = floor(x);
            l = floor(y);
            a = x - k;
            b = y - l;
            
            color = (1-a)*(1-b)*image(k,l) ...
            + (1-a)*b*image(k, l+1) ...
            + a*b*image(k+1, l+1) ...
            + a*(1-b)*image(k+1, l)
           
            

            return;
    end
else
        
    switch(border)
        case(constant)
            color = 0;
        case(nearest)
            if x < size(1)
            
           
            color = 
        case(periodic)   
           
   

end