// Copyright OEMTech, 2008, 20013. All rights reserved.

#include "CNC.h"
#include <windows.h>

static int (__cdecl *p_CNCAPIInit) (ConfigurationStructure*) = 0;
  int CNCAPIInit (ConfigurationStructure* Config)
  {
	return (*p_CNCAPIInit) (Config);
  }
static int (__cdecl *p_CNCAPIGetConfiguration) (ConfigurationStructure*) = 0;
  int CNCAPIGetConfiguration (ConfigurationStructure* Config)
  {
	return (*p_CNCAPIGetConfiguration) (Config);
  }
static int (__cdecl *p_CNCCloseHardwareBuffer) (void) = 0;
  int CNCCloseHardwareBuffer (void)
  {
    return (*p_CNCCloseHardwareBuffer) ();
  }
static int (__cdecl *p_CNCConnectToHardware) (int, int) = 0;
  int CNCConnectToHardware (int HardwareID, int ConnectOptions)
  {
    return (*p_CNCConnectToHardware) (HardwareID, ConnectOptions);
  }
static int (__cdecl *p_CNCContinue) (void) = 0;
  int CNCContinue (void)
  {
    return (*p_CNCContinue) ();
  }
static int (__cdecl *p_CNCDisconnectFromHardware) (void) = 0;
  int CNCDisconnectFromHardware (void)
  {
    return (*p_CNCDisconnectFromHardware) ();
  }
static int (__cdecl *p_CNCEnableCycleStartPin) (int, int, int, int) = 0;
  int CNCEnableCycleStartPin (int Enable, int RepeatEnabled, int FileStartLocation, int Options)
  {
    return (*p_CNCEnableCycleStartPin) (Enable, RepeatEnabled, FileStartLocation, Options);
  }
static int (__cdecl *p_CNCEnableEstopPin) (int, int) = 0;
  int CNCEnableEstopPin (int Enable, int Options)
  {
    return (*p_CNCEnableEstopPin) (Enable, Options);
  }
static int (__cdecl *p_CNCEnablePausePin) (int, int, int) = 0;
  int CNCEnablePausePin (int Enable, int Style, int Options)
  {
    return (*p_CNCEnablePausePin) (Enable, Style, Options);
  }
static int (__cdecl *p_CNCEnableSoftLimits) (int) = 0;
  int CNCEnableSoftLimits (int EnableStyle)
  {
    return (*p_CNCEnableSoftLimits) (EnableStyle);
  }
static int (__cdecl *p_CNCEnableTerrainFollowPins) (int, int, double, double, double) = 0;
  int CNCEnableTerrainFollowPins (int Enable, int Options, double MinZ, double MaxZ, double Vel)
  {
    return (*p_CNCEnableTerrainFollowPins) (Enable, Options, MinZ, MaxZ, Vel);
  }
static int (__cdecl *p_CNCEnterAutonomousMode) (int) = 0;
  int CNCEnterAutonomousMode (int Options)
  {
    return (*p_CNCEnterAutonomousMode) (Options);
  }
static int (__cdecl *p_CNCEstop) (void) = 0;
  int CNCEstop (void)
  {
    return (*p_CNCEstop) ();
  }
static int (__cdecl *p_CNCFeedRateOverride) (int, int) = 0;
  int CNCFeedRateOverride (int Percent, int Options)
  {
    return (*p_CNCFeedRateOverride) (Percent, Options);
  }
static int (__cdecl *p_CNCGetExtentsMM) (Extents*) = 0;
  int CNCGetExtentsMM (Extents* Exts)
  {
    return (*p_CNCGetExtentsMM) (Exts);
  }
static int (__cdecl *p_CNCGetHardwareStatus) (HardwareStatusStructure*) = 0;
  int CNCGetHardwareStatus (HardwareStatusStructure* Stat)
  {
    return (*p_CNCGetHardwareStatus) (Stat);
  }
static int (__cdecl *p_CNCGetInterpreterStatus) (InterpStatusStructure*) = 0;
  int CNCGetInterpreterStatus (InterpStatusStructure* Stat)
  {
    return (*p_CNCGetInterpreterStatus) (Stat);
  }
static int (__cdecl *p_CNCInit) (void) = 0;
  int CNCInit (void)
  {
    return (*p_CNCInit) ();
  }
static int (__cdecl *p_CNCInitInterpreter) (void) = 0;
  int CNCInitInterpreter (void)
  {
    return (*p_CNCInitInterpreter) ();
  }
static int (__cdecl *p_CNCJog) (double, int, int) = 0;
  int CNCJog (double Feedrate, int Axes, int Options)
  {
    return (*p_CNCJog) (Feedrate, Axes, Options);
  }
static wchar_t* (__cdecl *p_CNCLastGCodeErrorString) (void) = 0;
  wchar_t* CNCLastGCodeErrorString (void)
  {
    return (*p_CNCLastGCodeErrorString) ();
  }
static int (__cdecl *p_CNCLoadConfigFromINI) (wchar_t*) = 0;
  int CNCLoadConfigFromINI (wchar_t* INIFileName)
  {
    return (*p_CNCLoadConfigFromINI) (INIFileName);
  }
