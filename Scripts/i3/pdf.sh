
desc_dir=$HOME/Desktop/lambda-cases/description/description.ltx
wait_time=4

gnome-terminal -- sh -c "cd $desc_dir; vim description.tex" &
sleep $(($wait_time/2))
okular $desc_dir/Pdf/description.pdf &
