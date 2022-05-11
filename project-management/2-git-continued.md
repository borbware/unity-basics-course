---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: default -->

# Project Management 2. Git continued

## Git workflow 2: branches
* a git repository can have multiple **branches**
  * By default, git repository has only one branch, named **master** or **main**
  * Using multiple branches makes it possible to work on new features step by step in their own **feature branches**
    * Meanwhile, the master branch is kept clean and in a working state
    * Only when the feature is completed, the branch is merged into the master branch! 
* Even though your local repository can have multiple branches, only one of them is *active* at a given time
* `git status` tells you firsthand which branch you are on: "`On branch master`"
## git branch & git checkout

* You can create a new branch with `git branch branchName`
  * The new branch is not empty: it contains a copy of the code of the branch you executed this command in
  * **Note:** this command does not make the branch active!
* You can move to a branch with `git checkout branchName`. 
  * For example, to move back to master use `git checkout master`
* Additionally, you can list local branches with `git branch`
  * ...and all branches (incl. remote ones) with `git branch -a`
* Delete a local branch with `git branch -d branchName`
  * Remote branch can be deleted in the GitHub/etc website, or like [this](https://koukia.ca/delete-a-local-and-a-remote-git-branch-61df0b10d323).

### Extra commands

* There's also a handy command `git checkout -b branchName`
  * It's a shorthand for `git branch branchName` + `git checkout branchName`
* `git switch branchName` is for the moments when you notice you've been working on the wrong branch! It switches to the branch `branchName` and takes all your code with
* You can use the push command to delete a remote branch`git push origin -d branchName`
* If deleted remote branches still show up in `git branch -a`, you can use the command `git remote prune origin` to remove them from the list.

## Local vs. remote branches

* `git branch branchName` only creates a local branch
* When you try to push changes from a new local branch, git nags you that a matching remote branch doesn't yet exist
  * Git tells you how to create the remote branch:
    * `git push --set-upstream origin newBranch`
    * afterwards, `git push` pushes the changes to the matching remote branch
## git merge

* When the feature is done and all the broken things fixed, you want to merge your feature branch back to master
* First, checkout the master branch with `git checkout master`
* Then, do a `git pull` so you have the newest version of the master branch
  * Someone else might have done changes to it while you were working on your feature!
* Then, merge the feature branch to master with `git merge featureBranchName`
  * This is where **conflicts** can happen

## Exercise 1. Pushing onwards
<!-- _backgroundColor: Khaki -->

Continue the exercise from [Git Basics](1-git-basics.md) or create a new repository for these exercises.
* Create a new branch (with a name `new-feature`, for instance) in your local repository.
* Checkout the branch, make some changes to `GitTest.md` there, and push the changes to GitHub.
* Then, merge the changes from your `new-feature` branch to `master` branch by using
  a) `git merge` from command line
  b) pull request in GitHub
# 3. Conflicts
## GitLens

* to make git workflow easier, install the GitLens extension to VS code
  * helps in managing conflicts, comparing branches or commits
* Install it from the Extensions panel (access with ***CTRL+SHIFT+X***)
## Conflicts

* Sometimes two people have made changes in the same lines of code!
* This leads to a conflict that looks like this:
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
* "Current change" is between `<<<<` and `====`, old code in `master`
* "Incoming change" is between `>>>>` and `====`, new code from `featureBranch`
* Use your text editor to choose which (or some combination of both) you want to preserve
## After resolving the conflict
* After resolving conflicting files, use `git add filename` to add them to the commit
* Then use `git commit` (without a message) to apply changes. 
  * Close the automatically opened COMMITMSG file. This should finish the merge.
* Then just `git push` to apply changes in the remote repository

## Git workflow 3: Undoing
* Git doesn't have a general "undo" command
* If you make a mistake, it is very case-specific what you need to do to fix it
  * See [undo options here](https://docs.gitlab.com/ee/topics/git/numerous_undo_possibilities_in_git/)  
  * Also, [ohshitgit.com](https://ohshitgit.com/)
## git log & git checkout commitHash

* Use `git log` to see verbose history
* Or `git log --oneline` for a more concise version
  * Press ***Q*** to quit the log view.
  * The newest changes are seen on top
  * On the left side of the commit message you see the *hashcode* of the commit
  * Use `git checkout [hashcode]` to "time travel" into the commit

# 4. Workflow examples
## Common workflow

`git status`

`git add filename`	(if new files added)

`git commit filename -m "make change"`

`git pull` (If working in a team, always pull before pushing!)

`git push`

## Creating a new branch

`git branch newBranch`

`git checkout newBranch`

`git add newFile.txt`

`git commit -m "add newFile.txt"`

`git push --set-upstream origin newBranch`

* (The line above creates a new remote branch. After doing it once, you can just use regular git push)

## Merging a feature branch to master

`git checkout master`

`git merge newBranch`

* This is where the conflicts happen. Fix them in VS code

`git add conflictedFile.txt`

`git commit`

`git push`

## Merging changes from master to feature branch

* On feature branch:
  `git fetch origin master:master`

  `git merge master`

## Collaboration in Unity

* The most important rule: ***don't work on the same thing simultaneously or it's chaos***
* Be sure to communicate about ***scene ownership***
  * Scenes are not code files, so you can't merge conflicts if two people have worked on them
  * Thus, ***Scene Owner*** will be the only person on the team who should be working on a certain scene
  * If a scene needs GameObject contributions from others, they can create prefabs that the Scene Owners then add to their scene 

## Exercise 2. Branching team effort
<!-- _backgroundColor: Khaki -->
* Work as a group for this assignment.
* Continue Exercise 2 from [Git basics](1-git-basics.md).
* Every group member creates an individual branch from the master, and makes some changes to the `GitTest.md` file.
* Add new files as well.
* Do not tell other group members what you're going to change! :D
* Then, Merge the changes back to the master branch. Fix ensuing conflicts, if any appear.

## Exercise 3. Unity collaboration
<!-- _backgroundColor: Khaki -->

Create a new Unity project for your group.

Every group member creates their own scene and works on that (i.e., is the Scene Owner of the scne).

The scene can contain anything you like; the only mandatory feature is that pressing the A button (Fire1) should make the game continue on to the next scene.

From Scene 4, the game should loop back to Scene 1.

* ***Extra:*** Create a prefab that is included in every scene.

## Reading 

* [Pro Git book](https://git-scm.com/book/en/v2)
* [Oh shit Git]([ohshitgit.com](https://ohshitgit.com/))
* [Undo possibilities](https://docs.gitlab.com/ee/topics/git/numerous_undo_possibilities_in_git/) 