# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Load distro default config
if [ -f  /etc/skel/.bashrc ]; then
  source /etc/skel/.bashrc
fi

# Load personal configuration
for config_file in $HOME/.config/bash/*.bash; do
  [ -r $config_file ] && source $config_file
done
unset config_file
