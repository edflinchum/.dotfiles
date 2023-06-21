# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Load distro default config
if [ -f  /etc/skel/.bashrc ]; then
  source /etc/skel/.bashrc
fi

# Load personal config
if [ -f  ~/.config/personal/bashrc-personal.bash ]; then
  source ~/.config/personal/bashrc-personal.bash
fi
