function bool = inImage(isize, x, y)
    if(x >= 1 && x < isize(1)-1)
        if(y >= 1 && y < isize(2))
            bool = true;
            return;
        end
    end
    bool = false;
    return;
end