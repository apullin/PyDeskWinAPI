Attribute VB_Name = "Module2"
Option Explicit

Public Type TDeskWinAPICommand
    CommandType As Long
    X As Long
    Y As Long
    Z As Long
    A As Long
    Ex As Long
    Ey As Long
    rad As Long
    SlewSPS As Long
    EndSPS As Long
    Secs As Double
    Axis As Byte
    Quad As Byte
    Dir As Byte
    NumSteps As Long
    bXSps As Long
    bYSps As Long
    eXSps As Long
    eYSps As Long
    bZSps As Long
    eZSps As Long
  End Type
  
Public Const DESKWIN_OK = 90
Public Const DESKWIN_IN_POSITION = 91
Public Const DESKWIN_BUFFERFULL = 92
Public Const DESKWIN_BEGIN_STATUS_BUFFERFULL = 202
Public Const DESKWIN_ENDSTRING = 204
Public Const DESKWIN_SYNTAXERROR = 205
Public Const DESKWIN_LIMITHIT = 207
Public Const DESKWIN_INVALID_CHECKSUM = 208
Public Const DESKWIN_UNKNOWN_COMMAND = 209
Public Const DESKWIN_BEGINSTATUS = 210
Public Const DESKWIN_BEGINSTRING = 211
Public Const DESKWIN_INVALIDSTART = 212
Public Const DESKWIN_PROBEHIT = 213
Public Const DESKWIN_IN_EMSTOP = 254

Public Const DESKWIN_COMMAND_IS_IN_PROGRESS = 214
Public Const DESKWIN_PORT_DOES_NOT_EXIST = 215
Public Const DESKWIN_PORT_IS_ALREADY_OPEN = 216
Public Const DESKWIN_TIMEDOUT = 217
Public Const DESKWIN_FAILED_TO_RESET = 218
Public Const DESKWIN_NOTINITED = 255

Public Const DESKWIN_2nd_OK = 235
Public Const DESKWIN_2nd_IN_POSITION = 236
Public Const DESKWIN_2nd_BUFFERFULL = 237
Public Const DESKWIN_2nd_BEGIN_STATUS_BUFFERFULL = 244
Public Const DESKWIN_2nd_ENDSTRING = 245
Public Const DESKWIN_2nd_SYNTAXERROR = 246
Public Const DESKWIN_2nd_LIMITHIT = 247
Public Const DESKWIN_2nd_INVALID_CHECKSUM = 248
Public Const DESKWIN_2nd_UNKNOWN_COMMAND = 249
Public Const DESKWIN_2nd_BEGINSTATUS = 250
Public Const DESKWIN_2nd_BEGINSTRING = 251
Public Const DESKWIN_2nd_INVALIDSTART = 212
Public Const DESKWIN_2nd_PROBEHIT = 213
Public Const DESKWIN_2nd_IN_EMSTOP = 255

Public Const DESKWIN_2nd_COMMAND_IS_IN_PROGRESS = 241
Public Const DESKWIN_2nd_PORT_DOES_NOT_EXIST = 242
Public Const DESKWIN_2nd_PORT_IS_ALREADY_OPEN = 243
Public Const DESKWIN_2nd_TIMEDOUT = 238
Public Const DESKWIN_2nd_FAILED_TO_RESET = 239
Public Const DESKWIN_2nd_NOTINITED = 240

'' Command types
Public Const ARCDIRECTION = 1
Public Const ACCELCOM = 2
Public Const GETVERSION = 3
Public Const RESETCONTROL = 4
Public Const GETPOS = 5
Public Const PAUSECONTROL = 6
Public Const CONTINUECONTROL = 7
Public Const ENDMOVE = 8
Public Const EMERGENCYSTOP = 9
Public Const SETPOS = 10
Public Const OUTPUT = 11
Public Const CONTROLDELAY = 12
Public Const LINEARFEED = 13
Public Const RAPIDFEED = 14
Public Const CW = 15
Public Const CCW = 16
Public Const HOMECONTROL = 17
Public Const SETOVERRIDE = 18
Public Const SETOVERRIDEMAX = 19
Public Const INDEXFEED = 20
Public Const READINPUTS = 21
Public Const CHASEENCODER = 22
Public Const READRPM = 23
Public Const OUTPUTIMEDIATE = 24
Public rs274ngc_errors(0 To 198) As String

