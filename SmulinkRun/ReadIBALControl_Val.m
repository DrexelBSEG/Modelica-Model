function ReadIBALControl(block)
%MSFUNTMPL_BASIC A Template for a Level-2 MATLAB S-Function
%   The MATLAB S-function is written as a MATLAB function with the
%   same name as the S-function. Replace 'msfuntmpl_basic' with the 
%   name of your S-function.

%   Copyright 2003-2018 The MathWorks, Inc.

%%
%% The setup method is used to set up the basic attributes of the
%% S-function such as ports, parameters, etc. Do not add any other
%% calls to the main body of the function.
%%
setup(block);

%endfunction

%% Function: setup ===================================================
%% Abstract:
%%   Set up the basic characteristics of the S-function block such as:
%%   - Input ports
%%   - Output ports
%%   - Dialog parameters
%%   - Options
%%
%%   Required         : Yes
%%   C MEX counterpart: mdlInitializeSizes
%%
function setup(block)

% Register number of ports
block.NumInputPorts  = 1;
block.NumOutputPorts = 1;

% Setup port properties to be inherited or dynamic
block.SetPreCompInpPortInfoToDynamic;
block.SetPreCompOutPortInfoToDynamic;

% Override input port properties
block.InputPort(1).Dimensions        = 1;
block.InputPort(1).DatatypeID  = 0;  % double
block.InputPort(1).Complexity  = 'Real';
block.InputPort(1).DirectFeedthrough = true;

% Override output port properties
block.OutputPort(1).Dimensions       = 37;
block.OutputPort(1).DatatypeID  = 0; % double
block.OutputPort(1).Complexity  = 'Real';


% Register parameters
block.NumDialogPrms     = 0;

% Register sample times
%  [0 offset]            : Continuous sample time
%  [positive_num offset] : Discrete sample time
%
%  [-1, 0]               : Inherited sample time
%  [-2, 0]               : Variable sample time
block.SampleTimes = [0 0];

% Specify the block simStateCompliance. The allowed values are:
%    'UnknownSimState', < The default setting; warn and assume DefaultSimState
%    'DefaultSimState', < Same sim state as a built-in block
%    'HasNoSimState',   < No sim state
%    'CustomSimState',  < Has GetSimState and SetSimState methods
%    'DisallowSimState' < Error out when saving or restoring the model sim state
block.SimStateCompliance = 'DefaultSimState';

%% -----------------------------------------------------------------
%% The MATLAB S-function uses an internal registry for all
%% block methods. You should register all relevant methods
%% (optional and required) as illustrated below. You may choose
%% any suitable name for the methods and implement these methods
%% as local functions within the same file. See comments
%% provided for each function for more information.
%% -----------------------------------------------------------------

% block.RegBlockMethod('PostPropagationSetup',    @DoPostPropSetup);
% block.RegBlockMethod('InitializeConditions', @InitializeConditions);
% block.RegBlockMethod('Start', @Start);
block.RegBlockMethod('Outputs', @Outputs);     % Required
% block.RegBlockMethod('Update', @Update);
% block.RegBlockMethod('Derivatives', @Derivatives);
block.RegBlockMethod('Terminate', @Terminate); % Required

%end setup

%%
%% PostPropagationSetup:
%%   Functionality    : Setup work areas and state variables. Can
%%                      also register run-time methods here
%%   Required         : No
%%   C MEX counterpart: mdlSetWorkWidths
%%
function DoPostPropSetup(block)
% block.NumDworks = 1;
%   
%   block.Dwork(1).Name            = 'x1';
%   block.Dwork(1).Dimensions      = 1;
%   block.Dwork(1).DatatypeID      = 0;      % double
%   block.Dwork(1).Complexity      = 'Real'; % real
%   block.Dwork(1).UsedAsDiscState = true;