static int (__cdecl *p_CNCMemoryBlockRead) (int, PackedByteMemoryBlock) = 0;
  int CNCMemoryBlockRead (int BlockNo, PackedByteMemoryBlock var_Buffer)
  {
    return (*p_CNCMemoryBlockRead) (BlockNo, var_Buffer);
  }
static int (__cdecl *p_CNCMemoryBlockWrite) (int, PackedByteMemoryBlock) = 0;
  int CNCMemoryBlockWrite (int BlockNo, PackedByteMemoryBlock Buffer)
  {
    return (*p_CNCMemoryBlockWrite) (BlockNo, Buffer);
  }
static int (__cdecl *p_CNCOpenHardwareBuffer) (int, int) = 0;
  int CNCOpenHardwareBuffer (int Dest, int StartIndex)
  {
    return (*p_CNCOpenHardwareBuffer) (Dest, StartIndex);
  }
static int (__cdecl *p_CNCPause) (int) = 0;
  int CNCPause (int Options)
  {
    return (*p_CNCPause) (Options);
  }
static int (__cdecl *p_CNCProcessBlock) (wchar_t*, int, int) = 0;
  int CNCProcessBlock (wchar_t* GCode, int Options, int LineNo)
  {
	return (*p_CNCProcessBlock) (GCode, Options, LineNo);
  }
static int (__cdecl *p_CNCProcessGCodeFile) (wchar_t*, int) = 0;
  int CNCProcessGCodeFile (wchar_t* FileName, int BufferDestination)
  {
	return (*p_CNCProcessGCodeFile) (FileName, BufferDestination);
  }
static int (__cdecl *p_CNCReadProbedPosition) (HardwareStatusStructure*) = 0;
  int CNCReadProbedPosition (HardwareStatusStructure* Stat)
  {
    return (*p_CNCReadProbedPosition) (Stat);
  }
static int (__cdecl *p_CNCResetEstopPin) (int) = 0;
  int CNCResetEstopPin (int Options)
  {
    return (*p_CNCResetEstopPin) (Options);
  }
static int (__cdecl *p_CNCResetInterpreter) (void) = 0;
  int CNCResetInterpreter (void)
  {
    return (*p_CNCResetInterpreter) ();
  }
static int (__cdecl *p_CNCRestorePosition) (double, int, int) = 0;
  int CNCRestorePosition (double Feedrate, int Mask, int Options)
  {
    return (*p_CNCRestorePosition) (Feedrate, Mask, Options);
  }
static int (__cdecl *p_CNCRunJobFromSDStorage) (int) = 0;
  int CNCRunJobFromSDStorage (int Index)
  {
    return (*p_CNCRunJobFromSDStorage) (Index);
  }
static int (__cdecl *p_CNCSDCardBlockRead) (int, PackedByteMemoryBlock) = 0;
  int CNCSDCardBlockRead (int BlockNo, PackedByteMemoryBlock var_Buffer)
  {
    return (*p_CNCSDCardBlockRead) (BlockNo, var_Buffer);
  }
static int (__cdecl *p_CNCSDCardBlockWrite) (int, PackedByteMemoryBlock) = 0;
  int CNCSDCardBlockWrite (int BlockNo, PackedByteMemoryBlock Buffer)
  {
    return (*p_CNCSDCardBlockWrite) (BlockNo, Buffer);
  }
static int (__cdecl *p_CNCSavePosition) (int) = 0;
  int CNCSavePosition (int Options)
  {
    return (*p_CNCSavePosition) (Options);
  }
static int (__cdecl *p_CNCSaveScanToSTL) (wchar_t*) = 0;
  int CNCSaveScanToSTL (wchar_t* FName)
  {
    return (*p_CNCSaveScanToSTL) (FName);
  }
static int (__cdecl *p_CNCScanXY) (double, double, double, double, double, double, double, double, double) = 0;
  int CNCScanXY (double MinX, double MaxX, double MinY, double MaxY, double MinZ, double MaxZ, double XRes, double YRes, double Vel)
  {
    return (*p_CNCScanXY) (MinX, MaxX, MinY, MaxY, MinZ, MaxZ, XRes, YRes, Vel);
  }
static int (__cdecl *p_CNCSetInputPolarities) (int, int) = 0;
  int CNCSetInputPolarities (int Polarities, int Options)
  {
    return (*p_CNCSetInputPolarities) (Polarities, Options);
  }
static int (__cdecl *p_CNCSetProbe) (int, int) = 0;
  int CNCSetProbe (int State, int Options)
  {
    return (*p_CNCSetProbe) (State, Options);
  }
static int (__cdecl *p_CNCSetStopMode) (Axes, int, int) = 0;
  int CNCSetStopMode (Axes Masks, int IsHard, int Options)
  {
    return (*p_CNCSetStopMode) (Masks, IsHard, Options);
  }
static int (__cdecl *p_CNCSetStopModeEstopPin) (int, int) = 0;
  int CNCSetStopModeEstopPin (int IsHard, int Options)
  {
    return (*p_CNCSetStopModeEstopPin) (IsHard, Options);
  }
