set terminal epslatex color
set output 'errorfkt.tex'
set xlabel 'x [mm]'
set ylabel '$C(x,t)/C_0$'
set key bottom left
set xrange [-20:20]
set yrange [0:1.1]

f0(x)=(x<0)?1:0
f1(x)=0.5*(1-erf(x/a1))
f2(x)=0.5*(1-erf(x/a2))

a1=5
a2=15


p f0(x) lt -1 lw 3 title 't=0',\
f1(x) t '$(4Dt)^0.5=5~\si{\milli \meter}$',\
f2(x) t '$(4Dt)^0.5=15~\si{\milli \meter}$'

set output
!epstopdf errorfkt.eps