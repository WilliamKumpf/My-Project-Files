%% Simpsons 1/3 Rule Numerical Integration Created by Will Kumpf
function I=Simpson(x,y)
% The function is meant to approximate the integral over a region
if nargin~=2 % Only two inputs will work for this function
    error('Fuction requires 2 inputs')
end
if size(x)~=size(y) % Proving that the number of independent variables match the number of dependent variables
    error('The input vectors must match in size')
end
[m,n]=size(y); % Used to determine the dimensions of the vector
if m~=1 && n~=1 % Proves that the inputs are vectors and not matrices
    error('Inputs must be vector values')
end
if m==1 % Row vectors
    iter=n; % Number of iterations matches the number of columns
else
    iter=m; % Column Vector and the number of iterations matches the number of rows
end
% Find the number of points to determine if Trap rule needs to be used on
% last point
p=rem(length(y),2); % Determines if there are an even or odd number of segments
if p==0 % Even number of segments
    warning('The trap rule must be used to determine the last segment')
else
    p=1; % Odd number of segments
    disp('Determinig approximation using Simpsons 1/3 rule')
end
X=diff(x); % Determines the distance between each independent variable
if min(X)~=max(X) % States that the distance between each independent variable is not equal
    error('The dependent variable is not equally spaced')
end
I=0; % Initial I value
j=1; 
while j<iter-1
I=I+(x(j+2)-x(j))*(y(j)+4*y(j+1)+y(j+2))/6; % The simpson's 1/3 rule formula
j=j+2; 
end
if p==0 % If there is an odd number of segments use the trap rule
   I=I+((x(iter)-x(iter-1))*(y(iter)+y(iter-1))/2); % trap rule formula
   j=j+2;
end
end
