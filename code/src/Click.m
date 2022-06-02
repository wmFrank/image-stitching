im1 = im2double(imread('uttower1.jpg'));
im2 = im2double(imread('uttower2.jpg'));
[x1, y1, x2, y2] = GetCorrespondences(im1, im2);
H = GetHomography(x1,y1,x2,y2);
[im3, diffr, diffc] = GetWarpim(im1, H);
im = GetMosaic(im3, im2, diffr, diffc);
imwrite(im,'mosaic.png');