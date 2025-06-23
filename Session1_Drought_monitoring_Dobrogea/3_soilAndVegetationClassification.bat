@echo off
setlocal enabledelayedexpansion

REM === Define path variables ===
set "input_folder=E:\Work\Projects\14_STEP\Docs\LPS 2025\Drought_monitoring_Dobrogea\Processing\Output2"

REM === Define name variables ===

REM === Loop over .SAFE.zip files ===
for  %%F in ("%input_folder%\S2*.dim") do (    
	echo ----------------------------------
	echo Processing: %%F
	set "filename=%%~nxF"
	echo Start time:!filename!
	echo %time%
	gpt "E:\Work\Projects\14_STEP\Docs\LPS 2025\Drought_monitoring_Dobrogea\Processing\Code\Classify_soil_and_vegetation.xml" -Pinput="!filename!" -Poutput="!filename!"
	echo End time:
	echo %time%
)

pause
