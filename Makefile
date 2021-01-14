.RECIPEPREFIX +=                          # Allow the usage of spaces here

brews_install:
    brew install delta                # fancy fast diffs
    brew install prettyping           # beautiful ping
    brew install fd                   # alternative to find, which does what one assumes
    brew install ripgrep              # fast grepping
    brew install bat                  # alternative to cat
    brew install exa                  # modern ls
    brew install fzf                  # fuzzy finder
    brew install fasd                 # quick access to files and directories
    brew install zoxide
    brew install thefuck              # I made a mistake, correct it
    brew install tldr                 # tldr; alternative to man
    brew install youtube-dl           # process youtube videos
    brew install ncdu                 # disk usage analyzer
    brew install asciinema            # screencast from terminal
    brew install --HEAD denisidoro/tools/navi # interactive cheatsheet tool for the cli
    brew tap git-time-metric/gtm      # git time metrics
    brew install gtm
    brew tap augmentable-dev/tickgit
    brew install tickgit
    # brew install visidata            # cli spreadsheets 
    # TODO: Still in a pull request:
    # visidata 0.98.1 (new formula) (https://github.com/Homebrew/homebrew-core/pull/21577)
