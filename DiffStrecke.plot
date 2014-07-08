set terminal epslatex color
set output 'DiffStrecke.tex'
set xlabel 'Zeit [s]'
set ylabel 'Quadrat der Diffusionstrecke [mm$^2$]'
set key top left
#set xrange [0:*]

f(x)=m*x
g(x)=n*x
set fit logfile 'DiffStrecke1.log'
fit f(x) 'DiffStrecke.dat' u 1:(($2-4.77)**2):(2*($2-4.77)*0.02) via m

set fit logfile 'DiffStrecke2.log'
fit g(x) 'DiffStrecke.dat' u 1:(($3-7.55)**2):(2*($3-7.55)*0.02) via n

p 'DiffStrecke.dat' u 1:(($2-4.77)**2):(2*($2-4.77)*0.02) w e title 'Messpunkte c0/16', f(x) lt -1 lc 1 title 'lineare Regression c0/16',\
  'DiffStrecke.dat' u 1:(($3-7.55)**2):(2*($3-7.55)*0.02) w e title 'Messpunkte c0/32', g(x) lt -1 lc 3 title 'lineare Regression c0/32'
set output
!epstopdf DiffStrecke.eps