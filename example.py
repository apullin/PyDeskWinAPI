import deskwinapi as dw

def main():
	dwapi = dw.DeskWinAPI(comport = "COM3")
	
	## Snooped startup sequence for Madell P&P
	dw.DeskWinSetMaxSPS(40000, 4, 0, 0, 0)
	dw.DeskWinSetAccelleration(120000, 40000, 0, 0)
	dw.DeskWinSetPosition(0, 0, 0, 0, dw.AXIS_XYZA)
	DeskWinSetSpeedRange(0, 500)	# undocumented API function
	position = DeskWinGetPosition()
	DeskWinHome(dw.AXIS_Z, 0, 1000)
	# Wait for inposition?
	DeskWinHome(dw.AXIS_Y, 0, 2000)
	# Wait for inposition?
	DeskWinHome(dw.AXIS_x, 0, 2000)
	# Wait for inposition?
	
	## Set high acceleration
	DeskWinSetAccelleration(120000, 40000, 0, 0)
	
	## Get hardware inputs
	inputs = dw.DeskWinReadInputs()
	
	## Set Outputs
	DeskWinSetOutputImediate(0)
	
	## Ini file setup for G-code execution
	#dw.rs274ngc_ext_init("settings.ini")
	
	## Execute G-code
	#gfile = open("test.nc")
	#gcodelines = gfile.readlines()
	#gcode = ''.join(gcodelines)
	#dw.rs274ngc_read_block(gcode)
	#rs274ngc_execute_block()
	
	## Safe exit
	dw.DeskWinClose()

if __name__ == "__main__":
    main()