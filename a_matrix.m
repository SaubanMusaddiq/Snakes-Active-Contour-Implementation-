function A = a_matrix(N, alpha, beta, mode)
  a = 2;
  b = -1;
  A_alpha = diag(repmat(a,1,N));
  A_alpha = A_alpha + diag(repmat(b,1,N-1), 1) + diag(   b, -N+1);
  A_alpha = A_alpha + diag(repmat(b,1,N-1),-1) + diag(   b,  N-1);

  a = 6;
  b = -4;
  c = 1;
  A_beta = diag(repmat(a,1,N));
  A_beta = A_beta + diag(repmat(b,1,N-1), 1) + diag(   b, -N+1);
  A_beta = A_beta + diag(repmat(b,1,N-1),-1) + diag(   b,  N-1);
  A_beta = A_beta + diag(repmat(c,1,N-2), 2) + diag([c,c],-N+2);
  A_beta = A_beta + diag(repmat(c,1,N-2),-2) + diag([c,c], N-2);


  if mode == "Open"
    A_alpha(1,1) = 1;
    A_alpha(N,N) = 1;
    A_alpha(1,N) = 0;
    A_alpha(N,1) = 0;

    A_beta(1,1) = 1;       % First 2x2
    A_beta(1,2) = -2;
    A_beta(2,1) = -2;
    A_beta(2,2) = 5;

    A_beta(N,N) = 1;       % Last 2x2
    A_beta(N,N-1) = -2;
    A_beta(N-1,N) = -2;
    A_beta(N-1,N-1) = 5;

    A_beta(1,N-1:N) = 0;   %Corners
    A_beta(2,N) = 0;
    A_beta(N,1:2) = 0;
    A_beta(N-1,1) = 0;
  end

  A = alpha * A_alpha + beta * A_beta;
