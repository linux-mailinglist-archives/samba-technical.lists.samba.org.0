Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CF10E59439
	for <lists+samba-technical@lfdr.de>; Fri, 28 Jun 2019 08:32:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=HjVTczqq1EiblE56tdHj7fHgcDyM3E7phSU8WIlGX7o=; b=qG42/poxBDU16mAPW/MDRzY+si
	1O/Qr2ALWh5w0WDrz3l/Xpz8WxM8bRLzNMRC7LJGmhYljZOYQMQq7RjuIMhSI46NyMYZgVZzQ/Gh2
	pyQImL0dKCaG5sGRtDl0UXY+C2JG7LDph6BjVtyE7iAZEDQSz5Ddjj3jSOn9eju0FWkwAYSzmb4Z9
	YarHxcyhUFFRprKjZajqphksgIhYz1eljGM5dB7CLZuoHRzv/hjsFBkT1sUQUHE0H4TXa144iLqZw
	rcH4rkspcDhKu6gQvDWYgKeKOy6nbtyOESM9kKBA3Re0Jd8sKESFYgWd3lcdgJjhcFYpt+kMoI1CL
	YXoA5clg==;
Received: from localhost ([::1]:60750 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgkQA-002Gpp-6x; Fri, 28 Jun 2019 06:31:42 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:60894) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgkPu-002Gpi-E8
 for samba-technical@lists.samba.org; Fri, 28 Jun 2019 06:31:32 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1562308278.33746@MiPphShgRMUMjvMjI1lleQ
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: 4213711F44A.A6A75
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id 4213711F44A
 for <samba-technical@lists.samba.org>; Fri, 28 Jun 2019 08:31:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1561703477;
 bh=OQRZsxS2hDmcj26TE8UXVdXmGqfw+GFQO1u4C2rAsto=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=eAre/FA3UgDgBt0fnwTfccWIvF1zaL6dTeAUsnLfmkl/+A1fS3fAV3weuwaGO5QN8
 lilmWLYmzyaYa+0PKYmcIeygFUyXdjgy8i2pn7sSmTrEv9gO2gU0tLl0HU6EA26TKW
 HuPaaVmPNuSSIaX2Ctoe2gBb1xCdXxhMIWhdwzv1N/OTZXZeN2WLT4kt3dEPIvtdZE
 hJrLPtLX7HjbVc7QPE6MqoWo1mIvS98RsmokLuKWruD5QwFXLmRvcI+nfELHyHe00I
 ++MwlObIrhPImnNeGDB9FqfUf55GoXhnnBq5S3t76/QkHZ88EMAG2UI+wtUMBq6lxU
 5obk76cOl56XQ==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id 0B4163AF8C
 for <samba-technical@lists.samba.org>; Fri, 28 Jun 2019 08:31:16 +0200 (CEST)
Subject: RE: Compiling Samba with system Heimdal?
To: =?windows-1252?Q?samba-technical=40lists.samba.org?=
 <samba-technical@lists.samba.org>
Date: Fri, 28 Jun 2019 08:31:16 +0200
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190628143606.4e223af3@martins.ozlabs.org>
References: <20190628142946.7537edfd@martins.ozlabs.org>
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: AdUtexZQh18FLR+nTrm5Y9ywcQ7V5g==
Message-Id: <vmime.5d15b434.4582.3bcb7b652c1223e3@ms249-lin-003.rotterdam.bazuin.nl>
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
From: "L.P.H. van Belle via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "=?windows-1252?Q?L.P.H._van_Belle?=" <belle@bazuin.nl>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Good mornin Martin,

You tried, installing heimdal-multidev =3F=20
https://packages.debian.org/search=3Fsuite=3Dbuster&arch=3Dany&mode=3Dpath&searchon=3Dcontents&keywords=3Droken-common.h=20


Greetz,=20

Louis
=20

