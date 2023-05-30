
wget -O gullivers_travels.txt http://www.gutenberg.org/cache/epub/829/pg829.txt

pnum=(2 3 5 7 11)


for number in "${pnum[@]}"; do
  mkdir "$number"
done



lines=$(wc -l < gullivers_travels.txt)
lines_per_part=$((lines / 5))
split -l "$lines_per_part" gullivers_travels.txt


part=1
for part in x*; do
  mv "$part" "$part_num/"
  part=$((part + 1))
done

