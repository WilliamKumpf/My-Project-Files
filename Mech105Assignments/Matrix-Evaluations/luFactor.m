%% Homework 15 LU Partial Pivoting Algorithm Developement
function [L,U,P]=luFactor(A,b)
clear
clc
% Get augmented matrix
A=input('Input square coefficient matrix') % User inputs Coefficient Matrix
b=input('Input column matrix that has the same number of rows as matrix A') % User inputs b values

Ab=[A, b];
n=length(A);
L=eye(n); % L is the lower triangular matrix
P=eye(n); % P is the identity matrix
% A(1,1) pivot element
% Row exchange to ensure A(1,1) is the largest in column 1
c1=Ab(:,1); % c1= column 1
[ph,id]=max(c1); % Identifying the max in column 1
ph=Ab(1,:); % ph variable is a temporary place holder while matlab pivots the max to column 1
Ab(1,:)=Ab(id,:); % Matlab is pivoting the so A(1,:) has the max value for column 1
Ab(id,:)=ph; % Matlab pivots row 1 to the row replacing it


% Computation in the pivot column
    for i=2:n % Allowing all rows
        alpha=Ab(i,1)/Ab(1,1); % Determines multiplication factor for row1
        L(i,1)=alpha; % Row i Column 1
        Ab(i,:)=Ab(i,:)-alpha*Ab(1,:); % Row2=Row2-alpha*Row1
    end

% A(2,2) pivot element
% Row exchange to ensure the max of column 2 is in A(2,2)
c2=Ab(2:end,2); % Looking at row 2 and below of column 2 c2=column 2
[ph,id]=max(c2); % Identifying the max for c2(2:end,2)
ph=Ab(2,:); % ph variable is a temporary place holder while Matlab pivots
Ab(2,:)=Ab(id,:); % Matlab is pivoting the rows so A(2,2) has the max value for c2(2:end,2)
Ab(id,:)=ph; % Pivoting the original row 2 to the row the max came from
i=n; 
alpha=Ab(i,2)/Ab(2,2); % Multiplication factor for new row 2 
Ab(i,:)=Ab(i,:)-alpha*Ab(2,:); % Row3=Row3-Alpha*NewRow2
L(i,2)=alpha % Determining L matrix
U=Ab(1:n,1:n) % Determining U matrix
end

