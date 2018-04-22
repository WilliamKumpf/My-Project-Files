%% False Position Algorithm which estimates the root of a given function
function falsePosition(func,xl,xu,es,maxiter)

if nargin<3 || nargin>5 % 3-5 variables must be input
    error('must input 3-5 variables')
elseif nargin==3 % if 3 variables are input, es and maxiter are implied
    es=0.0001;
    maxiter=200;
elseif nargin==4 % if 4 variables are input maxiter is implied
    maxiter=200;
else
end 
if func(xl)==0 % if the function is equal to 0 the upper bound is your root
    disp('Your upper limit guess is the root')
end
if func(xu)==0  % if the function is equal to 0 the lower bound is your root
    disp('Your lower limit guess is the root')
end

iter=0; % Zero iterations thus far
ea=100; % ea is 100% because no iterations have occured yet
root=xl; % xl is the initial guess to run the function
if (func(xl)*func(xu))>0 % test the sign of the function to determine if the root is in the bounds
    error('The root is not in the bounds')
else
while iter<maxiter && es<ea 
rootprev=root;
root=xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)));
ea=abs((root-rootprev)/root)*100;
if func(root)*func(xl)<0
    xu=root;
else
    xl=root;
end
iter=iter+1;
end
end
fx=func(root);
% display the outputs
display(root)
display(fx)
display(ea)
display(iter)

end
