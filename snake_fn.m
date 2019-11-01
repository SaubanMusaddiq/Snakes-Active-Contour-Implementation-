function  snake(mode,alpha,beta,gamma,iterations)
  global KEY_IS_PRESSED
  KEY_IS_PRESSED = 0;
  global CLICK_X
  CLICK_X = 0;
  global CLICK_Y
  CLICK_Y = 0;

  N = 63;
  [x,y] = generate_data(mode,N);

  %v = VideoWriter('closed_kink1.avi');
  %open(v);
  %frame = getframe(gcf);
  %writeVideo(v,frame);

  %alpha = 0.15;
  %beta = 0.1;
  %gamma = 0.5;
  %iterations = 1000;

  A = a_matrix(N, alpha, beta, mode);
  P = inv(A+ gamma .* eye(N));

  if mode == "Open"
    plot1 = plot([x],[y],'b');
  else
    plot1 = plot([x;x(1)],[y;y(1)],'b');
  end
  set(plot1,'HitTest','off')
  set(gca,'ButtonDownFcn',@myKeyPressFcn)
  % set(plot1,'ButtonDownFcn','disp(''axis callback'')')

  %frame = getframe(gcf);
  %writeVideo(v,frame);

  for ii = 1:iterations
    extFx = 0;
    extFy = 0;
    if KEY_IS_PRESSED
      mx = CLICK_X;
      my = CLICK_Y;
      [M,I] = min((x - mx) .^ 2 + (y - my) .^ 2);
      x(I) = mx;
      y(I) = my;
      KEY_IS_PRESSED = 0;
    end
    [x,y] = update_position(x,y,P,gamma,extFx,extFy);
    pause(0.1);
    if mode == "Open"
      plot1.XData = [x];
      plot1.YData = [y];
    else
      plot1.XData = [x;x(1)];
      plot1.YData = [y;y(1)];
    end
    %frame = getframe(gcf);
    %writeVideo(v,frame);
  end
end

function myKeyPressFcn(hObject, event)
  global KEY_IS_PRESSED
  global CLICK_X
  global CLICK_Y
  CLICK_X = event.IntersectionPoint(1);
  CLICK_Y = event.IntersectionPoint(2);
  KEY_IS_PRESSED = 1;
end
