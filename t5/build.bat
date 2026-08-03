SET gamepath=D:\SteamLibrary\steamapps\common\Call of Duty Black Ops

xcopy *.* "%gamepath%\mods\plutonium" /E /I /Y
SET curdir=%cd%
pushd "%gamepath%\bin"

SET ffs=plutonium_mp plutonium_ui_mp plutonium_ui
for %%i in (%ffs%) do (
    move /Y "%gamepath%\mods\plutonium\%%i.csv" "%gamepath%\zone_source\mod.csv"
    linker_pc.exe -nopause -language english -moddir plutonium mod -summary -verbose
    move /Y "%gamepath%\zone\English\mod.ff" "%curdir%\zone_out\%%i.ff"
)

move /Y "%gamepath%\mods\plutonium\localized_plutonium.csv" "%gamepath%\zone_source\mod.csv"
if not exist "%gamepath%\mods\plutonium\localizedstrings" mkdir "%gamepath%\mods\plutonium\localizedstrings"
SET langs=english:en french:fr german:ge italian:it japanese:ja polish:po russian:ru spanish:sp
for %%i in (%langs%) do (
    for /f "tokens=1,2 delims=:" %%a in ("%%i") do (
        move /Y "%gamepath%\mods\plutonium\%%a\localizedstrings\*" "%gamepath%\mods\plutonium\localizedstrings"
        linker_pc.exe -nopause -language english -moddir plutonium mod -summary -verbose
        move /Y "%gamepath%\zone\English\mod.ff" "%curdir%\zone_out\%%b_plutonium_mp.ff"
        copy /Y "%curdir%\zone_out\%%b_plutonium_mp.ff" "%curdir%\zone_out\%%b_plutonium_ui.ff"
    )
)
