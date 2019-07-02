Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 637235C8B1
	for <lists+samba-technical@lfdr.de>; Tue,  2 Jul 2019 07:19:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=bqka9nDeR6cD139rUaBO7OQL1kQ8KdPO+i6NxMELApE=; b=rOlgS2oXHLNXcqfC94+kWJkfb7
	vRMqaizpGLvX0y5HOEYzg/2Bf0avUPvCulGuC/hKGUsFoStmwnYdxpSgefsOWNW4PhqC8v2GHCpor
	vougYQ+awCSgItVYIaU9IVPFuhNCIBQz7HnYH5hLPb101QVf8k2oG31+C1qeuzaexQ7olnskuBjGF
	yDgtmnCxn1b24MTI9vntYDP6OuGPyn/9YAA1IQMcy18AjGeWmuC9Vnj4w5yAScQgNQilN4cePJhT6
	bRPYumAgCQ9KYsvEnwC4OhMaqgalJJ7w6pi+XXnlSWSksZHat11+IUn+aJpuVg89HeYN3DHSYqftk
	eKEKlMMQ==;
Received: from localhost ([::1]:43986 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hiBBX-004MoZ-PU; Tue, 02 Jul 2019 05:18:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37552) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hiBBS-004MoR-Fh
 for samba-technical@lists.samba.org; Tue, 02 Jul 2019 05:18:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=bqka9nDeR6cD139rUaBO7OQL1kQ8KdPO+i6NxMELApE=; b=E3cSb9fPLABE1mxJk5U63BFIQL
 JdcUcX7dBtf2wsePqE1ipyImuLgot1ZB7q0KApEeNA1EWkM14N32hM/nnT/+xO8vlJwdkzrgpvvSq
 YKxXc7RSz1RXRjKDLZz6ysuEblGXVSXo3x1KpBzdNIDtUrHPMz8onlAqJmz1o3JiDxUg=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hiBBH-0001mz-Hb; Tue, 02 Jul 2019 05:18:16 +0000
Date: Mon, 1 Jul 2019 22:18:12 -0700
To: Martin Schwenke <martin@meltin.net>
Subject: Re: Compiling Samba with system Heimdal?
Message-ID: <20190702051811.GA22316@samba.org>
References: <20190628142946.7537edfd@martins.ozlabs.org>
 <20190628211045.GA16917@samba.org>
 <20190702111103.5be8bc8f@martins.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190702111103.5be8bc8f@martins.ozlabs.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jul 02, 2019 at 11:11:02AM +1000, Martin Schwenke wrote:
