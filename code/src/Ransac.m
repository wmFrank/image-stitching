function [x1,y1,x2,y2] = Ransac(matches, f1, f2)
len = size(matches,2);
matchnum = -1;
for i = 1 : 1000
    perm = randperm(len,4);
    xx1 = reshape(f1(1,matches(1,perm)),4,1);
    yy1 = reshape(f1(2,matches(1,perm)),4,1);
    xx2 = reshape(f2(1,matches(2,perm)),4,1);
    yy2 = reshape(f2(2,matches(2,perm)),4,1);
    num = 0;
    H = GetHomography(xx1,yy1,xx2,yy2);
    for j = 1 : len
        v1 = [f1(1,matches(1,j)); f1(2,matches(1,j)); 1];
        v1 = H * v1;
        v1 = v1 / v1(3);
        v2 = [f2(1,matches(2,j)); f2(2,matches(2,j)); 1];
        v = v1 - v2;
        v = [v(1); v(2)];
        length = norm(v);
        if(length < 1)
            num = num + 1;
        end
    end
    if(num > matchnum)
        matchnum = num;
        x1 = xx1;
        y1 = yy1;
        x2 = xx2;
        y2 = yy2;
    end
end
end