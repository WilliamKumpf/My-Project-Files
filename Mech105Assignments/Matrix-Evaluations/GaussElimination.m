%% LU Decomposition using Naive Gauss elimination
% solve Ax=b using Naive Gauss elimination
A=[1 1 1;2 1 3; 3 4 -2];
b=[4; 7; 9];

%% Gauss Elimination
% Get augmented matrix 
Ab=[A, b];
n=length(A);4;
L=eye(n);
P=eye(n);
P=L;
% A(1,1) pivot element
% Row exchange to ensure A(1,1) is the largest in column 1
col1=Ab(:,1);
[dummy,idx]=max(col1);
dummy=Ab(1,:);% dummy variable is a temporary place holder
Ab(1,:)=Ab(idx,:); % How to make max do this without determining by hand??
Ab(idx,:)=dummy;

% Computation in the pivot column
for i=2:3
    alpha=Ab(i,1)/Ab(1,1); % alpha=
    L(i,1)=alpha; % Row i Column 1
    Ab(i,:)=Ab(i,:)-alpha*Ab(1,:); % Row2=Row2-alpha*Row1
end

% A(2,2) pivot element
% Row exchange to ensure the max of column 2 is in A(2,2)
col2=Ab(2:end,2); % Looking at row 2 to finish of column 2
[dummy,idx]=max(col2);
dummy=Ab(2,:);% dummy variable is a temporary place holder
Ab(2,:)=Ab(idx,:); % How to make max do this without determining by hand??
Ab(idx,:)=dummy;
i=3;
alpha=Ab(i,2)/Ab(2,2);
Ab(i,:)=Ab(i,:)-alpha*Ab(2,:); % Row3=Row3-Alpha*NewRow2
L(i,2)=alpha;

U=Ab(1:n,1:n);
