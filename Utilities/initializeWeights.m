% function weights = initializeWeights(layers)
% 	% layers(end + 1) = 1;
% 	% weights = cell(1, length(layerSizes) - 1);
% 	for i = 1 : length(layers) - 1
% 		% layers(i) + 1 is the current neurons in layer i + umbral
% 		% layers(i + 1) because we use the next layer for the columns of the matrix
% 		% we substract 0.5 because we need the values to be between -0.5 and 0.5
% 		weights{i} = rand(layers(i) + 1, layers(i + 1)) - 0.5;
% 	endfor
% endfunction

function W = initializeWeights(layers)
	W{1} = [0.1481722834265246 0.0995366380168439; -0.3237771452183862 0.2653936771589726];
	W{2} = [-0.0434091190902027 0.3993306219890832; 0.1434396357948250   0.1564685649371464;
    		-0.1163816221673394  -0.3107913290661953];
	W{3} = [-0.0756366684953529;
     			0.0389826671377138;
     			0.1826836291015775];
endfunction

%!test
%! layers = [4, 3, 5, 7];
%! weights = initializeWeights(layers);
%! assert (length(weights), length(layers) - 1);

%! for i = 1 : length(weights)
%! 	assert(size(weights{i}), [layers(i) + 1, layers(i + 1)])
%! endfor
