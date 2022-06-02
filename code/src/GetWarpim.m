function [im3, diffr, diffc] = GetWarpim(im1, H)
[row, col, ~] = size(im1);
jl = [1 1; 1 col; row 1; row col];
for i = 1 : 4
    a = [jl(i,2); jl(i,1); 1];
    b = H * a;
    b = b / b(3);
    if(i == 1)
        minp(1,1) = b(2);
        minp(1,2) = b(1);
        maxp(1,1) = b(2);
        maxp(1,2) = b(1);
    else
        if(b(2) < minp(1,1))
            minp(1,1) = b(2);
        end
        if(b(1) < minp(1,2))
            minp(1,2) = b(1);
        end
        if(b(2) > maxp(1,1))
            maxp(1,1) = b(2);
        end
        if(b(1) > maxp(1,2))
            maxp(1,2) = b(1);
        end
    end
end
minp = round(minp);
maxp = round(maxp);
diffr = 0;
diffc = 0;
if(minp(1,1) <= 0)
    diffr = 1 - minp(1,1);
end
if(minp(1,2) <= 0)
    diffc = 1 - minp(1,2);
end
lenr = maxp(1,1) + diffr;
lenc = maxp(1,2) + diffc;
im3 = zeros(lenr, lenc, 3);
mapx = zeros(lenr, lenc);
mapy = zeros(lenr, lenc);
for i = minp(1,1) : maxp(1,1)
    for j = minp(1,2) : maxp(1,2)
        b = [j; i; 1];
        a = H \ b;
        a = a / a(3);
        ii = a(2);
        jj = a(1);
        mapx(i + diffr, j + diffc) = jj;
        mapy(i + diffr, j + diffc) = ii;
    end
end
for k = 1 : 3
    im3(:,:,k) = interp2(im1(:,:,k), mapx, mapy);
end
end
