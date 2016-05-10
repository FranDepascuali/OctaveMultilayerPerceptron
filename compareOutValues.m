function [ret, errorr] = compareOutValues (expectedValues, outValues, error)
  errorr = halfCuadraticError(expectedValues, outValues);
  ret = errorr <= error;
endfunction
