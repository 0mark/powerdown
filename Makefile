PREFIX = /usr/local
ETCPREFIX = /etc
SYSPREFIX = ${PREFIX}

install:
	install -D powerdown-functions ${DESTDIR}${PREFIX}/lib/powerdown-functions

	mkdir -p ${DESTDIR}${PREFIX}/bin

	sed "s#ETCPREFIX#${ETCPREFIX}#g;s#PREFIX#${PREFIX}#g" < powerdown > ${DESTDIR}${PREFIX}/bin/powerdown
	chmod a+x ${DESTDIR}${PREFIX}/bin/powerdown

	sed "s#ETCPREFIX#${ETCPREFIX}#g;s#PREFIX#${PREFIX}#g" < powerup > ${DESTDIR}${PREFIX}/bin/powerup
	chmod a+x ${DESTDIR}${PREFIX}/bin/powerup

	sed "s#PREFIX#${PREFIX}#g" < powernow > ${DESTDIR}${PREFIX}/bin/powernow
	chmod a+x ${DESTDIR}${PREFIX}/bin/powernow

	install -D conf ${DESTDIR}${PREFIX}/powerdown/conf
	chmod a+x ${DESTDIR}${ETCPREFIX}/powerdown/conf

	install -D powerdown.rules ${DESTDIR}${SYSPREFIX}/lib/udev/rules.d/99-powerdown.rules

	install -d ${DESTDIR}${ETCPREFIX}/powerdown/down

	install -d ${DESTDIR}${ETCPREFIX}/powerdown/up

uninstall:
	rm ${PREFIX}/lib/powerdown-functions
	rm ${PREFIX}/bin/powerdown
	rm ${PREFIX}/bin/powerup
	rm ${PREFIX}/bin/powernow
	rm ${SYSPREFIX}/lib/udev/rules.d/99-powerdown.rules
