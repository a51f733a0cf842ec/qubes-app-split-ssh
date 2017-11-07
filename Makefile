install:
	install -d $(DESTDIR)/usr/bin
	install secure-ssh-agent $(DESTDIR)/usr/bin
	install secure-ssh-agent.agent $(DESTDIR)/usr/bin

uninstall:
	rm $(DESTDIR)/usr/bin/secure-ssh-agent
	rm $(DESTDIR)/usr/bin/secure-ssh-agent.agent
