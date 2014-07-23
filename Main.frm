VERSION 5.00
Begin VB.Form Main 
   Caption         =   "VB DeskWinNC Control Simple Demo"
   ClientHeight    =   7350
   ClientLeft      =   45
   ClientTop       =   270
   ClientWidth     =   6465
   LinkTopic       =   "Form1"
   ScaleHeight     =   7350
   ScaleWidth      =   6465
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnOutputs 
      Caption         =   "Output"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   5160
      TabIndex        =   38
      Top             =   6000
      Width           =   1215
   End
   Begin VB.CommandButton btnFeedMinus 
      Caption         =   "Feed --"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   5160
      TabIndex        =   37
      Top             =   5280
      Width           =   1215
   End
   Begin VB.CommandButton btnFeedPlus 
      Caption         =   "Feed ++"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   5160
      TabIndex        =   36
      Top             =   4560
      Width           =   1215
   End
   Begin VB.CommandButton Command4 
      Caption         =   "RPM OFF"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   5160
      TabIndex        =   35
      Top             =   3720
      Width           =   1215
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Chase Enc"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3240
      TabIndex        =   32
      Top             =   1440
      Width           =   1455
   End
   Begin VB.CheckBox chkMode 
      Caption         =   "2nd Gen Control"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   4320
      TabIndex        =   31
      Top             =   240
      Value           =   1  'Checked
      Width           =   1935
   End
   Begin VB.CommandButton btnNegA 
      Caption         =   "Jog A-"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4800
      TabIndex        =   30
      Top             =   3000
      Width           =   1335
   End
   Begin VB.CommandButton btnPosA 
      Caption         =   "Jog A+"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4800
      TabIndex        =   29
      Top             =   2400
      Width           =   1335
   End
   Begin VB.TextBox txtGcode 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2160
      TabIndex        =   26
      Text            =   "G1 X50 Y75 Z100 F1.0"
      Top             =   1920
      Width           =   3735
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Execute GCode"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   240
      TabIndex        =   25
      Top             =   1920
      Width           =   1815
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Read Inputs"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   372
      Left            =   4800
      TabIndex        =   24
      Top             =   1440
      Width           =   1332
   End
   Begin VB.TextBox txtDist 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   288
      Left            =   2400
      TabIndex        =   22
      Text            =   "50"
      Top             =   1440
      Width           =   612
   End
   Begin VB.TextBox txtAccel 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   288
      Left            =   4560
      TabIndex        =   20
      Text            =   "2000"
      Top             =   720
      Width           =   612
   End
   Begin VB.TextBox txtMaxSPS 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   288
      Left            =   3600
      TabIndex        =   19
      Text            =   "650"
      Top             =   720
      Width           =   612
   End
   Begin VB.TextBox txtStartVel 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   288
      Left            =   2640
      TabIndex        =   18
      Text            =   "200"
      Top             =   720
      Width           =   612
   End
   Begin VB.TextBox txtScale 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   288
      Left            =   5520
      TabIndex        =   17
      Text            =   "1"
      Top             =   720
      Width           =   612
   End
   Begin VB.TextBox txtPort 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   288
      Left            =   3480
      TabIndex        =   16
      Text            =   "1"
      Top             =   240
      Width           =   612
   End
   Begin VB.CommandButton btnNegX 
      Caption         =   "Jog X-"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3360
      TabIndex        =   8
      Top             =   3000
      Width           =   1335
   End
   Begin VB.CommandButton btnPosX 
      Caption         =   "Jog X+"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3360
      TabIndex        =   7
      Top             =   2400
      Width           =   1335
   End
   Begin VB.CommandButton btnNegY 
      Caption         =   "Jog Y-"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1800
      TabIndex        =   6
      Top             =   3000
      Width           =   1455
   End
   Begin VB.CommandButton btnPosY 
      Caption         =   "Jog Y+"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1800
      TabIndex        =   5
      Top             =   2400
      Width           =   1455
   End
   Begin VB.CommandButton btnDown 
      Caption         =   "Jog Z-"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   240
      TabIndex        =   4
      Top             =   3000
      Width           =   1455
   End
   Begin VB.CommandButton btnUp 
      Caption         =   "Jog Z+"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   240
      TabIndex        =   3
      Top             =   2400
      Width           =   1455
   End
   Begin VB.CommandButton btnSetAccel 
      Caption         =   "Set Acceleration"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   372
      Left            =   240
      TabIndex        =   1
      Top             =   720
      Width           =   1932
   End
   Begin VB.CommandButton btnInit 
      Caption         =   "Initialize Controller"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   372
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   1932
   End
   Begin VB.Label lblRPM 
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   1680
      TabIndex        =   34
      Top             =   6000
      Width           =   3255
   End
   Begin VB.Label Label2 
      Caption         =   "RPM"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Index           =   4
      Left            =   240
      TabIndex        =   33
      Top             =   6000
      Width           =   1215
   End
   Begin VB.Label ACoord 
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   720
      TabIndex        =   28
      Top             =   5400
      Width           =   4215
   End
   Begin VB.Label Label2 
      Caption         =   "A"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Index           =   3
      Left            =   240
      TabIndex        =   27
      Top             =   5400
      Width           =   375
   End
   Begin VB.Label sbrBar 
      Height          =   255
      Left            =   120
      TabIndex        =   23
      Top             =   6960
      Width           =   6255
   End
   Begin VB.Label Label5 
      Caption         =   "Start Vel    Max SPS       Accel     AccelScale"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   2400
      TabIndex        =   21
      Top             =   1080
      Width           =   3975
   End
   Begin VB.Label Label4 
      Caption         =   "Com Port"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2400
      TabIndex        =   15
      Top             =   240
      Width           =   975
   End
   Begin VB.Label ZCoord 
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   720
      TabIndex        =   14
      Top             =   4800
      Width           =   4215
   End
   Begin VB.Label YCoord 
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   720
      TabIndex        =   13
      Top             =   4200
      Width           =   4215
   End
   Begin VB.Label XCoord 
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   720
      TabIndex        =   12
      Top             =   3600
      Width           =   4215
   End
   Begin VB.Label Label2 
      Caption         =   "Z"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   612
      Index           =   2
      Left            =   240
      TabIndex        =   11
      Top             =   4800
      Width           =   372
   End
   Begin VB.Label Label2 
      Caption         =   "Y"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   612
      Index           =   1
      Left            =   240
      TabIndex        =   10
      Top             =   4200
      Width           =   372
   End
   Begin VB.Label Label2 
      Caption         =   "X"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   612
      Index           =   0
      Left            =   240
      TabIndex        =   9
      Top             =   3600
      Width           =   372
   End
   Begin VB.Label Label1 
      Caption         =   "Jog Distance in Steps"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   252
      Left            =   240
      TabIndex        =   2
      Top             =   1560
      Width           =   2172
   End
