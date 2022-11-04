#!/bin/sh
PGSQL=/usr
MATCHES=(/usr/pgsql-*)
if [[ ${#MATCHES[@]} -gt 0 ]] ; then
  CNT=${#MATCHES[@]}
  PGSQL=${MATCHES[$CNT-1]}
  PG_VERSION=${PGSQL##*-}
fi
rpmbuild --define "pgconfig ${PGSQL}" --define "dist ${DIST:-}.apnscp" --define "_topdir `pwd`" -ba SPECS/apr-util.spec
