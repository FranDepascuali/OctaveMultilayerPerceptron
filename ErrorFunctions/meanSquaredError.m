function error = meanSquaredError(expectedValues, obtainedValues)
	error = (0.5*sum((expectedValues' - obtainedValues) .^ 2)) / length(expectedValues);
endfunction
