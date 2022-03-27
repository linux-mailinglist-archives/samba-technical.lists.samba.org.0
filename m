Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2434E86B8
	for <lists+samba-technical@lfdr.de>; Sun, 27 Mar 2022 09:52:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=f2VZbTUej4fy0ylC4sdq98Q92L23hreLzCpRuXdWYaE=; b=Hz3wA1ft9N+5WjkGBIh3YZbond
	u+5k/ax8qZ1FDhLd6QU/4BzOyWPU5anLMxGo9OWoa7eWrWpwYeNEoaJivOGkPYFvTtWxfKJTwNgbU
	iedltRMsQxAW9+BXYq5K0bn9/mQdq8S7cISeSpRFAZR1kyJMw6hC6G4caUYO7fIXydGqEX63SHMP3
	1ezC9LK7jKvwZ7VNsgjaNVZZvDn0gIvD7ZvNVYxNFtRklD3s8tc0i+2QsWhKbvuakMErOLL8kfT3g
	+JPTvspi3XauWciy4iTy5hs3kgzXF8H7ouzBRyivrmKq3J4gCs/rRcl+yEER9wIGSxGIub4grOWni
	oS/EJXnA==;
Received: from ip6-localhost ([::1]:60652 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nYNfx-005e1I-8U; Sun, 27 Mar 2022 07:51:01 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:51737) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nYNfn-005e18-8K
 for samba-technical@lists.samba.org; Sun, 27 Mar 2022 07:50:53 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 52629408C3
 for <samba-technical@lists.samba.org>; Sun, 27 Mar 2022 10:50:48 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 1FF1036F
 for <samba-technical@lists.samba.org>; Sun, 27 Mar 2022 10:47:02 +0300 (MSK)
Message-ID: <006ec6d2-39be-80e9-94c5-946dfdd968d9@msgid.tls.msk.ru>
Date: Sun, 27 Mar 2022 10:50:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
To: samba-technical@lists.samba.org
Content-Language: en-US
Subject: building 4.16 for debian (long)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi!

I'm trying to build samba 4.16 for debian. This is my first time to
build samba, and the first time to create debian packages for it, so
it is a double-interesting thing to do  :)

So far I come across several issues during the build process, and I
need some helping hand here. My current prob, it seems, is that I'm
not yet familiar with the build process.

First issue which took quite a lot of my attention was the public
headers of some support libraries (notable tdb and talloc).  There,
all API symbols are prefixed with _PUBLIC_ marker (which falls into
a reserved namespace, btw, it should not be used in public headers).
Debian packages these libraries separately in their own packages, so
other software can use them.  Now, public headers have this construct
(simplified):

  #ifndef _PUBLIC_
  # define _PUBLIC_ visibility(default)
  #endif

so when _PUBLIC_ is not defined when including eg <tdb.h>, everything
is okay.  But when building samba and using external libtdb, _PUBLIC_
*is* being defined into visibility(hidden). So this definition is used
in the tdb.h header too, and the generated symbol references (to the
hidden symbols) becomes incompatible with the libtdb.so shared library
provided by the system.

I have to patch out -- 's/^_PUBLIC_ //' -- tdb.h header at the library
install time in order to fix the link error.

This makes 3 questions.

1. Is it supported in samba to use system-provided variants of these
    libraries, at all, to start with? The libs are of the right versions
    ofc.

2. Why we (in samba) using symbols in a reserved namespace (starting with
    underscore and with ALL CAPS) in public header files?  This is the
    example of why this can be bad.

3. Should we - if we have to use some sort of API symbol marking like this
    _PUBLIC_ thing - provide "different kinds" of public for different
    libs? It is quite similar to e.g. GSSAPI_LIB_VARIABLE markers used in
    heimdal - the things local to gssapi module.

--------------------------------------------------
Second, in debian we build many internal-to-samba libraries as shared
libraries, - this were supported by samba in the past, it seems. And are
getting errors while linking libsmbconf.so, because hex_encode_talloc()
symbol is missing since it is in lib/util/util.o which is not included
into the link line of libsmbconf.

