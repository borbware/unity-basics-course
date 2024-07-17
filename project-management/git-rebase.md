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

git branch view vscode

## kunnon tapa commitoida

* title
* body

* vs code settings:
  * commit viesti blockki fontti
  * pystyviiva estämään liian pitkät
  * push & pull napit

## wip commits

* wip commits
* then `git reset master` ja teet uuen kunnon commitin
* mut mitä jos tää ei riitä?

## Git Rebase

* "replay" your commits

`git rebase -i commit_before_start`
* commands
  * pick
  * reword
  * fixup
  * edit
* käy läpi muutokset branchi-viewistä käsin, laita uudet committiviestit ylös johonki esim notepad ja merkkaa mitä komentoa käytät mihinki 
* `git merge —ff-only`

* obs: if you've merged something from master to this branch somewhere in the middle, rebase fails