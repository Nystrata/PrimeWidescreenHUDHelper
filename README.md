# PrimeWidescreenHUDHelper
The original [MetroidPrimeWidescreen](https://wiki.dolphin-emu.org/index.php?title=Metroid_Prime_(GC)#16:9_HUD_Mod) mod has very involved installation steps that require the user to manually extract the ISO, unpack PAK files, and manually copy over the required files.  
  
This batch script package automates it with a simple to run batch script.

# Mod Installation
- Download the original [MetroidPrimeWidescreen from the Dolphin Wiki](https://wiki.dolphin-emu.org/index.php?title=Metroid_Prime_(GC)#16:9_HUD_Mod) and extract it.
- Download PrimeWidescreenHUDHelper from this repository's Releases page.
- Copy the all of the files and folders from PrimeWidescreenHUDHelper into the extracted MetroidPrimeWidescreen folder
- Place you Metroid Prime (USA) (GM8E01) (0-00) ISO into the MetroidPrimeWidescreen folder,
  **Make sure it is named `prime.iso`.**
- The folder should look like this  
  ![image](https://github.com/Nystrata/PrimeWidescreenHUDHelper/assets/15365192/d0c6e632-7c24-4008-a36d-1e6f01b7dd91)
- Run the included **patch.bat** and follow the on-screen prompts.
- If everything is successful, prime_widescreenhud.iso should not be created.

# Widescreen Fixes
### Option 1: Using Gecko Codes
To force the game to use Widescreen, you can try the [16:9 Widescreen for NA **Gecko** code](https://wiki.dolphin-emu.org/index.php?title=Metroid_Prime_(GC)#16:9_Aspect_Ratio_Fix])  
(Make sure to disable the Dolphin Widescreen Hack before using these code.)  
```
$16:9 Widescreen [gamemasterplc, Parax]
C237D530 00000004
3DC03FAA 61CEAAAB
91C20000 C2620000
ED330272 ED6A4824
60000000 00000000
043452A8 C342CB78
045AE898 40000000
```

### Option 2 Using Widescreen Hack
Enable Widescreen Hack in Dolphin.  
To fix frustum culling problems (seeing stuff pop in and out near the left/right edges of the screen), use this **ActionReplay** code:  
```
043452A8 C342CB78
```
> When Widescreen Hack is enabled, Dolphin's current widescreen detection bug will cause the game to flicker between normal view and stretched view. It's recommended to use Option 1: Using Gecko Codes instead.
# Other Details
This mod includes [NODTool](https://github.com/AxioDL/nod) to extract and build the new ISO.  
If you're looking for a version for Metroid Prime 2: Echoes, see [EchoesWidescreenHUD](https://github.com/Nystrata/echoeswidescreenhud)

![image](https://github.com/Nystrata/PrimeWidescreenHUDHelper/assets/15365192/fc7bf6a1-5b32-4a13-9ccb-dbec6c737ba0)
