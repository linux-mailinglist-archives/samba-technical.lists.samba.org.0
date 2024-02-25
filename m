Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E581862D3C
	for <lists+samba-technical@lfdr.de>; Sun, 25 Feb 2024 22:41:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=b+67WDPp9pkDCnXq0OkT9MSVNY3Eek4NkAjjUHKetCw=; b=1XGO2u2WJPj/TeZFoyre8ZtsWg
	JFQejA/K1d/LLOVO7+ic9JMljV2DqOMYwFI/z3H4LIh2gqZxU30z0vSeyLweasJgE8KBhAKlxLAi4
	VT44Y9v9eW+aRN1TEXulf1MQ1kUeJW5MARWaO6FVTMh5gUmYAu3XBGpcpxo7g4BW5drRAJLpXRGKz
	K/ovjwBnbE6IZHtkGq6aiQATnvTrC5zG6yVWZNU6tu793kV46ga0A3B7kCBO6uabBQBCln9/l+3h2
	pPH2Ch0+5PwwZoNYJnrSKY7mYJz/JgJ3HVZ+Knowuy3K6OIoSDgu7CzHw6pEj4UUcnuwbKRY6qpIS
	F70/t/kA==;
Received: from ip6-localhost ([::1]:29096 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1reMEX-009Ph5-2M; Sun, 25 Feb 2024 21:40:29 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:55303) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1reMES-009Pgt-5H
 for samba-technical@lists.samba.org; Sun, 25 Feb 2024 21:40:26 +0000
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-7c76a566218so128579439f.2
 for <samba-technical@lists.samba.org>; Sun, 25 Feb 2024 13:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708897221; x=1709502021; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b+67WDPp9pkDCnXq0OkT9MSVNY3Eek4NkAjjUHKetCw=;
 b=Vd+sRvYL2jziecD3kmMJeC8B7EH6c9jPbjd20lI8xO0WN3mMd/XIrmAXOeOiDtTC62
 KqiLackoi4QzqQ/11Etl8VoAd7nFwVjhPhVjuFBRPL/EeuoJ7Q0ATlmGKzBU5xWgwrCx
 dtit8YtlQXytkbgvLrBZzWnxT4q5X8CbJwUM2o5MGJpLg6AJR6+83QAvJ0GN4AR7Larm
 l7GOGry5vQd5wdUEwV/Us8/SHFFRpUzJ5LPj3wsLXbRt7AscXolLqutQGhi6OFxQ5aGd
 VErH7rXrgoPxPy8XBvz7dzE3vj6fE+G7p0xjykJS/IptHFlDmGwJeoVDaNut0iu4GMpK
 A3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708897221; x=1709502021;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b+67WDPp9pkDCnXq0OkT9MSVNY3Eek4NkAjjUHKetCw=;
 b=aDw/40FfcjeQj46b8D0TLw+vNJuAFwUz+/MI7NhRzpxYPYKGto26hgGpQ2/LzCYAvT
 /JSr0H8TXZVTMC4hoo6kZo+Toim056tzwgl3TqMSAPQcSIZKYGWXaQAxB1iAgg7hsJuR
 0d5BEDNkZAipPS+likIEbH9P+5B1vSikQXn1ia0I//NEL8quLoy0GH5TqITg+FYFRi/k
 7Im61JhEvW6dMUS8/dMHyXNlJ1uVzJLDzlEI7A0FOUF28lMpz7Rlpor2Sw94h6Mab8gq
 /qqhCALmFViSGS7LFEF65b8+GlDu1t6bp3rkMeV6aWHdDVLx7Ek+6LQijgz4NbCVBqmm
 t1wA==
X-Gm-Message-State: AOJu0YxKpkQcR5drcNyXcSzG1wSvNB7fA9CcBGc/nlSMOVoNYzjG7b+w
 E77SjZUMC3/7y8ojfxRAqV0CVIZ2vlnpgqMMggsSuBi00vG/PvlogN2FmErxdsa+QXw8jqNuEV2
 HFeg1ZdHsneG+/HIfd3xQQU+EzDE=
X-Google-Smtp-Source: AGHT+IH8Jbvc7EDj2sR4WmbPo8slY7B/8TUlf7UD2i/pcInqpnbXi3IZLSpAKojDu+yxyQuB4kahT4SZDTuekxsTZmw=
X-Received: by 2002:a05:6602:2810:b0:7c7:25c7:b596 with SMTP id
 d16-20020a056602281000b007c725c7b596mr6066873ioe.16.1708897221144; Sun, 25
 Feb 2024 13:40:21 -0800 (PST)
