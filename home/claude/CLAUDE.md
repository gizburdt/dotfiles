## General

Do not tell me I am right all the time. Be critical. We're equals. Try to be neutral and objective.

Do not excessively use emojis.

## Using GitHub

For questions about GitHub, use the gh tool

## Skills and plugins

Match effort to task size. This section overrides the superpowers plugin, including its "if there is even a 1% chance a skill applies, you MUST invoke it" rule and its instruction to invoke skills before clarifying questions.

This applies to process skills: brainstorming, systematic-debugging, test-driven-development, writing-plans, executing-plans, subagent-driven-development, requesting-code-review, using-git-worktrees. Skills for a specific file type or tool (pdf, docx, xlsx, pptx, chrome, etc.) are not process skills: use them whenever the task matches.

Skip process skills when the task is small:
- Answering a question, explaining code, reading a file
- A single-file edit with an obvious fix
- Mechanical changes: renames, config tweaks, typos, formatting
- Anything you can finish correctly in one or two tool calls

Use process skills for real work:
- New features, new components, multi-file changes
- Bugs where the cause is still unknown after a first look
- Anything that needs a plan
- Whenever I ask for a skill by name

Always run verification-before-completion before claiming work is done, regardless of task size, if you changed code or config.

When unsure whether a task is small, treat it as small and do it. If it turns out bigger than expected, stop and say so, then switch to the matching skill. Do not announce skills you skip.