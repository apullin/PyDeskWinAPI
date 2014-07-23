Attribute VB_Name = "Module1"
''  Copyright Carken Co. 2001 - 2004 All rights reserved.
Option Explicit

Public Const COMMANDFAILED = 0
Public Const COMMANDACCEPTED = 1
Public Const BUFFERFULL = 2

Const TC = 27
Const NumAxis = 4
Const Inverted = 0
Const TagAlongAxis = 0

Global ControllerFound As Boolean
Global Port As Long
Global Mode2ndGen As Boolean
Global InPosition As Boolean
Global FirmVer As Double
Global EmStop As Boolean
Global Paused As Boolean


Public Function SendAPICommandToController(com As TDeskWinAPICommand) As Long

  Dim X As Long
  Dim Y As Long
  Dim Z As Long
  Dim A As Long
  Dim Ack As Byte
  Dim Inputs As Byte
  
  If Mode2ndGen = True Then
    SendAPICommandToController = SendAPICommandToController2ndGen(com)
    Exit Function
  End If
  
  SendAPICommandToController = COMMANDFAILED
  If Not ControllerFound Then Exit Function
  Ack = 0
  A = 0
  Select Case com.CommandType
   Case ARCDIRECTION
        Ack = DeskWinSetArcDirection(com.Dir)
   Case ACCELCOM
        ' usually sent directly
   Case GETVERSION
        FirmVer = DeskWinGetFirmwareVersion()
   Case RESETCONTROL
        Ack = DeskWinReset(Port, TC, 0)
   Case GETPOS
        Ack = DeskWinGetPosition(X, Y, Z, A)
        If Ack = DESKWIN_IN_POSITION Then
          InPosition = True
        Else
          Main.UpdateCoords X, Y, Z, A
        End If
   Case PAUSECONTROL
        Ack = DeskWinPause
        If Ack = DESKWIN_OK Then Paused = True
   Case CONTINUECONTROL
        If EmStop Then
          Ack = DESKWIN_IN_EMSTOP
        Else
          Ack = DeskWinContinue
        End If
        If Ack = DESKWIN_OK Then Paused = False
   Case ENDMOVE
        Ack = DeskWinEndCurrentMove
   Case EMERGENCYSTOP
        Ack = DeskWinEmStop
   Case SETPOS
        Ack = DeskWinSetPosition(com.X, com.Y, com.Z, com.A, com.Axis)
   Case OUTPUT
        If EmStop Then
          Ack = DESKWIN_IN_EMSTOP
        Else
          Ack = DeskWinSetOutput(com.Axis, com.Dir, X, Y, Z, A)
        End If
   Case CONTROLDELAY
        If EmStop Then
          Ack = DESKWIN_IN_EMSTOP
        Else
          Ack = DeskWinDelay(com.Secs, X, Y, Z, A)
        End If
   Case LINEARFEED
        If EmStop Then
          Ack = DESKWIN_IN_EMSTOP
        Else
          Ack = DeskWinLinearMove(com.X, com.Y, com.Z, com.A, com.SlewSPS, com.EndSPS, X, Y, Z, A)
        End If
   Case INDEXFEED
        If EmStop Then
          Ack = DESKWIN_IN_EMSTOP
        Else
          Ack = DeskWinIndexMove(com.X, com.Y, com.Z, com.A, com.SlewSPS, com.Axis, X, Y, Z, A)
        End If
   Case RAPIDFEED
        If EmStop Then
          Ack = DESKWIN_IN_EMSTOP
        Else
          Ack = DeskWinRapidMove(com.X, com.Y, com.Z, com.A, com.SlewSPS, com.EndSPS, X, Y, Z, A)
        End If
   Case CW
        If EmStop Then
          Ack = DESKWIN_IN_EMSTOP
        Else
          Ack = DeskWinQuadrantArcMoveCW(com.rad, com.X, com.Y, com.Ex, com.Ey, com.SlewSPS, com.EndSPS, com.Quad, X, Y, Z, A)
        End If
   Case CCW
        If EmStop Then
          Ack = DESKWIN_IN_EMSTOP
        End
          Ack = DeskWinQuadrantArcMoveCCW(com.rad, com.X, com.Y, com.Ex, com.Ey, com.SlewSPS, com.EndSPS, com.Quad, X, Y, Z, A)
        End If
   Case HOMECONTROL
        If EmStop Then
          Ack = DESKWIN_IN_EMSTOP
        Else
          Ack = DeskWinHome(com.Axis, com.Dir, com.SlewSPS)
        End If
   Case SETOVERRIDE
        Ack = DeskWinSetFeedOverride(com.SlewSPS)
   Case SETOVERRIDEMAX
        Ack = DeskWinSetMaxSPS(com.SlewSPS, NumAxis, Inverted, TagAlongAxis, com.NumSteps)
   Case READINPUTS
        Inputs = DeskWinReadInputs()
        Ack = DESKWIN_OK
  End Select
  Select Case Ack
    Case 0 To 52
        SendAPICommandToController = COMMANDACCEPTED
    Case DESKWIN_OK
        SendAPICommandToController = COMMANDACCEPTED
    Case DESKWIN_BUFFERFULL
        Main.UpdateCoords X, Y, Z, A
        SendAPICommandToController = BUFFERFULL
    Case DESKWIN_IN_POSITION
        Main.UpdateCoords X, Y, Z, A
        InPosition = True
        SendAPICommandToController = COMMANDACCEPTED
    Case DESKWIN_SYNTAXERROR
        Main.sbrBar.Caption = "Command Syntax Error..."
        SendAPICommandToController = COMMANDFAILED
    Case DESKWIN_LIMITHIT
        If Not EmStop Then Main.DoEmStop (True)
        InPosition = True
        Main.sbrBar.Caption = "Limit Switch Hit..."
        SendAPICommandToController = COMMANDFAILED
    Case DESKWIN_INVALID_CHECKSUM
        Main.sbrBar.Caption = "Invalid Checksum..."
        SendAPICommandToController = COMMANDFAILED
    Case DESKWIN_UNKNOWN_COMMAND
        Main.sbrBar.Caption = "Unknown Command..."
        SendAPICommandToController = COMMANDFAILED
    Case DESKWIN_INVALIDSTART
        Main.sbrBar.Caption = "Command Syntax Error..."
        SendAPICommandToController = COMMANDFAILED
    Case DESKWIN_PROBEHIT
        Main.sbrBar.Caption = "Probe (Home) Switch Hit..."
        InPosition = True
        SendAPICommandToController = COMMANDACCEPTED
    Case DESKWIN_COMMAND_IS_IN_PROGRESS
        Main.sbrBar.Caption = "Command is already in progress..."
        SendAPICommandToController = COMMANDFAILED
    Case DESKWIN_PORT_DOES_NOT_EXIST
        Main.sbrBar.Caption = "Port Does Not Exist..."
        SendAPICommandToController = COMMANDFAILED
    Case DESKWIN_PORT_IS_ALREADY_OPEN
        Main.sbrBar.Caption = "Port is already open..."
        SendAPICommandToController = COMMANDFAILED
    Case DESKWIN_TIMEDOUT
        Main.sbrBar.Caption = "Command Timed Out..."
        SendAPICommandToController = COMMANDFAILED
    Case DESKWIN_FAILED_TO_RESET
        Main.sbrBar.Caption = "Controller Failed to Reset..."
        SendAPICommandToController = COMMANDFAILED
    Case DESKWIN_NOTINITED
        Main.sbrBar.Caption = "Controller not Inited..."
        SendAPICommandToController = COMMANDFAILED
    Case DESKWIN_IN_EMSTOP
        Main.sbrBar.Caption = "Controller in EMSTOP..."
        SendAPICommandToController = COMMANDACCEPTED
  End Select