%%
%% InitializeConditions:
%%   Functionality    : Called at the start of simulation and if it is 
%%                      present in an enabled subsystem configured to reset 
%%                      states, it will be called when the enabled subsystem
%%                      restarts execution to reset the states.
%%   Required         : No
%%   C MEX counterpart: mdlInitializeConditions
%%
function InitializeConditions(block)

%end InitializeConditions


%%
%% Start:
%%   Functionality    : Called once at start of model execution. If you
%%                      have states that should be initialized once, this 
%%                      is the place to do it.
%%   Required         : No
%%   C MEX counterpart: mdlStart
%%
function Start(block)
block.Dwork(1).Data = 0;

%end Start

%%
%% Outputs:
%%   Functionality    : Called to generate block outputs in
%%                      simulation step
%%   Required         : Yes
%%   C MEX counterpart: mdlOutputs
%%
function Outputs(block)
persistent AllValiData Val_case
if isempty(AllValiData)
    load('AllValiData.mat')
    load('Val_case.mat')
end
clock=block.InputPort(1).Data;

timestep=clock/60+1;
IBALConrtol=zeros(1,37);

IBALConrtol(1)=AllValiData{Val_case,1}(timestep).AHU2F;
IBALConrtol(2)=AllValiData{Val_case,1}(timestep).AHU1F;

IBALConrtol(3)=AllValiData{Val_case,1}(timestep).AHU2SAD;
IBALConrtol(4)=AllValiData{Val_case,1}(timestep).AHU2RAD;
IBALConrtol(5)=AllValiData{Val_case,1}(timestep).AHU2EAD;
IBALConrtol(6)=AllValiData{Val_case,1}(timestep).AHU1SAD;
IBALConrtol(7)=AllValiData{Val_case,1}(timestep).AHU1RAD;
IBALConrtol(8)=AllValiData{Val_case,1}(timestep).AHU1EAD;

IBALConrtol(9)=AllValiData{Val_case,1}(timestep).VAV1D;
IBALConrtol(10)=AllValiData{Val_case,1}(timestep).VAV2D;
if IBALConrtol(10)>0.7
    IBALConrtol(10)=IBALConrtol(10)-0.2;
end
IBALConrtol(11)=min(AllValiData{Val_case,1}(timestep).VAV3D+0.04,1);
IBALConrtol(12)=min(AllValiData{Val_case,1}(timestep).VAV4D+0.04,1);

IBALConrtol(13)=AllValiData{Val_case,3}(timestep).m_ahu2_SA;
IBALConrtol(14)=AllValiData{Val_case,3}(timestep).T_ahu2_SA+273.15;
IBALConrtol(15)=AllValiData{Val_case,3}(timestep).w_ahu2_SA;
IBALConrtol(16)=AllValiData{Val_case,3}(timestep).m_ahu1_SA;
IBALConrtol(17)=AllValiData{Val_case,3}(timestep).T_ahu1_SA+273.15;
IBALConrtol(18)=AllValiData{Val_case,3}(timestep).w_ahu1_SA;

if Val_case==1
    IBALConrtol(19)=AllValiData{Val_case,2}(timestep).Qs_z1_ahu2/2;
    IBALConrtol(20)=AllValiData{Val_case,2}(timestep).Qs_z2_ahu2/2;
    IBALConrtol(21)=AllValiData{Val_case,2}(timestep).Qs_z1_ahu1;
    IBALConrtol(22)=AllValiData{Val_case,2}(timestep).Qs_z2_ahu1;
    IBALConrtol(23)=AllValiData{Val_case,2}(timestep).Ql_z1_ahu2/5;
    IBALConrtol(24)=AllValiData{Val_case,2}(timestep).Ql_z2_ahu2/5;
    IBALConrtol(25)=AllValiData{Val_case,2}(timestep).Ql_z1_ahu1/5;
    IBALConrtol(26)=AllValiData{Val_case,2}(timestep).Ql_z2_ahu1/5;
