reset
set terminal epslatex color
set output 'Diffprofil.tex'
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

p 'Diffprofil40.dat' u (($2+$3)/2-5.45):(1/$1) t'Messung 3',\
f1(x) t'32 min', f2(x) t'48min',\
'Diffprofil100.dat' u (($2+$3)/2-4.975):(1/$1) t'Messung 4',\
f3(x) t'86 min', f4(x) t'95 min'
   

set output
!epstopdf Diffprofil.eps