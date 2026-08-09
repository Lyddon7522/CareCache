# CareCache brand guidelines v0.1

> Working identity for Vector42. Formal trademark clearance is required before store submission.

## Brand idea

CareCache is a clear view of what is available and what needs attention. It should feel capable
and reassuring, never clinical, alarmist, childish, or like hospital inventory software.

**Tagline:** Know what you have. Know what is next.

## Personality and voice

| Trait | We are | We are not |
| --- | --- | --- |
| Calm | Clear about what is next | Alarmist about overdue work |
| Capable | Specific and action-oriented | Dense or administrative |
| Respectful | User-controlled and private | Patronizing or intrusive |
| Honest | Clear about uncertainty and limits | Diagnostic or overconfident |

Use plain verbs: add, scan, use, replace, clean, export. Prefer “Due today” over “Noncompliant.”
Success copy is brief: “Filter replacement recorded.” Error copy states a recovery path.

## Color system

### Light

| Token | Hex | Use |
| --- | --- | --- |
| Dusk indigo | `#4A4FC4` | Primary actions, selected navigation |
| Deep indigo | `#30358F` | Pressed state, strong emphasis |
| Periwinkle wash | `#E5E7FF` | Calm highlights and progress surfaces |
| Warm coral | `#C64B64` | Warm accents and secondary actions |
| Canvas | `#F8F8FD` | App background |
| Surface | `#FFFFFF` | Cards, sheets, fields |
| Ink | `#22243A` | Primary text |
| Muted ink | `#63667A` | Supporting text |
| Border | `#DFE0EC` | Dividers and field outlines |
| Success | `#15803D` | Completed and healthy inventory |
| Warning | `#A16207` | Low stock and due soon |
| Error | `#B91C1C` | Errors and destructive actions |
| Info | `#0369A1` | Informational states |

### Dark

Use `#11121E` canvas, `#1A1C2B` surface, `#B9C0FF` primary, `#FFB1C1` warm accent,
`#E8E8F2` primary text, `#C6C5D2` secondary text, and `#414354` borders. Dark mode is
designed independently and is not an inverted light theme.

Color is never the only status indicator. Pair it with a label and icon. Normal text pairs must
meet WCAG AA contrast.

## Typography

Use the platform system family so CareCache is fast, private, familiar, and responsive to Dynamic
Type:

- iOS: San Francisco through Flutter's default typography.
- Android: Roboto through Flutter's default typography.
- Web: `ui-sans-serif`, `system-ui`, `-apple-system`, `BlinkMacSystemFont`, `Segoe UI`, sans-serif.

Use weights 700 for display, 600 for headings/actions, 400 for body, and tabular figures for stock
counts and dates. Minimum body size is 16 px on the web and the Material body-large role in-app.

## Shape, spacing, and depth

- 4/8-point spacing system with 16-point page gutters on compact screens.
- Cards: 20-point radius, subtle 1 px border, restrained shadow only when hierarchy needs it.
- Buttons and inputs: 14-point radius and at least 48 dp height.
- Pills: fully rounded, used for small statuses rather than primary actions.
- Motion: 150 to 250 ms, cause-and-effect only, and safe under reduced motion.

## Mark

The mark combines an open “C” with a forward-moving check. The open form suggests an inventory
cycle that can be updated at any time; the check communicates readiness without using a medical
cross or a literal storage bin. The glyph stands on its own without an enclosing tile in lockups
and splash screens. Use the approved source SVG. Do not rotate, stretch, recolor, add effects, or
redraw it. Keep clear space equal to the check stroke width.

Use Material Symbols/Icons consistently for product UI. Structural icons are vectors, never emoji.

## Imagery

Prefer real, tidy home-care contexts with warm natural light, neutral backgrounds, diverse hands,
and no visible real prescription or serial data. Avoid hospital drama, fear-based imagery, glowing
technology effects, and identifiable patient information.
