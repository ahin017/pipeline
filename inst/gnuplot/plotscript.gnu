cd "H:/2013/Summer_project/rwd"
set terminal png truecolor
set output "grpimage.png"
set grid
set xtic rotate by -90
set style data histograms
set style fill solid 1.00 border -1
plot "plotdata.txt" using 3:xtic(1) title "AIDs"