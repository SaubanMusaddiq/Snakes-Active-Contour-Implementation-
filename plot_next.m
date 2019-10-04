function [x,y] = histpwl_lut(x,y,Pinv,gamma,plot,extFx,extFy,firstX,firstY,lastX,lastY)
  N = length(x);

  sx = gamma * x + extFx;
  sy = gamma * y + extFy;
  x = Pinv * sx;
  y = Pinv * sy;

  pause(0.1);
  plot.XData = [firstX;x;lastX];
  plot.YData = [firstY;y;lastY];
