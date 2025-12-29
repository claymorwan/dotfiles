n_gen=$(nh os info | wc -l)
if [[ $n_gen -eq 0 ]]; then
  echo 0
else
  echo $((n_gen - 4))
fi
