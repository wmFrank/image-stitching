function [H] = GetHomography(x1,y1,x2,y2)
[n,~] = size(x1);
A = zeros(n * 2, 9);
for i = 1 : 2 : n * 2
    j = (i + 1) / 2;
    A(i,:) = [-x1(j) -y1(j) -1 0 0 0 x1(j)*x2(j) x2(j)*y1(j) x2(j)];
    A(i + 1,:) = [0 0 0 -x1(j) -y1(j) -1 x1(j)*y2(j) y1(j)*y2(j) y2(j)];
end
[evec, eval] = eig(A'*A);
[~,pos] = min(diag(eval));
H = evec(:, pos);
H = reshape(H,3,3)';
end