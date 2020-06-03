verbatimtex
%&latex
\documentclass{article}
\newcommand{\klein}{\sffamily\scriptsize}
\begin{document}
etex

% 06.09.02
% latex2html omitted the matrix parentheses
% So LaTeXLabels.png was rendered by means
% of pdfLaTeX which did the job beautifully
%
% Then LaTeXLabels.pdf was converted to
% LaTeXLabels.png with the use of "gimp"
%

def draw_point(expr P) =
  save r;
  r:=1.5mm;
  unfill fullcircle scaled r shifted P;
  draw   fullcircle scaled r shifted P;
enddef;

u:=20;
breite:=12.5u;
hoehe:=11u;
path p[];
picture pic[];
transform t, T;
T:=identity scaled 2.5;
bboxmargin:=5;                        % internal variable bboxmargin: default is 2 (bp)

beginfig(1)
  z0=(0,0);                           % z0: origin  
  t:=identity scaled u;
  z1=(8.5, 7) transformed t;        % z1: top left, list of transform components
  
  p1:=halfcircle scaled 2 rotated -30 shifted (1.7 ,3);
  p1:=p1 transformed t;
  
  p2:=p1 transformed T;
  
  z11=point 0 of p1;
  z12=point infinity of p1;
  z10=point 1.5 of p1;
  
  z21=z11 transformed T;
  z22=z12 transformed T;
  z20=z10 transformed T;
  
  pic1:=\thelabel.lft(btex \sffamily\bfseries T:= identity scaled 2.5 etex,         
                                     (breite-.6u, 10.3u));  
  %
  % The \cdot command doesn't work with LaTeX2html version 2002 - 1
  %
  pic2:=\thelabel.lft(
    btex $
      \begin{array}{rcl}
        x' & = & T_x + T_{xx}\raisebox{.5ex}{.}x + T_{xy}\raisebox{.5ex}{.}y \\
        y' & = & T_y + T_{yx}\raisebox{.5ex}{.}x + T_{yy}\raisebox{.5ex}{.}y
      \end{array} 		   
    $ etex, 
    (breite-.6u, 1.4u)
  );

  % frame
  draw (0, 0)--(breite, 0)--(breite, hoehe)--(0, hoehe)--cycle;  
  
  % grid
  for i=1 upto 10:    
    draw ((0, i)--(8, i)) transformed t withcolor .7white;    
  endfor
  for j=1 upto 8:
    draw ((j, 0)--(j, 11)) transformed t withcolor .7white;
  endfor    

  % scaling
  draw z0--z21 withcolor red;
  draw z0--z22 withcolor red;
  draw z0--z20 withcolor red;  
  for i=1 upto 5:
    draw p1 scaled .5i withcolor red;
  endfor

  pickup pencircle scaled 2;
  draw p1;
  draw p2;
  
  label.lft(btex \klein Urs Oswald 08.09.2002 etex rotated 90, (breite, .5hoehe));
  label.lrt(btex $\mathcal{P}_1$ etex, z11);
  label.lft(btex $\mathcal{P}_2$ etex, z12);  
					      %
					      % mm is a purely numerical value:                                                       
					      % It is the ratio of 1mm to 1bp.
					      %
  label.rt(btex $\mathcal{P}=(x,y)$   etex, z10+mm*(1, 0)); 
  
  label.lrt(btex $\mathcal{P}_1'$ etex, z21);
  label.lft(btex $\mathcal{P}_2'$ etex, z22);
  label.lft(btex $\mathcal{P}'=(x',y')$ etex, z20-mm*(1,0));
 
  pickup pencircle scaled .5;
  for i=11, 12, 10, 21, 22, 20:
    draw_point(z[i]);
  endfor
				     
  % 
  % Strings can be catenated by the operator `&'.
  %
  label.rt("mm="&decimal mm,         z1+(0, 1.3u));
  
  %
  % Show the 6 components xpart, ypart, xxpart, xypart, yxpart, yypart
  % of transformation T
  %
  label.rt ("Tx="&decimal(xpart  T), z1);  y1:=y1-.6u;
  label.rt ("Ty="&decimal(ypart  T), z1);  y1:=y1-.6u;
  label.rt("Txx="&decimal(xxpart T), z1);  y1:=y1-.6u;
  label.rt("Txy="&decimal(xypart T), z1);  y1:=y1-.6u;
  label.rt("Tyx="&decimal(yxpart T), z1);  y1:=y1-.6u;
  label.rt("Tyy="&decimal(yypart T), z1);  y1:=y1-.6u;
		 		 
  unfill bbox pic1; draw pic1; draw bbox pic1;
  unfill bbox pic2; draw pic2; draw bbox pic2;   		 
endfig;

end
    
