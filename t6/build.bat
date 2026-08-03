SET linkerpath=%USERPROFILE%\source\repos\OpenAssetTools\build\bin\Release_x86\Linker.exe
SET gamepath=D:\SteamLibrary\steamapps\common\Call of Duty Black Ops II

for %%f in ("zone_source\*.*") do (
    "%linkerpath%" --output-folder ".\zone_out" --load "%gamepath%\zone\all\ui_mp.ff" "%%~nf"
)
