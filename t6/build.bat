SET linkerpath=Linker.exe
SET gamepath=%CODBO2_PATH%

for %%f in ("zone_source\*.*") do (
    %linkerpath% --output-folder ".\zone_out" --load "%gamepath%\zone\all\ui_mp.ff" "%%~nf"
)
