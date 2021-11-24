
# Preferred way to work with git when multiple team members push regularly to the same branch (in this case, master). 
> This avoid unecessary merge commits and keeps the git history linear and concise. 


## **TO DO EVERYDAY** 

#### to get all the latest commits from remote repository (Gitlab):
 _on master_

```git pull```

#### to go to your branch

```git checkout your_branch```

#### to get all the commits on master to your branch
_on your_branchname_

```git rebase master```

#### _continue working_



## **TO DO WHEN YOU FINISH A FEATURE OR A TASK**

#### to go to master branch
_on your_branch_

```git checkout master```

#### merge your work with master

```git merge your_branch```

#### push your work upstream (to Gitlab)

```git push```

#### go back to your branch

```git checkout your_branch```

#### _continue working_

## **NOTES/BEST PRACTICES** 

- To creata a new local branch use. (Replace 'your_branch' with whatever name you want)

    ```git checkout -b your_branch```

- To delete a branch use 

    ```git branch -d your_branch```

- To see all your branches use

    ```git branch```

- You should only push the master branch (in this case). Your local branch is only for local development. 

- The master branch should only have working code. Merge with master only if you know your code does not have any blocking errors (bugs are fine obviously).

- Rebase and merge can still create conflicts. And conflicts will create "merge commits". All this is fine and can be expected.
    > If rebase creates conflicts especailly when you have a lot of commits, it's always best to abort the rebase and use merge instead. 

- Never use '--force' or '-f' or '-D' with your git commands (even if git tells you to use it) unless you know EXACTLY what you are doing. 


