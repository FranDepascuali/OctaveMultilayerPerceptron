addpath(genpath(pwd, ".git"))

% Octave configurations
setenv("GNUTERM","X11")
more off;
format long;

% Input values
x = -5 : 0.01 : 5;
% z = -5: 0.01 : 5;
% input = [x; z]
% x = 2 : 0.01 : 5;

% Output values
% y = sin(x) + 6 * (cos(x) .^ 2);
% y  = sin(x) .* x.^3 + x/2;
y = sin(x);
% y = sin(x) .* (x .^ 3) + x ./ 2;

% Normalization
% y = y ./ max(abs(y));


%Perceptron parameters
layers = [1 10 20 1];
eta = 0.1;
activationFunction = @tanhyp;
derivedActivationFunction = @derivativeTanhyp;
beta = 0.75;
momentum = 0.5;
W = initializeWeights(layers);

minimumError = 0.01;

% error = 0.001;
% momentum = 0.5;
% etaAdaptativo = 0;
% a = 0.0005;
% b = 0.1;
% minimumDeltaError = 0;
% noisePercentage = 0;
% max_ages = 100;
% clf;
% multiLayerPerceptron(max_ages,W,values, layerSizes, eta, gValue, betaValue, error, momentum, etaAdaptativo, a, b, minimumDeltaError, noisePercentage);


multilayerPerceptron(x, y, beta, layers, W, minimumError, eta, momentum)
