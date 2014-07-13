reset
set terminal epslatex color
set output 'DiffDisk.tex'
set xlabel 'Zeit [s]'
set ylabel 'Quadrat der Diffusionstrecke [mm$^2$]'
set key under box
#set xrange [0:*]

a1=7.55
a2=6.55

#f(x)=m*x
#g(x)=n*x
#set fit logfile 'DiffStrecke1.log'
#fit f(x) 'DiffStrecke.dat' u 1:(($2-4.77)**2) via m

#set fit logfile 'DiffStrecke2.log'
#fit g(x) 'DiffStrecke.dat' u 1:(($3-6.55)**2) via n

p 'DiffStrecke.dat' u 1:(($2-4.77)**2):(2*($2-4.77)*0.02) w e title '$c_0/16$',\
  'DiffStrecke.dat' u 1:(($3-a1)**2):(2*($3-a1)*0.02) w e title '$c_0/32$',\
  'DiffStrecke.dat' u 1:(($3-a2)**2):(2*($3-a2)*0.02) w e title '$c_0/32$ Startwert um 1 mm verschoben'
set output
!epstopdf DiffDisk.eps