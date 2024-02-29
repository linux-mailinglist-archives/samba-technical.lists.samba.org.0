Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D7B86BF2A
	for <lists+samba-technical@lfdr.de>; Thu, 29 Feb 2024 03:58:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=CXjlJbUHG9TFYX5mXG8QeduskzC0aYa3QC0H+aN+6g0=; b=Q9y7NEllczQLn8HtHfOSFtHwLD
	Eb3bA+KlRCukcbUtXUG3C9xnnWECuJIbl+VzF9CNCRALSyd+2JjBvBwMKMX0JiYhp30IqyTe9mm3Z
	wRHYO2YZX9mtxdF5RuJGdW9YVBNam+i5d/SpW2Mph9V5tsy2f9WivNI2BdVwjORIYCAdUQz5M6Aw+
	jQsYxMTIQo7oVVKYvD6ww+g1ihwcEfQitIEHgfl1Jy8eXY6d00f7+0iCMSeVRcFRRivxxYxEvLnTk
	Y4wgBb6dxuSaar5c+Twch8x4yRpDuuYfkkVOyEbaQP3m/DtDD18o8Hsl9G2UfrZvXqhpEsKvy6vgN
	Tmtjp9Jw==;
Received: from ip6-localhost ([::1]:34090 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rfWce-009erD-Ur; Thu, 29 Feb 2024 02:58:13 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:41984) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rfWcY-009er6-NE
 for samba-technical@lists.samba.org; Thu, 29 Feb 2024 02:58:09 +0000
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-365169e0938so1378785ab.0
 for <samba-technical@lists.samba.org>; Wed, 28 Feb 2024 18:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709175484; x=1709780284; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CXjlJbUHG9TFYX5mXG8QeduskzC0aYa3QC0H+aN+6g0=;
 b=W6G2U2SsbdBcdNjHe8stuywnd5jQfH0hIznWpSIgI3gB8r5Kv9aemh6N7p4A59qBpK
 iRARrug4ZkRaPxi6jwBVLeAJemvEDRTFnz0vWnIZ1qD1Cq6XqmJ3G6S/TxtjNzWkoRgv
 D1XX6omR2q3mteFrwnmmfMmrWKqd6GASyzoVn41mXUaUe6GuOGZ2aen1hIyy9kc3Cup7
 JEDcbT/VdDde+LioSyePb4bRzn56Xa0k8o2BEGZMKti7XgiiuGBmkX6xd4B9gf/+OMAo
 /IQKJ7HT/5tq9FeyRIrDD35yg5tbXOX5nUbDVqO5SbNlIBiYgDAsH6AZfGcMB2lULXED
 isoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709175484; x=1709780284;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CXjlJbUHG9TFYX5mXG8QeduskzC0aYa3QC0H+aN+6g0=;
 b=CS0w7BnAsexai4uXKmeFxRBCA1JLFZ0OmCaZOoQ4b6MV/gzpFGn4x4ulM/hHeQk/DT
 C6Fwloqp6xO0zNZfl92AQ2HHPlu9CzaXF7oz1A0Jsl7wjQROihw/+lL/88iS9CD60jMW
 oPkoOQO0pD1hCvnJ4AB6jKHMKDCmoe3u8vnrZIA3x0g6cvgDUeHWVe7c+CgdsLRLDL3O
 CU7fFW7MYDPUTm3Zus3LmGOTgDi3wjNR3Ffv6pISkA5f/I2GegnKsU970pypuA6bJb2d
 xBUT8yqEYQVCyGRc6igtQkhyNzBSjeOgpJVZW0MlEP2b0UypqnLOB2SNm5ImQpE7GlXG
 qIaQ==
X-Gm-Message-State: AOJu0YyB7gTOFoqcJl8nvUCDx/U2543CmqOo8dn/zYqT5pb2BCOhhH8U
 gJ2JyySrBBt73g65RtEcG5yBj42nOB0xeXb0/HmsI7f3kmebq34xgMExP+zduqrkCWzbagC6621
 Rb4XdCWURLGfA6jq5UgRZtow7/R8ZYyEK
X-Google-Smtp-Source: AGHT+IHTIpegj2r/eRqiKZ8xg011gRcI0WzzMpMThuSmczYoUv0yuFXr92NEq/1NbYMkDuuPhAxqH3J+ys0Ae9dhj3c=
X-Received: by 2002:a05:6e02:20e3:b0:365:88b:3fc2 with SMTP id
 q3-20020a056e0220e300b00365088b3fc2mr337222ilv.4.1709175484500; Wed, 28 Feb
 2024 18:58:04 -0800 (PST)
