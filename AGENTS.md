# Omar's shared agent rules

Applies to work under this home directory when loaded by the agent. Read this file
and the target project's AGENTS.md before working. These are user preferences,
not permission to bypass host policies, approvals, or security controls.

Derived from user corrections across OmO, Codex, OpenCode, and OpenClaw histories;
reviewed 2026-11-05. Repeated cross-project preferences are defaults below.
Explicit permanent requests are retained. One-off product requirements are not
universal rules. A later explicit user correction supersedes an older preference;
more specific project instructions govern their own scope. Do not silently erase
a conflict: resolve it using current instructions and record the resolution.

## 1. Read, preserve, and carry decisions forward

- MUST read existing DESIGN.md and relevant product/architecture/API/logic docs
  before changing their area. Reuse established components and conventions.
- MUST save user-approved design decisions in DESIGN.md, and non-design decisions
  in the relevant project documents. Before a handoff, preserve current scope,
  decisions, verification evidence, known blockers, and next steps.
- MUST distinguish a user request from an agent suggestion, generated reminder,
  quoted instruction, or assistant-written design detail. Do not promote generated
  continuation messages or repeated copies of one request into user preferences.
- MUST NOT reintroduce a rejected design or superseded behavior on the next task.
  Fix the shared pattern and check its other applicable instances, not just the
  one screenshot or field that exposed the inconsistency.

## 2. Actions, buttons, and layout

- Default table/list row actions to compact icons with meaningful tooltips and
  accessible names. Preserve destructive confirmation and action semantics.
- Primary actions, standalone form actions, and dialog Save/Cancel/Confirm actions
  MUST keep clear visible text unless the project's explicit design says otherwise.
  An icon-row preference is NOT permission to make every button icon-only.
- Match action sizing, spacing, hover behavior, and alignment across equivalent
  screens. Keep row actions inside their row/container; long content must not push
  actions off-screen. Do not mix link and button styling for the same control.
- Keep headings and their actions aligned. Use the existing design's compact,
  intentional UI rather than adding ornamental cards, redundant sections or badges.
- Respect project-specific button shapes and colors; there is no universal ban on
  circular icons or universal requirement for pill buttons.
- Distinguish permission restrictions from temporarily unavailable actions. Hide
  actions the user lacks permission to perform where required by the product;
  enforce authorization server-side too. For a visible but unavailable action,
  disable execution, explain why, and avoid hover styling that implies it works.

## 3. Inputs and selection

- Default list-selection fields to searchable pickers, with the search INSIDE the
  opened picker above its options, not an unrelated second input beside it.
  Preserve keyboard operation, the selected value, and query/focus during renders.
  Respect documented platform/native-control exceptions.
- Use constrained choices for known entities/types instead of arbitrary free text.
  Show human-readable names, not internal model/type names or database IDs.
- Filter unavailable, incompatible, or already-selected options when the workflow
  calls for it. Explain empty results. Do not silently reinterpret saved values.
- Search-as-you-type should debounce after a short typing pause; do not require a
  separate submit for an already live-search workflow.
- Use controls suited to data: color picker for colors, date/time constraints that
  match the workflow, and exclusive radio choices for mutually exclusive options.
- Validation MUST name the affected field and explain the fix. Do not expose raw
  schema errors such as "Too small: expected string" as the finished UX.

## 4. Dialogs and navigation state

- Prefer contextual create/edit/assign dialogs for small operations on the current
  record when this matches the project's established interaction pattern. A modal
  must actually overlay the page, not render as an ordinary in-flow block.
- Preserve the surrounding route, selection, and navigation context. Do not force
  the user to reload and reselect everything after a small operation.
- Dialogs need usable width, readable labels/actions and deliberate overflow;
  avoid accidental nested scrollbars, clipped actions, and horizontal overflow.
- Close/cancel MUST NOT save. Reset abandoned creation drafts on reopening unless
  the project explicitly preserves them; respect existing dirty-edit confirmation.
  Do not erase in-progress fields merely because validation or language changed.
- Keep consistent Back/Cancel destinations and RTL-aware directional icons.
  Do not replace an explicitly requested inline/person view with a new info modal.

## 5. Language, RTL, and themes

- Arabic interfaces MUST have correct direction throughout: document, inputs,
  picker search/options, alignment, directional icons, validation and tooltips.
  A right-aligned label alone is not RTL support.
- Translate the full supported UI, including dialogs, details, errors and empty
  states. Preserve stored names/identifiers and do not translate user data unless
  that product explicitly supports it. Isolate intrinsically LTR values as needed.
- Where a language switch exists, retain the choice across reloads and verify it
  in both authenticated and unauthenticated views when applicable.
