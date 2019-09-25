# Makefile for SlackBuilds

# Copyright (C) 2017 Ryan S. Northrup <northrup@yellowapple.us>
#
# Permission to use, copy, modify, and/or distribute this software for
# any purpose with or without fee is hereby granted.
#
# THE WORK IS PROVIDED "AS IS" AND ALL AUTHORS AND CONTRIBUTORS
# DISCLAIM ALL WARRANTIES WITH REGARD TO THIS WORK INCLUDING ALL
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL
# THE AUTHORS OR CONTRIBUTORS BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER
# RESULTING FROM LOSS OF USE, DATA, OR PROFITS, WHETHER IN AN ACTION
# OF CONTRACT, NEGLIGENCE, OR OTHER TORTIOUS ACTION, ARISING OUT OF OR
# IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

# INSTRUCTIONS FOR USE/MODIFICATION
#
# Each SlackBuild should be contained in a directory named after the
# "foo" in "foo.SlackBuild".  A macro/variable in this Makefile called
# "foo_manifest" should be defined with the full list of files that
# should actually go into the SlackBuild archive (thus preventing
# upstream source code from being part of the SlackBuild during the
# resulting packaging process).  "foo.SlackBuild" should then be
# included as a dependency target for the "all" target.  The Makefile
# should then handle the rest when you run 'make' and spit out the
# packed-up SlackBuilds in '.out/'.  You can also run 'make clean' to
# clean out the '.out/' folder.
#
# See below for some examples of what it looks like to handle a
# SlackBuild this way.  There's probably room for significant
# improvement, but this seems to work at least reasonably well.

brlcad_manifest			=					\
	brlcad/README							\
	brlcad/README.SLACKWARE						\
	brlcad/brlcad.SlackBuild					\
	brlcad/brlcad.info						\
	brlcad/brlcad.patch						\
	brlcad/brlcad.png						\
	brlcad/brlcad_archer.desktop					\
	brlcad/brlcad_mged.desktop					\
	brlcad/doinst.sh						\
	brlcad/profile.d/brlcad.csh					\
	brlcad/profile.d/brlcad.sh					\
	brlcad/slack-desc

couchdb_manifest		=					\
	couchdb/README 							\
	couchdb/README.SLACKWARE 					\
	couchdb/couchdb.SlackBuild 					\
	couchdb/couchdb.info 						\
	couchdb/doinst.sh 						\
	couchdb/slack-desc

elixir_manifest			=					\
	elixir/README 							\
	elixir/elixir.SlackBuild 					\
	elixir/elixir.info 						\
	elixir/slack-desc

erlang-otp_manifest 		=					\
	erlang-otp/README 						\
	erlang-otp/doinst.sh 						\
	erlang-otp/erlang-otp.SlackBuild 				\
	erlang-otp/erlang-otp.info 					\
	erlang-otp/slack-desc

gauche_manifest			=					\
	gauche/README							\
	gauche/gauche.SlackBuild					\
	gauche/gauche.info						\
	gauche/slack-desc

geany-plugins_manifest		=					\
	geany-plugins/README						\
	geany-plugins/doinst.sh						\
	geany-plugins/geany-plugins.SlackBuild				\
	geany-plugins/geany-plugins.info				\
	geany-plugins/slack-desc

geany_manifest			=					\
	geany/README							\
	geany/doinst.sh							\
	geany/geany.SlackBuild						\
	geany/geany.info						\
	geany/slack-desc

peg_manifest			=					\
	peg/README							\
	peg/peg.SlackBuild						\
	peg/peg.info							\
	peg/slack-desc

perl-class-accessor_manifest	=					\
	perl-class-accessor/README					\
	perl-class-accessor/perl-class-accessor.SlackBuild		\
	perl-class-accessor/perl-class-accessor.info			\
	perl-class-accessor/slack-desc

perl-file-path-expand_manifest	=					\
	perl-file-path-expand/README					\
	perl-file-path-expand/perl-file-path-expand.SlackBuild		\
	perl-file-path-expand/perl-file-path-expand.info		\
	perl-file-path-expand/slack-desc

perl-lirc-client_manifest	=					\
	perl-lirc-client/README						\
	perl-lirc-client/perl-lirc-client.SlackBuild			\
	perl-lirc-client/perl-lirc-client.info				\
	perl-lirc-client/slack-desc

perl-tk_manifest		=					\
	perl-tk/README							\
	perl-tk/patches/perl-tk-804.031.diff				\
	perl-tk/patches/perl_bin_path.diff				\
	perl-tk/perl-tk.SlackBuild					\
	perl-tk/perl-tk.info						\
	perl-tk/slack-desc

scrot_manifest			=					\
	scrot/README							\
	scrot/scrot.SlackBuild						\
	scrot/scrot.info						\
	scrot/slack-desc

sfnt2woff_manifest		=					\
	sfnt2woff/README 						\
	sfnt2woff/sfnt2woff.SlackBuild 					\
	sfnt2woff/sfnt2woff.info 					\
	sfnt2woff/slack-desc

solvespace_manifest		=					\
	solvespace/README						\
	solvespace/doinst.sh						\
	solvespace/solvespace.SlackBuild				\
	solvespace/solvespace.info					\
	solvespace/slack-desc

OUT 	= ./out
TAR 	= tar caf
GZIP 	= gzip

all: 	brlcad.SlackBuild			\
	couchdb.SlackBuild			\
	elixir.SlackBuild			\
	erlang-otp.SlackBuild			\
	gauche.SlackBuild			\
	geany-plugins.SlackBuild		\
	geany.SlackBuild			\
	peg.SlackBuild				\
	perl-class-accessor.SlackBuild		\
	perl-file-path-expand.SlackBuild	\
	perl-lirc-client.SlackBuild		\
	perl-tk.SlackBuild			\
	scrot.SlackBuild			\
	sfnt2woff.SlackBuild

outdir: ; mkdir -p $(OUT)

%.SlackBuild: outdir ; $(TAR) $(OUT)/$*.tar.gz $($*_manifest)

clean: FRC ; rm $(OUT)/*
FRC:
