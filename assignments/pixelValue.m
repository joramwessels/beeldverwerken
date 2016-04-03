function color = pixelValue( image, x ,y, method, border)
    imsize = size(image);
if inImage(imsize, x, y)
    switch(method)
        case 'nearest'
            Rx = floor(x + 0.5);
            Ry = floor(y + 0.5);
            color = image(Rx, Ry);
        case 'linear'
            k = floor(x);
            l = floor(y);
            a = x - k;
            b = y - l;
            color = (1-a)*(1-b)*image(k,l) ...
            + (1-a)*b*image(k, l+1) ...
            + a*b*image(k+1, l+1) ...
            + a*(1-b)*image(k+1, l);
    end
else
    switch(border)
        case('constant')
            color = 0;
        case('nearest')
            new_x = x;
            new_y = y;
            if x <= 1
                new_x = 1;
            elseif x >= imsize(1)
                new_x = imsize(1);
            end
            if y <= 1
                new_y = 1;
            elseif y >= imsize(2)
                new_y = imsize(2);
            end
            color = image(new_x, new_y);
        case('periodic')
           new_x = x;
           new_y = y;
           while new_x < 1
               new_x = new_x + imsize(1);
           end
           while new_x >= imsize(1)
               new_x = new_x - imsize(1);
           end
           while new_y < 1
               new_y = new_y + imsize(2);
           end
           while new_y >= imsize(2)
               new_y = new_y - imsize(2);
           end
           color = image(new_x, new_y);
    end
end