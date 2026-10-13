# Skills hub — read this first on every task

This repository is the owner's personal library of skills. It is attached to
sessions so that, for any task, you first check here which skills apply and
follow them. The owner writes in Russian; answer in Russian.

## How to use

1. Read the task and match it against the table below.
2. Open the matching skill's `SKILL.md` (and the files it routes to) before acting.
3. If no skill matches, work as usual — don't force a skill onto an unrelated task.

| Task | Skill | Tool it needs |
|---|---|---|
| Edit / cut / montage a video, subtitles, music, graphics ("смонтируй", "нарежь", "субтитры") | [`.claude/skills/chatmonteur/SKILL.md`](.claude/skills/chatmonteur/SKILL.md) | `chatmonteur` CLI in `~/chatmonteur` |
| Understand / navigate / change code in a repo that has a `graft/` graph | [`.claude/skills/graft/SKILL.md`](.claude/skills/graft/SKILL.md) | `graft` CLI |

## Toolchain

On cloud sessions the SessionStart hook runs `scripts/setup-session.sh` in the
background (log: `~/.cache/skills-setup.log`). It installs `graft` and clones +
installs ChatMonteur into `~/chatmonteur`. If a command is missing, check the log
or run the script yourself. Video transcription needs `huggingface.co` allowed in
the environment's network settings.

## Adding a skill

Put it in `.claude/skills/<name>/SKILL.md` (frontmatter `name` + `description`),
then add a row to the table above.
