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

couchdb_manifest	= 	couchdb/README 				\
				couchdb/README.SLACKWARE 		\
				couchdb/couchdb.SlackBuild 		\
				couchdb/couchdb.info 			\
				couchdb/doinst.sh 			\
				couchdb/slack-desc

elixir_manifest		= 	elixir/README 				\
				elixir/elixir.SlackBuild 		\
				elixir/elixir.info 			\
				elixir/slack-desc

erlang-otp_manifest	= 	erlang-otp/README 			\
				erlang-otp/doinst.sh 			\
				erlang-otp/erlang-otp.SlackBuild 	\
				erlang-otp/erlang-otp.info 		\
				erlang-otp/slack-desc

perl-tk_manifest	=	perl-tk/README				\
				perl-tk/patches/perl-tk-804.031.diff	\
				perl-tk/patches/perl_bin_path.diff	\
				perl-tk/perl-tk.SlackBuild		\
				perl-tk/perl-tk.info			\
				perl-tk/slack-desc

sfnt2woff_manifest	= 	sfnt2woff/README 			\
				sfnt2woff/sfnt2woff.SlackBuild 		\
				sfnt2woff/sfnt2woff.info 		\
				sfnt2woff/slack-desc

OUT 	= ./out
TAR 	= tar caf
GZIP 	= gzip

all: 	couchdb.SlackBuild \
	elixir.SlackBuild \
	erlang-otp.SlackBuild \
	sfnt2woff.SlackBuild

outdir: ; mkdir -p $(OUT)

%.SlackBuild: outdir ; $(TAR) $(OUT)/$*.tar.gz $($*_manifest)

clean: FRC ; rm $(OUT)/*
FRC:
