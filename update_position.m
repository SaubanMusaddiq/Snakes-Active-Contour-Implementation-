function [x,y] = update_position(x,y,Pinv,gamma,extFx,extFy)
  N = length(x);
  sx = gamma * x + extFx;
  sy = gamma * y + extFy;
  x = Pinv * sx;
  y = Pinv * sy;
