FROM finalduty/archlinux:weekly

MAINTAINER AUR <aur@schindlerfamily.de>

RUN pacman -Q | awk '{print $1}' | pacman -Syu --noconfirm -; pacman -Scc --noconfirm; rm -r /usr/share/man/*; ls -d /usr/share/locale/* | egrep -v "alias|en|de" | xargs rm -rf; echo "de_DE.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen; echo "LANG=en_US.UTF-8" > /etc/locale.conf

ADD mkimage-gitit__*.sh /root/
RUN for ii in $(cd /root && ls mkimage-gitit__*.sh | sort); do echo "==== running ${ii} ====" && sh /root/${ii} && rm /root/${ii}; done

ADD entrypoint.sh /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

