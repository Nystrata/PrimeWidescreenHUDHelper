# PrimeWidescreenHUDHelper
The original [MetroidPrimeWidescreen](https://wiki.dolphin-emu.org/index.php?title=Metroid_Prime_(GC)#16:9_HUD_Mod) mod by Aruki has very involved installation steps that require the user to manually extract the ISO, unpack PAK files, and copy over the required files.  
  
This batch script package automates it with a simple to run batch script.  

This mod is intended for the DOL-GM8E-0-00 USA (commonly known as "0-00") version only.  
For information on determining the disc's version number, see [metroid2002.com: metroid prime: version differences: version number](https://www.metroid2002.com/version_differences_version_number.php)

## Patching the Game
- Download the original [MetroidPrimeWidescreen from the Dolphin Wiki](https://wiki.dolphin-emu.org/index.php?title=Metroid_Prime_(GC)#16:9_HUD_Mod) and extract it.
- Download PrimeWidescreenHUDHelper from this repository's [Releases page](https://github.com/Nystrata/PrimeWidescreenHUDHelper/releases) and extract it.
- Copy the all of the files and folders from PrimeWidescreenHUDHelper into the extracted MetroidPrimeWidescreen folder
- Place your Metroid Prime ISO into the MetroidPrimeWidescreen folder,  
  **Make sure it is named `prime.iso`**  
  The folder should look like this  
  ![image](https://github.com/Nystrata/PrimeWidescreenHUDHelper/assets/15365192/d0c6e632-7c24-4008-a36d-1e6f01b7dd91)  
- Run the included **patch.bat** and follow the on-screen prompts.
- If everything is successful, prime_widescreenhud.iso should be created.

> [!TIP]
> With HUD Lag enabled in-game, some of the HUD widget elements may move around inconsistently with each other.  
> I highly recommend **turning HUD Lag *OFF*** in the in-game settings while using this mod.

## Widescreen for Dolphin
#### Widescreen Hack Method    
(Requires 5.0-20347 Beta or later for [this feature](https://dolphin-emu.org/blog/2023/11/25/dolphin-progress-report-august-september-and-october-2023/#50-20097-and-50-20109-allow-widescreen-heuristic-to-be-modified-per-game-by-oatmealdome-and-billiard))  

In Dolphin, 
1. Choose Force 16:9 or Stretch for the Aspect Ratio  
   (Options -> Graphics Settings -> General -> Aspect Ratio)   
2. Enable Widescreen Hack  
   (Options -> Graphics Settings -> Enhancements -> Check Widescreen Hack)  

To fix frustum culling problems (seeing stuff pop in and out near the left/right edges of the screen), use this **ActionReplay** code:  
```
043452A8 C342CB78
```

To fix the game flickering between normal and stretched view, edit the game INI to add  
```
[Video_Settings]
SuggestedAspectRatio = 2
```
(To edit game INI settings, right click Metroid Prime in the game list -> Properties -> Game Config tab -> Editor  
There, you can add the setting to the User Config section)  

#### Gecko Code Method    
In Dolphin, choose Force 16:9 for the Aspect Ratio (Options -> Graphics Settings -> General -> Aspect Ratio)  
Right-click the Metroid Prime in the game list, click Properties, and apply the code to the Gecko Codes tab.  

This widescreen code is for the NTSC-U copy of the game:  
(Taken from [Dolphin Emulator Wiki](https://wiki.dolphin-emu.org/index.php?title=Metroid_Prime_(GC)#16:9_Aspect_Ratio_Fix))
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
**Make sure Widescreen Hack is *disabled* in Dolphin when using this code!**  
To disable Widescreen Hack, go to Options -> Graphics Settings -> Enhancements -> Uncheck Widescreen Hack

## Widescreen for Nintendont
You may try Nintedont's "Force Widescreen" option, but this has not been tested.  

## Randovania Compatibility
To use this with the [Randovania randomizer](https://randovania.org/games/prime1/),  
patch the vanilla game ISO with the Prime Widescreen mod first, then select it as the Input ISO when exporting the game from Randovania.  

> [!NOTE]  
> While mod does work with Randovania, it is *not* supported by Randovania developers.  
> Do not report bugs to the Randovania developers while using this mod.

# Other Details
This package includes [NODTool](https://github.com/AxioDL/nod) to extract and build the new ISO.  

**If you're looking for a version for Metroid Prime 2: Echoes**  
See [EchoesWidescreenHUD](https://github.com/Nystrata/echoeswidescreenhud)

![image](https://github.com/Nystrata/PrimeWidescreenHUDHelper/assets/15365192/fc7bf6a1-5b32-4a13-9ccb-dbec6c737ba0)
(This screenshot uses parts of [Metroid Prime Trilogy - HD Interface Textures](https://forums.dolphin-emu.org/Thread-metroid-prime-trilogy-hd-interface-textures-v-1-7-may-01-2021))
