# AGENTS.md

This repository contains Markdown source files, a shared stylesheet, a PDF generation script, and generated PDF outputs for Marco Bettiolo CV variants.

## Repository layout

- `cv.md`: main CV source in Markdown
- `cv--the-aid.md`: The AID-focused CV source in Markdown
- `cv.css`: shared stylesheet for PDF generation
- `generate-cv.sh`: the only supported way to generate PDFs in this repo
- `Marco Bettiolo - CTO CV <Mon YYYY>.pdf`: generated PDF output, always using the current month and year regardless of source variant

## Working conventions

- Treat Markdown files as the source of truth; PDFs are generated artifacts.
- Preserve the current writing style: concise executive CV language, strong action verbs, short bullets.
- Keep formatting ASCII-only unless an existing file already uses a specific symbol.
- Do not overwrite or revert unrelated changes in the working tree.
- When making role-specific variants, create a copy of the base CV and keep the shared CSS unless a variant explicitly needs different styling.
- When new repository-specific instructions are given, update `AGENTS.md` in the same task so future work follows the latest rules.

## PDF generation

- Always use `./generate-cv.sh <input-md>` to generate PDFs.
- Do not run `npx md-to-pdf` directly from agent workflows.
- If `generate-cv.sh` does not support a requested input file or naming rule, do not bypass the script; ask the user to implement that feature in `generate-cv.sh`.
- Generated PDF filenames must always be `Marco Bettiolo - CTO CV <Mon YYYY>.pdf`, using the abbreviated current month and year, for example `Marco Bettiolo - CTO CV Mar 2026.pdf`.
- Multiple Markdown variants may exist, but they should all render to the same clean PDF output name.

Examples:

```bash
./generate-cv.sh cv.md
./generate-cv.sh cv--the-aid.md
```

## The AID variant rules

- Position `The AID` as the current role: `CTO • The AID • Jun 2025 - Present`.
- Keep `Sensay` under past experiences with dates `Jul 2023 - Feb 2026`.
- Reflect The AID's current geographic focus as Cambodia and Kenya.
- Keep `Languages` before the experience sections.
- Keep a single page break before `## Past Experiences`.
- Do not add any other page breaks unless explicitly requested.

## Layout rules

- Always place the page break immediately before `## Past Experiences`.

## Git guidance

- Commit only when explicitly requested.
- Prefer focused commits when possible.
- If asked to commit everything, include generated PDFs that correspond to Markdown edits.