End Function



Public Function SendAPICommandToController2ndGen(com As TDeskWinAPICommand) As Long

  Dim X As Long
  Dim Y As Long
  Dim Z As Long
  Dim A As Long
  Dim Ack As Byte
  Dim Inputs As Byte
  Dim RPM As Long
  
 
  SendAPICommandToController2ndGen = COMMANDFAILED
  If Not ControllerFound Then Exit Function
  Ack = 0
  A = 0
  Select Case com.CommandType
   Case ARCDIRECTION
        Ack = DeskWinSetArcDirection(com.Dir)
   Case ACCELCOM
        ' usually sent directly
   Case GETVERSION
        FirmVer = DeskWinGetFirmwareVersion()
   Case RESETCONTROL
        Ack = DeskWinReset(Port, TC, 1)
   Case GETPOS
        Ack = DeskWinGetPosition(X, Y, Z, A)
        If Ack = DESKWIN_2nd_IN_POSITION Then
          InPosition = True
        Else
          Main.UpdateCoords X, Y, Z, A
        End If
   Case PAUSECONTROL
        Ack = DeskWinPause
        If Ack = DESKWIN_2nd_OK Then Paused = True
   Case CONTINUECONTROL
        If EmStop Then
          Ack = DESKWIN_2nd_IN_EMSTOP
        Else
          Ack = DeskWinContinue
        End If
        If Ack = DESKWIN_2nd_OK Then Paused = False
   Case ENDMOVE
        Ack = DeskWinEndCurrentMove
   Case EMERGENCYSTOP
        Ack = DeskWinEmStop
   Case SETPOS
        Ack = DeskWinSetPosition(com.X, com.Y, com.Z, com.A, com.Axis)
   Case OUTPUT
        If EmStop Then
          Ack = DESKWIN_2nd_IN_EMSTOP
        Else
          Ack = DeskWinSetOutput(com.Axis, com.Dir, X, Y, Z, A)
        End If
   Case CONTROLDELAY
        If EmStop Then
          Ack = DESKWIN_2nd_IN_EMSTOP
        Else
          Ack = DeskWinDelay(com.Secs, X, Y, Z, A)
        End If
   Case LINEARFEED
        If EmStop Then
          Ack = DESKWIN_2nd_IN_EMSTOP
        Else
          Ack = DeskWinLinearMove(com.X, com.Y, com.Z, com.A, com.SlewSPS, com.EndSPS, X, Y, Z, A)
        End If
   Case INDEXFEED
        If EmStop Then
          Ack = DESKWIN_2nd_IN_EMSTOP
        Else
          Ack = DeskWinIndexMove(com.X, com.Y, com.Z, com.A, com.SlewSPS, com.Axis, X, Y, Z, A)
        End If
   Case RAPIDFEED
        If EmStop Then
          Ack = DESKWIN_2nd_IN_EMSTOP
        Else
          Ack = DeskWinRapidMove(com.X, com.Y, com.Z, com.A, com.SlewSPS, com.EndSPS, X, Y, Z, A)
        End If
   Case CW
        If EmStop Then
          Ack = DESKWIN_2nd_IN_EMSTOP
        Else
          Ack = DeskWinQuadrantArcMoveCW(com.rad, com.X, com.Y, com.Ex, com.Ey, com.SlewSPS, com.EndSPS, com.Quad, X, Y, Z, A)
        End If
   Case CCW
        If EmStop Then
          Ack = DESKWIN_2nd_IN_EMSTOP
        End
          Ack = DeskWinQuadrantArcMoveCCW(com.rad, com.X, com.Y, com.Ex, com.Ey, com.SlewSPS, com.EndSPS, com.Quad, X, Y, Z, A)
        End If
   Case HOMECONTROL
        If EmStop Then
          Ack = DESKWIN_2nd_IN_EMSTOP
        Else
          Ack = DeskWinHome(com.Axis, com.Dir, com.SlewSPS)
        End If
   Case SETOVERRIDE
        Ack = DeskWinSetFeedOverride(com.SlewSPS)
   Case SETOVERRIDEMAX
        Ack = DeskWinSetMaxSPS(com.SlewSPS, NumAxis, Inverted, TagAlongAxis, com.NumSteps)
   Case READINPUTS
        Inputs = DeskWinReadInputs()
        Ack = DESKWIN_2nd_OK
   Case CHASEENCODER
          If com.Quad = 1 Then
            Ack = DeskWinChaseEncoder(com.Axis, com.Dir, com.X, com.Y, com.Z, com.A)
          Else
            Ack = DeskWinEndChaseEncoder()
          End If
   Case READRPM
          RPM = DeskWinReadRPM()
          Main.UpdateRPM RPM
          Ack = DESKWIN_2nd_OK
    Case OUTPUTIMEDIATE
        If EmStop Then
          Ack = DESKWIN_2nd_IN_EMSTOP
        Else
          Ack = DeskWinSetOutputImediate(com.Dir)
        End If
 End Select
  Select Case Ack
    Case 0 To 232
        SendAPICommandToController2ndGen = COMMANDACCEPTED
    Case DESKWIN_2nd_OK
        SendAPICommandToController2ndGen = COMMANDACCEPTED
    Case DESKWIN_2nd_BUFFERFULL
        Main.UpdateCoords X, Y, Z, A
        SendAPICommandToController2ndGen = BUFFERFULL
    Case DESKWIN_2nd_IN_POSITION
        Main.UpdateCoords X, Y, Z, A
        InPosition = True
        SendAPICommandToController2ndGen = COMMANDACCEPTED
    Case DESKWIN_2nd_SYNTAXERROR
        Main.sbrBar.Caption = "Command Syntax Error..."
        SendAPICommandToController2ndGen = COMMANDFAILED
    Case DESKWIN_2nd_LIMITHIT
        If Not EmStop Then Main.DoEmStop (True)
        InPosition = True
        Main.sbrBar.Caption = "Limit Switch Hit..."
        SendAPICommandToController2ndGen = COMMANDFAILED
    Case DESKWIN_2nd_INVALID_CHECKSUM
        Main.sbrBar.Caption = "Invalid Checksum..."
        SendAPICommandToController2ndGen = COMMANDFAILED
    Case DESKWIN_2nd_UNKNOWN_COMMAND
        Main.sbrBar.Caption = "Unknown Command..."
        SendAPICommandToController2ndGen = COMMANDFAILED
    Case DESKWIN_2nd_INVALIDSTART
        Main.sbrBar.Caption = "Command Syntax Error..."
        SendAPICommandToController2ndGen = COMMANDFAILED
    Case DESKWIN_2nd_PROBEHIT
        Main.sbrBar.Caption = "Probe (Home) Switch Hit..."
        InPosition = True
        SendAPICommandToController2ndGen = COMMANDACCEPTED
    Case DESKWIN_2nd_COMMAND_IS_IN_PROGRESS
        Main.sbrBar.Caption = "Command is already in progress..."
        SendAPICommandToController2ndGen = COMMANDFAILED
    Case DESKWIN_2nd_PORT_DOES_NOT_EXIST
        Main.sbrBar.Caption = "Port Does Not Exist..."
        SendAPICommandToController2ndGen = COMMANDFAILED
    Case DESKWIN_2nd_PORT_IS_ALREADY_OPEN
        Main.sbrBar.Caption = "Port is already open..."
        SendAPICommandToController2ndGen = COMMANDFAILED
    Case DESKWIN_2nd_TIMEDOUT
        Main.sbrBar.Caption = "Command Timed Out..."
        SendAPICommandToController2ndGen = COMMANDFAILED
    Case DESKWIN_2nd_FAILED_TO_RESET
        Main.sbrBar.Caption = "Controller Failed to Reset..."
        SendAPICommandToController2ndGen = COMMANDFAILED
    Case DESKWIN_2nd_NOTINITED
        Main.sbrBar.Caption = "Controller not Inited..."
        SendAPICommandToController2ndGen = COMMANDFAILED
  End Select
End Function




