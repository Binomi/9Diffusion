reset
set terminal epslatex color
set output 'Diffprofil40.tex'
set xlabel '$x$ [mm]'
set ylabel '$c/c_0$'
set key top right
set xrange [-0.2:6]
set yrange [0:0.55]

f1(x)=0.5*(1-erf(x/(4*D*t1)**0.5))
f2(x)=0.5*(1-erf(x/(4*D*t2)**0.5))
f3(x)=0.5*(1-erf(x/(4*D*t3)**0.5))
f4(x)=0.5*(1-erf(x/(4*D*t4)**0.5))


D=3.63e-4
t1=60*32
t2=60*48
t3=60*86
t4=60*95

p 'Diffprofil40.dat' u (($2+$3)/2-5.45):(1/$1):(($2-$3)/2) w xe t'Messung 3',\
f1(x) t'Theorie 32 min' lt -1 lw 3 lc 2, f2(x) t'Theorie 48 min'  lt -1 lw 3 lc 3

set output
!epstopdf Diffprofil40.eps


set output 'Diffprofil100.tex'

p 'Diffprofil100.dat' u (($2+$3)/2-4.975):(1/$1):(($2-$3)/2) w xe t'Messung 4',\
f3(x) t'Theorie 86 min' lt -1 lw 3 lc 2, f4(x) t'Theorie 95 min' lt -1 lw 3 lc 3

set output
!epstopdf Diffprofil100.eps