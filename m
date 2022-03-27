Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5784E8AEB
	for <lists+samba-technical@lfdr.de>; Mon, 28 Mar 2022 00:46:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=D3IS9VGgm503wkPB9VKud8vE6uhAxH/+o7ufraD+FfM=; b=43p8WSl8uZyFdHriwjeILnofz+
	zh81fuQnDNnxsMyLiJLwmj61HhJkLpyy8TS3nH0j0FZuhgjRYlt34MsasnROarA4iMAJPGKBzjesC
	Yef9AnvxDa81mw0GGPP/nmFD3c4aHb9Ae5Cy86MDy/4L3NQAeApJWcUTHoPgbcB1qo/oFpFWyov8A
	HS8rT4MP35tpItIaZdpEvCqUsS3BA92PGYhQopT0EDvS2QTU+QVuT8zTaprZH/qnVFUjht3Sb1TWc
	mOFMgEci+xBdPj7clr0t674BtKd3qBOPCdaCbnBqUti+EN9lYLa+j2FGR5dDaTjwMmMoJnNV4oNGC
	2687S+Gg==;
Received: from ip6-localhost ([::1]:25540 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nYbe2-005ltp-8V; Sun, 27 Mar 2022 22:45:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37914) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nYbdx-005lte-Iq
 for samba-technical@lists.samba.org; Sun, 27 Mar 2022 22:45:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=D3IS9VGgm503wkPB9VKud8vE6uhAxH/+o7ufraD+FfM=; b=d1BFAY1qhKX2szbQPcN5tfmSyL
 LHQbWWbcIRJSRKSCcY4yxF/7mENng2ut7ZwXag6Dnvbfs9YmhcYl6MrIuhORcZKZU4DzeOou0WvRM
 GM2jCbL/pSRTkP4P53NylhDj8IBbXG/2rzdepH89OrML288PzYbmRx03GpI5NueFE+p2y0AET8mrn
 fxlmjwAKA+fiMUeusgbHt66UFO3sRNbL4M1WOx3X4H1Bp8iH0lK7L4g8yrJ4Kkn4HGE9qNKwS6ONg
 t/JSlsxqOy6e1sjMW0kSOd45sp7T965ZxmP7ybpblLAnPLo28jrAbqWxVYG5grv+Yj/cPuUZYuObe
 RjaLVwbcv86SmuP/j+66vh/O9Cb4CIQvEYel9prZ1MyLVm2242rq1MRFfvUsOlnheCq/bD49JjqX9
 R3QAWs4vkuYexT3FrM0o8e60nNL1imkUAP2T75KPha5EgkJyrR9hiQQQQ+0lZkKziuoIbzMkHQDfg
 ElUtCQI1cCNTeVyXmg+zyEbc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nYbdv-003rpe-PK; Sun, 27 Mar 2022 22:45:52 +0000
Message-ID: <33910b414a3ab85d0e637b9f6e537cd3c05efdc4.camel@samba.org>
Subject: Re: building 4.16 for debian (long)
To: Michael Tokarev <mjt@tls.msk.ru>, samba-technical@lists.samba.org
Date: Mon, 28 Mar 2022 11:45:48 +1300
In-Reply-To: <006ec6d2-39be-80e9-94c5-946dfdd968d9@msgid.tls.msk.ru>
References: <006ec6d2-39be-80e9-94c5-946dfdd968d9@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, 2022-03-27 at 10:50 +0300, Michael Tokarev via samba-technical
wrote:
> Hi!
> 
> I'm trying to build samba 4.16 for debian. This is my first time to
> build samba, and the first time to create debian packages for it, so
> it is a double-interesting thing to do  :)
> 
> So far I come across several issues during the build process, and I
> need some helping hand here. My current prob, it seems, is that I'm
> not yet familiar with the build process.
> 
> First issue which took quite a lot of my attention was the public
> headers of some support libraries (notable tdb and talloc).  There,
> all API symbols are prefixed with _PUBLIC_ marker (which falls into
> a reserved namespace, btw, it should not be used in public headers).

I can't help on this one, I think you are correct that this suggests
the need for post-processing. 

--------------------------------------------------
> Second, in debian we build many internal-to-samba libraries as shared
> libraries, - this were supported by samba in the past, it seems. And
> are
> getting errors while linking libsmbconf.so, because
> hex_encode_talloc()
> symbol is missing since it is in lib/util/util.o which is not
> included
> into the link line of libsmbconf.

We often find that dependency errors, hidden because of implicit build
dependencies, are seen in custom build configurations.   I'm sorry you
are hitting that.

> Am I right that --bundled-libraries= is the list of libraries to
> build
> as shared libs? Where's the complete list of libs which can be listed
> in there?

No, bundled-libraries is the list of libraries (either maintained by
Samba, or distributed by Samba in third_party) that could be found on
the system, but which we should never use the system version for.

