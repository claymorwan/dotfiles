shimejis=("ENA-shimeji_by_keryiz" "ena" "Neuron" "Weuron" "Eviling")
for shimeji in ${shimejis[@]}; do
  shijima-qt spawn --name $shimeji
done
