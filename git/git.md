# Git Essentials

## Initialization

- `git init` — create a new repository
- `git clone <url>` — clone remote repo

## Staging & Committing

- `git status` — show current changes
- `git add <file>` — stage file
- `git add .` — stage all changes
- `git commit -m "msg"` — commit with message
- `git commit -am "msg"` — stage + commit tracked files

## Branching

- `git branch` — list branches
- `git branch <name>` — create branch
- `git checkout <name>` — switch branch
- `git checkout -b <name>` — create + switch
- `git switch <name>` — modern switch
- `git switch -c <name>` — create + switch

## Merging & Rebasing

- `git merge <branch>` — merge branch into current
- `git rebase <branch>` — reapply commits on top
- `git rebase -i HEAD~n` — interactive rebase

## Remote Repositories

- `git remote -v` — list remotes
- `git remote add origin <url>` — add remote
- `git push -u origin <branch>` — first push
- `git push` — push changes
- `git pull` — fetch + merge
- `git fetch` — fetch without merge

## Undoing Changes

- `git restore <file>` — discard unstaged changes
- `git restore --staged <file>` — unstage file
- `git reset --hard` — reset working tree
- `git reset HEAD~1` — undo last commit (keep changes)
- `git revert <commit>` — create opposite commit

## Logs & History

- `git log` — full commit history
- `git log --oneline` — compact history
- `git diff` — show unstaged changes
- `git diff --staged` — show staged changes

## Stashing

- `git stash` — save work temporarily
- `git stash pop` — restore + remove stash
- `git stash list` — list stashes
