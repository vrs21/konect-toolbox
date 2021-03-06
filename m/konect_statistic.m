%
% Compute a network statistic, i.e., a numerical characteric of a
% network.  This is a wrapper function that takes the name of the
% statistic as input and calls the actual function.  The functions
% for each statistic have names konect_statistic_$STATISTIC(). 
%
% A statistic in KONECT is a numerical characteristic of a network,
% e.g., the diameter or the clustering coefficient. 
%
% PARAMETERS 
%	statistic	The statistic to compute, as a string 
%	A		Half-adjacency / biadjacency matrix
%	format		The network format
%	weights		Edge weight type
%	opts		(optional) The variable opts.disp can be
%			set to control output
%
% RESULT 
%	values	Column vector of values.  The first value is the
%		statistic itself.  Subsequent values may denote
%		additional values, such as an error on the main value. 
%

function values = konect_statistic(statistic, A, format, weights, opts)

fh = str2func(sprintf('konect_statistic_%s', statistic)); 

if ~exist('opts', 'var')
    values = fh(A, format, weights); 
else
    values = fh(A, format, weights, opts); 
end

