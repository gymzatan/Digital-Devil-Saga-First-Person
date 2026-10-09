# Digital Devil Saga — SELECT Camera Toggle

First-person / third-person camera toggle patches for the **USA English PS2 releases** of *Shin Megami Tensei: Digital Devil Saga* and *Digital Devil Saga 2*.

Author: **gymzatan**

[Download the patch package](https://github.com/gymzatan/Digital-Devil-Saga-First-Person/releases/download/usa-camera/DDS_SELECT_USA_Patches.zip) · [Release notes](https://github.com/gymzatan/Digital-Devil-Saga-First-Person/releases/tag/usa-camera)

## Features

- Press **SELECT** during normal field exploration to switch between first-person and third-person views. Press it again to switch back.
- Available from the first playthrough; no cleared-game or New Game Plus requirement.
- First-person mode hides the player model and places the view near the character's eye height.
- Uses the game's existing camera, smoothing, collision and player-visibility routines.
- Event and special cameras follow their original behavior. The selected view resumes when normal exploration returns.
- Starts in third-person mode. The camera selection is not written into normal game saves.
- Patches are embedded into the ISO; no PNACH file or emulator cheats are required.

The design was inspired by the SELECT camera toggle in *Shin Megami Tensei III: Nocturne*.

## Supported disc images

Use an unmodified ISO matching the exact source image below. Matching the game title or disc serial alone is insufficient. `checksums.json` also lists the complete source, output and patch SHA-256 values.

| Game | Executable | Patch | Windows launcher | ISO size (bytes) |
| --- | --- | --- | --- | ---: |
| Digital Devil Saga (USA) | `SLUS_209.74` | `DDS1_USA.xdelta` | `Apply_DDS1_USA.cmd` | 4,539,547,648 |
| Digital Devil Saga 2 (USA) | `SLUS_211.52` | `DDS2_USA.xdelta` | `Apply_DDS2_USA.cmd` | 4,677,500,928 |

Source ISO SHA-256:

```text
Digital Devil Saga (USA)
7dd1f68190ab989f9ff53ee3fe061f6832628c5c4a987a94960ed32921d37843

Digital Devil Saga 2 (USA)
ecb1ac6164ca6f9cfe55f140de9873378aeea26c11224ddb95fdb34cdd3fa760
```

## Apply the patch on Windows

1. Download `DDS_SELECT_USA_Patches.zip` from the release and **extract the entire archive**. Keep the launchers, `patches` and `tools` folders together.
2. Prepare the matching original USA ISO. An archive or CHD must first be converted or extracted into the correct ISO; renaming its extension does not convert it.
3. Drag **one ISO** onto `Apply_DDS1_USA.cmd` or `Apply_DDS2_USA.cmd`, according to the game.
4. Wait for **"Patch applied and verified successfully"**. The launcher creates an ISO next to the original with ` [SELECT Camera]` added to its filename. The original is preserved, and an existing output is not overwritten.
5. In PCSX2, **cold boot the new ISO**, then load a normal save through the game's own load menu. **Do not start from an old emulator save state:** it restores the executable code captured before patching.
6. Enter a normal field exploration scene and press the input mapped to the PS2 controller's **SELECT** button.

The package includes the official self-contained **64-bit Windows Xdelta tool**. Python and emulator cheats are not needed. Allow at least 5 GB of free space beside the source ISO, on a filesystem that supports individual files larger than 4 GB. Processing a full disc image can take several minutes.

If Xdelta reports **"source file BLAKE3 mismatch"** or **"source does not match"**, the ISO is not the supported source. Compare its SHA-256 with the values above. Keep verification enabled. Do not use an incomplete output after any error.

## Command-line application

From the extracted package directory on Windows:

```bat
tools\xdelta3.exe -d -s "original.iso" "patches\DDS1_USA.xdelta" "patched.iso"
```

For the second game, use `DDS2_USA.xdelta`. Always use a different, previously nonexistent output path.

Linux and macOS users can use the [official Xdelta release](https://github.com/jmacd/xdelta/releases) for their platform:

```sh
xdelta3 -d -s "original.iso" "patches/DDS1_USA.xdelta" "patched.iso"
```

## Validation and feedback

Both patches have been fully decoded and the resulting ISO SHA-256 values match the previously built and verified modified images. The Windows launchers were checked for wrong-source rejection and preservation of existing output files.

**This is a public test release. Actual game startup, camera rendering, movement and scene-transition compatibility still require gameplay testing.** File and instruction checks do not replace those tests.

When reporting an issue, include the game, emulator version, location, reproduction steps, and a screenshot or video if possible.

## Credits and distribution

This is an unofficial fan camera modification by gymzatan. Thanks to ATLUS and the original game developers. The distribution contains patch data and application tools; it does not contain game disc images. Supply your own matching original ISO.

The bundled Xdelta executable is unmodified. Its official README and third-party license texts are retained in `licenses`; see `THIRD_PARTY_NOTICES.txt` for provenance.
