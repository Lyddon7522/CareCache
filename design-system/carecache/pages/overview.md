# Overview page direction

This page extends the CareCache master system with a more expressive, content-first dashboard.

## Visual direction

- Use a tactile bento composition: one dominant status hero followed by clearly grouped content
  cards of varied visual weight.
- Keep the established dusk-indigo and coral palette. Add energy through scale, layering, soft
  shadows, and tonal surfaces rather than introducing unrelated colors.
- Use the hero for real status and high-value actions. Decorative shapes remain code-native,
  abstract, low contrast, and outside the semantic tree.
- Give the next scheduled task the strongest content card after the hero. Do not invent sample
  reminders or inventory data to fill empty states.
- Quick actions use rounded icon pods and one visually dominant scan action. All other actions are
  tonal and subordinate.

## Interaction

- Tappable cards use Material ink feedback plus a subtle `0.985` press scale over 120 ms.
- Disable the press animation when the operating system requests reduced motion.
- Keep all interactive targets at least 48 logical pixels and preserve visible labels.
- Entire cards may be tappable only when they contain no nested action.

## Responsive behavior

- Use two-column summary and action groups when at least 320 logical pixels are available.
- Stack content at narrower widths and allow cards to grow vertically with text scaling.
- Show the hero's decorative supply artwork only at 560 logical pixels and wider.

## Content order

1. Current status and primary add/scan actions
2. Concrete low-stock and overdue records, when present
3. Upcoming reminders or an actionable empty state
4. Inventory and schedule snapshot
5. Secondary quick actions

## Avoid

- Generic wellness language, fake progress, or decorative cards without an action or data point
- A photo-led medical aesthetic that could be mistaken for user health data
- Multiple competing gradients, neon accents, glass blur, or exaggerated clay shadows
- Horizontal carousels for primary actions or reminders
