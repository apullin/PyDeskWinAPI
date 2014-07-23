// Copyright OEMTech, 2008-2013. All rights reserved.

#include <stdlib.h>
#ifdef __cplusplus
extern "C"
{
#endif
const int   IDFILE = 1;
const int   IDNCPOD = 2;
const int   IDNCPODII = 3;
const int   IDSIMULATOR = 4;
const int   IDAGNI = 5;

const int IDPLANNEREMC = 1;
const int IDPLANNEROEMTECH = 2;
const int IDPLANNERDIRECT = 3;

const int PROBEOFF = 0;
const int PROBENORMALLYOPEN = 1;
const int PROBENORMALLYCLOSED = 2;

const int SOFTSTOP = 0;
const int HARDSTOP = 1;

const int ERRNOERROR = 0;
const int ERRAPINOTINITED = 1;
const int ERRHARDWARENOTCONNECTED = 2;
const int ERRCOMMANDNOTSUPPORTEDINHARDWARE = 3;
const int ERRHARDWARENOTINPOSITION = 4;
const int ERRMISSINGSDCARD = 5;
const int ERROUTOFRANGE = 6;
const int ERRFILENOTFOUND = 7;
const int ERRBUFFERISALREADYOPEN = 8;
const int   ERRINVALIDFILE = 9;
const int   ERRESTOPISLATCHED = 10;
const int   ERRHARDWARENOTMOVING = 11;
const int   ERRNOTSUPPORTED = 12;
const int ERRUNDEFINED = 999;

  // Traj Planner options
const int COMMANDOPTIONNONE = 0;
const int COMMANDOPTIONCOMPRESS = 1;
const int COMMANDOPTIONDIRECT = 2;
const int COMMANDOPTIONDEFAULTBUFFER = 3;

const int HWAREBUFFERNONE = 0;
const int HWAREBUFFER = 1;
const int HWAREMEMORY = 2;
const int HWARESTORAGE = 3;

const int AXISX = 0;
const int AXISY = 1;
const int AXISZ = 2;
const int AXISA = 3;
const int AXISB = 4;
const int AXISC = 5;

const int JOGPOSX = 1;
const int JOGNEGX = 2;
const int JOGPOSY = 4;
const int JOGNEGY = 8;
const int JOGPOSZ = 16;
const int JOGNEGZ = 32;
const int JOGPOSA = 64;
const int JOGNEGA = 128;
const int JOGPOSB = 256;
const int JOGNEGB = 512;
const int JOGPOSC = 1024;
const int JOGNEGC = 2048;

const int AXISMASKX = 1;
const int AXISMASKY = 2;
const int AXISMASKZ = 4;
const int AXISMASKA = 8;
const int AXISMASKB = 16;
const int AXISMASKC = 32;
const int AXISMASKALL = 63;

  // Switch Masks
const int HOMESWITCHMASKX = 1;
const int HOMESWITCHMASKY = 2;
const int HOMESWITCHMASKZ = 4;
const int HOMESWITCHMASKA = 8;
const int HOMESWITCHMASKB = 16;
const int HOMESWITCHMASKC = 32;
const int INPUTSWITCHMASKPAUSE = 64;
const int INPUTSWITCHMASKESTOP = 128;
const int INPUTSWITCHMASKPROBE = 256;
const int INPUTSWITCHMASKCYCLESTART = 512;
const int INPUTSWITCHMASKTERRAINFOLLOWUP = 1024;
const int INPUTSWITCHMASKTERRAINFOLLOWDOWN = 2048;

  // Output Masks
const int OUTPUTMASKFLOOD = 1;
const int OUTPUTMASKMIST = 2;
const int OUTPUTMASKCW = 4;
const int OUTPUTMASKCCW = 8;
const int OUTPUTMASKAUX1 = 16;

const int   OUTPUTPINIDCW = 1;
const int   OUTPUTPINIDCCW = 2;
const int   OUTPUTPINIDFLOOD = 3;
const int   OUTPUTPINIDMIST = 4;
const int   OUTPUTPINIDAUX1 = 5;
const int   OUTPUTPINIDAUX2 = 6;
const int   OUTPUTPINIDAUX3 = 7;
const int   OUTPUTPINIDAUX4 = 8;


const int   UNITSINCH = 1;
const int   UNITSMM = 2;

typedef char CharBuffer [256];
typedef int Axes [6];
typedef double AxesDouble [6];
typedef char PackedByteMemoryBlock [512];
typedef int ActiveGCodeArray [12];
typedef int ActiveMCodeArray [7];

typedef struct
{
  int ID;
  double Length;
  double Diameter;
  double TipGeometry;
  int ToolType;
  double	XOffset;
  double	YOffset;
  double	ZOffset;
  CharBuffer Comment;
} CNCTool;

typedef struct
{
  double Xmin;
  double Ymin;
  double Zmin;
  double Amin;
  double Bmin;
  double Cmin;
  double Xmax;
  double Ymax;
  double Zmax;
  double Amax;
  double Bmax;
  double Cmax;
} Extents;

typedef struct
{
   double X;
   double Y;
   double Z;
   double A;
   double B;
   double C;
}CNCPosition;


typedef struct
{
  ActiveGCodeArray ActiveGCodes;
  ActiveMCodeArray ActiveMCodes;
  int ActivePlane;
  double FeedRate;
  double LinearUnits;
  double SpindleSpeed;
  CNCPosition Position;
  AxesDouble ProgramOrigin;
  AxesDouble AxisOrigin;
  int FeedRateOverride;
  int FirstToolNum;
  int CurrentTool;
  double CurrentToolLengthOffset;
  double CurrentToolWidthOffset;
  int CurrentToolType;
  double CurrentToolDia;
  double CurrentToolTipDiameter;
  CharBuffer CurrentToolComment;
  CharBuffer Msg;
} InterpStatusStructure;

typedef struct
{
  AxesDouble Position;
  AxesDouble PositionMM;
  AxesDouble ProbePosition;
  Axes RawPositionInSteps;
  int ErrorNumber;
  int IsConnected;
  int ModelNumber;
  int HardwareSerialNumber;
  int FirmwareIsUpdateRequired;
  int FirmwareVersionMinimumRequired;
  int FirmwareVersionInstalled;
  int TimeInMilliseconds;
  int MachTool;
  int MotionStreamLineNumber;
  int MotionStreamLoadTime;
  int MotionStreamJobDuration;
  int MotionStreamIsNotBusy;
  int IsWaitingFor;
  int MotionStreamIsLoaded;
  int MotionStreamIsLoadInProgress;
  int MotionStreamIsRunInProgress;
  int MotionStreamIsSdCardPresent;
  int MotionStreamLoadProgress;
  int MotionStreamExecutionPointer;
  int IsMotionInProgress;
  int OutputPins;
  int InputPins;
  int IsEstopPinActivated;
  int IsInEstop;
  int IsProbeActivated;
  int IsScanInProgress;
  int IsPaused;
  int IsCycleStartActive;
  int IsTerrainFollowActive;
  int IsTickleActive;
  int Ack;
  int Perf;
  CharBuffer ErrorMessage;
} HardwareStatusStructure;

typedef struct
{
  double Max3DVelocity;
  double Max3DAcceleration;
  double JogAcceleration;
  double PauseAccelerationInSecondsToDecelerateOneHundredPercent;
  AxesDouble StepsPerMM;
  AxesDouble MaxVelocityMM;
  AxesDouble MaxAccelerationMM;
  AxesDouble SoftLimMinMM;
  AxesDouble SoftLimMaxMM;
  AxesDouble MotionBacklash;
  AxesDouble RasterBacklash;
  int NumberOfAxes;
  int SdBlockNumber;
  int MinSpindleSpeedInRpm;
  int MaxSpindleSpeedInRpm;
  int MinPwmInPercent;
  int MaxPwmInPercent;
  int IgnoreM6;
} ConfigurationStructure;

int LoadCncDll ();

int CNCAPIInit (ConfigurationStructure* Config);
int CNCAPIGetConfiguration(ConfigurationStructure* Config);
int CNCCloseHardwareBuffer (void);
int CNCConnectToHardware (int HardwareID, int ConnectOptions);
int CNCContinue (void);
int CNCDisconnectFromHardware (void);
int CNCEnableCycleStartPin (int Enable, int RepeatEnabled, int FileStartLocation, int Options);
int CNCEnableEstopPin (int Enable, int Options);
int CNCEnablePausePin (int Enable, int Style, int Options);
int CNCEnableSoftLimits (int EnableStyle);
int CNCEnableTerrainFollowPins (int Enable, int Options, double MinZ, double MaxZ, double Vel);
int CNCEnterAutonomousMode (int Options);
int CNCEstop (void);
int CNCFeedRateOverride (int Percent, int Options);
int CNCGetExtentsMM (Extents* Exts);
int CNCGetHardwareStatus (HardwareStatusStructure* Stat);
int CNCGetInterpreterStatus (InterpStatusStructure* Stat);
int CNCInit (void);
int CNCInitInterpreter (void);
int CNCJog (double Feedrate, int Axes, int Options);
wchar_t* CNCLastGCodeErrorString (void);
int CNCLoadConfigFromINI (wchar_t* INIFileName);
int CNCMemoryBlockRead (int BlockNo, PackedByteMemoryBlock var_Buffer);
int CNCMemoryBlockWrite (int BlockNo, PackedByteMemoryBlock Buffer);
int CNCOpenHardwareBuffer (int Dest, int StartIndex);
int CNCPause (int Options);
int CNCProcessBlock (wchar_t* GCode, int Options, int LineNo);
int CNCProcessGCodeFile (wchar_t* FileName, int BufferDestination);
int CNCReadProbedPosition (HardwareStatusStructure* Stat);
int CNCResetEstopPin (int Options);
int CNCResetInterpreter (void);
int CNCRestorePosition (double Feedrate, int Mask, int Options);
int CNCRunJobFromSDStorage (int Index);
int CNCSDCardBlockRead (int BlockNo, PackedByteMemoryBlock var_Buffer);
int CNCSDCardBlockWrite (int BlockNo, PackedByteMemoryBlock Buffer);
int CNCSavePosition (int Options);
int CNCSaveScanToSTL (wchar_t* FName);
int CNCScanXY (double MinX, double MaxX, double MinY, double MaxY, double MinZ, double MaxZ, double XRes, double YRes, double Vel);
int CNCSetInputPolarities (int Polarities, int Options);
int CNCSetProbe (int State, int Options);
int CNCSetStopMode (Axes Masks, int IsHard, int Options);
int CNCSetStopModeEstopPin (int IsHard, int Options);
int CNCSetStopModeHomeSwitches (int IsHard, int Options);
int CNCSetStopModeNone (int Options);
int CNCSetTrajectoryPlanner (int PlannerID, int PlannerOptions);
int CNCStartLinearMaskedMove (double FeedRate, AxesDouble var_Position, int Mask, int IsRelative, int Options);
int CNCStartLinearMaskedMoveSteps (int FeedRate, Axes var_Position, int Mask, int IsRelative, int Options);
int CNCStopMotion (void);
int CNCToolLibraryGetTool (int ToolNumber, CNCTool* Tool);
int CNCToolLibraryLoadFromINI (wchar_t* FName);
int CNCToolLibrarySaveToIniFile (wchar_t* FName);
int CNCToolLibrarySetMaxTools (int MaxTools);
int CNCZeroExtents (void);
void CNCArcMove (double first_end, double second_end, double first_axis, double second_axis, int rotation, double axis_end_point, double a, double b, double c, int Options);
void CNCChangeTool (int slot, int Options);
void CNCClearAuxOutputBit (int bit, int Options);
void CNCClearMotionOutputBit (int bit, int Options);
void CNCComment (wchar_t* s, int Options);
void CNCDisableFeedOverride (int Options);
void CNCDisableSpeedOverride (int Options);
void CNCDwell (double seconds, int Options);
void CNCEnableFeedOverride (int Options);
void CNCEnableSpeedOverride (int Options);
void CNCExecuteG27Home (double x, double y, double z, double a, double b, double c, char AxisFlags, int Options);
void CNCExecuteG30Home (double x, double y, double z, double a, double b, double c, char AxisFlags, int Options);
void CNCFloodOff (int Options);
void CNCFloodOn (int Options);
void CNCMistOff (int Options);
void CNCMistOn (int Options);
void CNCMsg (wchar_t* s, int Options);
void CNCOptionalProgramStop (void);
void CNCOrientSpindle (double val, int dir, int Options);
void CNCPalletteShuttle (int Options);
void CNCProgramMessageStop (wchar_t* msg);
void CNCProgramStop (void);
void CNCRapidMove (double x, double y, double z, double a, double b, double c, int Options);
void CNCSelectPlane (int in_plane);
void CNCSelectTool (int slot, int Options);
void CNCoutputIO (int Output, int Mask, int Options);
void CNCSetAuxOutputBit (int bit, int Options);
void CNCSetAxisOffsets (double x, double y, double z, double a, double b, double c);
void CNCSetAxisCoordinates (double x, double y, double z, double a, double b, double c, char AxisFlags, int Options);
void CNCSetAxisCoordinatesSteps (int x, int y, int z, int a, int b, int c, char AxisFlags, int Options);
void CNCSetFeedrate (double rate);
void CNCSetMotionControlMode (int mode, double tol, double angle);
void CNCSetMotionOutputBit (int bit, int Options);
void CNCSetOriginOffsets (double x, double y, double z, double a, double b, double c);
void CNCSetSpindleSpeed (double r, int Options);
void CNCStartSpeedFeedSynch (int Options);
void CNCStartSpindleClockwise (int Options);
void CNCStartSpindleCounterClockwise (int Options);
void CNCStopSpeedFeedSynch (int Options);
void CNCStopSpindleTurning (int Options);
void CNCStraightMove (double x, double y, double z, double a, double b, double c, int Options);
void CNCStraightProbe (double x, double y, double z, double AA, double BB, double CC, int Options);
void CNCUseLengthUnits (int in_unit, int LineNo);
void CNCUseToolLengthOffset (int index);

#ifdef __cplusplus
}
#endif
