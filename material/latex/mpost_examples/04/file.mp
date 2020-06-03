u:=25;                    % 25 = 25bp = 25 PostP102cript points = 25/72 in
wi:=10;                   % width  in units u   
he:=10;                   % height in units u
hoehe:=he*u;              % height
breite:=wi*u;             % width
path p[];
pair P[], versch, vs;

P0:=(6.875, hoehe-6.875);     % starting point top left

vardef hilbertPath(expr s, n) =
  %
  %  recursively calculates and returns path ``hilb''
  %  of segment length s and depth n
  %
  pair versch;
  path hilb, hilbOLD; 
  versch:=(s, 0); 
  % --- Calculation of path ``hilb'' ---
  if n=0:
    hilb:=P0;
  else:
    hilbOLD:=hilbertPath(s, n-1);    
    p100:=hilbOLD reflectedabout(P0, P0 shifted (1, -1));
    P100:=point length(p100) of p100;  
    vs:=P100-P0;   
    p101:=hilbOLD shifted (vs+versch);
    P101:=point 0 of p101;  
    hilb:=p100&P100--P101&p101;  
    P102:=P101 shifted ((vs+.5versch) rotated -90);  
    p102:=reverse hilb reflectedabout(P102, P102 shifted (1,0));
    hilb:=hilb&point length(hilb) of hilb--point 0 of p102&p102;        
  fi
  % --- End: Calculation of path ``hilb'' ---  
  hilb         % return path ``hilb''
enddef;

beginfig(1)  
  draw (0, 0)--(breite, 0)--(breite, hoehe)--(0, hoehe)--cycle;
  
  draw hilbertPath(3.72, 6);  % Draw Hilbert curve of segment length
                              % 3.72 PostScript points and depth 6
  
  % draw hilbertPath(2, 7);   % maximum possible depth 
                              % with main memory size=1000001  
endfig;

end
    
