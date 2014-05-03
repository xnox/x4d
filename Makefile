all:
	TZ=UTC faketime -f '2014-05-03 00:00:00' ./generate.sh
install:
	mkdir -p $(DESTDIR)/usr/share/icons/X4D/
	cp -r Icons $(DESTDIR)/usr/share/icons/X4D/
clean:
	rm -rf Icons
