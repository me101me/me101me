@SETLOCAL
FOR /f %%x IN ('wmic path win32_localtime get /format:list ^| findstr "="') DO @SET %%x
@SET "Month=0%Month%"
@SET "Month=%Month:~-2%"
@SET "Day=0%Day%"
@SET "Day=%Day:~-2%"
@SET "Hour=0%Hour%"
@SET "Hour=%Hour:~-2%"
@SET "Minute=0%Minute%"
@SET "Minute=%Minute:~-2%"
@SET "Second=0%Second%"
@SET "Second=%Second:~-2%"
@SET NOW=%Year%%Month%%Day%%Hour%%Minute%%Second%

@SET OUTDIR=%HOMEDRIVE%%HOMEPATH%\.local\share\me101me
@SET OUTFILE=%OUTDIR%\%NOW%.png
@SET APPPATH=%~dp0..\app
@SET NW=%~dp0..\nwjs\nw
"%NW%" "%APPPATH%" --out="%OUTFILE%"