> -----Oorspronkelijk bericht-----
> Van: samba-technical=20
> [mailto:samba-technical-bounces@lists.samba.org] Namens=20
> Martin Schwenke via samba-technical
> Verzonden: vrijdag 28 juni 2019 6:36
> Aan: Samba Technical
> Onderwerp: Re: Compiling Samba with system Heimdal=3F
>=20
> On Fri, 28 Jun 2019 14:29:46 +1000, Martin Schwenke=20
> <martin@meltin.net>
> wrote:
>=20
> > I'm trying to build Samba with system Heimdal on Debian testing...
> >=20
> > $ CFLAGS=3D"-O3" ./configure --picky-developer --abi-check-disable \
> >     --without-ad-dc  --without-json \
> >     --with-system-heimdalkrb5
> > ...
> > 'configure' finished successfully (1m1.668s)
> >=20
> > $ make
> > [184/187] Compiling source4/heimdal_build/version.c
> > [185/187] Compiling source4/heimdal/lib/vers/print_version.c
> > In file included from ../../source4/heimdal_build/roken.h:156,
> >                  from=20
> ../../source4/heimdal/lib/vers/print_version.c:39:
> > ../../source4/heimdal/lib/roken/roken.h.in:282:10: fatal=20
> error: roken-common.h: No such file or directory
> >  #include <roken-common.h>
> >           ^~~~~~~~~~~~~~~~
> > compilation terminated.
> >=20
> > Waf: Leaving directory `/home/martins/samba/samba/bin/default'
> > Build failed
> >  -> task in 'HEIMDAL_VERS_HOSTCC' failed with exit status 1=20
> (run with -v to display more information)
> > make: *** [Makefile:7: all] Error 1
> >=20
> > $ ls /usr/include/heimdal/roken-common.h=20
> > /usr/include/heimdal/roken-common.h
> >=20
> > $ make V=3D1
> > PYTHONHASHSEED=3D1 WAF_MAKE=3D1  ./buildtools/bin/waf build
> > Waf: Entering directory `/home/martins/samba/samba/bin/default'
> > =09Selected system Heimdal build
> > [185/187] Compiling source4/heimdal/lib/vers/print_version.c
> > 14:25:25 runner ['/home/martins/bin/gcc',=20
> '-D_SAMBA_BUILD_=3D4', '-DHAVE_CONFIG_H=3D1', '-O3', '-MMD',=20
> '-D_GNU_SOURCE=3D1', '-D_XOPEN_SOURCE_EXTENDED=3D1',=20
> '-DHAVE_CONFIG_H=3D1', '-DDEVELOPER', '-DDEBUG_PASSWORD',=20
> '-fPIC', '-D__STDC_WANT_LIB_EXT1__=3D1', '-D_REENTRANT',=20
> '-D_POSIX_PTHREAD_SEMANTICS', '-DDEVELOPER',=20
> '-DDEBUG_PASSWORD', '-fstack-protector-strong',=20
> '-fstack-clash-protection', '-g', '-Wall', '-Wshadow',=20
> '-Wmissing-prototypes', '-Wmissing-field-initializers',=20
> '-Wformat-overflow=3D2', '-Wcast-align', '-Wcast-qual',=20
> '-fno-common', '-Werror=3Daddress',=20
> '-Werror=3Dstrict-prototypes', '-Wstrict-prototypes',=20
> '-Werror=3Dwrite-strings', '-Wwrite-strings',=20
> '-Werror-implicit-function-declaration',=20
> '-Werror=3Dpointer-arith', '-Wpointer-arith',=20
> '-Werror=3Ddeclaration-after-statement',=20
> '-Wdeclaration-after-statement', '-Werror=3Dreturn-type',=20
> '-Wreturn-type', '-Werror=3Duninitialized', '-Wuninitialized',=20
> '-Wimplicit-fallthrough', '-Werror=3Dstrict-overflow',=20
> '-Wstrict-overflow=3D2', '-Wformat=3D2', '-Wno-format-y2k',
>   '-Wno-format-zero-length', '-Werror=3Dformat-security',=20
> '-Wformat-security', '-Werror=3Dformat',=20
> '-DSTATIC_HEIMDAL_VERS_HOSTCC_MODULES=3DNULL',=20
> '-DSTATIC_HEIMDAL_VERS_HOSTCC_MODULES_PROTO=3Dextern void=20
> __HEIMDAL_VERS_HOSTCC_dummy_module_proto(void)',=20
> '-Isource4/heimdal_build', '-I../../source4/heimdal_build',=20
> '-Iinclude/public', '-I../../include/public', '-Isource4',=20
> '-I../../source4', '-Ilib', '-I../../lib', '-Isource4/lib',=20
> '-I../../source4/lib', '-Isource4/include',=20
> '-I../../source4/include', '-Iinclude', '-I../../include',=20
> '-Ilib/replace', '-I../../lib/replace', '-I.', '-I../..',=20
> '../../source4/heimdal/lib/vers/print_version.c', '-c',=20
> '-o/home/martins/samba/samba/bin/default/source4/heimdal/lib/v
> ers/print_version.c.1.o']
> > In file included from ../../source4/heimdal_build/roken.h:156,
> >                  from=20
> ../../source4/heimdal/lib/vers/print_version.c:39:
> > ../../source4/heimdal/lib/roken/roken.h.in:282:10: fatal=20
> error: roken-common.h: No such file or directory
> >  #include <roken-common.h>
> >           ^~~~~~~~~~~~~~~~
> > compilation terminated.
> >=20
> > I don't see -I/usr/include/heimdal in there anywhere.  :-(
> >=20
> > Can someone please tell me what I'm doing wrong=3F
>=20
> Note that I asked the same question almost exactly 6 months=20
> ago and got
> no answer...  :-(
>=20
> peace & happiness,
> martin
>=20
>=20