- Verify contrast, borders, disabled controls and hover states in every supported
  theme. Do not leave hard-coded light-theme colors in dark mode or vice versa.
- Do not universalize Arabic-only behavior: bilingual products still need English.

### Reusable theme packs

- Shared theme catalogue: `~/.config/agent-themes/README.md` and `catalog.json`.
  Available packs: `midnight-lime`, `jet-flame`, `paper-cornflower`.
- Before UI work, MUST read the project's DESIGN.md and current semantic tokens.
  If adopting a pack, read its THEME.md, tokens.json/CSS and reference screenshot.
- Preserve the project's selected theme. Do not impose a palette globally or
  switch an existing theme merely because new packs are available. Choose for a
  new project only when requested or when design choice is delegated.
- Record selected theme ID/version, project-local token paths and deliberate
  overrides in DESIGN.md. Copy the chosen version into the project so deployment
  never depends on a home-directory path; library updates are not automatic migrations.
- MUST reuse semantic color/type/spacing/state tokens rather than scattering
  hard-coded palette values through components. Preserve approved visual identity.
- Verify applicable hover, focus, disabled, error and success states, responsive
  layout, RTL and reduced motion in every supported theme. Use contrast-safe
  foreground/background pairings, not raw accent colors indiscriminately.
- Source reference images are evidence, not product assets or permission to copy
  brands, claims, portraits or artwork. Distinguish exact source palettes from
  authored adaptations. Do not invent an opposite-mode variant or add a theme
  picker unless that is part of the requested project scope.

## 6. Verify the result the user actually receives

- MUST check the running application for UI work, not only source/build output.
  Keep an existing preview usable; rebuild/restart the correct service when needed.
  Reuse the project's configured port rather than inventing a new one each session.
- Check affected interactions, long text, relevant dialogs, phone/desktop widths,
  RTL/LTR and supported themes. Preserve current data during verification.
- Report what was checked and what remains unverified. A shell prompt, idle badge,
  successful command submission, build, or uploaded file is not end-to-end proof.
- Distinguish implemented, tested, committed, pushed, deployed and running. Verify
  remote branch identity before claiming pushed. Do not hide failing checks behind
  a blanket "done"; separate inherited failures from new regressions.
- Preserve known working artifacts and record failed approaches so the next agent
  does not repeat the same investigation or make the same premature success claim.
- Be resourceful and concise. Inspect available context before asking for it again.
  When storage is tight, reuse installed runtimes/models and avoid duplicate or
  optional heavyweight downloads. Do not delete unrelated data to make room.

## 7. Git and review workflow

- New task branches MUST use meaningful prefixes such as feat/, fix/, hotfix/,
  refactor/, docs/, chore/ or release/, not generic task/ names. This does not
  authorize renaming existing branches or rewriting history.
- For each PR being worked on, MUST read its latest comments AND reviews before
  concluding the task or advancing its review/merge workflow. Address or explicitly
  account for actionable feedback; do not repeatedly skip review comments.
- Do not hide durable plans in git stash. Store task plans in the project's chosen
  documentation workflow; never apply/delete unrelated stashes automatically.
- Follow the user's authorized publication scope. These rules do not themselves
  authorize commits, pushes, PR comments, merges, deployments or tracker updates.

## 8. Project-specific requirements and exceptions

These sections prevent project decisions being misapplied globally. Read each
project's current docs for full details; this is not a replacement product spec.

### Mal3ab main application
- Sport behavior belongs in sport-provider modules; keep shared UI/data free of
  volleyball-only assumptions. Teams and player roles are sport-aware.
- Icon-only actions are ROW actions only. Dialogs, toolbars and other non-row
  actions retain visible localized labels (explicit correction, 2026-10-30).
- Read DESIGN.md and docs/HANDOFF.md for current bilingual/theme/navigation rules.
  Do not revive old navigation rules superseded by the approved redesign.

### Mal3ab product website
- This is a separate project from the main application. Keep requested website
  changes scoped to it; preserve its demo-form behavior and saved submissions.
- Preserve its approved Arabic/English toggle, RTL and remembered language choice.

### PeerGraph
- Every list-input picker has search within the opened picker above the results.
  Name inputs and search inputs stay RTL, including queries typed in Latin letters.
- Row/section actions use the approved compact, borderless icons with tooltips;
  section add icons may be circular. This is a scoped exception to general
  text-labelled non-row actions, not a rule for all applications.
- Add social relations and locations through dialogs. Preserve the later person
  view/tab design; do not restore the superseded standalone/floating info view.
- Global search is hidden in History and person views as specified in DESIGN.md.
- Family-role wording, deceased visibility, parent precedence and derived relations
  are domain rules in project docs, not global UI or demographic assumptions.