static int (__cdecl *p_CNCSetStopModeHomeSwitches) (int, int) = 0;
  int CNCSetStopModeHomeSwitches (int IsHard, int Options)
  {
    return (*p_CNCSetStopModeHomeSwitches) (IsHard, Options);
  }
static int (__cdecl *p_CNCSetStopModeNone) (int) = 0;
  int CNCSetStopModeNone (int Options)
  {
    return (*p_CNCSetStopModeNone) (Options);
  }
static int (__cdecl *p_CNCSetTrajectoryPlanner) (int, int) = 0;
  int CNCSetTrajectoryPlanner (int PlannerID, int PlannerOptions)
  {
    return (*p_CNCSetTrajectoryPlanner) (PlannerID, PlannerOptions);
  }
static int (__cdecl *p_CNCStartLinearMaskedMove) (double, AxesDouble, int, int, int) = 0;
  int CNCStartLinearMaskedMove (double FeedRate, AxesDouble var_Position, int Mask, int IsRelative, int Options)
  {
    return (*p_CNCStartLinearMaskedMove) (FeedRate, var_Position, Mask, IsRelative, Options);
  }
static int (__cdecl *p_CNCStartLinearMaskedMoveSteps) (int, Axes, int, int, int) = 0;
  int CNCStartLinearMaskedMoveSteps (int FeedRate, Axes var_Position, int Mask, int IsRelative, int Options)
  {
	return (*p_CNCStartLinearMaskedMoveSteps) (FeedRate, var_Position, Mask, IsRelative, Options);
  }
static int (__cdecl *p_CNCStopMotion) (void) = 0;
  int CNCStopMotion (void)
  {
    return (*p_CNCStopMotion) ();
  }
static int (__cdecl *p_CNCToolLibraryGetTool) (int, CNCTool*) = 0;
  int CNCToolLibraryGetTool (int ToolNumber, CNCTool* Tool)
  {
	return (*p_CNCToolLibraryGetTool) (ToolNumber, Tool);
  }
static int (__cdecl *p_CNCToolLibraryLoadFromINI) (wchar_t*) = 0;
  int CNCToolLibraryLoadFromINI (wchar_t* FName)
  {
    return (*p_CNCToolLibraryLoadFromINI) (FName);
  }
static int (__cdecl *p_CNCToolLibrarySaveToIniFile) (wchar_t*) = 0;
  int CNCToolLibrarySaveToIniFile (wchar_t* FName)
  {
    return (*p_CNCToolLibrarySaveToIniFile) (FName);
  }
static int (__cdecl *p_CNCToolLibrarySetMaxTools) (int) = 0;
  int CNCToolLibrarySetMaxTools (int MaxTools)
  {
    return (*p_CNCToolLibrarySetMaxTools) (MaxTools);
  }
static int (__cdecl *p_CNCZeroExtents) (void) = 0;
  int CNCZeroExtents (void)
  {
    return (*p_CNCZeroExtents) ();
  }
static void (__cdecl *p_CNCArcMove) (double, double, double, double, int, double, double, double, double, int) = 0;
  void CNCArcMove (double first_end, double second_end, double first_axis, double second_axis, int rotation, double axis_end_point, double a, double b, double c, int Options)
  {
    (*p_CNCArcMove) (first_end, second_end, first_axis, second_axis, rotation, axis_end_point, a, b, c, Options);
  }
static void (__cdecl *p_CNCChangeTool) (int, int) = 0;
  void CNCChangeTool (int slot, int Options)
  {
    (*p_CNCChangeTool) (slot, Options);
  }
static void (__cdecl *p_CNCClearAuxOutputBit) (int, int) = 0;
  void CNCClearAuxOutputBit (int bit, int Options)
  {
    (*p_CNCClearAuxOutputBit) (bit, Options);
  }
static void (__cdecl *p_CNCClearMotionOutputBit) (int, int) = 0;
  void CNCClearMotionOutputBit (int bit, int Options)
  {
    (*p_CNCClearMotionOutputBit) (bit, Options);
  }
static void (__cdecl *p_CNCComment) (wchar_t*, int) = 0;
  void CNCComment (wchar_t* s, int Options)
  {
    (*p_CNCComment) (s, Options);
  }
static void (__cdecl *p_CNCDisableFeedOverride) (int) = 0;
  void CNCDisableFeedOverride (int Options)
  {
    (*p_CNCDisableFeedOverride) (Options);
  }
static void (__cdecl *p_CNCDisableSpeedOverride) (int) = 0;
  void CNCDisableSpeedOverride (int Options)
  {
    (*p_CNCDisableSpeedOverride) (Options);
  }
static void (__cdecl *p_CNCDwell) (double, int) = 0;
  void CNCDwell (double seconds, int Options)
  {
    (*p_CNCDwell) (seconds, Options);
  }
static void (__cdecl *p_CNCEnableFeedOverride) (int) = 0;
  void CNCEnableFeedOverride (int Options)
  {
    (*p_CNCEnableFeedOverride) (Options);
  }
