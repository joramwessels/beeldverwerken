function im = addBlackBorder(image, angle)
    angle = 180 * angle/pi
    while angle >= 90
        angle = angle - 90;
    end
    if angle > 45
        angle = angle - (angle-45);
    end
    imsize = size(image);
    c = abs(cos(angle));
    s = abs(sin(angle));
    border_size_y = floor(((imsize(1) * s + imsize(2) * c) - imsize(2))/2);
    border_size_x = floor(((imsize(2) * s + imsize(1) * c) - imsize(1))/2);
    border_side = zeros(imsize(2), border_size_x);
    im = [border_side,image,border_side];
    border_top = zeros(border_size_y, imsize(2) + (2 * border_size_x));
    im = [border_top;im;border_top];
    imshow(im);
end