### DarAlmazad
- Table actions use the specified semantic colors: edit yellow, delete red,
  disable orange, add green. Reuse consistent hover treatment.
- Back actions sit with the heading at the trailing edge and use a directional
  arrow. The edit-car action must not become an oversized pill.
- Translation controls follow the later appended/connected-input design, not the
  earlier floating-inside-input attempts. Honor the project's actual components.
- For its established Plane/PR workflow, keep tasks synchronized to the tracker
  when authorized, attach UI-check screenshots to the relevant PR comment and
  identify the actual commenting agent. Wait for Omar's requested PR feedback
  before moving to the next task. Do not impose this review gate on other projects.
- Use solution-level `dotnet build` for its requested workflow, not individual
  `*.csproj` builds. Follow repo documentation for additional checks.

### Nextcloud Department Workflow (testing-nextcloud)
- Match the host Nextcloud/Deck conventions and permission-aware navigation.
- Template controls must match create/edit-project controls; creation uses dialogs.
  Closing a dialog resets its abandoned form data.
- Read the current per-file-stage specification; do not restore the superseded
  project-wide-stage model. Use configured stage timeouts, not hard-coded durations.
- Preserve user-entered project names; use the approved Arabic department wording
  in project docs. Keep long file names from hiding row actions.

## 9. UI motion and microinteractions

User-requested additions from Charles (@charles.unemployed), "20 Ways to Make
Beautiful AI Animations": https://www.tiktok.com/@charles.unemployed/video/7704685504305876242
Source: all 20 on-screen tips visually verified on 2026-11-06.

Apply these defaults to relevant interactions, not as a requirement to animate
every element. Numeric values are starting points, not universal constants.
Preserve project-specific design, responsiveness, accessibility and RTL behavior.

1. Use ease-out for entrances so elements settle naturally.
2. Keep dropdown transitions short: normally 150–250 ms.
3. When staggering list rows, start around 30 ms between rows; cap total delay
   for long lists so content and interaction are not held back.
4. Give suitable buttons subtle press feedback around scale(0.97); keep their
   hit areas and layout stable.
5. Where appropriate, stretch moving knobs by about 12% in the direction of
   motion, preserving perceived area. Keep this restrained and nonessential.
6. Let secondary details settle shortly after their parent, rather than stopping
   every animated part in perfect synchrony.
7. Use gentle arcs for object-transfer motion where they clarify spatial movement.
8. Use a brief, restrained pulse to reinforce actual success; retain a clear
   accessible success message and never signal success before confirmation.
9. Use ease-in-out for moves between positions, not a rigid linear glide.
10. Start suitable popovers near scale(0.95), then settle at full size; avoid
    scaling them up from zero.
11. Set entrance transform origins to the triggering control/anchor, with correct
    RTL positioning, so the surface appears connected to its source.
12. Exit toward that same trigger/anchor when the spatial relationship applies.
13. Avoid bouncing/overshooting animations in everyday functional UI.
14. While an object is held or dragged, track the pointer directly; do not tween
    behind it. Settling animation belongs after release.
15. Make exits roughly 20% shorter than entrances when appropriate.
16. Overlap outgoing and incoming visual states to avoid a blank beat; prevent
    duplicate interactive controls or duplicate screen-reader announcements.
17. Prefer masks/clipping for suitable reveals and color transitions rather than
    indiscriminately fading whole content areas.
18. For icon-state changes, use a short crossfade, with subtle blur only where it
    improves clarity; keep meaning, accessible labels and sharp resting states.
19. Where custom dragging has bounds, use diminishing rubber-band resistance
    past the limit, then settle within bounds; do not interfere with native scroll.
20. Preserve shared-element identity across connected states (e.g. the same
    layoutId when using Motion) so an object transforms rather than appearing
    to be replaced. Use the existing framework's equivalent; no new library is
    required solely for this effect.

Accessibility/performance guardrails added when applying the source: MUST honor
prefers-reduced-motion, avoid flashing/repeated pulses, retain keyboard/focus
behavior, and never delay essential actions for decoration. Animate only what
communicates state or continuity. Verify motion in the running UI, including
interruption/repeated input and reduced-motion mode.

## 10. Before reporting completion

Check: correct project and scope; applicable current rules loaded; repeated pattern
fixed consistently; existing data preserved; evidence/limitations recorded; project
decision docs updated when necessary; Git/publication status stated accurately.
Do not claim that this file alone technically enforces compliance. It must be loaded
by each client; strict security/release gates belong in permissions and CI. Already
running sessions may need a new turn/session or an explicit reload to see changes.