Declare Function DeskWinSetArcDirection Lib "DeskWinAPI" (ByVal Direction As Byte) As Byte
Declare Function DeskWinSetAccelleration Lib "DeskWinAPI" (ByVal ACCELL As Long, ByVal MaxSPS As Long, ByVal StartVel As Long, ByVal AccellScale As Byte) As Byte
Declare Function DeskWinGetFirmwareVersion Lib "DeskWinAPI" () As Double
Declare Function DeskWinReset Lib "DeskWinAPI" (ComPort As Long, ByVal TimeConstant As Long, ByVal Mode As Long) As Byte
Declare Function DeskWinGetPosition Lib "DeskWinAPI" (X As Long, Y As Long, Z As Long, A As Long) As Byte
Declare Function DeskWinPause Lib "DeskWinAPI" () As Byte
Declare Function DeskWinContinue Lib "DeskWinAPI" () As Byte
Declare Function DeskWinEndCurrentMove Lib "DeskWinAPI" () As Byte
Declare Function DeskWinEmStop Lib "DeskWinAPI" () As Byte
Declare Function DeskWinSetPosition Lib "DeskWinAPI" (ByVal X As Long, ByVal Y As Long, ByVal Z As Long, ByVal A As Long, ByVal Axis As Byte) As Byte
Declare Function DeskWinSetOutput Lib "DeskWinAPI" (ByVal OUTPUT As Byte, ByVal State As Byte, X As Long, Y As Long, Z As Long, A As Long) As Byte
Declare Function DeskWinSetOutputImediate Lib "DeskWinAPI" (ByVal OutputState As Byte) As Byte
Declare Function DeskWinDelay Lib "DeskWinAPI" (ByVal seconds As Double, X As Long, Y As Long, Z As Long, A As Long) As Byte
Declare Function DeskWinIndexMove Lib "DeskWinAPI" (ByVal X As Long, ByVal Y As Long, ByVal Z As Long, ByVal A As Long, ByVal SlewSPS As Long, ByVal Axis As Byte, PosX As Long, PosY As Long, PosZ As Long, PosA As Long) As Byte
Declare Function DeskWinLinearMove Lib "DeskWinAPI" (ByVal X As Long, ByVal Y As Long, ByVal Z As Long, ByVal A As Long, ByVal SlewSPS As Long, ByVal EndSPS As Long, PosX As Long, PosY As Long, PosZ As Long, PosA As Long) As Byte
Declare Function DeskWinRapidMove Lib "DeskWinAPI" (ByVal X As Long, ByVal Y As Long, ByVal Z As Long, ByVal A As Long, ByVal SlewSPS As Long, ByVal EndSPS As Long, PosX As Long, PosY As Long, PosZ As Long, PosA As Long) As Byte
Declare Function DeskWinQuadrantArcMoveCW Lib "DeskWinAPI" (ByVal rad As Long, ByVal StartX As Long, ByVal StartY As Long, ByVal EndX As Long, ByVal EndY As Long, ByVal SlewSPS As Long, ByVal EndSPS As Long, ByVal Quad As Byte, PosX As Long, PosY As Long, PosZ As Long, PosA As Long) As Byte
Declare Function DeskWinQuadrantArcMoveCCW Lib "DeskWinAPI" (ByVal rad As Long, ByVal StartX As Long, ByVal StartY As Long, ByVal EndX As Long, ByVal EndY As Long, ByVal SlewSPS As Long, ByVal EndSPS As Long, ByVal Quad As Byte, PosX As Long, PosY As Long, PosZ As Long, PosA As Long) As Byte
Declare Function DeskWinHome Lib "DeskWinAPI" (ByVal Axis As Byte, ByVal HomeDir As Byte, ByVal HomeVel As Long) As Byte
Declare Function DeskWinSetMaxSPS Lib "DeskWinAPI" (ByVal MaxSPS As Long, ByVal NumAxis As Long, ByVal Inverted As Long, ByVal TagAlong As Long, ByVal MaxEncCount As Long) As Byte
Declare Function DeskWinSetFeedOverride Lib "DeskWinAPI" (ByVal Value As Long) As Byte
Declare Function DeskWinSetPWMOutput Lib "DeskWinAPI" (ByVal Value As Byte) As Byte
Declare Function DeskWinReadInputs Lib "DeskWinAPI" () As Byte
Declare Function DeskWinChaseEncoder Lib "DeskWinAPI" (ByVal EncDir As Long, ByVal Dir As Long, ByVal X As Long, ByVal Y As Long, ByVal Z As Long, ByVal Enc As Long) As Byte
Declare Function DeskWinEndChaseEncoder Lib "DeskWinAPI" () As Byte
Declare Function DeskWinSetProbePolarity Lib "DeskWinAPI" (ByVal Polarity As Byte) As Byte
Declare Function DeskWinReadRPM Lib "DeskWinAPI" () As Long
Declare Function DeskWinClose Lib "DeskWinAPI" () As Byte
Declare Function rs274ngc_ext_init Lib "DeskWinAPI" (ByVal IniFile As String) As Integer
Declare Function rs274ngc_read_block Lib "DeskWinAPI" (ByVal block As String) As Integer
Declare Function rs274ngc_execute_block Lib "DeskWinAPI" () As Long
Declare Sub FlushBuffer Lib "DeskWinAPI" ()

