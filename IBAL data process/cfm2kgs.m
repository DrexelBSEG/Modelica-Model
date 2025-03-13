function kgs = cfm2kgs(cfm,rho)
%% Notes
% Source: Google
% Author: Zhelun Chen
% Date: 03/22/2023
%
%% Inputs
% cfm:  Flow rate [CFM]
% rho:  user defined density [kg/m3]
%
%% Outputs
% kgs:  Mass flow rate [kg/s]
%
%% Main
% If air density not provided, set to 1.25 by default
if nargin == 1
    rho = 1.25;
end

% Conversion
kgs = ((0.3048^3)/60)*cfm.*rho;

end

