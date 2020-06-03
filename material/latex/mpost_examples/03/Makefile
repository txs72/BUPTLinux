file.pdf: file.ps
	ps2pdf file.ps file.pdf
	
file.ps: file.dvi
	dvips -o file.ps file

file.dvi: file.tex file.1
	latex file.tex

file.1: file.mp
	mpost file.mp

clean: 
	rm -f file.aux file.log file.mpx  file.dvi file.1 file.ps file.mpx file.pdf


