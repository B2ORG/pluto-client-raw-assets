SET gamepath=D:\SteamLibrary\steamapps\common\Call of Duty World at War

xcopy *.* "%gamepath%\mods\plutonium" /E /I /Y
SET curdir=%cd%
pushd "%gamepath%\bin"

SET ffs=plutonium_mp plutonium_ui_mp plutonium_ui plutonium
for %%i in (%ffs%) do (
    move /Y "%gamepath%\mods\plutonium\%%i.csv" "%gamepath%\zone_source\mod.csv"
    linker_pc.exe -nopause -language english -moddir plutonium mod -summary -verbose
    move /Y "%gamepath%\zone\english\mod.ff" "%curdir%\zone_out\%%i.ff"
)

move /Y "%gamepath%\mods\plutonium\localized_plutonium.csv" "%gamepath%\zone_source\mod.csv"
if not exist "%gamepath%\mods\plutonium\localizedstrings" mkdir "%gamepath%\mods\plutonium\localizedstrings"
SET langs=english french german italian korean polish russian spanish
for %%i in (%langs%) do (
    move /Y "%gamepath%\mods\plutonium\%%i\localizedstrings\*" "%gamepath%\mods\plutonium\localizedstrings"
    linker_pc.exe -nopause -language english -moddir plutonium mod -summary -verbose

    if not exist "%curdir%\zone_out\%%i" mkdir "%curdir%\zone_out\%%i"

    move /Y "%gamepath%\zone\english\mod.ff" "%curdir%\zone_out\%%i\localized_plutonium_mp.ff"
    copy /Y "%curdir%\zone_out\%%i\localized_plutonium_mp.ff" "%curdir%\zone_out\%%i\localized_plutonium.ff"
)
