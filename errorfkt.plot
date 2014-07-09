reset
set terminal epslatex color
set output 'errorfkt.tex'
set xlabel 'x [mm]'
set ylabel '$C(x,t)/C_0$'
set key top right
set xrange [-3:3]
set yrange [0:1.1]

f0(x)=(x<0)?1:0
f1(x)=0.5*(1-erf(x/(4*D*t1)**0.5))
f2(x)=0.5*(1-erf(x/(4*D*t2)**0.5))

D=4e-4
t1=60*30
t2=60*90


p f0(x) lt -1 lw 3 title '$t=0$',\
f1(x) lw 3 t '$t=30~\si{\minute}$',\
f2(x) lw 3 t '$t=90~\si{\minute}$'

set output
!epstopdf errorfkt.eps