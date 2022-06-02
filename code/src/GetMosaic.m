function [im] = GetMosaic(im3, im2, diffr, diffc)
[r3,c3,~] = size(im3);
[r2,c2,~] = size(im2);
r = max(r3, r2 + diffr);
c = max(c3, c2 + diffc);
im = zeros(r,c,3);
for i = 1 : r3
    for j = 1 : c3
        tmp = im3(i, j, :);
        if(isnan(tmp) == 0)
            im(i, j, :) = tmp;
        end
    end
end
for i = 1 : r2
    for j = 1 : c2
        im(i + diffr, j + diffc, :) = im2(i, j, :);
    end
end
end