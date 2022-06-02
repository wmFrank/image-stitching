function [x1, y1, x2, y2] = GetCorrespondences(im1, im2)
figure,imshow(im1);
[x1,y1] = ginput(4);
close;
figure,imshow(im2);
[x2,y2] = ginput(4);
close;
end