elseif Val_case==2
    IBALConrtol(19)=AllValiData{Val_case,2}(timestep).Qs_z1_ahu2/1.5;
    IBALConrtol(20)=AllValiData{Val_case,2}(timestep).Qs_z2_ahu2/1.5;
    IBALConrtol(21)=AllValiData{Val_case,2}(timestep).Qs_z1_ahu1;
    IBALConrtol(22)=AllValiData{Val_case,2}(timestep).Qs_z2_ahu1;
    IBALConrtol(23)=AllValiData{Val_case,2}(timestep).Ql_z1_ahu2;
    IBALConrtol(24)=AllValiData{Val_case,2}(timestep).Ql_z2_ahu2;
    IBALConrtol(25)=AllValiData{Val_case,2}(timestep).Ql_z1_ahu1;
    IBALConrtol(26)=AllValiData{Val_case,2}(timestep).Ql_z2_ahu1;
else
    IBALConrtol(19)=AllValiData{Val_case,2}(timestep).Qs_z1_ahu2/1.5;
    IBALConrtol(20)=AllValiData{Val_case,2}(timestep).Qs_z2_ahu2/1.5;
    IBALConrtol(21)=AllValiData{Val_case,2}(timestep).Qs_z1_ahu1;
    IBALConrtol(22)=AllValiData{Val_case,2}(timestep).Qs_z2_ahu1;
    IBALConrtol(23)=AllValiData{Val_case,2}(timestep).Ql_z1_ahu2;
    IBALConrtol(24)=AllValiData{Val_case,2}(timestep).Ql_z2_ahu2;
    IBALConrtol(25)=AllValiData{Val_case,2}(timestep).Ql_z1_ahu1;
    IBALConrtol(26)=AllValiData{Val_case,2}(timestep).Ql_z2_ahu1;
end



if AllValiData{Val_case,3}(timestep).Power_pump1>50 || AllValiData{Val_case,3}(timestep).Power_pump2>50
    ChillerNum= find([AllValiData{Val_case,3}(timestep).Power_pump1 AllValiData{Val_case,3}(timestep).Power_pump2]==...
        max([AllValiData{Val_case,3}(timestep).Power_pump1 AllValiData{Val_case,3}(timestep).Power_pump2]));
    if ChillerNum==1
        IBALConrtol(27:30)=[1 0 1.38 0];
        IBALConrtol(37)=1.467;
    else
        IBALConrtol(27:30)=[0 1 0 1.490];
        IBALConrtol(37)=2.167;
    end
else
    IBALConrtol(27:30)=[0 0 0 0];
    IBALConrtol(37)=0;
end

IBALConrtol(31)=AllValiData{Val_case,1}(timestep).pump3_sped;
IBALConrtol(32)=min(AllValiData{Val_case,1}(timestep).v12_pos+0.6,1);
IBALConrtol(33)=min(0.4*(AllValiData{Val_case,1}(timestep).v13_pos)+0.7,1);
IBALConrtol(34)=AllValiData{Val_case,1}(timestep).ch1_Tset+273.15;
IBALConrtol(35)=AllValiData{Val_case,1}(timestep).ch2_Tset+273.15;
IBALConrtol(36)=AllValiData{Val_case,2}(timestep).Tw_out+273.15;

if timestep==1201
    clear AllValiData Val_case
end
block.OutputPort(1).Data = IBALConrtol;

%end Outputs

%%
%% Update:
%%   Functionality    : Called to update discrete states
%%                      during simulation step
%%   Required         : No
%%   C MEX counterpart: mdlUpdate
%%
function Update(block)

% block.Dwork(1).Data = block.InputPort(1).Data;

%end Update

%%
%% Derivatives:
%%   Functionality    : Called to update derivatives of
%%                      continuous states during simulation step
%%   Required         : No
%%   C MEX counterpart: mdlDerivatives
%%
function Derivatives(block)

%end Derivatives

%%
%% Terminate:
%%   Functionality    : Called at the end of simulation for cleanup
%%   Required         : Yes
%%   C MEX counterpart: mdlTerminate
%%
function Terminate(block)

%end Terminate

