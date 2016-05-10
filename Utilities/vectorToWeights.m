function W = vectorToWeights(vec,layerSizes)
	layerSizes(end+1) = 1;
	elements = 0;
	for i = 1:length(layerSizes) - 1
		x = elements +1;
		elements = elements + (layerSizes(i)+1) * layerSizes(i+1);
		W{i} = (reshape(vec(1,x:elements), layerSizes(i)+1, layerSizes(i+1)))';
	endfor
endfunction