#!/usr/bin/zsh -i
unset HISTFILE
/usr/bin/zsh -l -c "'/usr/bin/python' -c 'import os; print(dict(os.environ))'"
