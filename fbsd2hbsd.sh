#!/usr/bin/env tcsh 

cd /tmp 
fetch https://raw.githubusercontent.com/HardenedBSD/hardenedBSD/hardened/11-stable/master-libressl/{usr.sbin/hbsd-update/hbsd-update,etc/hbsd-update.conf,share/keys/hbsd-update/trusted/ca.hardenedbsd.org,share/keys/hbsd-update/trusted/dnssec.key-2016-07-30}
sed -i -e '/^UNBOUND_HOST=/ s/\/usr\/sbin\/unbound-host/\/usr\/local\/sbin\/unbound-host/' hbsd-update
chmod +x hbsd-update

mv hbsd-update /usr/sbin
mv hbsd-update.conf /etc
mkdir -p /usr/share/keys/hbsd-update/trusted
mv ca.hardenedbsd.org /usr/share/keys/hbsd-update/trusted
mv dnssec.key-2016-07-30 /usr/share/keys/hbsd-update/trusted
ln -s /usr/share/keys/hbsd-update/trusted/ca.hardenedbsd.org /usr/share/keys/hbsd-update/trusted/5905e1b4.0
ln -s /usr/share/keys/hbsd-update/trusted/dnssec.key-2016-07-30 /usr/share/keys/hbsd-update/trusted/dnssec.key

# Sketchy hacks afoot (make it so hbsd doesn't have any merge conflicts with the current freebsd system. I'm lazy.)
rm /etc/ssh/sshd_config
rm /etc/motd

/usr/sbin/hbsd-update
