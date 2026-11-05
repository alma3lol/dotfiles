# Midnight Lime / كحلي وليمي
Version: 1.0.0 · Mode: dark · ID: `midnight-lime`

## Evidence and scope
Source: https://www.tiktok.com/@toolandtea/video/7704365914048793869 by @toolandtea, viewed 2026-11-06.
`references/video-frame.jpg` is a reference frame at 3.5 seconds, not an asset to ship in a product. Exact visible palette: {"Midnight Navy": "#102C40", "Cloud White": "#F7FAFC", "Electric Lime": "#DBFF00"}.
Only palette labels/hexes and visible composition are source evidence. Typography,
spacing, radii, semantic states and accessibility variants below are our reusable
adaptation, not values claimed by the creator. Reference imagery/brands remain the
creator's or depicted owners' work. No permission for product/public redistribution
of their imagery is implied; replace with licensed/original assets.

## Visual direction
Athletic editorial: generous navy fields, confident wide typography and a single lime emphasis. A photographic focal point can lead a marketing page; use licensed, project-relevant assets only. Keep utility screens calm and legible.

## Typography and structure
Use the project's approved Arabic-capable font if established. Otherwise recommend
Noto Sans Arabic with Noto Sans for Latin; self-host licensed fonts when implementing,
not a remote font dependency. Fonts are not bundled here. Body 16px / 1.7; small 14px;
display responsive 32–72px. Arabic letter-spacing stays normal. Layout max 1200px,
reading measure about 65ch; spacing uses the shared 4px scale.
Control radius 12px; panels 14px. Prefer separators and open sections to
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
Do not turn every heading, border and icon lime. Do not copy the source athlete, ratings or club branding.

## Adoption
Read ../README.md; copy this version into the project's own tracked theme directory,
import tokens.css, set data-agent-theme="midnight-lime" on the root, and record the selected
ID/version/path and justified overrides in project DESIGN.md. Existing project
identity is not replaced merely because this pack is available.