End
Attribute VB_Name = "Main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

 Dim Jogging As Boolean
 Dim Chase As Boolean
 Dim CurX, CurY, CurZ, CurA As Long
 Dim RPMON As Boolean
 Dim OverRide As Long
 
 


Private Sub btnDown_Click()
  Dim NewPos, X, Y, Z, A As Long
  Dim Ack As Byte
  Dim com As TDeskWinAPICommand
  
  If Jogging Then Exit Sub
  Jogging = True
  UpdatePositionFromController
  NewPos = Val(txtDist.Text)
  com.X = CurX
  com.Y = CurY
  com.Z = CurZ - NewPos
  com.A = CurA
  com.EndSPS = 0
  com.SlewSPS = Val(txtMaxSPS.Text)
  com.CommandType = RAPIDFEED
  Ack = SendAPICommandToController(com)
  GetStatusUntilInPosition
  Jogging = False
End Sub

Private Sub btnFeedMinus_Click()
  Dim com As TDeskWinAPICommand
  Dim Ack As Long
  
  If Mode2ndGen Then
    OverRide = OverRide + 10
  Else
    OverRide = OverRide - 10
  End If
  
  btnFeedPlus.Caption = "Feed (" + Str(OverRide) + ")"
  
  com.CommandType = SETOVERRIDE
  com.SlewSPS = OverRide
  Ack = SendAPICommandToController(com)

End Sub

Private Sub btnFeedPlus_Click()
  Dim com As TDeskWinAPICommand
  Dim Ack As Long
 
  If Mode2ndGen Then
    OverRide = OverRide - 10
  Else
    OverRide = OverRide + 10
  End If
  
  btnFeedPlus.Caption = "Feed (" + Str(OverRide) + ")"
  
  com.CommandType = SETOVERRIDE
  com.SlewSPS = OverRide
  Ack = SendAPICommandToController(com)
End Sub

