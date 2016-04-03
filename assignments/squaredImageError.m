function x = squaredImageError(im1, im2)
    if size(im1) ~= size(im2)
        x = -1;
    end
    im = (im1 - im2) .^ 2;
    x = sum(im(:));
end