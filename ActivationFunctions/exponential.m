function y = exponential(beta, x)
  y = (1 + exp(-2 * x * beta)) .^ -1;
endfunction
