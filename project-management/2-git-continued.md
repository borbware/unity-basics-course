---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: default -->

# Project Management 2. Git continued

## Git workflow 2: branches
* a git repository can have multiple **branches**
  * by default, git repository has only one branch, named **master** or **main**
  * using multiple branches makes it possible to work on new features step by step in their own **feature branches**
    * meanwhile, the master branch is kept clean and in a working state
    * only when the feature is completed, the branch is merged into the master branch! 
* Even though your local repository can have multiple branches, only one of them is *active* at a given time
* `git status` tells you firsthand which branch you are on: "`On branch master`"
## git branch & git checkout

* You can create a new branch with `git branch branchName`
  * **Note:** this command does not make the branch active!
* You can move to a branch with `git checkout branchName`. 
  * For example, to move back to master use `git checkout master`
* Additionally, you can list local branches with `git branch` 
  * and all branches (incl. remote ones) with `git branch -a`
* delete a local branch with `git branch -d branchName`
  * remote branch can be deleted in the github/etc website, or like [this](https://koukia.ca/delete-a-local-and-a-remote-git-branch-61df0b10d323).
* **Note:** There's also a handy command `git checkout -b branchName`
  * It's a shorthand for `git branch branchName` + `git checkout branchName`
## Local vs. remote branches

* git branch branchName only creates a local branch
* when you try to push changes from a new local branch, git nags you that a matching remote branch doesn't yet exist
  * git tells you how to create the remote branch:
    * `git push --set-upstream origin newBranch`
    * afterwards, `git push` pushes the changes to the matching remote branch
## git merge

* when the feature is done and all the broken things fixed, you want to merge your feature branch back to master
* First, checkout the master branch with `git checkout master`
* Then, do a `git pull` so you have the newest version of the master branch
  * someone else might have done changes to it while you were working on your feature!
* Then, merge the feature branch to master with `git merge featureBranchName`
  * this is where **conflicts** can happen

## Exercise 1. Pushing onwards
<!-- _backgroundColor: Khaki -->

Continue the exercise from [Git Basics](1-git-basics.md) or create a new repository for these exercises.
* Create a new branch (with a name `new-feature`, for instance) in your local repository.
* Checkout the branch, make some changes to `GitTest.md` there, and push the changes to GitHub.
* Then, merge the changes from your `new-feature` branch to `master` branch by using
  a) git merge from command line
  b) pull request in GitHub
# 3. Conflicts
## GitLens

* to make git workflow easier, install the GitLens extension to VS code
  * helps in managing conflicts, comparing branches or commits
* Install it from the Extensions panel ([CTRL+SHIFT+X])
## Conflicts

* sometimes two people have made changes in the same lines of code!
* this leads to a conflict that looks like this:
  ```c#
  <<<<<<< HEAD:Player.cs
    if (Input.anyKey) {
      return true;
    }
  =======
    if (Input.anyKey)
        return true;
  >>>>>>> iss53:Player.cs
  ```
* "current change" is between `<<<<` and `====`, old code in `master`
* "incoming change" is between `>>>>` and `====`, new code from `featureBranch`
* use your text editor to choose which (or some combination of both) you want to preserve
## After resolving the conflict
* After resolving conflicting files, use `git add filename` to add them to the commit
* Then use `git commit` (without a message) to apply changes. This should finish the merge.
* Then just `git push` to apply changes in the remote repository

## Git workflow 3: Undoing
* git doesn't have a general "undo" command
* if you make a mistake, it is very case-specific what you need to do to fix it
  * See [undo options here](https://docs.gitlab.com/ee/topics/git/numerous_undo_possibilities_in_git/)  
  * Also, [ohshitgit.com](https://ohshitgit.com/)
## git log & git checkout commitHash

* use `git log` to see verbose history
* or `git log --oneline` for a more concise version
  * the newest changes are seen on top
  * on the left side of the commit message you see the *hashcode* of the commit
  * use `git checkout hashcode` to "time travel" into the commit

# 4. Workflow examples
## Common workflow

`git status`

`git add filename`	(if new files added)

`git commit filename -m "make change"`

`git pull` (if working in a team, always pull before pushing!)

`git push`

## Creating a new branch

`git branch newBranch`

`git checkout newBranch`

`git add newFile.txt`

`git commit -m "add newFile.txt"`

`git push --set-upstream origin newBranch`

* (the line above creates a new remote branch. After doing it once, you can just use regular git push)

## Merging a feature branch to master

`git checkout master`

`git merge newBranch`

* this is where the conflicts happen. Fix them in VS code

`git add conflictedFile.txt`

`git commit`

`git push`

## Exercise 2. Branching team effort
<!-- _backgroundColor: Khaki -->
* Work as a group for this assignment.
* Continue Exercise 2 from [Git basics](1-git-basics.md).
* Every group member creates an individual branch from the master, and makes some changes to the `GitTest.md` file.
* Add new files as well.
* Do not tell other group members what you're going to change! :D
* Then, Merge the changes back to the master branch. Fix ensuing conflicts, if any appear.


## Reading 

* [Pro Git book](https://git-scm.com/book/en/v2)
* [Oh shit Git]([ohshitgit.com](https://ohshitgit.com/))
* [Undo possibilities](https://docs.gitlab.com/ee/topics/git/numerous_undo_possibilities_in_git/) 