static void (__cdecl *p_CNCEnableSpeedOverride) (int) = 0;
  void CNCEnableSpeedOverride (int Options)
  {
    (*p_CNCEnableSpeedOverride) (Options);
  }
static void (__cdecl *p_CNCExecuteG27Home) (double, double, double, double, double, double, char, int) = 0;
  void CNCExecuteG27Home (double x, double y, double z, double a, double b, double c, char AxisFlags, int Options)
  {
    (*p_CNCExecuteG27Home) (x, y, z, a, b, c, AxisFlags, Options);
  }
static void (__cdecl *p_CNCExecuteG30Home) (double, double, double, double, double, double, char, int) = 0;
  void CNCExecuteG30Home (double x, double y, double z, double a, double b, double c, char AxisFlags, int Options)
  {
    (*p_CNCExecuteG30Home) (x, y, z, a, b, c, AxisFlags, Options);
  }
static void (__cdecl *p_CNCFloodOff) (int) = 0;
  void CNCFloodOff (int Options)
  {
    (*p_CNCFloodOff) (Options);
  }
static void (__cdecl *p_CNCFloodOn) (int) = 0;
  void CNCFloodOn (int Options)
  {
    (*p_CNCFloodOn) (Options);
  }
static void (__cdecl *p_CNCMistOff) (int) = 0;
  void CNCMistOff (int Options)
  {
    (*p_CNCMistOff) (Options);
  }
static void (__cdecl *p_CNCMistOn) (int) = 0;
  void CNCMistOn (int Options)
  {
    (*p_CNCMistOn) (Options);
  }
static void (__cdecl *p_CNCMsg) (wchar_t*, int) = 0;
  void CNCMsg (wchar_t* s, int Options)
  {
    (*p_CNCMsg) (s, Options);
  }
static void (__cdecl *p_CNCOptionalProgramStop) (void) = 0;
  void CNCOptionalProgramStop (void)
  {
    (*p_CNCOptionalProgramStop) ();
  }
static void (__cdecl *p_CNCOrientSpindle) (double, int, int) = 0;
  void CNCOrientSpindle (double val, int dir, int Options)
  {
    (*p_CNCOrientSpindle) (val, dir, Options);
  }
static void (__cdecl *p_CNCPalletteShuttle) (int) = 0;
  void CNCPalletteShuttle (int Options)
  {
    (*p_CNCPalletteShuttle) (Options);
  }
static void (__cdecl *p_CNCProgramMessageStop) (wchar_t*) = 0;
  void CNCProgramMessageStop (wchar_t* msg)
  {
    (*p_CNCProgramMessageStop) (msg);
  }
static void (__cdecl *p_CNCProgramStop) (void) = 0;
  void CNCProgramStop (void)
  {
    (*p_CNCProgramStop) ();
  }
static void (__cdecl *p_CNCRapidMove) (double, double, double, double, double, double, int) = 0;
  void CNCRapidMove (double x, double y, double z, double a, double b, double c, int Options)
  {
    (*p_CNCRapidMove) (x, y, z, a, b, c, Options);
  }
static void (__cdecl *p_CNCSelectPlane) (int) = 0;
  void CNCSelectPlane (int in_plane)
  {
    (*p_CNCSelectPlane) (in_plane);
  }
static void (__cdecl *p_CNCSelectTool) (int, int) = 0;
  void CNCSelectTool (int slot, int Options)
  {
    (*p_CNCSelectTool) (slot, Options);
  }
static void (__cdecl *p_CNCOutputIO) (int, int, int) = 0;
  void CNCOutputIO (int Output, int Mask, int Options)
  {
	(*p_CNCOutputIO) (Output, Mask, Options);
  }
static void (__cdecl *p_CNCSetAuxOutputBit) (int, int) = 0;
  void CNCSetAuxOutputBit (int bit, int Options)
  {
	(*p_CNCSetAuxOutputBit) (bit, Options);
  }
static void (__cdecl *p_CNCSetAxisOffsets) (double, double, double, double, double, double) = 0;
  void CNCSetAxisOffsets (double x, double y, double z, double a, double b, double c)
  {
    (*p_CNCSetAxisOffsets) (x, y, z, a, b, c);
  }
static void (__cdecl *p_CNCSetAxisCoordinates) (double, double, double, double, double, double, char, int) = 0;
  void CNCSetAxisCoordinates (double x, double y, double z, double a, double b, double c, char AxisFlags, int Options)
  {
    (*p_CNCSetAxisCoordinates) (x, y, z, a, b, c, AxisFlags, Options);
  }
static void (__cdecl *p_CNCSetAxisCoordinatesSteps) (int, int, int, int, int, int, char, int) = 0;
  void CNCSetAxisCoordinatesSteps (int x, int y, int z, int a, int b, int c, char AxisFlags, int Options)
  {
	(*p_CNCSetAxisCoordinatesSteps) (x, y, z, a, b, c, AxisFlags, Options);
  }
