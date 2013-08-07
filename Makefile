PREFIX = /usr/local
ETCPREFIX = /etc
SYSPREFIX = ${PREFIX}

install:
	install -D powerdown-functions $(DESTDIR)${PREFIX}/lib/powerdown-functions
	mkdir -p ${DESTDIR}${PREFIX}/bin
	sed "s#PREFIX#${PREFIX}#g" < powerdown > ${DESTDIR}${PREFIX}/bin/powerdown
	chmod a+x ${DESTDIR}${PREFIX}/bin/powerdown
	sed "s#PREFIX#${PREFIX}#g" < powerup > ${DESTDIR}${PREFIX}/bin/powerup
	chmod a+x ${DESTDIR}${PREFIX}/bin/powerup
	sed "s#PREFIX#${PREFIX}#g" < powernow > ${DESTDIR}${PREFIX}/bin/powernow
	chmod a+x ${DESTDIR}${PREFIX}/bin/powernow
	sed "s#PREFIX#${PREFIX}#g" < suspend-to-mem > ${DESTDIR}${PREFIX}/bin/suspend-to-mem
	chmod a+x ${DESTDIR}${PREFIX}/bin/suspend-to-mem
	sed "s#PREFIX#${PREFIX}#g" < suspend-to-disk > ${DESTDIR}${PREFIX}/bin/suspend-to-disk
	chmod a+x ${DESTDIR}${PREFIX}/bin/suspend-to-disk
	sed "s#PREFIX#${PREFIX}#g" < suspend-hybrid > ${DESTDIR}${PREFIX}/bin/suspend-hybrid
	chmod a+x ${DESTDIR}${PREFIX}/bin/suspend-hybrid
	sed "s#PREFIX#${PREFIX}#g" < pm-utils/pm-is-supported > ${DESTDIR}${PREFIX}/bin/pm-is-supported
	chmod a+x ${DESTDIR}${PREFIX}/bin/pm-is-supported
	install -D pm-utils/pm-powersave $(DESTDIR)${PREFIX}/bin/pm-powersave
	install -D pm-utils/pm-suspend $(DESTDIR)${PREFIX}/bin/pm-suspend
	install -D pm-utils/pm-hibernate $(DESTDIR)${PREFIX}/bin/pm-hibernate
	install -D pm-utils/pm-suspend-hybrid $(DESTDIR)${PREFIX}/bin/pm-suspend-hybrid
	install -D powerdown.rules $(DESTDIR)${SYSPREFIX}/lib/udev/rules.d/99-powerdown.rules
	install -D power_supply@.service $(DESTDIR)${SYSPREFIX}/lib/systemd/system/power_supply@.service
	install -D power_supply $(DESTDIR)${PREFIX}/bin/power_supply
	install -d $(DESTDIR)${ETCPREFIX}/powerdown
	install -d $(DESTDIR)${ETCPREFIX}/powerup

uninstall:
	rm ${PREFIX}/lib/powerdown-functions
	rm ${PREFIX}/bin/powerdown
	rm ${PREFIX}/bin/powerup
	rm ${PREFIX}/bin/powernow
	rm ${PREFIX}/bin/suspend-to-mem
	rm ${PREFIX}/bin/suspend-to-disk
	rm ${PREFIX}/bin/suspend-hybrid
	rm ${PREFIX}/bin/pm-is-supported
	rm ${PREFIX}/bin/pm-powersave
	rm ${PREFIX}/bin/pm-suspend
	rm ${PREFIX}/bin/pm-hibernate
	rm ${PREFIX}/bin/pm-suspend-hybrid
	rm ${SYSPREFIX}/lib/udev/rules.d/99-powerdown.rules
	rm ${SYSPREFIX}/lib/systemd/system/power_supply@.service
	rm ${PREFIX}/bin/power_supply