> Hi Christof,
>=20
> On Fri, 28 Jun 2019 14:10:46 -0700, Christof Schmitt <cs@samba.org>
> wrote:
>=20
> > On Fri, Jun 28, 2019 at 02:29:46PM +1000, Martin Schwenke via samba-tec=
hnical wrote:
> > > I'm trying to build Samba with system Heimdal on Debian testing...
> > >=20
> > > $ CFLAGS=3D"-O3" ./configure --picky-developer --abi-check-disable \
> > >     --without-ad-dc  --without-json \
> > >     --with-system-heimdalkrb5
> > > ...
> > > 'configure' finished successfully (1m1.668s)
> > >=20
> > > $ make
> > > [184/187] Compiling source4/heimdal_build/version.c
> > > [185/187] Compiling source4/heimdal/lib/vers/print_version.c
> > > In file included from ../../source4/heimdal_build/roken.h:156,
> > >                  from ../../source4/heimdal/lib/vers/print_version.c:=
39:
> > > ../../source4/heimdal/lib/roken/roken.h.in:282:10: fatal error: roken=
-common.h: No such file or directory
> > >  #include <roken-common.h>
> > >           ^~~~~~~~~~~~~~~~
> > > compilation terminated.
> > >=20
> > > Waf: Leaving directory `/home/martins/samba/samba/bin/default'
> > > Build failed =20
> > >  -> task in 'HEIMDAL_VERS_HOSTCC' failed with exit status 1 (run with=
 -v to display more information) =20
> > > make: *** [Makefile:7: all] Error 1 =20
> >=20
> > Hi Martin,
> >=20
> > i see the same also on Ubuntu 18.04. Samba 4.10 has the same problem,
> > Samba 4.9 compiles. 4.10 started using Python3 for the build. Then i
> > came across this comment from metze, that there might be a problem with
> > parsing the output of krb5-config with Python3:
> >=20
> > commit 8061983d4882f3ba3f12da71443b035d7b672eec
> > Author: Stefan Metzmacher <metze@samba.org>
> > Date:   Thu Jan 24 02:31:10 2019 +0100
> >=20
> >     wscript: separate embedded_heimdal from system_heimdal
> >    =20
> >     This allows to default (embedded_heimdal) to build even with a
> >     broken krb5-config file from Heimdal.
> >    =20
> >     In the system_heimdal case we parse the content of krb5-config
> >     instead of just executing it. This fails on FreeBSD 12 as
> >     krb5-config contains iso-8859-1 characters, which can't be parsed
> >     as unicode python buffers when using python3.
> >    =20
> >     Fixing the system_heimdal case is a task for another day,
> >     I guess it will only work once we imported a current heimdal version
> >     and actually tested the system_heimdal case.
> >    =20
> >     Signed-off-by: Stefan Metzmacher <metze@samba.org>
> >     Reviewed-by: Andreas Schneider <asn@samba.org>
> >=20
> > I am not sure if that is the exact problem, but it would seem worthwhile
> > to look closer in that area.
>=20
> Thanks for this idea.
>=20
> Unfortunately, the problem doesn't seem to be iso-8859-1 characters
> that can't be parsed using python3.
>=20
> I hacked wscript_configure_system_heimdal to grep the desired lines
> of krb5-config.heimdal and then read only those lines in Python.  This
> avoids any non-ASCII characters.  However, the same
> bin/c4che/default_cache.py file is produced with or without the hack.
>=20
> On my Debian testing system I see:
>=20
>   $ file /usr/bin/krb5-config.heimdal=20
>   /usr/bin/krb5-config.heimdal: POSIX shell script, UTF-8 Unicode text ex=
ecutable
>=20
> compared with:
>=20
>   $ file /usr/bin/krb5-config.mit=20
>   /usr/bin/krb5-config.mit: POSIX shell script, ASCII text executable
>=20
> So, I don't think the iso-8859-1 character problem exists on my system.
>=20
> I don't think my problem is that I have both kerberos flavours
> installed.  wscript_configure_system_heimdal explicitly looks for
> krb5-config.heimdal.  When I saw this problem 6 months ago I didn't
> have MIT kerberos installed.
>=20
> Potentially relevant lines from default_cache.py are:
>=20
> CFLAGS_roken =3D []
> CPPPATH_ASN1 =3D ['/usr/include/heimdal']
> CPPPATH_COM_ERR =3D ['/usr/include/heimdal']
> CPPPATH_GSSAPI =3D ['/usr/include/heimdal']
> CPPPATH_HCRYPTO =3D ['/usr/include/heimdal']
> CPPPATH_HDB =3D ['/usr/include/heimdal']
> CPPPATH_HEIMBASE =3D ['/usr/include/heimdal']
> CPPPATH_HEIMNTLM =3D ['/usr/include/heimdal']
> CPPPATH_HX509 =3D ['/usr/include/heimdal']
> CPPPATH_KDC =3D ['/usr/include/heimdal']
> CPPPATH_KRB5 =3D ['/usr/include/heimdal']
> CPPPATH_ROKEN =3D ['/usr/include/heimdal']
> CPPPATH_ROKEN_HOSTCC =3D ['/usr/include/heimdal']
> CPPPATH_WIND =3D ['/usr/include/heimdal']
> FOUND_SYSTEMLIB_roken =3D True
> HAVE_LIBROKEN =3D 1
> HAVE_ROKEN_H =3D 1
> HEIMDAL_KRB5_CONFIG =3D ['/usr/bin/krb5-config.heimdal']
> HEIMDAL_KRB5_TYPES_PATH =3D '/usr/include/heimdal/krb5-types.h'
> LDFLAGS_roken =3D ['-lpthread', '-Wl,-no-undefined']
> LIBPATH_ASN1 =3D ['/usr/lib/x86_64-linux-gnu/heimdal', '/usr/lib/x86_64-l=
inux-gnu/mit-krb5']
> LIBPATH_COM_ERR =3D ['/usr/lib/x86_64-linux-gnu/heimdal', '/usr/lib/x86_6=
4-linux-gnu/mit-krb5']
> LIBPATH_GSSAPI =3D ['/usr/lib/x86_64-linux-gnu/heimdal', '/usr/lib/x86_64=
-linux-gnu/mit-krb5']
> LIBPATH_HCRYPTO =3D ['/usr/lib/x86_64-linux-gnu/heimdal', '/usr/lib/x86_6=
4-linux-gnu/mit-krb5']
> LIBPATH_HDB =3D ['/usr/lib/x86_64-linux-gnu/heimdal', '/usr/lib/x86_64-li=
nux-gnu/mit-krb5']
> LIBPATH_HEIMBASE =3D ['/usr/lib/x86_64-linux-gnu/heimdal', '/usr/lib/x86_=
64-linux-gnu/mit-krb5']
> LIBPATH_HEIMNTLM =3D ['/usr/lib/x86_64-linux-gnu/heimdal', '/usr/lib/x86_=
64-linux-gnu/mit-krb5']
> LIBPATH_HX509 =3D ['/usr/lib/x86_64-linux-gnu/heimdal', '/usr/lib/x86_64-=
linux-gnu/mit-krb5']
> LIBPATH_KDC =3D ['/usr/lib/x86_64-linux-gnu/heimdal', '/usr/lib/x86_64-li=
nux-gnu/mit-krb5']
> LIBPATH_KRB5 =3D ['/usr/lib/x86_64-linux-gnu/heimdal', '/usr/lib/x86_64-l=
inux-gnu/mit-krb5']
> LIBPATH_ROKEN =3D ['/usr/lib/x86_64-linux-gnu/heimdal', '/usr/lib/x86_64-=
linux-gnu/mit-krb5']
> LIBPATH_ROKEN_HOSTCC =3D ['/usr/lib/x86_64-linux-gnu/heimdal', '/usr/lib/=
x86_64-linux-gnu/mit-krb5']
> LIBPATH_WIND =3D ['/usr/lib/x86_64-linux-gnu/heimdal', '/usr/lib/x86_64-l=
inux-gnu/mit-krb5']
> LIB_ROKEN =3D 'roken'
> LIB_ROKEN_HOSTCC =3D 'roken'
> LIB_roken =3D ['roken']
> SAMBA4_USES_HEIMDAL =3D 1
> SYSTEM_LIBS =3D ('heimdal', 'asn1', 'com_err', 'roken', 'hx509', 'wind', =
'gssapi', 'hcrypto', 'krb5', 'heimbase', 'asn1_compile', 'compile_et', 'kdc=
', 'hdb', 'heimntlm')
> TARGET_TYPE =3D {'inotify': 'EMPTY', 'tirpc': 'EMPTY', 'nsl': 'SYSLIB', '=
socket': 'EMPTY', 'bsd': 'SYSLIB', 'setproctitle': 'EMPTY', 'attr': 'EMPTY'=
, 'dl': 'SYSLIB', 'rt': 'SYSLIB', 'resolv': 'SYSLIB', 'intl': 'EMPTY', 'pth=
read': 'SYSLIB', 'crypt': 'SYSLIB', 'popt': 'SYSLIB', 'z': 'SYSLIB', 'pam':=
 'SYSLIB', 'com_err': 'SYSLIB', 'roken': 'SYSLIB', 'ROKEN_HOSTCC': 'SYSLIB'=
, 'wind': 'SYSLIB', 'hx509': 'SYSLIB', 'asn1': 'SYSLIB', 'heimbase': 'SYSLI=
B', 'hcrypto': 'SYSLIB', 'krb5': 'SYSLIB', 'gssapi': 'SYSLIB', 'heimntlm': =
'SYSLIB', 'hdb': 'SYSLIB', 'kdc': 'SYSLIB', 'gnutls': 'SYSLIB', 'gpgme': 'E=
MPTY', 'execinfo': 'EMPTY', 'systemd-daemon': 'EMPTY', 'systemd-journal': '=
EMPTY', 'systemd': 'SYSLIB', 'lttng-ust': 'EMPTY', 'iconv': 'EMPTY', 'ncurs=
es': 'SYSLIB', 'readline': 'EMPTY', 'jansson': 'EMPTY', 'inet': 'EMPTY', 'a=
rchive': 'SYSLIB', 'dm': 'EMPTY', 'jfsdm': 'EMPTY', 'dmapi': 'EMPTY', 'xdsm=
': 'EMPTY', 'cap': 'EMPTY', 'sunacl': 'EMPTY', 'acl': 'SYSLIB', 'cups': 'EM=
PTY', 'lber': 'SYSLIB', 'ld
>  ap': 'SYSLIB', 'avahi-client': 'EMPTY', 'avahi-common': 'EMPTY', 'sendfi=
le': 'EMPTY', 'gen': 'EMPTY', 'security': 'EMPTY', 'sec': 'EMPTY', 'gfapi':=
 'EMPTY', 'menu': 'SYSLIB', 'panel': 'SYSLIB', 'form': 'SYSLIB', 'crypto': =
'SYSLIB', 'glib-2.0': 'SYSLIB', 'nscd': 'EMPTY', 'util': 'SYSLIB', 'pcap': =
'EMPTY', 'libtasn1': 'SYSLIB'}
> USING_SYSTEM_ROKEN =3D 1
>=20
>=20
> Despite all of those lovely variables containing
> "/usr/include/heimdal", I don't see that in the compilation command.
>=20
> In fact, as-per Andrew's comment a year ago, I'm guessing that we
> shouldn't even be trying to build anything in source4/heimdal/.
> However, it isn't as simple as commenting out
>=20
>   bld.RECURSE('source4/heimdal_build')
>=20
> in wscript_build_system_heimdal as is done in
> wscript_build_system_mitkrb5.  That results in:
>=20
>   Unknown dependency 'gssapi_krb5' in 'KRB5_PAC'
>=20
> ... and then I'm too far into dependencies that I don't understand well
> enough to unravel.  :-(

As this works with Samba 4.9, one approach could be to configure Samba
4.9 and 4.10, and then compare the configure logs. I don't have time to
dig through this now, maybe later this month.

Christof