static void (__cdecl *p_CNCSetFeedrate) (double) = 0;
  void CNCSetFeedrate (double rate)
  {
    (*p_CNCSetFeedrate) (rate);
  }
static void (__cdecl *p_CNCSetMotionControlMode) (int, double, double) = 0;
  void CNCSetMotionControlMode (int mode, double tol, double angle)
  {
	(*p_CNCSetMotionControlMode) (mode, tol, angle);
  }
static void (__cdecl *p_CNCSetMotionOutputBit) (int, int) = 0;
  void CNCSetMotionOutputBit (int bit, int Options)
  {
    (*p_CNCSetMotionOutputBit) (bit, Options);
  }
static void (__cdecl *p_CNCSetOriginOffsets) (double, double, double, double, double, double) = 0;
  void CNCSetOriginOffsets (double x, double y, double z, double a, double b, double c)
  {
    (*p_CNCSetOriginOffsets) (x, y, z, a, b, c);
  }
static void (__cdecl *p_CNCSetSpindleSpeed) (double, int) = 0;
  void CNCSetSpindleSpeed (double r, int Options)
  {
    (*p_CNCSetSpindleSpeed) (r, Options);
  }
static void (__cdecl *p_CNCStartSpeedFeedSynch) (int) = 0;
  void CNCStartSpeedFeedSynch (int Options)
  {
    (*p_CNCStartSpeedFeedSynch) (Options);
  }
static void (__cdecl *p_CNCStartSpindleClockwise) (int) = 0;
  void CNCStartSpindleClockwise (int Options)
  {
    (*p_CNCStartSpindleClockwise) (Options);
  }
static void (__cdecl *p_CNCStartSpindleCounterClockwise) (int) = 0;
  void CNCStartSpindleCounterClockwise (int Options)
  {
    (*p_CNCStartSpindleCounterClockwise) (Options);
  }
static void (__cdecl *p_CNCStopSpeedFeedSynch) (int) = 0;
  void CNCStopSpeedFeedSynch (int Options)
  {
    (*p_CNCStopSpeedFeedSynch) (Options);
  }
static void (__cdecl *p_CNCStopSpindleTurning) (int) = 0;
  void CNCStopSpindleTurning (int Options)
  {
    (*p_CNCStopSpindleTurning) (Options);
  }
static void (__cdecl *p_CNCStraightMove) (double, double, double, double, double, double, int) = 0;
  void CNCStraightMove (double x, double y, double z, double a, double b, double c, int Options)
  {
    (*p_CNCStraightMove) (x, y, z, a, b, c, Options);
  }
static void (__cdecl *p_CNCStraightProbe) (double, double, double, double, double, double, int) = 0;
  void CNCStraightProbe (double x, double y, double z, double AA, double BB, double CC, int Options)
  {
    (*p_CNCStraightProbe) (x, y, z, AA, BB, CC, Options);
  }
static void (__cdecl *p_CNCUseLengthUnits) (int, int) = 0;
  void CNCUseLengthUnits (int in_unit, int LineNo)
  {
    (*p_CNCUseLengthUnits) (in_unit, LineNo);
  }
static void (__cdecl *p_CNCUseToolLengthOffset) (int) = 0;
  void CNCUseToolLengthOffset (int index)
  {
    (*p_CNCUseToolLengthOffset) (index);
  }

