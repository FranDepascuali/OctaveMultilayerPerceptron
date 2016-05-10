function weights = weightsToVector(W)
	weights =[];
	for i =1:length(W)
		weights = [weights W{i}'(:)' ];
	endfor
endfunction