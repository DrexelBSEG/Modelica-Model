Atlanta_Eff_TypSum_RB_2004_TypOcc_TypBehav_NoTES_LoadBalance_05282023_070250.mat: An example of IBAL raw historical data
DataPre.m: Pre-process raw historical data and generate a .mat file called 'AllData.mat'
ReadIBALControl.m: Based on the time step, the control signal of the IBAL Modelica model is read out from AllData.mat

The remaining functions are the sub-equations that will be used in the DataPre.m