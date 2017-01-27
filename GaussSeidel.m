clear all
clc

format compact

A = [4 -1 0 -1 0 0;
     -1 4 -1 0 -1 0;
     0 -1 4 0 0 -1;
     -1 0 0 4 -1 0;
     0 -1 0 -1 4 1;
     0 0 -1 0 -1 4];
b = [-1; 0; 1; -2; 1; 2];
X = zeros(6,1);
Error_eval = ones(6,1);

iter = 0;
while max(Error_eval) > 0.0005
    iter = iter + 1;
    Z = X;  % save current values to calculate error later
    for i = 1:6
        j = 1:6; % define an array of the coefficients' elements
        j(i) = [];  % eliminate the unknow's coefficient from the remaining coefficients
        Xtemp = X;  % copy the unknows to a new variable
        Xtemp(i) = [];  % eliminate the unknown under question from the set of values
        X(i) = (b(i) - sum(A(i,j) * Xtemp)) / A(i,i);
    end
    Xsol(:,iter) = X;
    Error_eval = sqrt((X - Z).^2);
end

GaussSeidelTable = [1:iter;Xsol]'