Private Sub btnInit_Click()
  Dim com As TDeskWinAPICommand
  Dim Ack As Long
  Dim init As Integer
  
  Port = Val(txtPort.Text)
  
  com.CommandType = RESETCONTROL
  If chkMode.Value = 1 Then
    Mode2ndGen = True
  Else
    Mode2ndGen = False
  End If
  
  Ack = SendAPICommandToController(com)
  sbrBar.Caption = "Ack = " + Str(Ack)

  
  FirmVer = DeskWinGetFirmwareVersion
  If FirmVer <> 0 Then
    sbrBar.Caption = "Firmware Version " + Str(FirmVer) + " detected..."
  Else
    sbrBar.Caption = "Controller NOT detected..."
  End If
  
  
  com.CommandType = SETOVERRIDEMAX
  If Mode2ndGen Then
    com.SlewSPS = 100000 'max SPS
    com.NumSteps = 8000
  Else
    com.SlewSPS = 40000
    com.NumSteps = 0
  End If
  
  ''  execute Aux Output Imediately - do not buffer (com.axis = 0 to buffer output)
  com.Axis = 1
  
  Ack = SendAPICommandToController(com)
  
  init = rs274ngc_ext_init("C:\Program Files\DevStudio\VB\Projects\ControllerTest\DeskCNC.Ini")
End Sub

Private Sub btnNegA_Click()
  Dim NewPos, X, Y, Z, A As Long
  Dim Ack As Byte
  Dim com As TDeskWinAPICommand
  
  If Jogging Then Exit Sub
  Jogging = True
  UpdatePositionFromController
  NewPos = Val(txtDist.Text)
  com.X = CurX
  com.Y = CurY
  com.Z = CurZ
  com.A = CurA - NewPos
  com.EndSPS = 0
  com.SlewSPS = Val(txtMaxSPS.Text)
  com.CommandType = RAPIDFEED
  Ack = SendAPICommandToController(com)
  GetStatusUntilInPosition
  Jogging = False
End Sub

Private Sub btnNegX_Click()
  Dim NewPos, X, Y, Z, A As Long
  Dim Ack As Byte
  Dim com As TDeskWinAPICommand
  
  If Jogging Then Exit Sub
  Jogging = True
  UpdatePositionFromController
  NewPos = Val(txtDist.Text)
  com.X = CurX - NewPos
  com.Y = CurY
  com.Z = CurZ
  com.A = CurA
  com.EndSPS = 0
  com.SlewSPS = Val(txtMaxSPS.Text)
  com.CommandType = RAPIDFEED
  Ack = SendAPICommandToController(com)
  GetStatusUntilInPosition
  Jogging = False
End Sub

Private Sub btnNegY_Click()
  Dim NewPos, X, Y, Z, A As Long
  Dim Ack As Byte
  Dim com As TDeskWinAPICommand
  
  If Jogging Then Exit Sub
  Jogging = True
  UpdatePositionFromController
  NewPos = Val(txtDist.Text)
  com.X = CurX
  com.Y = CurY - NewPos
  com.Z = CurZ
  com.A = CurA
  com.EndSPS = 0
  com.SlewSPS = Val(txtMaxSPS.Text)
  com.CommandType = RAPIDFEED
  Ack = SendAPICommandToController(com)
  GetStatusUntilInPosition
  Jogging = False
End Sub


Private Sub btnOutputs_Click()
  Dim com As TDeskWinAPICommand
  Dim Ack As Byte
  
  If Mode2ndGen Then
    com.CommandType = OUTPUTIMEDIATE
    com.Dir = 127   '0-127
    Ack = SendAPICommandToController(com)
  End If
  sbrBar.Caption = Str(Ack)

End Sub

Private Sub btnPosA_Click()
  Dim NewPos, X, Y, Z, A As Long
  Dim Ack As Byte
  Dim com As TDeskWinAPICommand
  
  If Jogging Then Exit Sub
  Jogging = True
  UpdatePositionFromController
  NewPos = Val(txtDist.Text)
  com.X = CurX
  com.Y = CurY
  com.Z = CurZ
  com.A = CurA + NewPos
  com.EndSPS = 0
  com.SlewSPS = Val(txtMaxSPS.Text)
  com.CommandType = RAPIDFEED
  Ack = SendAPICommandToController(com)
  GetStatusUntilInPosition
  Jogging = False

End Sub

