% Calculates the difference in width and height between the rotated image
% and the original and adds a black border of half that size to each side
% of the respective dimension.
function im = addBlackBorder(image, R)
    s = size(image);
    c = R * [0 s(1) 0 s(1) ; 0 0 s(2) s(2) ; 1 1 1 1];
    ct = c';
    w = floor((max(ct(:, 1)) - min(ct(:, 1)) - s(2)) /2) + 1;
    h = floor((max(ct(:, 2)) - min(ct(:, 2)) - s(1)) /2) + 1;
    side_border = zeros(s(2), w);
    vert_border = zeros(h, s(2) + 2 * w);
    im = [side_border, image, side_border];
    im = [vert_border ; im ; vert_border];
end