https://gitlab.com/samba-team/samba/-/merge_requests/2461 has some
improved documentation. 

> Right now, our debian/rules (coming with samba-4.13 debian package)
> has
>   --bundled-
> libraries=NONE,pytevent,iniparser,roken,replace,wind,hx509,asn1,\
>  
> heimbase,hcrypto,krb5,gssapi,heimntlm,hdb,kdc,com_err,compile_et,asn1
> _compile
> I'm not sure it is up-to-date for samba 4.16.

This list is wrong.  Most of the values are for things that we either
do not accept system libraries for - bits of Heimdal - or have since
stopped including in their_party.  But invalid values are currently
ignored (MR welcome on that).

I think you with --bundled-libraries=NONE,pytevent (presuming for some
reason the debian package of tevent does not include the python
bindings). 

> Of the same theme, another question is about
>   --with-shared-modules=idmap_rid,idmap_ad,idmap_adex,idmap_hash,\
>    idmap_ldap,idmap_tdb2,vfs_dfs_samba4,auth_samba4,vfs_nfs4acl_xattr
> I guess this list needs to be updated for 4.16.

This is essentially your choice, as to which things you want as .so
modules.  This may or may not help splitting up dependencies. 

> --------------------------------------------------
> Third, when linking smbd, I'm getting this error:
> 
> /usr/bin/ld: source3/smbd/server.c.147.o: in function `notifyd_req':
> ./bin/default/../../source3/smbd/server.c:366: undefined reference to
> `messaging_ctdb_connection'
> 
> apparently source3/lib/messages_ctdb.o is missing somewhere in the
> link
> line. Maybe this is related to usage of the bundled-libs above.

This is probably a missing entry in 'deps=' in whatever subsystem is
using that. 

> --------------------------------------------------
> And finally (for now), right now I'm stuck at another interesting
> tidbit from where I can't move on.  Somehow it fails to compile
> files using gssapi.h, and it fails to build heimdal sources.  I've
> seen this before already, the prob was intermittent, but now it is
> always here.
> 
> First, the includes.  For example, while compiling
> lib/krb5_wrap/gss_samba.c ,
> the include-path includes -Ithird_party/heimdal/lib
> -Ithird_party/heimdal/lib/gssapi .
> 
> gss_samba.c #includes gss_samba.h which includes
> lib/replace/system/gssapi.h,
> which - based on HAVE_GSSAPI_GSSAPI_H, includes
> <gssapi/gssapi.h>.  The first
> include path which has gssapi/gssapi.h is third_party/heimdal/lib, so
> we include
> third_party/heimdal/lib/gssapi/gssapi.h. But this is a simple
> dispatcher
> file, it merely includes <gssapi/gssapi.h>. Which, as we know
> already, is
> third_party/heimdal/lib/gssapi/gssapi.h. So we end up without all the
> gssapi
> definitions altogether. The correct file to include for
> <gssapi/gssapi.h>
> is third_party/heimdal/lib/gssapi/gssapi/gssapi.h (note the double,
> or even
> triple, gssapi in there) - so the _second_ -I path should be used
> from the
> above.  This is quite messy and not really reliable.

Again, like symbols, header include paths are dependent on the 'deps='
of the subsystems.  So a subsystem is missing a dependency.  We have
had reports (to Heimdal, frustratingly) about this, but someone needs
to chase it down. 

See https://bugzilla.samba.org/show_bug.cgi?id=15033

The Heimdal issue is https://github.com/heimdal/heimdal/issues/984 

> What I don't understand is why I managed to _not_ hit this issue on a
> few
> previous attempts to build samba (using the same configure options
> and the
> build environment).  And next, I don't understand how it is supposed
> to
> work to start with..

I'm not sure, but we should be able to fix it up with a correct
dependency.

> ------
> Overall, I'm quite shocked by the amount of issues I'm seeing and the
> severity of those issues (the visibility(hidden) thing for one took
> me 3 days to figure out with a help of whole binutils community).
> And the problem becomes worse because I don't quite understand how
> this whole build system - waf - actually works. I see the ideas, but
> taking this heimdal issue above as an example - I need some starting
> point for the beginning of the work of solving this...
> 
> Please excuse me it is so long. This is what I'm hitting while trying
> to build it. Maybe I'm doing something wrongly, - again, I don't know
> what/where.
> 
> https://salsa.debian.org/samba-team/samba/-/blob/mjt-4.16/debian/rules
> is
> the debian build instructions, - the important in there is the
> conf_args
> variable starting at line #37.

On that, I would remove as much complexity as possible, and stick as
close to the tested examples in script/autobuild.py if possible.

I'll reply to your other mails to the Debian Samba packaging list, I
can help on those as well.

Thank you so much for taking this on, and I'm sorry I wasn't around to
assist over the weekend as you fought your way this far.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


