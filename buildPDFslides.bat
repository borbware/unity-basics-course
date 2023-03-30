for /D %%i in (.\*) do (
	for %%j in (%%i\*.md) do (
		marp %%j -o %%~pj%%~nj.pdf
	)
) 
