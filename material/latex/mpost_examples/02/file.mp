
verbatimtex
  \font\cyr=wncyr10
etex

u:=50;                    % 50 = 50bp = 50 PostScript points = 50/72 in
wi:=5;                    % width  in units u   
he:=3.5;                  % height in units u
hoehe:=he*u;              % height
breite:=wi*u;             % width
path p, q[];
transform t;
picture lab[];

beginfig(1)
  z0=.5(u,u);
  t:=identity scaled u shifted z0;

  z1=(3.5, 0) transformed t;
  z2=(0, 2.5) transformed t;
    
  p:=(.5, 2) for i=2 upto 6: ..(.5i, 1/(.5i)) endfor ;
  p:=p transformed t;
  
  q0:=((1,   -0.5)--(1, 2.5))   transformed t;
  q1:=((2.8, -0.5)--(2.8, 2.5)) transformed t;
  
  q2:=buildcycle(z0--z1, q1, p, q0);
  
  lab0:=thelabel(btex $A$ etex, center q2 shifted (0, -u/4));
  lab1:=thelabel(btex $\displaystyle A=\int_1^a {dx\over x}=\ln a$ etex, 
                    (2, 1.5) transformed t);
  
  % frame
  draw (0, 0)--(breite, 0)--(breite, hoehe)--(0, hoehe)--cycle;
  
  fill q2 withcolor .9white;

  % --- Grid ---
  for i=0 upto 2:
    draw ((0, i)--(3, i)) transformed t withcolor .7white;
  endfor
  for j=0 upto 3:
    draw ((j, 0)--(j, 2)) transformed t withcolor .7white;
  endfor
  % --- End Grid ---
  
  drawarrow z0--z1;                % x-Achse
  drawarrow z0--z2;                % y-Achse  
    
  draw q0 cutbefore (z0--z1) cutafter p;
  draw q1 cutbefore (z0--z1) cutafter p;
    
  pickup pencircle scaled 2;
  draw p;
  
  % ============================== labels ====================================
  
  label.rt(btex $x$ etex, z1);
  label.top(btex $y$ etex, z2);
  
  label.bot(btex $1$ etex, (z0--z1) intersectionpoint q0);  
  label.bot(btex $a$ etex, (z0--z1) intersectionpoint q1);  
  
  label.top(btex $\displaystyle y={1\over x}$ etex, (.5, 2) transformed t);
  
  unfill bbox lab0; draw lab0;
  unfill bbox lab1; draw lab1;
  
  label.lft(btex Logarithm and area etex, (3.7, 2.6) transformed t);
  label.lft(btex 
            \cyr  logarifm i plowad\char126  
	    etex scaled 1.1, (3.7, 2.4) transformed t);
	    
  label.ulft(btex Urs Oswald etex rotated  90, (breite, 0));	    
  label.llft(btex 06.09.2002 etex rotated -90, (breite, hoehe));	    
  
  % ============================== labels ====================================
  
endfig;

end

