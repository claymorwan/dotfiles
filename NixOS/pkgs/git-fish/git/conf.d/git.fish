set -g __git_fish_version 0.1.0

alias grt 'cd "$(git rev-parse --show-toplevel || echo .)"'


abbr g 'git'
abbr ga 'git add'
abbr gaa 'git add --all'
abbr gapa 'git add --patch'
abbr gau 'git add --update'
abbr gav 'git add --verbose'
alias gwip 'git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"'

abbr gam 'git am'
abbr gama 'git am --abort'
abbr gamc 'git am --continue'
abbr gamscp 'git am --show-current-patch'
abbr gams 'git am --skip'

abbr gap 'git apply'
abbr gapt 'git apply --3way'

abbr gbs 'git bisect'
abbr gbsb 'git bisect bad'
abbr gbsg 'git bisect good'
abbr gbsn 'git bisect new'
abbr gbso 'git bisect old'
abbr gbsr 'git bisect reset'
abbr gbss 'git bisect start'

abbr gbl 'git blame -w'

abbr gb 'git branch'
abbr gba 'git branch --all'
abbr gbd 'git branch --delete'
abbr gbD 'git branch --delete --force'
alias gbgd 'LANG=C git branch --no-color -vv | grep ": gone\]" | cut -c 3- | awk '"'"'{print $1}'"'"' | xargs git branch -d'
alias gbgD ' 	LANG=C git branch --no-color -vv | grep ": gone\]" | cut -c 3- | awk '"'"'{print $1}'"'"' | xargs git branch -D'
abbr gbm 'git branch --move'
abbr gbnm 'git branch --no-merged'
abbr gbr 'git branch --remote'
alias ggsup 'git branch --set-upstream-to=origin/$(git_current_branch)'
alias gbg 'LANG=C git branch -vv | grep ": gone\]"'

abbr gco 'git checkout'
abbr gcor 'git checkout --recurse-submodules'
abbr gcb 'git checkout -b'
abbr gcB 'git checkout -B'
#TODO abbr gcd 'git checkout $(git_develop_branch)'
#TODO gcm func git_main_branch

abbr gcp 'git cherry-pick'
abbr gcpa 'git cherry-pick --abort'
abbr gcpc 'git cherry-pick --continue'

abbr gclean 'git clean --interactive -d'

abbr gcl 'git clone --recurse-submodules'
alias gclf 'git clone --recursive --shallow-submodules --filter=blob:none --also-filter-submodules'
alias gccd 'git clone --recurse-submodules "$argv" && cd "$(basename $_ .git)"'

abbr gcam 'git commit --all --message'
abbr gcas 'git commit --all --signoff'
abbr gcasm 'git commit --all --signoff --message'
abbr gcmsg 'git commit --message'
abbr gcsm 'git commit --signoff --message'
abbr gc 'git commit --verbose'
abbr gca 'git commit --verbose --all'
abbr gca! 'git commit --verbose --all --amend'
abbr gcan! 'git commit --verbose --all --no-edit --amend'
abbr gcans! 'git commit --verbose --all --signoff --no-edit --amend'
abbr gcann! 'git commit --verbose --all --date=now --no-edit --amend'
abbr gc! 'git commit --verbose --amend'
abbr gcn 'git commit --verbose --no-edit'
abbr gcn! 'git commit --verbose --no-edit --amend'
abbr gcs 'git commit -S'
abbr gcss 'git commit -S -s'
abbr gcssm 'git commit -S -s -m'
abbr gcfu 'git commit --fixup'

abbr gcf 'git config --list'

alias gdct 'git describe --tags $(git rev-list --tags --max-count=1)'

abbr gd 'git diff'
abbr gdca 'git diff --cached'
abbr gdcw 'git diff --cached --word-diff'
abbr gds 'git diff --staged'
abbr gdw 'git diff --word-diff'
alias gdv 'git diff -w "$argv" | view -'
alias gdup 'git diff @{upstream}'
alias gdnolock 'git diff $argv ":(exclude)package-lock.json" ":(exclude)\*.lock"'
abbr gdt 'git diff-tree --no-commit-id --name-only -r'

abbr gf 'git fetch'
abbr gfa 'git fetch --all --tags --prune'
abbr gfo 'git fetch origin'

abbr gg 'git gui citool'
abbr gga 'git gui citool --amend'

abbr gh 'git help'

abbr glgg 'git log --graph'
abbr glgga 'git log --graph --decorate --all'
abbr glgm 'git log --graph --max-count=10'
alias glod 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset"'
alias glods 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" --date=short'
alias glol 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"'
alias glola 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --all'
alias glols 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --stat'
abbr glo 'git log --oneline --decorate'
abbr glog 'git log --oneline --decorate --graph'
abbr gloga 'git log --oneline --decorate --graph --all'
# abbr glp 'git log --pretty=<format>'
abbr glg 'git log --stat'
abbr glgp 'git log --stat --patch'

alias gignored 'git ls-files -v | grep "^[[:lower:]]"'
alias gfg 'git ls-files | grep'

abbr gm 'git merge'
abbr gma 'git merge --abort'
abbr gmc 'git merge --continue'
abbr gms 'git merge --squash'
abbr gmff 'git merge --ff-only'
#TODO alias gmom 'git merge origin/$(git_main_branch)'
#TODO alias gmum 'git merge upstream/$(git_main_branch)'
abbr gmtl 'git mergetool --no-prompt'
abbr gmtlvim 'git mergetool --no-prompt --tool=vimdiff'

abbr gl 'git pull'
abbr gpr 'git pull --rebase'
abbr gprv 'git pull --rebase -v'
abbr gpra 'git pull --rebase --autostash'
abbr gprav 'git pull --rebase --autostash -v'
#TODO alias gprom 'git pull --rebase origin $(git_main_branch)'
#TODO alias gpromi 'git pull --rebase=interactive origin $(git_main_branch)'
#TODO alias gprum 'git pull --rebase upstream $(git_main_branch)'
#TODO alias gprumi 'git pull --rebase=interactive upstream $(git_main_branch)'
#TODO alias ggpull 'git pull origin "$(git_current_branch)"'
#TODO alias ggl 'git pull origin $(current_branch)'
#TODO alias gluc 'git pull upstream $(git_current_branch)'
#TODO alias glum 'git pull upstream $(git_main_branch)'

abbr gp 'git push'
abbr gpd 'git push --dry-run'
abbr gpf! 'git push --force'
alias ggf 'git push --force origin $(current_branch)'
#TODO gpf
alias ggfl 'git push --force-with-lease origin $(current_branch)'
alias gpsup 'git push --set-upstream origin $(git_current_branch)'
#TODO gpsuf
abbr gpv 'git push --verbose'
alias gpoat 'git push origin --all && git push origin --tags'
abbr gpod 'git push origin --delete'
alias ggpush 'git push origin "$(git_current_branch)"'
alias ggp 'git push origin $(current_branch)'
abbr gpu 'git push upstream'

abbr grb 'git rebase'
abbr grba 'git rebase --abort'
abbr grbc 'git rebase --continue'
abbr grbi 'git rebase --interactive'
abbr grbo 'git rebase --onto'
abbr grbs 'git rebase --skip'
#TODO grbd func git_develop_branch
#TODO grbm func git_main_branch
#TODO grbom func git_main_branch
#TODO grbum func git_main_branch

