---
---

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
3bis mv a/submodule_tmp a/submodule
```
