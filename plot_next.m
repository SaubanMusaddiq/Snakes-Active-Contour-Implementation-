function [x,y] = histpwl_lut(x,y,Pinv,gamma,extFx,extFy)
  N = length(x);

  sx = gamma * x + extFx;
  sy = gamma * y + extFy;
  x = Pinv * sx;
  y = Pinv * sy;
