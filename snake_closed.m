x = 120+50*cos(0:0.1:2*pi)';
y = 140+60*sin(0:0.1:2*pi)';
hold on, plot([x;x(1)],[y;y(1)],'g');

alpha = 0.01;
beta = 0.05;
gamma = 0.05;
iterations = 10;

N = length(x);
a = (2*alpha+6*beta);
b = -alpha-4*beta;
c = beta;
P = diag(repmat(a,1,N));
P = P + diag(repmat(b,1,N-1), 1) + diag(   b, -N+1);
P = P + diag(repmat(b,1,N-1),-1) + diag(   b,  N-1);
P = P + diag(repmat(c,1,N-2), 2) + diag([c,c],-N+2);
P = P + diag(repmat(c,1,N-2),-2) + diag([c,c], N-2);
P = inv(P+ gamma .* eye(N));

fx = 300;
fy = 300;
[M,I] = min((x - fx) .^ 2 + (y - fy) .^ 2);
x(I) = fx;
y(I) = fy;

plot1 = plot([x;x(1)],[y;y(1)],'b');

for ii = 1:iterations
  [x,y] = plot_next(x,y,P,gamma,plot1,0,0,[],[],x(1),y(1));
end
