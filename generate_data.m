function [x,y] = generate_data(mode,N)
  if mode == "Closed"
    step = 2*pi/N;
    x = 120+50*cos(0:step:2*pi)';
    y = 140+60*sin(0:step:2*pi)';
    fx = 300;
    fy = 300;
    [M,I] = min((x - fx) .^ 2 + (y - fy) .^ 2);
    x(I) = fx;
    y(I) = fy;
  else
    step = 2*pi/N;
    x = (0:step:2*pi)' + 10;
    y = 10*sin(0:step:2*pi)' + 2;
  end
  x = x(1:N);
  y = y(1:N);
