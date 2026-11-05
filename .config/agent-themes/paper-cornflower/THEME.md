# Paper Cornflower / ورقي وأزرق
Version: 1.0.0 · Mode: light · ID: `paper-cornflower`

## Evidence and scope
Source: https://www.tiktok.com/@toolandtea/video/7704365914048793869 by @toolandtea, viewed 2026-11-06.
`references/video-frame.jpg` is a reference frame at 12 seconds, not an asset to ship in a product. Exact visible palette: {"Paper White": "#FFFFFF", "Ink Black": "#050505", "Cornflower Blue": "#548CFF"}.
Only palette labels/hexes and visible composition are source evidence. Typography,
spacing, radii, semantic states and accessibility variants below are our reusable
adaptation, not values claimed by the creator. Reference imagery/brands remain the
creator's or depicted owners' work. No permission for product/public redistribution
of their imagery is implied; replace with licensed/original assets.

## Visual direction
Clear technical editorial: paper-white canvas, ink-black hierarchy, controlled cornflower emphasis and thin separators. Favor readable documentation, clear actions and restrained technical diagrams. The source shows an ASCII-like landscape; this is optional art direction, not a required background.

## Typography and structure
Use the project's approved Arabic-capable font if established. Otherwise recommend
Noto Sans Arabic with Noto Sans for Latin; self-host licensed fonts when implementing,
not a remote font dependency. Fonts are not bundled here. Body 16px / 1.7; small 14px;
display responsive 32–72px. Arabic letter-spacing stays normal. Layout max 1200px,
reading measure about 65ch; spacing uses the shared 4px scale.
Control radius 6px; panels 14px. Prefer separators and open sections to
repeated decorative cards. These are adaptation defaults, not a screenshot clone.

## Components
- Primary action: action-primary background + on-action text; hover action-hover.
- Secondary action: transparent, text-primary, border-control. Keep main actions labelled.
- Inputs: surface-raised, text-primary, visible labels and border-control; never placeholder-only.
- Focus: 2px focus-ring with 3px offset. Where accent-adjacent, use a surface separator.
- Disabled: disabled-surface + disabled-text; no misleading hover or opacity-only meaning.
- Errors/success: semantic text tokens with an icon/text explanation, never color alone.
- Dialogs: surface-raised, shadow-popover, accessible naming and focus trapping,
  Escape/Cancel behavior, scroll-safe mobile layout. No stacked shadow+border decoration.
- Navigation: readable base text; use a label/underline/aria-current as well as accent.
- Tables/lists: aligned compact row icons with accessible labels/tooltips; main actions keep text.

## Color discipline
Build the foundation with the two neutral colors, then use one brand accent to guide
attention. Error/success colors are functional exceptions, not extra brand accents.
Use semantic tokens from tokens.css, never paste palette hexes into components.
Check actual pairings; on-action intentionally uses dark text on the vivid accent.
For Paper Cornflower, link/focus use an authored darker blue because raw #548CFF
is not suitable for ordinary text on white. Do not silently darken the source swatch.
No opposite-mode variant is claimed: adding one is a separate project design decision.

## RTL, motion and responsiveness
Set lang/dir on the document, use logical properties, preserve keyboard navigation,
mirror directional icons only, and isolate URLs/numerals where needed. Translate the
actual product UI; theme labels in this pack are documentation, not product copy.
Use the shared AGENTS.md motion rules, with prefers-reduced-motion respected.
Transitions are short and purposeful, never delay tasks. Check phone/desktop and all
implemented states. Do not add a theme picker to products unless requested.

## Avoid
Do not use the raw blue as small body text on white, or white text on the raw blue. Do not copy the example security product claims, logo or artwork.

## Adoption
Read ../README.md; copy this version into the project's own tracked theme directory,
import tokens.css, set data-agent-theme="paper-cornflower" on the root, and record the selected
ID/version/path and justified overrides in project DESIGN.md. Existing project
identity is not replaced merely because this pack is available.
