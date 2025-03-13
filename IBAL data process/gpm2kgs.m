function kgs = gpm2kgs(gpm,rho)
%% Notes
% Inputs
% cfm:  Flow rate [GPM]
% opt:  1-use input density, else use water density 1000 kg/m3
% rho:  user defined density [kg/m3]
% Outputs
% kgs:  Mass flow rate [kg/s]
%% Main
if nargin == 1
    rho = 1000;
end
kgs = (0.00378541/60) * gpm .* rho;
end

