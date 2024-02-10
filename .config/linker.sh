
CONFIG="~/.config/"
for dir in ~/.dotfiles/*; do
  # Check if target directory exists before creating link
  if [[ -d "$dir" ]]; then
    echo $dir
    if [[ ! -d $CONFIG$dir ]]; then
      mkdir -p $CONFIG$dir
    fi
    echo $CONFIG$dir
    # ln -s ./$dir $CONFIG$dir
  fi
done

