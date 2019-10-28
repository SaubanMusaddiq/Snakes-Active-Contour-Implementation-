x = (0:0.1:2*pi)' + 10;
y = 10*sin(0:0.1:2*pi)' + 2;

hold on, plot(x,y,'g');

%v = VideoWriter('closed_kink1.avi');
%open(v);
%frame = getframe(gcf);
%writeVideo(v,frame);

alpha = 0.2;
beta = 0;
gamma = 0.1;
iterations =1000;

N = length(x);
A = a_matrix(N, alpha, beta, 'open');

P = inv(A+ gamma .* eye(N));

plot1 = plot(x,y,'b');

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
  pause(0.01);
  plot1.XData = x;
  plot1.YData = y;
  %frame = getframe(gcf);
  %writeVideo(v,frame);
end

%close(v);

function myKeyPressFcn(hObject, event)
  CLICK_X = event.IntersectionPoint(1);
  CLICK_Y = event.IntersectionPoint(2);
  KEY_IS_PRESSED = 1;
end
