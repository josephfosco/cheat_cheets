---
---

**Deleting branches**

To delete a **REMOTE** branch
`git push <remote_name> :<branch_name>`
or (more recently
`git push <remote_name> --delete <branch_name>`

To delete a **LOCAL** branch
`git branch -d <branch_name>`
or to force
`git branch -D <branch_name>`

**Stash**

To stash current uncommitted changes
`git stash`

To list changes stages
`git stash list`

To inspect stashed changes
`git stash show`

To retrieve stashed changes on current branch run
`git stash apply <stash>`

To clear all stached entries
`git stash clear`

To remove a single stashed entry
`git stash drop <stash>`

**Submodules**

***After cloning a repo with submodules run the following commands***
`git submodule init`
`git submodule update  - pull submodules down to the project`

***To update all submodules in a repo to their master branch run***
`git submodule update --remote`

***To remove/delete a submodule***

The 3-step removal process is:

```
0. mv a/submodule a/submodule_tmp

1. git submodule deinit -f -- a/submodule    
2. rm -rf .git/modules/a/submodule
3. git rm -f a/submodule
# Note: a/submodule (no trailing slash)

# or, if you want to leave it in your working tree and have done step 0
3.   git rm --cached a/submodule
     mv a/submodule_tmp a/submodule
```

***To create a new github repo from an existing local repo***

1. Log in to github and go to the "Repositories" page
2. Click "New", fill in the required information, and then click "Create Repository"
3. On the local computer cd to the directory you want to make a git repo
4. Type `git init`
5. Set the git username and email address
```
git config  user.name "<username>"
git config  user.email "<email address>"
```
Note: This sets the username and email for the local repository only
6. Add the remote using the following format
`git remote add origin git@<github username>/<github repo name>.git`
Note: This is not generally the exact uri you get from the "Code" dropdown in github.
This has the additional occurance of \<github username\> after the "@"
7. Type `git pull origin main`
Note: this must be done before making any commits to the local repo
8. Add and push first commit```
git add .
git commit -m"Initial commit"
git push --set-upstream origin main
```

