##
## Makefile for managing simple NetHirc-related tasks
##
## $Id$
##

FILES= Files.base
PRODUCT= cowsay
VER= 3.03
BASE= ${PRODUCT}-${VER}
TARZ= ${BASE}.tar.Z
TARGZ= ${BASE}.tar.gz
TARS= ${TARZ} ${TARGZ}
SIGZ= ${TARZ}.sig
SIGGZ= ${TARGZ}.sig
SIGS= ${SIGZ} ${SIGGZ}
FTP= jariten:ftp/cowsay

release: run-pax sign upload

tar: run-pax

run-pax: ${FILES}
	-chmod +x install.sh
	pax -w -d -x tar \
		-s ",^,${BASE}/," \
		-f ${BASE}.tar \
		`cat ${FILES}`
	gzip -c ${BASE}.tar > ${TARGZ}
	compress ${BASE}.tar

sign: ${TARS}
	for i in ${TARS}; do pgp -sb $$i; done
	chmod 644 ${SIGS}

upload: ${TARS} ${SIGS}
	scp ${TARS} ${SIGS} ${FTP}

clean: 
	-rm -f ${TARS} ${SIGS}
