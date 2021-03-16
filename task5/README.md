### Task

- See git diff on your commits
- Make rewords your commits
- Make squash if it's need

### Solution

Attached files

git_oneline.log - short log  
git_full.log - full log  

Commands

p, pick <commit> = use commit  
r, reword <commit> = use commit, but edit the commit message  
e, edit <commit> = use commit, but stop for amending  
s, squash <commit> = use commit, but meld into previous commit  
f, fixup <commit> = like "squash", but discard this commit's log message  
x, exec <command> = run command (the rest of the line) using shell  
b, break = stop here (continue rebase later with 'git rebase --continue')  
d, drop <commit> = remove commit  
l, label <label> = label current HEAD with a name  
t, reset <label> = reset HEAD to a label  
m, merge [-C <commit> | -c <commit>] <label> [# <oneline>]  
       create a merge commit using the original merge commit's  
       message (or the oneline, if no original merge commit was  
       specified). Use -c <commit> to reword the commit message.  

git add  
git status  
git log --oneline  
git reset main~1  
git rebase --interactive @~N  
git commit --amend  
git rebase --continue  
git push --force  
