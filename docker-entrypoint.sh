#!/bin/bash
set -e

if [ "$1" = 'exim' ]; then
	if [ "$(id -u)" = '0' ]; then
		mkdir -p /var/spool/exim4 /var/log/exim4 || :
		chown -R Debian-exim:Debian-exim /var/spool/exim4 /var/log/exim4 || :
	fi

	update-exim4.conf -v

	set -- tini -- "$@"
fi

exec "$@"