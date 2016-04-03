function im = addBlackBorderBackup(image)
    imsize = size(image);
    diagonal = sqrt(imsize(1)^2 + imsize(2)^2);
    border_size = floor((diagonal - imsize(1)) / 2)+1;
    border = zeros(imsize(2), border_size);
    im = [border,image,border];
    imsize = size(im);
    border = zeros(border_size, imsize(2));
    im = [border;im;border];
    imshow(im);
end