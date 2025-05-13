---
title: Project management. Git rebase
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# Project management. Git Rebase (WIP)

## extra

muista:
`git push --force-with-lease`

VS Code: git branch view

## kunnon tapa commitoida

* title & body

* vs code settings:
  * commit viesti blockki fontti
  * pystyviiva estämään liian pitkät
  * push & pull napit

## wip commits

* wip commits
* then `git reset master` ja teet uuen kunnon commitin
* mut mitä jos tää ei riitä?

## Git Rebase

* rewrite your local Git history before merging your private branch to master 
* "replays" your commits

`git rebase -i commit_before_start`
* commands
  * pick
  * reword
  * fixup
  * edit
* Explained when interactive rebase starts

---

* käy läpi muutokset branchi-viewistä käsin, laita uudet committiviestit ylös johonki esim notepad ja merkkaa mitä komentoa käytät mihinki 
* `git merge —ff-only`

* obs: if you've merged something from master to this branch somewhere in the middle, rebase fails

## Extra: splitting a commit

* Want to split one commit to many, or move changes from one commit to another?
* Use interactive rebase like [this](https://stackoverflow.com/questions/6217156/break-a-previous-commit-into-multiple-commits)
  * Start an interactive rebase with `git rebase -i <your_commit>^`
  * Mark the commit you want to split with the action `edit`.
  * When editing said commit, execute `git reset HEAD^`. The effect is that the files of said commit are unstaged now.
  * Add the changes to a new commit with `git add`, then commit with `git commit`. Repeat until working tree is clean.
  * Continue with `git rebase --continue`
* After this rebase, if you want to combine commits, you can do it with another rebase