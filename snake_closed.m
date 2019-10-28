global KEY_IS_PRESSED
KEY_IS_PRESSED = 0;
global CLICK_X
CLICK_X = 0;
global CLICK_Y
CLICK_Y = 0;

x = 120+50*cos(0:0.5:2*pi)';
y = 140+60*sin(0:0.5:2*pi)';
hold on, plot([x;x(1)],[y;y(1)],'g');

%v = VideoWriter('closed_kink1.avi');
%open(v);
%frame = getframe(gcf);
%writeVideo(v,frame);

alpha = 0.15;
beta = 0.1;
gamma = 0.1;
iterations = 250;

N = length(x);
A = a_matrix(N, alpha, beta, 'closed');

P = inv(A+ gamma .* eye(N));

fx = 300;
fy = 300;
[M,I] = min((x - fx) .^ 2 + (y - fy) .^ 2);
x(I) = fx;
y(I) = fy;

plot1 = plot([x;x(1)],[y;y(1)],'b');

%set(plot1,'HitTest','off')
%set(gca,'ButtonDownFcn',@myKeyPressFcn)
%set(plot1,'ButtonDownFcn','disp(''axis callback'')')


%frame = getframe(gcf);
%writeVideo(v,frame);

for ii = 1:iterations
  [x,y] = plot_next(x,y,P,gamma,0,0);
  if 0
    KEY_IS_PRESSED
    mx = CLICK_X;
    my = CLICK_Y;
    %[M,I] = min((x - mx) .^ 2 + (y - my) .^ 2);
    I = 1
    x(I) = mx;
    y(I) = my;
    KEY_IS_PRESSED = 0;
  end
  pause(1);
  plot1.XData = [x;x(1)];
  plot1.YData = [y;y(1)];
  %frame = getframe(gcf);
  %writeVideo(v,frame);
end

%close(v);

function myKeyPressFcn(hObject, event)
  CLICK_X = event.IntersectionPoint(1);
  CLICK_Y = event.IntersectionPoint(2);
  KEY_IS_PRESSED = 1;
end