MIME-Version: 1.0
References: <CAOCN9rxnv=Wx7OJQ4JDdZQn62D1VKjYSBYGOjX45CJLSq=-LJw@mail.gmail.com>
 <ZdIU8U1tFrsf0Yi2@toolbox>
In-Reply-To: <ZdIU8U1tFrsf0Yi2@toolbox>
Date: Sun, 25 Feb 2024 16:40:09 -0500
Message-ID: <CAOCN9rwCGJOhK2EkCDJOeahbt7j1R5fNpbd+55rjrKrtCbqjtA@mail.gmail.com>
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

On Sun, Feb 18, 2024 at 9:29=E2=80=AFAM Alexander Bokovoy <ab@samba.org> wr=
ote:
>
> On Sun, 18 Feb 2024, Nico Kadel-Garcia via samba-technical wrote:
> > I've been publishing backports of current Samba releases for RHEL to
> > include full domain controller capability for a few years now. Red Hat
> > elects to turn off the domain controller features at build time, and
> > the Fedora SRPM's reflect this decision for RHEL. Building for RHEL
> > meand activating "--with-includelibs" in order to avoid conflicts with
> > the libldb, libtdb, etc. versons used by sssd and other default tools.
> >
> > My current work is published at https://github.com/nkadel/samba4repo/.
> > When I enable the use of the built-in Heimdall Kerberos with the
> > "system_mit_krb5" option in the .spec file, I get these errors when
> > compiling Samba with the "mock" command.

[ log snipped ]


> This just shows that systemd-nspawn execution failed when running
> 'rpmbuild -bb ... samba.spec'. Are there are any more logs available?
>
> In particular, prior to
>
> > error: Bad exit status from /var/tmp/rpm-tmp.sarBcy (%build)
> > RPM build errors:
>
> --
> / Alexander Bokovoy

I normally do these builds with "mock". Working from a CentOS 8 system
with more standard rpmbuild setup:

symlink: samba_downgrade_db -> ./samba_downgrade_db
symlink: samba-tool -> ./samba-tool
symlink: samba-gpupdate -> ./samba-gpupdate
symlink: smbaddshare -> ./smbaddshare
symlink: smbchangeshare -> ./smbchangeshare
symlink: smbdeleteshare -> ./smbdeleteshare
Checking project rules ...
Project rules pass
[1/1] Processing VERSION: VERSION buildtools/wafsamba/samba_version.py
-> bin/default/version.h
Waf: Leaving directory
`/home/nkadel/git/nkadel/samba4repo/samba-srpm/rpmbuild/BUILD/samba-4.20.0r=
c2/bin/default'
source not found: '../heimdal/lib/wind/gen-errorlist.py' in
bld(source=3D'../heimdal/lib/wind/gen-errorlist.py
../heimdal/lib/wind/rfc3454.txt ../heimdal/lib/wind/stringprep.py',
target=3D['../heimdal/lib/wind/errorlist_table.c',
'../heimdal/lib/wind/errorlist_table.h'], meths=3D['check_err_features',
'check_err_order', 'process_rule', 'process_source'], features=3D[],
path=3D/home/nkadel/git/nkadel/samba4repo/samba-srpm/rpmbuild/BUILD/samba-4=
.20.0rc2/third_party/heimdal_build,
idx=3D106, tg_idx_count=3D2463, rule=3D"${PYTHON} '${SRC[0].abspath()}'
'${SRC[1].abspath()}' '${SRC[1].parent.abspath(env)}'", shell=3DTrue,
update_outputs=3DTrue, before=3D'c', ext_out=3D'.c', vars=3D["${PYTHON}
'${SRC[0].abspath()}' '${SRC[1].abspath()}'
'${SRC[1].parent.abspath(env)}'"], samba_type=3D'GENERATOR',
_name=3D'HEIMDAL_ERRORLIST', posted=3DTrue) in
/home/nkadel/git/nkadel/samba4repo/samba-srpm/rpmbuild/BUILD/samba-4.20.0rc=
2/third_party/heimdal_build
make[1]: *** [Makefile:7: all] Error 1
make[1]: Leaving directory
'/home/nkadel/git/nkadel/samba4repo/samba-srpm/rpmbuild/BUILD/samba-4.20.0r=
c2'
error: Bad exit status from /var/tmp/rpm-tmp.o6xbN7 (%build)