Private Sub btnPosX_Click()
  Dim NewPos, X, Y, Z, A As Long
  Dim Ack As Byte
  Dim com As TDeskWinAPICommand
  
  If Jogging Then Exit Sub
  Jogging = True
  UpdatePositionFromController
  NewPos = Val(txtDist.Text)
  com.X = CurX + NewPos
  com.Y = CurY
  com.Z = CurZ
  com.A = CurA
  com.EndSPS = 0
  com.SlewSPS = Val(txtMaxSPS.Text)
  com.CommandType = RAPIDFEED
  Ack = SendAPICommandToController(com)
  GetStatusUntilInPosition
  Jogging = False
End Sub

Private Sub btnPosY_Click()
  Dim NewPos, X, Y, Z, A As Long
  Dim Ack As Byte
  Dim com As TDeskWinAPICommand
  
  If Jogging Then Exit Sub
  Jogging = True
  UpdatePositionFromController
  NewPos = Val(txtDist.Text)
  com.X = CurX
  com.Y = CurY + NewPos
  com.Z = CurZ
  com.A = CurA
  com.EndSPS = 0
  com.SlewSPS = Val(txtMaxSPS.Text)
  com.CommandType = RAPIDFEED
  Ack = SendAPICommandToController(com)
  GetStatusUntilInPosition
  Jogging = False
End Sub

Private Sub btnSetAccel_Click()
  Dim Ack As Byte
  Dim Accel As Long
  Dim MaxSPS As Long
  Dim StartVel As Long
  Dim AScale As Byte
 
  sbrBar.Caption = "Setting Acceleration..."
  sbrBar.Refresh
  Accel = Val(txtAccel.Text)
  MaxSPS = Val(txtMaxSPS.Text)
  StartVel = Val(txtStartVel.Text)
  AScale = Val(txtScale.Text)
  Ack = DeskWinSetAccelleration(ByVal Accel, ByVal MaxSPS, ByVal StartVel, ByVal AScale)
  If Mode2ndGen Then
    If Ack = DESKWIN_2nd_OK Then
      sbrBar.Caption = "Acceleration set!"
    Else
      sbrBar.Caption = "Failed " + Str(Ack)
    End If
  Else
    If Ack = DESKWIN_OK Then
      sbrBar.Caption = "Acceleration set!"
    Else
      sbrBar.Caption = "Failed " + Str(Ack)
    End If
  End If
End Sub

Private Sub btnUp_Click()
  Dim NewPos, X, Y, Z, A As Long
  Dim Ack As Byte
  Dim com As TDeskWinAPICommand
  
  If Jogging Then Exit Sub
  Jogging = True
  UpdatePositionFromController
  NewPos = Val(txtDist.Text)
  com.X = CurX
  com.Y = CurY
  com.Z = CurZ + NewPos
  com.A = CurA
  com.EndSPS = 0
  com.SlewSPS = Val(txtMaxSPS.Text)
  com.CommandType = RAPIDFEED
  Ack = SendAPICommandToController(com)
  GetStatusUntilInPosition
  Jogging = False
End Sub

Public Sub UpdateCoords(X, Y, Z, A As Long)

  CurX = X
  CurY = Y
  CurZ = Z
  CurA = A
  XCoord.Caption = Format(CurX, "000.000")
  YCoord.Caption = Format(CurY, "000.000")
  ZCoord.Caption = Format(CurZ, "000.000")
  ACoord.Caption = Format(CurA, "000.000")

  XCoord.Refresh
  YCoord.Refresh
  ZCoord.Refresh
  ACoord.Refresh
End Sub
Public Sub UpdateRPM(RPM As Long)
  lblRPM.Caption = Format(RPM, "00000")
  lblRPM.Refresh
End Sub

Public Sub DoEmStop(State As Boolean)
  Dim com As TDeskWinAPICommand
  Dim Ack As Byte
  
  If State Then
    EmStop = True
    Paused = False
    Jogging = False
    com.CommandType = EMERGENCYSTOP
    Ack = SendAPICommandToController(com)
    GetStatusUntilInPosition
    sbrBar.Caption = "Controller in EMSTOP..."
  Else
    com.CommandType = GETPOS
    If SendAPICommandToController(com) = COMMANDACCEPTED Then
      sbrBar.Caption = "Controller is Ready..."
      EmStop = False
    End If
  End If
End Sub

Public Sub UpdatePositionFromController()
  Dim com As TDeskWinAPICommand
  Dim Ack As Byte
  
  com.CommandType = GETPOS
  Ack = SendAPICommandToController(com)
End Sub