Sub SetupErrorCodes()

 rs274ngc_errors(0) = "No error"
  rs274ngc_errors(1) = "No error"
 rs274ngc_errors(2) = "No error"
 rs274ngc_errors(3) = "No error"
  rs274ngc_errors(4) = "A file is already open"
  rs274ngc_errors(5) = "All axes missing with g92"
  rs274ngc_errors(6) = "All axes missing with motion code"
  rs274ngc_errors(7) = "Arc radius too small to reach end point"
  rs274ngc_errors(8) = "Argument to acos out of range"
  rs274ngc_errors(9) = "Argument to asin out of range"
  rs274ngc_errors(10) = "Attempt to divide by zero"
  rs274ngc_errors(11) = "Attempt to raise negative to non integer power"
  rs274ngc_errors(12) = "Bad character used"
  rs274ngc_errors(13) = "Bad format unsigned integer"
  rs274ngc_errors(14) = "Bad number format"
  rs274ngc_errors(15) = "Bug bad g code modal group 100"
  rs274ngc_errors(16) = "Bug code not g0 or g1"
  rs274ngc_errors(17) = "Bug code not g17 g18 or g19"
  rs274ngc_errors(18) = "Bug code not g20 or g21"
  rs274ngc_errors(19) = "Bug code not g28 or g30"
 rs274ngc_errors(20) = "Bug code not g2 or g3"
 rs274ngc_errors(21) = "Bug code not g40 g41 or g42"
 rs274ngc_errors(22) = "Bug code not g43 or g49"
 rs274ngc_errors(23) = "Bug code not g4 g10 g28 g30 g53 or g92 series"
 rs274ngc_errors(24) = "Bug code not g61 g61 1 or g64"
 rs274ngc_errors(25) = "Bug code not g90 or g91"
 rs274ngc_errors(26) = "Bug code not g93 or g94"
 rs274ngc_errors(27) = "Bug code not g98 or g99"
 rs274ngc_errors(28) = "Bug code not in g92 series"
 rs274ngc_errors(29) = "Bug code not in range g54 to g593"
 rs274ngc_errors(30) = "Bug code not m0 m1 m2 m30 m60 "
 rs274ngc_errors(31) = "Bug distance mode not g90 or g91"
 rs274ngc_errors(32) = "Bug function should not have been called"
 rs274ngc_errors(33) = "Bug in tool radius comp"
 rs274ngc_errors(34) = "Bug plane not xy yz or xz"
 rs274ngc_errors(35) = "Bug side not right or left"
 rs274ngc_errors(36) = "Bug unknown motion code"
 rs274ngc_errors(37) = "Bug unknown operation"
 rs274ngc_errors(38) = "Cannot change axis offsets with cutter radius comp"
 rs274ngc_errors(39) = "Cannot change units with cutter radius comp"
  rs274ngc_errors(40) = "Cannot create backup file"
 rs274ngc_errors(41) = "Cannot do g1 with zero feed rate"
 rs274ngc_errors(42) = "Cannot do zero repeats of cycle"
 rs274ngc_errors(43) = "Cannot make arc with zero feed rate"
  rs274ngc_errors(44) = "Cannot move rotary axes during probing"
 rs274ngc_errors(45) = "Cannot open backup file"
 rs274ngc_errors(46) = "Cannot open variable file"
 rs274ngc_errors(47) = "Cannot probe in inverse time feed mode "
 rs274ngc_errors(48) = "Cannot probe with cutter radius comp on"
 rs274ngc_errors(49) = "Cannot probe with zero feed rate"
 rs274ngc_errors(50) = "Cannot put a b in canned cycle"
 rs274ngc_errors(51) = "Cannot put a c in canned cycle "
 rs274ngc_errors(52) = "Cannot put an a in canned cycle"
  rs274ngc_errors(53) = "Cannot turn cutter radius comp on out of xy plane"
  rs274ngc_errors(54) = "Cannot turn cutter radius comp on when on"
 rs274ngc_errors(55) = "Cannot use a word "
 rs274ngc_errors(56) = " Cannot use axis values with g80"
  rs274ngc_errors(57) = "Cannot use axis values without a g code that uses them"
  rs274ngc_errors(58) = "Cannot use b word"
  rs274ngc_errors(59) = "Cannot use c word"
  rs274ngc_errors(60) = "Cannot use g28 or g30 with cutter radius comp"
  rs274ngc_errors(61) = "Cannot use g53 incremental"
  rs274ngc_errors(62) = "Cannot use g53 with cutter radius comp"
  rs274ngc_errors(63) = "Cannot use two g codes that both use axis values"
  rs274ngc_errors(64) = "Cannot use xz plane with cutter radius comp"
  rs274ngc_errors(65) = "Cannot use yz plane with cutter radius comp"
  rs274ngc_errors(66) = "Command too long "
  rs274ngc_errors(67) = " Concave corner with cutter radius comp"
  rs274ngc_errors(68) = "Coordinate system index parameter 5220 out of range"
  rs274ngc_errors(69) = "Current point same as end point of arc"
  rs274ngc_errors(70) = "Cutter gouging with cutter radius comp"
  rs274ngc_errors(71) = "D word with no g41 or g42"
  rs274ngc_errors(72) = "Dwell time missing with g4"
 rs274ngc_errors(73) = "Dwell time p word missing with g82"
 rs274ngc_errors(74) = "Dwell time p word missing with g86 "
 rs274ngc_errors(75) = " Dwell time p word missing with g88"
 rs274ngc_errors(76) = "Dwell time p word missing with g89"
 rs274ngc_errors(77) = "Equal sign missing in parameter setting"
  rs274ngc_errors(78) = "F word missing with inverse time arc move"
  rs274ngc_errors(79) = "F word missing with inverse time g1 move"
  rs274ngc_errors(80) = "File ended with no percent sign"
 rs274ngc_errors(81) = "File ended with no percent sign or program end"
  rs274ngc_errors(82) = "File name too long "
 rs274ngc_errors(83) = "File not open"
 rs274ngc_errors(84) = "G code out of range"
  rs274ngc_errors(85) = "H word with no g43"
  rs274ngc_errors(86) = "I word given for arc in yz plane"
  rs274ngc_errors(87) = "I word missing with g87"
  rs274ngc_errors(88) = "I word with no g2 or g3 or g87 to use it"
  rs274ngc_errors(89) = "J word given for arc in xz plane"
  rs274ngc_errors(90) = "J word missing with g87"
  rs274ngc_errors(91) = "J word with no g2 or g3 or g87 to use it "
  rs274ngc_errors(92) = "K word given for arc in xy plane"
  rs274ngc_errors(93) = "K word missing with g87"
 rs274ngc_errors(94) = "K word with no g2 or g3 or g87 to use it"
  rs274ngc_errors(95) = "L word with no canned cycle or g10"
  rs274ngc_errors(96) = "Left bracket missing after slash with atan"
  rs274ngc_errors(97) = "Left bracket missing after unary operation name"
  rs274ngc_errors(98) = "Line number greater than 99999"
  rs274ngc_errors(99) = "Line with g10 does not have l2"
  rs274ngc_errors(100) = "M code greater than 99"
   rs274ngc_errors(101) = "Mixed radius ijk format for arc"
   rs274ngc_errors(102) = "Multiple a words on one line"
  rs274ngc_errors(103) = "Multiple b words on one line"
  rs274ngc_errors(104) = "Multiple c words on one line"
  rs274ngc_errors(105) = "Multiple d words on one line"
  rs274ngc_errors(106) = "Multiple f words on one line "
  rs274ngc_errors(107) = "Multiple h words on one line"
 rs274ngc_errors(108) = "Multiple i words on one line"
  rs274ngc_errors(109) = "Multiple j words on one line"
  rs274ngc_errors(110) = "Multiple k words on one line"
  rs274ngc_errors(111) = "Multiple l words on one line "
  rs274ngc_errors(112) = "Multiple p words on one line"
 rs274ngc_errors(113) = "Multiple q words on one line"
 rs274ngc_errors(114) = "Multiple r words on one line"
 rs274ngc_errors(115) = "Multiple s words on one line"
  rs274ngc_errors(116) = "Multiple t words on one line "
 rs274ngc_errors(117) = "Multiple x words on one line"
 rs274ngc_errors(118) = "Multiple y words on one line"
 rs274ngc_errors(119) = "Multiple z words on one line"
 rs274ngc_errors(120) = "Must use g0 or g1 with g53"
 rs274ngc_errors(121) = "Negative argument to sqrt"
 rs274ngc_errors(122) = "Negative d word tool radius index used"
 rs274ngc_errors(123) = "Negative f word used"
 rs274ngc_errors(124) = "Negative g code used"
  rs274ngc_errors(125) = "Negative h word tool length offset index used"
  rs274ngc_errors(126) = "Negative l word used "
  rs274ngc_errors(127) = "Negative m code used"
  rs274ngc_errors(128) = "Negative or zero q value used"
  rs274ngc_errors(129) = "Negative p word used"
  rs274ngc_errors(130) = "Negative spindle speed used"
  rs274ngc_errors(131) = "Negative tool id used"
 rs274ngc_errors(132) = "Nested comment found"
 rs274ngc_errors(133) = "No characters found in reading real value"
 rs274ngc_errors(134) = "No digits found where real number should be"
 rs274ngc_errors(135) = "Non integer value for integer"
 rs274ngc_errors(136) = "Null missing after newline"
 rs274ngc_errors(137) = "Offset index missing"
 rs274ngc_errors(138) = "P value not an integer with g10 l2"
 rs274ngc_errors(139) = "P value out of range with g10 l2"
  rs274ngc_errors(140) = "P word with no g4 g10 g82 g86 g88 g89"
  rs274ngc_errors(141) = "Parameter file out of order"
  rs274ngc_errors(142) = "Parameter number out of range"
  rs274ngc_errors(143) = "Q word missing with g83"
 rs274ngc_errors(144) = "Q word with no g83"
  rs274ngc_errors(145) = "Queue is not empty after probing"
  rs274ngc_errors(146) = "R clearance plane unspecified in cycle"
 rs274ngc_errors(147) = "R i j k words all missing for arc"
 rs274ngc_errors(148) = "R less than x in cycle in yz plane"
 rs274ngc_errors(149) = "R less than y in cycle in xz plane"
 rs274ngc_errors(150) = "R less than z in cycle in xy plane"
  rs274ngc_errors(151) = "R word with no g code that uses it"
  rs274ngc_errors(152) = "Radius to end of arc differs from radius to start"
  rs274ngc_errors(153) = "Radius too small to reach end point"
  rs274ngc_errors(154) = "Required parameter missing"
  rs274ngc_errors(155) = "Selected tool slot number too large"
  rs274ngc_errors(156) = "Slash missing after first atan argument"
  rs274ngc_errors(157) = "Spindle not turning clockwise in g84"
  rs274ngc_errors(158) = "Spindle not turning in g86"
  rs274ngc_errors(159) = "Spindle not turning in g87"
   rs274ngc_errors(160) = "Spindle not turning in g88"
   rs274ngc_errors(161) = "Sscanf failed"
  rs274ngc_errors(162) = "Start point too close to probe point"
  rs274ngc_errors(163) = "Too many m codes on line"
  rs274ngc_errors(164) = "Tool length offset index too big"
  rs274ngc_errors(165) = "Tool max too large"
  rs274ngc_errors(166) = "Tool radius index too big"
  rs274ngc_errors(167) = "Tool radius not less than arc radius with comp"
  rs274ngc_errors(168) = "Two g codes used from same modal group"
  rs274ngc_errors(169) = "Two m codes used from same modal group"
  rs274ngc_errors(170) = "Unable to open file"
  rs274ngc_errors(171) = "Unclosed comment found"
   rs274ngc_errors(172) = "Unclosed expression"
  rs274ngc_errors(173) = "Unknown g code used"
   rs274ngc_errors(174) = "Unknown m code used "
  rs274ngc_errors(175) = "Unknown operation"
  rs274ngc_errors(176) = "Unknown operation name starting with a"
   rs274ngc_errors(177) = "Unknown operation name starting with m"
   rs274ngc_errors(178) = "Unknown operation name starting with o"
  rs274ngc_errors(179) = "Unknown operation name starting with x"
  rs274ngc_errors(180) = "Unknown word starting with a"
  rs274ngc_errors(181) = "Unknown word starting with c"
  rs274ngc_errors(182) = "Unknown word starting with e"
  rs274ngc_errors(183) = "Unknown word starting with f "
  rs274ngc_errors(184) = "Unknown word starting with l"
  rs274ngc_errors(185) = "Unknown word starting with r"
  rs274ngc_errors(186) = "Unknown word starting with s"
  rs274ngc_errors(187) = "Unknown word starting with t"
   rs274ngc_errors(188) = "Unknown word where unary operation could be"
   rs274ngc_errors(189) = "X and y words missing for arc in xy plane"
   rs274ngc_errors(190) = "X and z words missing for arc in xz plane"
    rs274ngc_errors(191) = "X value unspecified in yz plane canned cycle"
   rs274ngc_errors(192) = "X y and z words all missing with g38 2"
   rs274ngc_errors(193) = "Y and z words missing for arc in yz plane"
   rs274ngc_errors(194) = "Y value unspecified in xz plane canned cycle"
  rs274ngc_errors(195) = "Z value unspecified in xy plane canned cycle"
   rs274ngc_errors(196) = "Zero or negative argument to ln"
   rs274ngc_errors(197) = "Zero radius arc"
   rs274ngc_errors(198) = "The End"


End Sub