Am I right that --bundled-libraries= is the list of libraries to build
as shared libs? Where's the complete list of libs which can be listed
in there?

Right now, our debian/rules (coming with samba-4.13 debian package) has
  --bundled-libraries=NONE,pytevent,iniparser,roken,replace,wind,hx509,asn1,\
  heimbase,hcrypto,krb5,gssapi,heimntlm,hdb,kdc,com_err,compile_et,asn1_compile
I'm not sure it is up-to-date for samba 4.16.

Of the same theme, another question is about
  --with-shared-modules=idmap_rid,idmap_ad,idmap_adex,idmap_hash,\
   idmap_ldap,idmap_tdb2,vfs_dfs_samba4,auth_samba4,vfs_nfs4acl_xattr
I guess this list needs to be updated for 4.16.

--------------------------------------------------
Third, when linking smbd, I'm getting this error:

/usr/bin/ld: source3/smbd/server.c.147.o: in function `notifyd_req':
./bin/default/../../source3/smbd/server.c:366: undefined reference to `messaging_ctdb_connection'

apparently source3/lib/messages_ctdb.o is missing somewhere in the link
line. Maybe this is related to usage of the bundled-libs above.

--------------------------------------------------
And finally (for now), right now I'm stuck at another interesting
tidbit from where I can't move on.  Somehow it fails to compile
files using gssapi.h, and it fails to build heimdal sources.  I've
seen this before already, the prob was intermittent, but now it is
always here.

First, the includes.  For example, while compiling lib/krb5_wrap/gss_samba.c ,
the include-path includes -Ithird_party/heimdal/lib -Ithird_party/heimdal/lib/gssapi .

gss_samba.c #includes gss_samba.h which includes lib/replace/system/gssapi.h,
which - based on HAVE_GSSAPI_GSSAPI_H, includes <gssapi/gssapi.h>.  The first
include path which has gssapi/gssapi.h is third_party/heimdal/lib, so we include
third_party/heimdal/lib/gssapi/gssapi.h. But this is a simple dispatcher
file, it merely includes <gssapi/gssapi.h>. Which, as we know already, is
third_party/heimdal/lib/gssapi/gssapi.h. So we end up without all the gssapi
definitions altogether. The correct file to include for <gssapi/gssapi.h>
is third_party/heimdal/lib/gssapi/gssapi/gssapi.h (note the double, or even
triple, gssapi in there) - so the _second_ -I path should be used from the
above.  This is quite messy and not really reliable.

What I don't understand is why I managed to _not_ hit this issue on a few
previous attempts to build samba (using the same configure options and the
build environment).  And next, I don't understand how it is supposed to
work to start with..

Okay, I moved third_party/heimdal/lib/gssapi/gssapi.h out of the way for now
to continue, it compiled okay, until failed elsewhere:

In file included from ../../third_party/heimdal/lib/krb5/krb5_locl.h:122,
                  from ../../source4/kdc/wdc-samba4.c:31:
../../third_party/heimdal/include/crypto-headers.h:5:2: error: #error "need config.h"

Is it because heimdal in samba turned out to be somehow unconfigured
before being built? Mmmm...  Can it be that the samba built system
found a _system_ heimdal libs and decided it does not need to built it,
but parts of heimdal sources are used during the build anyway?


------
Overall, I'm quite shocked by the amount of issues I'm seeing and the
severity of those issues (the visibility(hidden) thing for one took
me 3 days to figure out with a help of whole binutils community).
And the problem becomes worse because I don't quite understand how
this whole build system - waf - actually works. I see the ideas, but
taking this heimdal issue above as an example - I need some starting
point for the beginning of the work of solving this...

Please excuse me it is so long. This is what I'm hitting while trying
to build it. Maybe I'm doing something wrongly, - again, I don't know
what/where.

https://salsa.debian.org/samba-team/samba/-/blob/mjt-4.16/debian/rules is
the debian build instructions, - the important in there is the conf_args
variable starting at line #37.

Help? :)

Thank you!

/mjt

