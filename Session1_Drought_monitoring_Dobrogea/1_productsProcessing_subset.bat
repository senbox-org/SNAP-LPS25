@echo off
setlocal enabledelayedexpansion

REM === Define path variables ===
set "Path_S2=E:\Work\Projects\14_STEP\Docs\LPS 2025\Drought_monitoring_Dobrogea\Processing\Input\S2_L2A_InitialProducts"
set "output_folder=E:\Work\Projects\14_STEP\Docs\LPS 2025\Drought_monitoring_Dobrogea\Processing\Output1"

REM === Define name variables ===
set "oldEnd=.SAFE.zip"
set "newEnd=_indices.dim"

REM === Loop over .SAFE.zip files ===
for  %%F in ("%Path_S2%\S2*.SAFE.zip") do (    
	echo ----------------------------------
	echo Processing: %%F
    REM === Extract date part from filename (S2A_MSIL2A_YYYYMMDD...SAFE.zip) ===
	set "filename=%%~nxF"
	set "acc_datetime=!filename:~11,15!"
	set "year=!acc_datetime:~0,6!"
	set "newProduct=!filename:~0,60!"
	rem echo file name "!filename!"
	rem echo new product "!newProduct!"
	echo Start time:
	echo %time%
	gpt "E:\Work\Projects\14_STEP\Docs\LPS 2025\Drought_monitoring_Dobrogea\Processing\Code\ProductProcessing_subset.xml" -PInput="%%F" -POutput="!output_folder!\!year!\!newProduct!!newEnd!"
	echo End time:
	echo %time%
)

pause
