from ctypes import *

class DeskWinAPI():
	def __init__(self, comport = '', init = False, secondGen = True):
		self.dll = cdll.LoadLibrary("DeskWinAPI.dll")
		self.comport = comport
		self.secondGen = secondGen
		
		if init and (comport ~= ''):
			Ack = DeskWinReset(self.comport, 27, self.secondGen)
			
		if err ~= self.DESKWIN_OK:
			#TODO: handle start-up errors
			pass
		
	
	# Controller Acknowledgements
	# Todo: change these to a dictionary?
	DESKWIN_OK = 90
	DESKWIN_IN_POSITION = 91
	DESKWIN_BUFFERFULL = 92
	DESKWIN_BEGIN_STATUS_BUFFERFULL = 202
	DESKWIN_ENDSTRING = 204
	DESKWIN_SYNTAXERROR = 205
	DESKWIN_LIMITHIT = 207
	DESKWIN_INVALID_CHECKSUM = 208
	DESKWIN_UNKNOWN_COMMAND = 209
	DESKWIN_BEGINSTATUS = 210
	DESKWIN_BEGINSTRING = 211
	DESKWIN_INVALIDSTART = 212
	DESKWIN_PROBEHIT = 213
	DESKWIN_IN_EMSTOP = 254

	DESKWIN_COMMAND_IS_IN_PROGRESS = 214
	DESKWIN_PORT_DOES_NOT_EXIST = 215
	DESKWIN_PORT_IS_ALREADY_OPEN = 216
	DESKWIN_TIMEDOUT = 217
	DESKWIN_FAILED_TO_RESET = 218
	DESKWIN_NOTINITED = 255

	DESKWIN_2nd_OK = 235
	DESKWIN_2nd_IN_POSITION = 236
	DESKWIN_2nd_BUFFERFULL = 237
	DESKWIN_2nd_BEGIN_STATUS_BUFFERFULL = 244
	DESKWIN_2nd_ENDSTRING = 245
	DESKWIN_2nd_SYNTAXERROR = 246
	DESKWIN_2nd_LIMITHIT = 247
	DESKWIN_2nd_INVALID_CHECKSUM = 248
	DESKWIN_2nd_UNKNOWN_COMMAND = 249
	DESKWIN_2nd_BEGINSTATUS = 250
	DESKWIN_2nd_BEGINSTRING = 251
	DESKWIN_2nd_INVALIDSTART = 212
	DESKWIN_2nd_PROBEHIT = 213
	DESKWIN_2nd_IN_EMSTOP = 255

	DESKWIN_2nd_COMMAND_IS_IN_PROGRESS = 241
	DESKWIN_2nd_PORT_DOES_NOT_EXIST = 242
	DESKWIN_2nd_PORT_IS_ALREADY_OPEN = 243
	DESKWIN_2nd_TIMEDOUT = 238
	DESKWIN_2nd_FAILED_TO_RESET = 239
	DESKWIN_2nd_NOTINITED = 240
	
	# Command Types
	ARCDIRECTION = 1
	ACCELCOM = 2
	GETVERSION = 3
	RESETCONTROL = 4
	GETPOS = 5
	PAUSECONTROL = 6
	CONTINUECONTROL = 7
	ENDMOVE = 8
	EMERGENCYSTOP = 9
	SETPOS = 10
	OUTPUT = 11
	CONTROLDELAY = 12
	LINEARFEED = 13
	RAPIDFEED = 14
	CW = 15
	CCW = 16
	HOMECONTROL = 17
	SETOVERRIDE = 18
	SETOVERRIDEMAX = 19
	INDEXFEED = 20
	READINPUTS = 21
	CHASEENCODER = 22
	READRPM = 23
	OUTPUTIMEDIATE = 24
	
	# Helper defines
	AXIS_X = 1
	AXIS_Y = 2
	AXIS_Z = 4
	AXIS_A = 8
	AXIS_XYZA = AXIS_X + AXIS_Y + AXIS_Z + AXIS_A
	
	def SetArcDirection(self, Direction): # byte
		return self.dll.DeskWinSetArcDirection(Direction) # byte
		
	def SetAccelleration(self, ACCELL, MaxSPS, StartVel, AccellScale): # long, long, long, byte
		return self.dll.DeskWinSetAccelleration(ACCELL, MaxSPS, StartVel, AccellScale) # byte
		
	def DeskWinGetFirmwareVersion(self):
		return self.dll.DeskWinGetFirmwareVersion() # double
		
	def DeskWinReset(self, ComPort, TimeConstant, Mode): # long, long, long  
		return self.dll.DeskWinReset(ComPort, TimeConstant, Mode) # byte
		
	def GetPosition(self, X, Y, Z, A): # long, long, long, long
		self.dll.DeskWinGetPosition() # byte
		
	def Pause(self):
		return self.dllDeskWinPause() # byte
		
	def Continue(self):
		return self.dll.DeskWinContinue() # byte
		
	def EndCurrentMove(self):
		self.dll.DeskWinEndCurrentMove() # byte
		
	def EmStop(self):
		return self.dll.DeskWinEmStop() # byte
		
	def SetPosition(self, X, Y, Z, A, Axis): # long, long, long, long, byte
		return self.dll.DeskWinSetPosition(X, Y, Z, A, Axis) # byte
		
	def SetOutput(self, OUTPUT, State, X, Y, Z, A): # byte, byte, long, long, long, long
		self.dll.DeskWinSetOutput(OUTPUT, State, X, Y, Z, A);
		
	def SetOutputImediate(self, OutputState): # byte
		return self.dll.DeskWinSetOutputImediate(OutputState)
		
	def Delay(self, seconds, X, Y, Z, A): # double, long, long, long, long
		return self.dll.DeskWinDelay(seconds, X, Y, Z, A) # byte
		
	def IndexMove(self, X, Y, Z, A, SlewSPS, Axis, PosX, PosY, PosZ, PosA): # long, long, long, long, long, byte, long, long, long, long
		return self.dll.DeskWinIndexMove(X, Y, Z, A, SlewSPS, Axis, PosX, PosY, PosZ, PosA) # byte
		
	def LinearMove(self, X,Y,Z,A,SlewSPS,EndSPS,PosX, PosY, PosZ, PosA): # long, long, long, long, long, long, long, long, long, long
		return self.dll.DeskWinLinearMove(X,Y,Z,A,SlewSPS,EndSPS,PosX, PosY, PosZ, PosA) # byte
		
	def RapidMove(self, X, Y, Z, A, SlewSPS, EndSPS, PosX, PosY, PosZ, PosA): # long, long, long, long, long, long, long, long, long, long
		return self.dll.RapidMove(X, Y, Z, A, SlewSPS, EndSPS, PosX, PosY, PosZ, PosA) # byte
		
	def QuadrantArcMoveCW(self, rad, StartX, StartY, EndX, EndY, SlewSPS, EndSPS, ByVal, Quad, PosX, PosY, PosZ, PosA): # long, long, long, long, long, long, long, byte, long, long, long, long
		return self.dll.DeskWinQuadrantArcMoveCW(rad, StartX, StartY, EndX, EndY, SlewSPS, EndSPS, ByVal, Quad, PosX, PosY, PosZ, PosA) # byte
		
	def QuadrantArcMoveCCW(self, rad, StartX, StartY, EndX, EndY, SlewSPS, EndSPS, ByVal, Quad, PosX, PosY, PosZ, PosA): # long, long, long, long, long, long, long, byte, long, long, long, long
		return self.dll.DeskWinQuadrantArcMoveCCW(rad, StartX, StartY, EndX, EndY, SlewSPS, EndSPS, ByVal, Quad, PosX, PosY, PosZ, PosA) # byte
		
	def Home(self, Axis, HomeDir, HomeVel):
		return self.dll.DeskWinHome(Axis, HomeDir, HomeVel) # byte
		
	def SetMaxSPS(self, MaxSPS, NumAxis, Inverted, TagAlong, MaxEncCount):
		return self.dll.DeskWinSetMaxSPS(MaxSPS, NumAxis, Inverted, TagAlong, MaxEncCount)
		
	def SetFeedOverride(self, Value):
		return self.dll.DeskWinSetFeedOverride(Value) # byte
		
	def SetPWMOutput(self):
		return self.dll.DeskWinSetPWMOutput(Value) # byte
		
	def ReadInputs(self):
		return self.dll.DeskWinReadInputs() # byte
		
	def ChaseEncoder(self):
		return self.dll.DeskWinChaseEncoder(EncDir, Dir, X, Y, Z, Enc) # byte
		
	def ChaseEncoder(self):
		return self.dll.DeskWinEndChaseEncoder() # byte
		
	def ProbePolarity(self, Polarity):
		return self.dll.DeskWinSetProbePolarity(Polarity) # byte
		
	def ReadRPM(self):
		return self.dll.DeskWinReadRPM() # long
		
	def Close(self):
		return self.dll.Close() # byte
		
	def rs274ngc_ext_init(self, IniFile): # string
		return self.dll.rs274ngc_ext_init(IniFile) # int
		
	def rs274ngc_read_block(self, block): # string
		return self.dll.rs274ngc_read_block(block) # int
		
	def rs274ngc_execute_block(self):
		return api.rs274ngc_execute_block() #Long
		
	def FlushBuffer(self):
		self.dll.FlushBuffer()
		
	rs274ngc_errors = ["No error", \
						"No error", \
						"No error", \
						"No error", \
						"A file is already open", \
						"All axes missing with g92", \
						"All axes missing with motion code", \
						"Arc radius too small to reach end point", \
						"Argument to acos out of range", \
						"Argument to asin out of range", \
						"Attempt to divide by zero", \
						"Attempt to raise negative to non integer power", \
						"Bad character used", \
						"Bad format unsigned integer", \
						"Bad number format", \
						"Bug bad g code modal group 100", \
						"Bug code not g0 or g1", \
						"Bug code not g17 g18 or g19", \
						"Bug code not g20 or g21", \
						"Bug code not g28 or g30", \
						"Bug code not g2 or g3", \
						"Bug code not g40 g41 or g42", \
						"Bug code not g43 or g49", \
						"Bug code not g4 g10 g28 g30 g53 or g92 series", \
						"Bug code not g61 g61 1 or g64", \
						"Bug code not g90 or g91", \
						"Bug code not g93 or g94", \
						"Bug code not g98 or g99", \
						"Bug code not in g92 series", \
						"Bug code not in range g54 to g593", \
						"Bug code not m0 m1 m2 m30 m60 ", \
						"Bug distance mode not g90 or g91", \
						"Bug function should not have been called", \
						"Bug in tool radius comp", \
						"Bug plane not xy yz or xz", \
						"Bug side not right or left", \
						"Bug unknown motion code", \
						"Bug unknown operation", \
						"Cannot change axis offsets with cutter radius comp", \
						"Cannot change units with cutter radius comp", \
						"Cannot create backup file", \
						"Cannot do g1 with zero feed rate", \
						"Cannot do zero repeats of cycle", \
						"Cannot make arc with zero feed rate", \
						"Cannot move rotary axes during probing", \
						"Cannot open backup file", \
						"Cannot open variable file", \
						"Cannot probe in inverse time feed mode ", \
						"Cannot probe with cutter radius comp on", \
						"Cannot probe with zero feed rate", \
						"Cannot put a b in canned cycle", \
						"Cannot put a c in canned cycle ", \
						"Cannot put an a in canned cycle", \
						"Cannot turn cutter radius comp on out of xy plane", \
						"Cannot turn cutter radius comp on when on", \
						"Cannot use a word ", \
						"Cannot use axis values with g80", \
						"Cannot use axis values without a g code that uses them", \
						"Cannot use b word", \
						"Cannot use c word", \
						"Cannot use g28 or g30 with cutter radius comp", \
						"Cannot use g53 incremental", \
						"Cannot use g53 with cutter radius comp", \
						"Cannot use two g codes that both use axis values", \
						"Cannot use xz plane with cutter radius comp", \
						"Cannot use yz plane with cutter radius comp", \
						"Command too long ", \
						" Concave corner with cutter radius comp", \
						"Coordinate system index parameter 5220 out of range", \
						"Current point same as end point of arc", \
						"Cutter gouging with cutter radius comp", \
						"D word with no g41 or g42", \
						"Dwell time missing with g4", \
						"Dwell time p word missing with g82", \
						"Dwell time p word missing with g86 ", \
						" Dwell time p word missing with g88", \
						"Dwell time p word missing with g89", \
						"Equal sign missing in parameter setting", \
						"F word missing with inverse time arc move", \
						"F word missing with inverse time g1 move", \
						"File ended with no percent sign", \
						"File ended with no percent sign or program end", \
						"File name too long ", \
						"File not open", \
						"G code out of range", \
						"H word with no g43", \
						"I word given for arc in yz plane", \
						"I word missing with g87", \
						"I word with no g2 or g3 or g87 to use it", \
						"J word given for arc in xz plane", \
						"J word missing with g87", \
						"J word with no g2 or g3 or g87 to use it ", \
						"K word given for arc in xy plane", \
						"K word missing with g87", \
						"K word with no g2 or g3 or g87 to use it", \
						"L word with no canned cycle or g10", \
						"Left bracket missing after slash with atan", \
						"Left bracket missing after unary operation name", \
						"Line number greater than 99999", \
						"Line with g10 does not have l2", \
						"M code greater than 99", \
						"Mixed radius ijk format for arc", \
						"Multiple a words on one line", \
						"Multiple b words on one line", \
						"Multiple c words on one line", \
						"Multiple d words on one line", \
						"Multiple f words on one line ", \
						"Multiple h words on one line", \
						"Multiple i words on one line", \
						"Multiple j words on one line", \
						"Multiple k words on one line", \
						"Multiple l words on one line ", \
						"Multiple p words on one line", \
						"Multiple q words on one line", \
						"Multiple r words on one line", \
						"Multiple s words on one line", \
						"Multiple t words on one line ", \
						"Multiple x words on one line", \
						"Multiple y words on one line", \
						"Multiple z words on one line", \
						"Must use g0 or g1 with g53", \
						"Negative argument to sqrt", \
						"Negative d word tool radius index used", \
						"Negative f word used", \
						"Negative g code used", \
						"Negative h word tool length offset index used", \
						"Negative l word used ", \
						"Negative m code used", \
						"Negative or zero q value used", \
						"Negative p word used", \
						"Negative spindle speed used", \
						"Negative tool id used", \
						"Nested comment found", \
						"No characters found in reading real value", \
						"No digits found where real number should be", \
						"Non integer value for integer", \
						"Null missing after newline", \
						"Offset index missing", \
						"P value not an integer with g10 l2", \
						"P value out of range with g10 l2", \
						"P word with no g4 g10 g82 g86 g88 g89", \
						"Parameter file out of order", \
						"Parameter number out of range", \
						"Q word missing with g83", \
						"Q word with no g83", \
						"Queue is not empty after probing", \
						"R clearance plane unspecified in cycle", \
						"R i j k words all missing for arc", \
						"R less than x in cycle in yz plane", \
						"R less than y in cycle in xz plane", \
						"R less than z in cycle in xy plane", \
						"R word with no g code that uses it", \
						"Radius to end of arc differs from radius to start", \
						"Radius too small to reach end point", \
						"Required parameter missing", \
						"Selected tool slot number too large", \
						"Slash missing after first atan argument", \
						"Spindle not turning clockwise in g84", \
						"Spindle not turning in g86", \
						"Spindle not turning in g87", \
						"Spindle not turning in g88", \
						"Sscanf failed", \
						"Start point too close to probe point", \
						"Too many m codes on line", \
						"Tool length offset index too big", \
						"Tool max too large", \
						"Tool radius index too big", \
						"Tool radius not less than arc radius with comp", \
						"Two g codes used from same modal group", \
						"Two m codes used from same modal group", \
						"Unable to open file", \
						"Unclosed comment found", \
						"Unclosed expression", \
						"Unknown g code used", \
						"Unknown m code used ", \
						"Unknown operation", \
						"Unknown operation name starting with a", \
						"Unknown operation name starting with m", \
						"Unknown operation name starting with o", \
						"Unknown operation name starting with x", \
						"Unknown word starting with a", \
						"Unknown word starting with c", \
						"Unknown word starting with e", \
						"Unknown word starting with f ", \
						"Unknown word starting with l", \
						"Unknown word starting with r", \
						"Unknown word starting with s", \
						"Unknown word starting with t", \
						"Unknown word where unary operation could be", \
						"X and y words missing for arc in xy plane", \
						"X and z words missing for arc in xz plane", \
						"X value unspecified in yz plane canned cycle", \
						"X y and z words all missing with g38 2", \
						"Y and z words missing for arc in yz plane", \
						"Y value unspecified in xz plane canned cycle", \
						"Z value unspecified in xy plane canned cycle", \
						"Zero or negative argument to ln", \
						"Zero radius arc", \
						"The End"]
						