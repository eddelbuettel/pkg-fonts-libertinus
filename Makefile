
## Minimal and hackish packaging for Libertinus
##
## This Makefile downloads from GitHub, extracts the OTF files and
## lets the Debian packaging in debian/ do the rest. Just call
##
##     dpkg-buildpackage -rfakeroot -us -uc -tc
##
## or just
##
##     runMe.sh
##
## to have the package build using 'fake' suid, do not sign (as we're
## not uploading anywhere) and clean.
##
## Copyright (C) 2016 - 2018  Dirk Eddelbuettel
## and released under GPL (>=2 )


srcfile=https://github.com/libertinus-fonts/libertinus/releases/download/v6.6/libertinus-6.6.zip
outfile=$(shell basename ${srcfile})

all:
	test -f ${outfile} || wget ${srcfile} 
	unzip ${outfile}
	mkdir otf 
	mv libertinus-?.?/*.otf otf/
	rm -rf libertinus-?.?

clean:
	rm -rf ${outfile} libertinus-?.?/ otf/
