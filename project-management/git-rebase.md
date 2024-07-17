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

* rewrite your local Git history before merging your private branch to master 
* "replays" your commits

`git rebase -i commit_before_start`
* commands
  * pick
  * reword
  * fixup
  * edit

---

* käy läpi muutokset branchi-viewistä käsin, laita uudet committiviestit ylös johonki esim notepad ja merkkaa mitä komentoa käytät mihinki 
* `git merge —ff-only`

* obs: if you've merged something from master to this branch somewhere in the middle, rebase fails

## Extra: splitting a commit

* if you want some changes from a commit to one commit, and some to another?
* do a rebase before doing a rebase
* jos rebasetat vaikka commitit A ja B ja haluat alunperin A:ssa olleet muutokset B:hen
* Niin edit molemmille, sitte A:n kohdalla muokkaat siitä tiedostosta ne muutokset pois ja B:n kohdalla laitat ne takasi.  unstagettaa sen tiedoston ja stagettaa sen sitte takasi seuraavaan
  * sit vissiin git commit --amend i guess, en oo testannu vielä
* elikkäs. splittaa unstagetetun tiedoston commitit osiin ja sit vetää uuden rebasen ja squashaa (fixup) sen toiseen.