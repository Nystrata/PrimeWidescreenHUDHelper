# PrimeWidescreenHUDHelper
The original [MetroidPrimeWidescreen](https://wiki.dolphin-emu.org/index.php?title=Metroid_Prime_(GC)#16:9_HUD_Mod) mod by Aruki has very involved installation steps that require the user to manually extract the ISO, unpack PAK files, and copy over the required files.  
  
This batch script package automates it with a simple to run batch script.

# Mod Installation
- Download the original [MetroidPrimeWidescreen from the Dolphin Wiki](https://wiki.dolphin-emu.org/index.php?title=Metroid_Prime_(GC)#16:9_HUD_Mod) and extract it.
- Download PrimeWidescreenHUDHelper from this repository's [Releases page](https://github.com/Nystrata/PrimeWidescreenHUDHelper/releases) and extract it.
- Copy the all of the files and folders from PrimeWidescreenHUDHelper into the extracted MetroidPrimeWidescreen folder
- Place your Metroid Prime (USA) (GM8E01) (0-00) ISO into the MetroidPrimeWidescreen folder,  
  **Make sure it is named `prime.iso`**
- The folder should look like this  
  ![image](https://github.com/Nystrata/PrimeWidescreenHUDHelper/assets/15365192/d0c6e632-7c24-4008-a36d-1e6f01b7dd91)
- Run the included **patch.bat** and follow the on-screen prompts.
- If everything is successful, prime_widescreenhud.iso should not be created.

> With HUD Lag turned on in-game, some of the widget elements may move around inconsistently with each other.  
> I highly recommend **turning HUD Lag *OFF*** in-game.

# Widescreen for Dolphin
### Option 1: Gecko Codes
In Dolphin, choose Force 16:9 for the Aspect Ratio (Options -> Graphics Settings -> General -> Aspect Ratio)  
Right-click the Metroid Prime in the game list, click Properties, and apply the code to the Gecko Codes tab.  

This widescreen code is for the NTSC-U copy of the game:  
[(Source)](https://wiki.dolphin-emu.org/index.php?title=Metroid_Prime_(GC)#16:9_Aspect_Ratio_Fix])  
(Make sure to disable the Dolphin Widescreen Hack before using this Gecko code.)  
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

### Option 2: Widescreen Hack
> When Widescreen Hack is enabled, Dolphin's current widescreen detection will cause the game to flicker between normal view and stretched view.  
> It is recommended to use Option 1: Gecko Codes while playing this game in the official Dolphin releases.  
> Widescreen Hack should work properly if using the PrimeHack Dolphin fork.  

In Dolphin, choose Force 16:9 or Stretch for the Aspect Ratio (Options -> Graphics Settings -> General -> Aspect Ratio)   
Enable Widescreen Hack: go to Options -> Graphics Settings -> Enhancements -> Check Widescreen Hack  
  
To fix frustum culling problems (seeing stuff pop in and out near the left/right edges of the screen), use this **ActionReplay** code:  
```
043452A8 C342CB78
```

### Nintendont
This hasn't been tested on Nintendont. You're free to give it a try, but no guarantees it'll work.

# Randovania Compatibility
> While mod does work with Randovania, it is *not* supported by Randovania  developers.  
> Do not report bugs to the Randovania developers while using this mod.

To use this with [Randovania randomizer](https://github.com/randovania/randovania),  
create a vanilla game with the Widescreen HUD mod first, then select it as the Input ISO when exporting the game from Randovania.  
Make sure to use the gecko code or widescreen hack first before starting the game.  

# Other Details
This mod includes [NODTool](https://github.com/AxioDL/nod) to extract and build the new ISO.  

**If you're looking for a version for Metroid Prime 2: Echoes**  
See [EchoesWidescreenHUD](https://github.com/Nystrata/echoeswidescreenhud)

![image](https://github.com/Nystrata/PrimeWidescreenHUDHelper/assets/15365192/fc7bf6a1-5b32-4a13-9ccb-dbec6c737ba0)
(This screenshot uses parts of [Metroid Prime Trilogy - HD Interface Textures](https://forums.dolphin-emu.org/Thread-metroid-prime-trilogy-hd-interface-textures-v-1-7-may-01-2021))
