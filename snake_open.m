x =(0:0.1:2*pi)' + 2;
y =20*sin(0:0.1:2*pi)' + 2;
hold on, plot([x],[y],'g');


alpha = 1;
beta = 0.1;
gamma = 0.05;
iterations = 100;


N = length(x);

extFx = zeros(N,1);
extFy = zeros(N,1);

a = (2*alpha+6*beta);
b = -alpha-4*beta;
c = beta;
P = diag(repmat(a,1,N));
P = P + diag(repmat(b,1,N-1), 1) + diag(   b, -N+1);
P = P + diag(repmat(b,1,N-1),-1) + diag(   b,  N-1);
P = P + diag(repmat(c,1,N-2), 2) + diag([c,c],-N+2);
P = P + diag(repmat(c,1,N-2),-2) + diag([c,c], N-2);

P(1,N) = 0;
P(1,N-1) = 0;
P(2,N) = 0;
P(N,1) = 0;
P(N-1,1) = 0;
P(N,2) = 0;

P(1,1) = P(1,1) - c;
P(N,N) = P(N,N) - c;

firstX = x(1);
firstY = y(1);
lastX  = x(N);
lastY  = y(N);


extFx(1) = extFx(1) - (2*c + b)* firstX;
extFx(2) = extFx(2) - (c)* firstX;
extFx(N-1) = extFx(N-1) -(c)* lastX;
extFx(N) = extFx(N) - (2*c + b)* lastX;

extFy(1) = extFy(1) - (2*c + b)* firstY;
extFy(2) = extFy(2) - (c)* firstY;
extFy(N-1) = extFy(N-1) - (c)* lastY;
extFy(N) = extFy(N) - (2*c + b)* lastY;

Pinv = inv(P+ gamma .* eye(N));

plot1 = plot([x(1);x;x(N)],[y(1);y;y(N)],'b');

for ii = 1:iterations
  [x,y] = plot_next(x,y,Pinv,gamma,plot1,extFx,extFy,firstX,firstY,lastX,lastY);
end
