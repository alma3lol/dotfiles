# Shared agent theme library

Three reusable themes extracted from @toolandtea's video:
https://www.tiktok.com/@toolandtea/video/7704365914048793869
Shared link: https://vt.tiktok.com/ZSp2TgtgJ/

- midnight-lime — Midnight Navy #102C40, Cloud White #F7FAFC, Electric Lime #DBFF00.
- jet-flame — Jet Black #000000, Soft White #FFFFFF, Flame Orange #FE5101.
- paper-cornflower — Paper White #FFFFFF, Ink Black #050505, Cornflower Blue #548CFF.

## Agent workflow
1. Read the target project's AGENTS.md, DESIGN.md and existing tokens first.
2. Preserve its selected theme. On a new project, present appropriate options or
   choose only if the user delegates the design; record that decision honestly.
3. Read the chosen pack's THEME.md, tokens.json and reference image. Images are
   visual evidence, not a set of product claims or reusable product artwork.
4. Copy the selected pack's THEME.md/tokens into a versioned project directory
   (e.g. design/themes/midnight-lime/). Do not make deployment depend on a home path.
5. Import tokens.css and set the data-agent-theme attribute on the document root.
   Read ../README relative to the library when copying; update paths in project docs.
6. Record theme ID, version, copied paths, reference source and overrides in DESIGN.md.
7. Map project components to semantic tokens; avoid component-local color literals.
8. Verify actual UI at mobile/desktop, Arabic RTL as applicable, focus/hover/disabled/
   error/success and reduced-motion. Static contrast checks do not prove UI compliance.

## Example project DESIGN.md entry
Selected theme: midnight-lime@1.0.0
Selection: explicitly requested by user (or delegated decision — record which).
Theme spec: design/themes/midnight-lime/THEME.md
Tokens: design/themes/midnight-lime/tokens.css
Source: ~/.config/agent-themes/midnight-lime (upstream template only).
Overrides: list any deliberate, justified differences; do not silently edit the palette.

## Preview and validation
Open preview.html locally: it is an offline token/component specimen, not a finished
website or a replica of the source layouts. It loads no remote scripts, fonts or media.
Switch between all three themes and Arabic RTL / English LTR. The local system font
fallback is intentional for the specimen; final projects choose/self-host fonts.
Run `python3 validate.py` to validate token parity and key WCAG contrast pairings.

## Scope / provenance
Palette hex codes were read directly from video frames. Other tokens/component rules
are authored adaptations. No fonts, icon library or source-video assets are required
at runtime. Reference JPEGs are private inspiration, not redistributable product assets.
Do not publish reference images as your own work. No full video is stored in dotfiles.
Only source-mode palettes are provided, not invented light/dark pairs.
