#! /bin/sh

apt-get --yes update
apt-get --yes install wget equivs curl git

git_commit=$(git rev-parse --short HEAD)

printf >config "%s\n" \
	"Section: misc" \
	"Priority: optional" \
	"Homepage: https://kaytime.github.io" \
	"Package: system-live-user" \
	"Version: $PROJECT_VERSION" \
	"Maintainer: Steph DGenius <stephanetse@gmail.com>" \
	"Depends: adduser" \
	"Architecture: all" \
	"Postinst: postinst" \
	"Postrm: postrm" \
	"Description: Default user for the Kaytime system."

equivs-build config
