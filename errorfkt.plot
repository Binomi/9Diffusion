reset
set terminal epslatex color
set output 'errorfkt.tex'
set xlabel '$x$ [mm]'
set ylabel '$c(x,t)/c_0$'
set key top right
set xrange [-5:5]
set yrange [-0.1:1.1]

f0(x)=(x<0)?1:0
f1(x)=0.5*(1-erf(x/(4*D*t1)**0.5))
f2(x)=0.5*(1-erf(x/(4*D*t2)**0.5))
f3(x)=0.5*(1-erf(x/(4*D*t3)**0.5))
f4(x)=0.5*(1-erf(x/(4*D*t4)**0.5))

D=4e-4
t1=60*30
t2=60*90
t3=60*60*6
t4=60*60*24*2


p f0(x) lt -1 lw 3 title '$t=0$',\
f1(x) lw 3 t '$t=30~\si{\minute}$',\
f2(x) lw 3 t '$t=90~\si{\minute}$',\
f3(x) lw 3 t '$t=6~\si{\hour}$',\
f4(x) lw 3 t '$t=2~\si{\day}$'

set output
!epstopdf errorfkt.eps