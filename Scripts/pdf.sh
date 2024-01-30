desc_dir=$HOME/Desktop/lambda-cases/description/description.ltx

gnome-terminal -- sh -c "cd $desc_dir; vim description.tex" &
okular $desc_dir/Pdf/description.pdf &
