
PREFIX = /usr/local

rva: rva.sh rva.awk rva.tsv
	cat rva.sh > $@
	echo 'exit 0' >> $@
	echo "#EOF" >> $@
	tar cz rva.awk rva.tsv >> $@
	chmod +x $@

test: rva.sh
	shellcheck -s sh rva.sh

clean:
	rm -f rva

install: rva
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f rva $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/rva

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/rva

.PHONY: test clean install uninstall
