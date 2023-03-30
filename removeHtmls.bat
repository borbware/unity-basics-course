for /D %%i in (.\*) do (
	for %%j in (%%i\*.md) do (
		del %%~pj%%~nj.html
	)
) 