Public Sub GetStatusUntilInPosition()
  Dim com As TDeskWinAPICommand
  Dim Ack As Byte
  
 sbrBar.Caption = "Controller is NOT INPOSITION..."
 InPosition = False
  com.CommandType = GETPOS
  Do While Not InPosition
    Ack = SendAPICommandToController(com)
    DoEvents
    If EmStop Then Exit Do
  Loop
  sbrBar.Caption = "Controller is INPOSITION..."
End Sub

Public Sub GetStatusUntilInPositionRPM()
  Dim com As TDeskWinAPICommand
  Dim RPMCom As TDeskWinAPICommand
  Dim Ack As Byte
  Dim cnt As Long
  
 sbrBar.Caption = "Controller is NOT INPOSITION..."
 InPosition = False
  com.CommandType = GETPOS
  RPMCom.CommandType = READRPM
  RPMCom.NumSteps = 2000 'Change to encoder CPR
  
  Do While Not InPosition
    If cnt = 25 Then
      Ack = SendAPICommandToController(RPMCom)
      cnt = 0
    End If
    cnt = cnt + 1
    Ack = SendAPICommandToController(com)
    DoEvents
    If EmStop Then Exit Do
  Loop
  sbrBar.Caption = "Controller is INPOSITION..."
End Sub

Public Sub GetStatusRPM()
  Dim com As TDeskWinAPICommand
  Dim RPMCom As TDeskWinAPICommand
  Dim Ack As Byte
  Dim cnt As Long
  
 sbrBar.Caption = "Controller is NOT INPOSITION..."
 InPosition = False
  com.CommandType = GETPOS
  RPMCom.CommandType = READRPM
 
  Do While Command4.Caption = "ON"
    If cnt = 25 Then
      Ack = SendAPICommandToController(RPMCom)
      cnt = 0
    End If
    cnt = cnt + 1
    Ack = SendAPICommandToController(com)
    DoEvents
    If EmStop Then Exit Do
  Loop
  sbrBar.Caption = "Controller is INPOSITION..."
End Sub


Private Sub Command1_Click()

Dim ii As Integer

  If FirmVer > 1.3 Then
    sbrBar.Caption = "Inputs " + Str(DeskWinReadInputs)
  Else
    sbrBar.Caption = "Not available in firmware versions before V1.31"
  End If
End Sub

Private Sub Command2_Click()
  Dim block As String
  Dim error As Long
  Dim init As Long
  Dim l As Integer
  
''  block = StrConv(txtGcode.Text, vbUnicode)
''  block = String(101, 0)
''  block = StrConv(txtGcode.Text, vbUnicode)

  block = txtGcode.Text
  l = Len(block)
  If init = 0 Then
    error = rs274ngc_read_block(block)
    If error = 0 Then
      error = rs274ngc_execute_block
      FlushBuffer
      GetStatusUntilInPosition
    Else
      If error <> 0 Then sbrBar.Caption = "Error " + rs274ngc_errors(error)
      Exit Sub
    End If
  Else
    sbrBar.Caption = "Interpreter failed to initialize - error " + Str(init)
  End If
  If error <> 0 Then sbrBar.Caption = "Error " + Str(error)
End Sub


Private Sub Command3_Click()
  Dim com As TDeskWinAPICommand
  Dim Ack As Byte
  
  Chase = Not Chase
  If Mode2ndGen Then
    com.CommandType = CHASEENCODER
    If Chase Then
      com.X = 0
      com.Y = 0
      com.Z = 70000   'Total Number of steps to move z
      com.A = 70000  'Number of encoder counts command is active
      com.Dir = 1    'Direction of Z
      com.Quad = 1   'Enable command
      com.Axis = 0   'Encoder Phase Direction (0 or 1 to reverse encoder count direction)
      Ack = SendAPICommandToController(com)
      sbrBar.Caption = "Encoder Chase On - "
      Command3.Caption = "ON"
    Else
      com.Quad = 0   'Disable command
      Ack = SendAPICommandToController(com)
      sbrBar.Caption = "Encoder Chase Off"
      Command3.Caption = "OFF"
    End If
    GetStatusUntilInPositionRPM
  End If
End Sub


Private Sub Command4_Click()
    RPMON = Not RPMON
    If RPMON Then
      Command4.Caption = "ON"
    Else
      Command4.Caption = "OFF"
    End If
    GetStatusRPM
End Sub

Private Sub Form_Load()
  ControllerFound = True
  SetupErrorCodes
End Sub

Private Sub Form_Terminate()
  DeskWinClose
End Sub
