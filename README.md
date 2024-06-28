# File Description

* Modelica_IBAL.mo: The Modelica model of the IBAL system, including 2 AHUs air loop and a water loop with 2 chillers and the pumps. Note that there is no ice tank, local controller, or zone simulator in the Modelica model. Using the FMU interfaces to expose the input and output of the Modelica model.
  * _Input_: equipment control signal, outdoor air condition, plant chilled water condition.
  * _Output_: VAV supply air condition and the equipment power. 

* Modelica_IBAL.fmu: The fmu file that converted from the Modelica_IBAL.mo. The fmu file can be used in MATLAB Simulink for simulation purposes.
* CoSimulationDemo: The library used in Modelica_IBAL.mo. **Note** It also needs the Buildings 8.1.3 library, which is not uploaded because of the size limitation. 
