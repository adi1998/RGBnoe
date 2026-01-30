param([switch]$local)

deppth2 hpk -c BC7 -s .\textures\ -t .\data\zerp-RGBnoe

rm -force -recurse data/zerp-RGBnoe

tcli build