MIME-Version: 1.0
References: <CAOCN9rxnv=Wx7OJQ4JDdZQn62D1VKjYSBYGOjX45CJLSq=-LJw@mail.gmail.com>
 <ZdIU8U1tFrsf0Yi2@toolbox>
 <CAOCN9rwCGJOhK2EkCDJOeahbt7j1R5fNpbd+55rjrKrtCbqjtA@mail.gmail.com>
 <Zd2jaaIxgSWMiZ6f@toolbox>
In-Reply-To: <Zd2jaaIxgSWMiZ6f@toolbox>
Date: Wed, 28 Feb 2024 21:57:52 -0500
Message-ID: <CAOCN9rz3nPyzGyyZVHAydFxaO0wDstMnDSZUttYs6D+c4VXk3w@mail.gmail.com>
Subject: Re: Samba 4.20.0rc2 fails to support "--with-includelibs" or build
 Heimdall Kerberos
To: Alexander Bokovoy <ab@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Nico Kadel-Garcia via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nico Kadel-Garcia <nkadel@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks, I'll check it out!

On Tue, Feb 27, 2024 at 3:55=E2=80=AFAM Alexander Bokovoy <ab@samba.org> wr=
ote:
>
> On =D0=9D=D1=8F=D0=B4, 25 =D0=BB=D1=8E=D1=82 2024, Nico Kadel-Garcia wrot=
e:
> > On Sun, Feb 18, 2024 at 9:29=E2=80=AFAM Alexander Bokovoy <ab@samba.org=
> wrote:
> > >
> > > On Sun, 18 Feb 2024, Nico Kadel-Garcia via samba-technical wrote:
> > > > I've been publishing backports of current Samba releases for RHEL t=
o
> > > > include full domain controller capability for a few years now. Red =
Hat
> > > > elects to turn off the domain controller features at build time, an=
d
> > > > the Fedora SRPM's reflect this decision for RHEL. Building for RHEL
> > > > meand activating "--with-includelibs" in order to avoid conflicts w=
ith
> > > > the libldb, libtdb, etc. versons used by sssd and other default too=
ls.
> > > >
> > > > My current work is published at https://github.com/nkadel/samba4rep=
o/.
> > > > When I enable the use of the built-in Heimdall Kerberos with the
> > > > "system_mit_krb5" option in the .spec file, I get these errors when
> > > > compiling Samba with the "mock" command.
> >
> > [ log snipped ]
> >
> >
> > > This just shows that systemd-nspawn execution failed when running
> > > 'rpmbuild -bb ... samba.spec'. Are there are any more logs available?
> > >
> > > In particular, prior to
> > >
> > > > error: Bad exit status from /var/tmp/rpm-tmp.sarBcy (%build)
> > > > RPM build errors:
> > >
> > > --
> > > / Alexander Bokovoy
> >
> > I normally do these builds with "mock". Working from a CentOS 8 system
> > with more standard rpmbuild setup:
> >
> > symlink: samba_downgrade_db -> ./samba_downgrade_db
> > symlink: samba-tool -> ./samba-tool
> > symlink: samba-gpupdate -> ./samba-gpupdate
> > symlink: smbaddshare -> ./smbaddshare
> > symlink: smbchangeshare -> ./smbchangeshare
> > symlink: smbdeleteshare -> ./smbdeleteshare
> > Checking project rules ...
> > Project rules pass
> > [1/1] Processing VERSION: VERSION buildtools/wafsamba/samba_version.py
> > -> bin/default/version.h
> > Waf: Leaving directory
> > `/home/nkadel/git/nkadel/samba4repo/samba-srpm/rpmbuild/BUILD/samba-4.2=
0.0rc2/bin/default'
> > source not found: '../heimdal/lib/wind/gen-errorlist.py' in
>
> ^^ it did not find the gen-errorlist.py file.
>
> It is now in ./third_party/heimdal/lib/wind/gen-errorlist.py while
> before commit 7055827b8ffd3823c1240ba3f0b619dd6068cd51 it was in
> ./source4/heimdal/lib/wind/gen-errorlist.py:
>
> -------------------------------------------------------------------------=
-----------
> commit 7055827b8ffd3823c1240ba3f0b619dd6068cd51
> Author: Stefan Metzmacher <metze@samba.org>
> Date:   Wed Jan 19 13:15:45 2022 +0100
>
>     HEIMDAL: move code from source4/heimdal* to third_party/heimdal*
>
>     This makes it clearer that we always want to do heimdal changes
>     via the lorikeet-heimdal repository.
>
>     Signed-off-by: Stefan Metzmacher <metze@samba.org>
>     Reviewed-by: Joseph Sutton <josephsutton@catalyst.net.nz>
>
>     Autobuild-User(master): Joseph Sutton <jsutton@samba.org>
>     Autobuild-Date(master): Wed Jan 19 21:41:59 UTC 2022 on sn-devel-184
>
> (part of the commit 7055827b)
> diff --git a/source4/heimdal/lib/wind/gen-errorlist.py b/third_party/heim=
dal/lib/wind/gen-errorlist.py
> similarity index 100%
> rename from source4/heimdal/lib/wind/gen-errorlist.py
> rename to third_party/heimdal/lib/wind/gen-errorlist.py
> -------------------------------------------------------------------------=
-----------
>
> I suspect other locations using ../heimdal/ prefix would need to be
> adjusted to use new location. These are mostly in
>
> $ git grep '\.\./heimdal/'
> third_party/heimdal_build/gssapi-glue.c:#include "../heimdal/lib/gssapi/g=
ssapi_mech.h"
> third_party/heimdal_build/hdb-glue.c:#include "../heimdal/lib/hdb/hdb_loc=
l.h"
> third_party/heimdal_build/krb5-glue.c:#include "../heimdal/lib/krb5/krb5_=
locl.h"
> third_party/heimdal_build/krb5/kdc-plugin.h:#include "../../heimdal/kdc/k=
dc-plugin.h"
> third_party/heimdal_build/roken.h:#include "../heimdal/lib/roken/roken.h.=
in"
> third_party/heimdal_build/vis.h:#include "../heimdal/lib/roken/vis.hin"
> third_party/heimdal_build/wscript_build:            source =3D '../heimda=
l/lib/roken/err.hin',
> third_party/heimdal_build/wscript_build:            target =3D '../heimda=
l/lib/roken/err.h',
> third_party/heimdal_build/wscript_build:        includes=3D'../heimdal/li=
b/roken ../heimdal/include ../heimdal_build/include',
> third_party/heimdal_build/wscript_build:        includes=3D'../heimdal/li=
b/roken ../heimdal/include ../heimdal_build/include',
> third_party/heimdal_build/wscript_build:                    includes=3D'.=
./heimdal/lib/gss_preauth',
> third_party/heimdal_build/wscript_build:                        includes=
=3D'../heimdal/kdc',
> third_party/heimdal_build/wscript_build:                        includes=
=3D'../heimdal/lib/ntlm',
> third_party/heimdal_build/wscript_build:        includes=3D'../heimdal/li=
b/asn1')
> third_party/heimdal_build/wscript_build:        includes=3D'../heimdal/li=
b/hdb',
> third_party/heimdal_build/wscript_build:        includes=3D'../heimdal/li=
b/hdb',
> third_party/heimdal_build/wscript_build:        includes=3D'../heimdal/li=
b/asn1',
> third_party/heimdal_build/wscript_build:        includes=3D'../heimdal/li=
b/asn1',
> third_party/heimdal_build/wscript_build:                      includes=3D=
'../heimdal/lib/gssapi/gssapi ../heimdal/lib/gssapi/spnego ../heimdal/lib/g=
ssapi/krb5 ../heimdal/lib/gssapi/mech ../heimdal/lib/ntlm',
> third_party/heimdal_build/wscript_build:                    includes=3D'.=
./heimdal/lib/gssapi/gssapi ../heimdal/lib/gssapi/spnego ../heimdal/lib/gss=
api/krb5 ../heimdal/lib/gssapi/mech ../heimdal/lib/ntlm',
> third_party/heimdal_build/wscript_build:                      includes=3D=
'../heimdal/lib/krb5 ../heimdal/lib/asn1 ../heimdal/include',
> third_party/heimdal_build/wscript_build:                      includes=3D=
'../heimdal/include ../heimdal/lib/asn1 ../heimdal/lib/ipc',
> third_party/heimdal_build/wscript_build:        includes=3D'../heimdal/li=
b/krb5 ../heimdal/include',
> third_party/heimdal_build/wscript_build:                        includes=
=3D'../heimdal/lib/krb5 ../heimdal/lib/asn1 ../heimdal/include',
> third_party/heimdal_build/wscript_build:        includes=3D'../heimdal/li=
b/asn1',
> third_party/heimdal_build/wscript_build:                          include=
s=3D'../heimdal/lib/hcrypto/libtommath'
> third_party/heimdal_build/wscript_build:        includes=3D'../heimdal/li=
b/hcrypto ../heimdal/lib ../heimdal/include',
> third_party/heimdal_build/wscript_build:        includes=3D'../heimdal/li=
b/base ../heimdal/include ../heimdal/lib/krb5',
> third_party/heimdal_build/wscript_build:        includes=3D'../heimdal/li=
b/base ../heimdal/lib/com_err ../heimdal/include ../heimdal/lib/krb5',
> third_party/heimdal_build/wscript_build:        includes=3D'../heimdal/li=
b/asn1',
> third_party/heimdal_build/wscript_build:        includes=3D'../heimdal/li=
b/asn1',
> third_party/heimdal_build/wscript_build:        includes=3D'../heimdal/li=
b/hx509',
> third_party/heimdal_build/wscript_build:        source =3D '../heimdal/li=
b/wind/gen-errorlist.py ../heimdal/lib/wind/rfc3454.txt ../heimdal/lib/wind=
/stringprep.py',
> third_party/heimdal_build/wscript_build:        target =3D '../heimdal/li=
b/wind/errorlist_table.c ../heimdal/lib/wind/errorlist_table.h'
> third_party/heimdal_build/wscript_build:        source =3D '../heimdal/li=
b/wind/gen-normalize.py ../heimdal/lib/wind/UnicodeData.txt ../heimdal/lib/=
wind/CompositionExclusions-3.2.0.txt',
> third_party/heimdal_build/wscript_build:        target =3D '../heimdal/li=
b/wind/normalize_table.h ../heimdal/lib/wind/normalize_table.c'
> third_party/heimdal_build/wscript_build:        source =3D '../heimdal/li=
b/wind/gen-combining.py ../heimdal/lib/wind/UnicodeData.txt',
> third_party/heimdal_build/wscript_build:        target =3D '../heimdal/li=
b/wind/combining_table.h ../heimdal/lib/wind/combining_table.c'
> third_party/heimdal_build/wscript_build:        source =3D '../heimdal/li=
b/wind/gen-bidi.py ../heimdal/lib/wind/rfc3454.txt',
> third_party/heimdal_build/wscript_build:        target =3D '../heimdal/li=
b/wind/bidi_table.h ../heimdal/lib/wind/bidi_table.c'
> third_party/heimdal_build/wscript_build:        source =3D '../heimdal/li=
b/wind/gen-map.py ../heimdal/lib/wind/stringprep.py ../heimdal/lib/wind/rfc=
3454.txt',
> third_party/heimdal_build/wscript_build:        target =3D '../heimdal/li=
b/wind/map_table.h ../heimdal/lib/wind/map_table.c'
> third_party/heimdal_build/wscript_build:          includes=3D'../heimdal/=
lib/wind',
> third_party/heimdal_build/wscript_build:        includes=3D'../heimdal/li=
b/com_err',
> third_party/heimdal_build/wscript_build:                      includes=3D=
'../heimdal/lib/asn1',
> third_party/heimdal_build/wscript_build:        includes=3D'../heimdal/li=
b/asn1',
> third_party/heimdal_build/wscript_build:        includes=3D'../heimdal/li=
b/com_err',
>
>
> > bld(source=3D'../heimdal/lib/wind/gen-errorlist.py
> > ../heimdal/lib/wind/rfc3454.txt ../heimdal/lib/wind/stringprep.py',
> > target=3D['../heimdal/lib/wind/errorlist_table.c',
> > '../heimdal/lib/wind/errorlist_table.h'], meths=3D['check_err_features'=
,
> > 'check_err_order', 'process_rule', 'process_source'], features=3D[],
> > path=3D/home/nkadel/git/nkadel/samba4repo/samba-srpm/rpmbuild/BUILD/sam=
ba-4.20.0rc2/third_party/heimdal_build,
> > idx=3D106, tg_idx_count=3D2463, rule=3D"${PYTHON} '${SRC[0].abspath()}'
> > '${SRC[1].abspath()}' '${SRC[1].parent.abspath(env)}'", shell=3DTrue,
> > update_outputs=3DTrue, before=3D'c', ext_out=3D'.c', vars=3D["${PYTHON}
> > '${SRC[0].abspath()}' '${SRC[1].abspath()}'
> > '${SRC[1].parent.abspath(env)}'"], samba_type=3D'GENERATOR',
> > _name=3D'HEIMDAL_ERRORLIST', posted=3DTrue) in
> > /home/nkadel/git/nkadel/samba4repo/samba-srpm/rpmbuild/BUILD/samba-4.20=
.0rc2/third_party/heimdal_build
> > make[1]: *** [Makefile:7: all] Error 1
> > make[1]: Leaving directory
> > '/home/nkadel/git/nkadel/samba4repo/samba-srpm/rpmbuild/BUILD/samba-4.2=
0.0rc2'
> > error: Bad exit status from /var/tmp/rpm-tmp.o6xbN7 (%build)
>
>
>
>
> --
> / Alexander Bokovoy