static HMODULE CncDll;
int LoadCncDll ()
{
  CncDll = LoadLibrary (TEXT ("CNC.dll"));
  p_CNCAPIInit = (void *) GetProcAddress (CncDll, "CNCAPIInit");
	if (!p_CNCAPIInit) return -1;
  p_CNCAPIGetConfiguration = (void *) GetProcAddress (CncDll, "CNCAPIGetConfiguration");
	if (!p_CNCAPIGetConfiguration) return -1;
  p_CNCCloseHardwareBuffer = (void *) GetProcAddress (CncDll, "CNCCloseHardwareBuffer");
	if (!p_CNCCloseHardwareBuffer) return -1;
  p_CNCConnectToHardware = (void *) GetProcAddress (CncDll, "CNCConnectToHardware");
    if (!p_CNCConnectToHardware) return -1;
  p_CNCContinue = (void *) GetProcAddress (CncDll, "CNCContinue");
    if (!p_CNCContinue) return -1;
  p_CNCDisconnectFromHardware = (void *) GetProcAddress (CncDll, "CNCDisconnectFromHardware");
    if (!p_CNCDisconnectFromHardware) return -1;
  p_CNCEnableCycleStartPin = (void *) GetProcAddress (CncDll, "CNCEnableCycleStartPin");
    if (!p_CNCEnableCycleStartPin) return -1;
  p_CNCEnableEstopPin = (void *) GetProcAddress (CncDll, "CNCEnableEstopPin");
    if (!p_CNCEnableEstopPin) return -1;
  p_CNCEnablePausePin = (void *) GetProcAddress (CncDll, "CNCEnablePausePin");
    if (!p_CNCEnablePausePin) return -1;
  p_CNCEnableSoftLimits = (void *) GetProcAddress (CncDll, "CNCEnableSoftLimits");
    if (!p_CNCEnableSoftLimits) return -1;
  p_CNCEnableTerrainFollowPins = (void *) GetProcAddress (CncDll, "CNCEnableTerrainFollowPins");
    if (!p_CNCEnableTerrainFollowPins) return -1;
  p_CNCEnterAutonomousMode = (void *) GetProcAddress (CncDll, "CNCEnterAutonomousMode");
    if (!p_CNCEnterAutonomousMode) return -1;
  p_CNCEstop = (void *) GetProcAddress (CncDll, "CNCEstop");
    if (!p_CNCEstop) return -1;
  p_CNCFeedRateOverride = (void *) GetProcAddress (CncDll, "CNCFeedRateOverride");
    if (!p_CNCFeedRateOverride) return -1;
  p_CNCGetExtentsMM = (void *) GetProcAddress (CncDll, "CNCGetExtentsMM");
    if (!p_CNCGetExtentsMM) return -1;
  p_CNCGetHardwareStatus = (void *) GetProcAddress (CncDll, "CNCGetHardwareStatus");
	if (!p_CNCGetHardwareStatus) return -1;
  p_CNCGetInterpreterStatus = (void *) GetProcAddress (CncDll, "CNCGetInterpreterStatus");
    if (!p_CNCGetInterpreterStatus) return -1;
  p_CNCInit = (void *) GetProcAddress (CncDll, "CNCInit");
    if (!p_CNCInit) return -1;
  p_CNCInitInterpreter = (void *) GetProcAddress (CncDll, "CNCInitInterpreter");
    if (!p_CNCInitInterpreter) return -1;
  p_CNCJog = (void *) GetProcAddress (CncDll, "CNCJog");
    if (!p_CNCJog) return -1;
  p_CNCLastGCodeErrorString = (void *) GetProcAddress (CncDll, "CNCLastGCodeErrorString");
    if (!p_CNCLastGCodeErrorString) return -1;
  p_CNCLoadConfigFromINI = (void *) GetProcAddress (CncDll, "CNCLoadConfigFromINI");
    if (!p_CNCLoadConfigFromINI) return -1;
  p_CNCMemoryBlockRead = (void *) GetProcAddress (CncDll, "CNCMemoryBlockRead");
    if (!p_CNCMemoryBlockRead) return -1;
  p_CNCMemoryBlockWrite = (void *) GetProcAddress (CncDll, "CNCMemoryBlockWrite");
    if (!p_CNCMemoryBlockWrite) return -1;
  p_CNCOpenHardwareBuffer = (void *) GetProcAddress (CncDll, "CNCOpenHardwareBuffer");
    if (!p_CNCOpenHardwareBuffer) return -1;
  p_CNCPause = (void *) GetProcAddress (CncDll, "CNCPause");
    if (!p_CNCPause) return -1;
  p_CNCProcessBlock = (void *) GetProcAddress (CncDll, "CNCProcessBlock");
	if (!p_CNCProcessBlock) return -1;
  p_CNCProcessGCodeFile = (void *) GetProcAddress (CncDll, "CNCProcessGCodeFile");
	if (!p_CNCProcessGCodeFile) return -1;
  p_CNCReadProbedPosition = (void *) GetProcAddress (CncDll, "CNCReadProbedPosition");
    if (!p_CNCReadProbedPosition) return -1;
  p_CNCResetEstopPin = (void *) GetProcAddress (CncDll, "CNCResetEstopPin");
    if (!p_CNCResetEstopPin) return -1;
  p_CNCResetInterpreter = (void *) GetProcAddress (CncDll, "CNCResetInterpreter");
	if (!p_CNCResetInterpreter) return -1;
  p_CNCRestorePosition = (void *) GetProcAddress (CncDll, "CNCRestorePosition");
    if (!p_CNCRestorePosition) return -1;
  p_CNCRunJobFromSDStorage = (void *) GetProcAddress (CncDll, "CNCRunJobFromSDStorage");
    if (!p_CNCRunJobFromSDStorage) return -1;
  p_CNCSDCardBlockRead = (void *) GetProcAddress (CncDll, "CNCSDCardBlockRead");
    if (!p_CNCSDCardBlockRead) return -1;
  p_CNCSDCardBlockWrite = (void *) GetProcAddress (CncDll, "CNCSDCardBlockWrite");
    if (!p_CNCSDCardBlockWrite) return -1;
  p_CNCSavePosition = (void *) GetProcAddress (CncDll, "CNCSavePosition");
    if (!p_CNCSavePosition) return -1;
  p_CNCSaveScanToSTL = (void *) GetProcAddress (CncDll, "CNCSaveScanToSTL");
    if (!p_CNCSaveScanToSTL) return -1;
  p_CNCScanXY = (void *) GetProcAddress (CncDll, "CNCScanXY");
    if (!p_CNCScanXY) return -1;
  p_CNCSetInputPolarities = (void *) GetProcAddress (CncDll, "CNCSetInputPolarities");
    if (!p_CNCSetInputPolarities) return -1;
  p_CNCSetProbe = (void *) GetProcAddress (CncDll, "CNCSetProbe");
    if (!p_CNCSetProbe) return -1;
  p_CNCSetStopMode = (void *) GetProcAddress (CncDll, "CNCSetStopMode");
    if (!p_CNCSetStopMode) return -1;
  p_CNCSetStopModeEstopPin = (void *) GetProcAddress (CncDll, "CNCSetStopModeEstopPin");
    if (!p_CNCSetStopModeEstopPin) return -1;
  p_CNCSetStopModeHomeSwitches = (void *) GetProcAddress (CncDll, "CNCSetStopModeHomeSwitches");
    if (!p_CNCSetStopModeHomeSwitches) return -1;
  p_CNCSetStopModeNone = (void *) GetProcAddress (CncDll, "CNCSetStopModeNone");
    if (!p_CNCSetStopModeNone) return -1;
  p_CNCSetTrajectoryPlanner = (void *) GetProcAddress (CncDll, "CNCSetTrajectoryPlanner");
    if (!p_CNCSetTrajectoryPlanner) return -1;
  p_CNCStartLinearMaskedMove = (void *) GetProcAddress (CncDll, "CNCStartLinearMaskedMove");
	if (!p_CNCStartLinearMaskedMove) return -1;
  p_CNCStartLinearMaskedMoveSteps = (void *) GetProcAddress (CncDll, "CNCStartLinearMaskedMoveSteps");
	if (!p_CNCStartLinearMaskedMoveSteps) return -1;
  p_CNCStopMotion = (void *) GetProcAddress (CncDll, "CNCStopMotion");
    if (!p_CNCStopMotion) return -1;
  p_CNCToolLibraryGetTool = (void *) GetProcAddress (CncDll, "CNCToolLibraryGetTool");
    if (!p_CNCToolLibraryGetTool) return -1;
  p_CNCToolLibraryLoadFromINI = (void *) GetProcAddress (CncDll, "CNCToolLibraryLoadFromINI");
    if (!p_CNCToolLibraryLoadFromINI) return -1;
  p_CNCToolLibrarySaveToIniFile = (void *) GetProcAddress (CncDll, "CNCToolLibrarySaveToIniFile");
    if (!p_CNCToolLibrarySaveToIniFile) return -1;
  p_CNCToolLibrarySetMaxTools = (void *) GetProcAddress (CncDll, "CNCToolLibrarySetMaxTools");
    if (!p_CNCToolLibrarySetMaxTools) return -1;
  p_CNCZeroExtents = (void *) GetProcAddress (CncDll, "CNCZeroExtents");
    if (!p_CNCZeroExtents) return -1;
  p_CNCArcMove = (void *) GetProcAddress (CncDll, "CNCArcMove");
    if (!p_CNCArcMove) return -1;
  p_CNCChangeTool = (void *) GetProcAddress (CncDll, "CNCChangeTool");
    if (!p_CNCChangeTool) return -1;
  p_CNCClearAuxOutputBit = (void *) GetProcAddress (CncDll, "CNCClearAuxOutputBit");
    if (!p_CNCClearAuxOutputBit) return -1;
  p_CNCClearMotionOutputBit = (void *) GetProcAddress (CncDll, "CNCClearMotionOutputBit");
    if (!p_CNCClearMotionOutputBit) return -1;
  p_CNCComment = (void *) GetProcAddress (CncDll, "CNCComment");
    if (!p_CNCComment) return -1;
  p_CNCDisableFeedOverride = (void *) GetProcAddress (CncDll, "CNCDisableFeedOverride");
    if (!p_CNCDisableFeedOverride) return -1;
  p_CNCDisableSpeedOverride = (void *) GetProcAddress (CncDll, "CNCDisableSpeedOverride");
    if (!p_CNCDisableSpeedOverride) return -1;
  p_CNCDwell = (void *) GetProcAddress (CncDll, "CNCDwell");
    if (!p_CNCDwell) return -1;
  p_CNCEnableFeedOverride = (void *) GetProcAddress (CncDll, "CNCEnableFeedOverride");
    if (!p_CNCEnableFeedOverride) return -1;
  p_CNCEnableSpeedOverride = (void *) GetProcAddress (CncDll, "CNCEnableSpeedOverride");
    if (!p_CNCEnableSpeedOverride) return -1;
  p_CNCExecuteG27Home = (void *) GetProcAddress (CncDll, "CNCExecuteG27Home");
    if (!p_CNCExecuteG27Home) return -1;
  p_CNCExecuteG30Home = (void *) GetProcAddress (CncDll, "CNCExecuteG30Home");
    if (!p_CNCExecuteG30Home) return -1;
  p_CNCFloodOff = (void *) GetProcAddress (CncDll, "CNCFloodOff");
    if (!p_CNCFloodOff) return -1;
  p_CNCFloodOn = (void *) GetProcAddress (CncDll, "CNCFloodOn");
    if (!p_CNCFloodOn) return -1;
  p_CNCMistOff = (void *) GetProcAddress (CncDll, "CNCMistOff");
    if (!p_CNCMistOff) return -1;
  p_CNCMistOn = (void *) GetProcAddress (CncDll, "CNCMistOn");
    if (!p_CNCMistOn) return -1;
  p_CNCMsg = (void *) GetProcAddress (CncDll, "CNCMsg");
    if (!p_CNCMsg) return -1;
  p_CNCOptionalProgramStop = (void *) GetProcAddress (CncDll, "CNCOptionalProgramStop");
    if (!p_CNCOptionalProgramStop) return -1;
  p_CNCOrientSpindle = (void *) GetProcAddress (CncDll, "CNCOrientSpindle");
    if (!p_CNCOrientSpindle) return -1;
  p_CNCPalletteShuttle = (void *) GetProcAddress (CncDll, "CNCPalletteShuttle");
    if (!p_CNCPalletteShuttle) return -1;
  p_CNCProgramMessageStop = (void *) GetProcAddress (CncDll, "CNCProgramMessageStop");
    if (!p_CNCProgramMessageStop) return -1;
  p_CNCProgramStop = (void *) GetProcAddress (CncDll, "CNCProgramStop");
    if (!p_CNCProgramStop) return -1;
  p_CNCRapidMove = (void *) GetProcAddress (CncDll, "CNCRapidMove");
    if (!p_CNCRapidMove) return -1;
  p_CNCSelectPlane = (void *) GetProcAddress (CncDll, "CNCSelectPlane");
    if (!p_CNCSelectPlane) return -1;
  p_CNCSelectTool = (void *) GetProcAddress (CncDll, "CNCSelectTool");
    if (!p_CNCSelectTool) return -1;
  p_CNCOutputIO = (void *) GetProcAddress (CncDll, "CNCOutputIO");
	if (!p_CNCOutputIO) return -1;
  p_CNCSetAuxOutputBit = (void *) GetProcAddress (CncDll, "CNCSetAuxOutputBit");
	if (!p_CNCSetAuxOutputBit) return -1;
  p_CNCSetAxisOffsets = (void *) GetProcAddress (CncDll, "CNCSetAxisOffsets");
    if (!p_CNCSetAxisOffsets) return -1;
  p_CNCSetAxisCoordinates = (void *) GetProcAddress (CncDll, "CNCSetAxisCoordinates");
	if (!p_CNCSetAxisCoordinates) return -1;
  p_CNCSetAxisCoordinatesSteps = (void *) GetProcAddress (CncDll, "CNCSetAxisCoordinatesSteps");
	if (!p_CNCSetAxisCoordinatesSteps) return -1;
  p_CNCSetFeedrate = (void *) GetProcAddress (CncDll, "CNCSetFeedrate");
    if (!p_CNCSetFeedrate) return -1;
  p_CNCSetMotionControlMode = (void *) GetProcAddress (CncDll, "CNCSetMotionControlMode");
    if (!p_CNCSetMotionControlMode) return -1;
  p_CNCSetMotionOutputBit = (void *) GetProcAddress (CncDll, "CNCSetMotionOutputBit");
    if (!p_CNCSetMotionOutputBit) return -1;
  p_CNCSetOriginOffsets = (void *) GetProcAddress (CncDll, "CNCSetOriginOffsets");
    if (!p_CNCSetOriginOffsets) return -1;
  p_CNCSetSpindleSpeed = (void *) GetProcAddress (CncDll, "CNCSetSpindleSpeed");
    if (!p_CNCSetSpindleSpeed) return -1;
  p_CNCStartSpeedFeedSynch = (void *) GetProcAddress (CncDll, "CNCStartSpeedFeedSynch");
    if (!p_CNCStartSpeedFeedSynch) return -1;
  p_CNCStartSpindleClockwise = (void *) GetProcAddress (CncDll, "CNCStartSpindleClockwise");
    if (!p_CNCStartSpindleClockwise) return -1;
  p_CNCStartSpindleCounterClockwise = (void *) GetProcAddress (CncDll, "CNCStartSpindleCounterClockwise");
    if (!p_CNCStartSpindleCounterClockwise) return -1;
  p_CNCStopSpeedFeedSynch = (void *) GetProcAddress (CncDll, "CNCStopSpeedFeedSynch");
    if (!p_CNCStopSpeedFeedSynch) return -1;
  p_CNCStopSpindleTurning = (void *) GetProcAddress (CncDll, "CNCStopSpindleTurning");
    if (!p_CNCStopSpindleTurning) return -1;
  p_CNCStraightMove = (void *) GetProcAddress (CncDll, "CNCStraightMove");
    if (!p_CNCStraightMove) return -1;
  p_CNCStraightProbe = (void *) GetProcAddress (CncDll, "CNCStraightProbe");
    if (!p_CNCStraightProbe) return -1;
  p_CNCUseLengthUnits = (void *) GetProcAddress (CncDll, "CNCUseLengthUnits");
    if (!p_CNCUseLengthUnits) return -1;
  p_CNCUseToolLengthOffset = (void *) GetProcAddress (CncDll, "CNCUseToolLengthOffset");
    if (!p_CNCUseToolLengthOffset) return -1;
  return 0;
}