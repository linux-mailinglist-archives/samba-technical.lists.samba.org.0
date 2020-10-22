Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B57D5295CA7
	for <lists+samba-technical@lfdr.de>; Thu, 22 Oct 2020 12:27:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=CDfW14vcL9DOMzbua0oMTEeA0Rjyinc6YAOWWcJWy10=; b=CdNo0Hdwid5E8AzF+XL0uLUupK
	9LcRveAeEVgOgpzA7C36JDVdgIGkxFCxDuyavdLE6LYv84NaGxdUZCscQS/c/JmjRmSxY4culT1j5
	+mR2vnvDMYv8h9Yroh1XfjTZTcHF6wHmtiMcH1xN+ohai54uHN8rSpBE8XsRaTPiRSu7aLZG8A7nG
	aK1Q+A0vLbL3khtVAqmdhlT5WTnJt1hdVxaGcwxc49u42lUqQhc2n737Mzv5mbzkblv4YFN2Pw64K
	SiO0yGsga0798xgsqRLAiTLRmrWJOxbBmq10sKTSMhXHjvq/Wynu7om+rBdD1CGvzILP5aIRALVdc
	MKDyCQkA==;
Received: from ip6-localhost ([::1]:40926 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kVXoZ-00DFgT-U2; Thu, 22 Oct 2020 10:27:23 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:40056) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVXoT-00DFg8-03
 for samba-technical@lists.samba.org; Thu, 22 Oct 2020 10:27:21 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1603966090.98766@wGqbLbXwl9/UosTq8gNP6g
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: DC38711F302.A59C4
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id DC38711F302
 for <samba-technical@lists.samba.org>; Thu, 22 Oct 2020 12:08:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1603361287;
 bh=ZgSE8IE77aGZNsAJE7yUgI/3ZqB6K8rKDnGhi7BLD0I=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=R8Y8CKHhpu31M3AVa4N9PkWFjADOtzi+N/gHbnAanBAlnu8dJKYdqLCUyNWN8P3SX
 ycfG/a66pHFdCt23eKHs6XYPsYCkgbGd7fmIr+29DOi1erFaijq+8btrgAhe5HV47D
 nsCWic9X21pG9HB4qn4a4OiR89pi0Y+XPtOohL8zVivm0xMgszr16kBUa7HHfYOuc0
 5/aayu88ENAGAqhdkiK7e/4jmx9HXsrnYEkoUVF2SqGyNhwAXHM9SN4QqnyXaMSl60
 yq3zGpsmy+2C9vdqqkgu50Mgiv/aEWBBdxgxWVimzmQ/T/2vuuzrh+EjAnC4//KrtP
 NlBFCIOdyQqFw==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id 7CBB33AF8C
 for <samba-technical@lists.samba.org>; Thu, 22 Oct 2020 12:08:06 +0200 (CEST)
Subject: RE: 4.12 -> 4.13 upgrade
To: =?windows-1252?Q?samba-technical=40lists.samba.org?=
 <samba-technical@lists.samba.org>
Date: Thu, 22 Oct 2020 12:08:06 +0200
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <6013c870-8b8c-d3fa-cee4-1dd9fa9dec61@samba.org>
References: <5E76D2F9CEBD40A2BAADFE3EAB53360F@rotterdam.bazuin.nl>
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: AdaoWzwIvAEW09ZlRJeIRleoxmPmAw==
Message-Id: <vmime.5f915a06.1483.6a1ed22ad77c366@ms249-lin-003.rotterdam.bazuin.nl>
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

=20

> -----Oorspronkelijk bericht-----
> Van: samba-technical=20
> [mailto:samba-technical-bounces@lists.samba.org] Namens=20
> Rowland penny via samba-technical
> Verzonden: donderdag 22 oktober 2020 12:00
> Aan: samba-technical@lists.samba.org
> Onderwerp: Re: 4.12 -> 4.13 upgrade
>=20
> On 22/10/2020 10:06, L. van Belle via samba-technical wrote:
> > Hai,
> >
> > Small question, i cant find this.
> >
> > So after the 4.13.0 (on
> > release date) I upgrade a DC and that failed. so i reverted=20
> back to my VM
> > snapshot.
> >
> > I now see the following in the logs.
> >
> > [2020/10/22 10:48:36.514438,
> >   0] ../../lib/util/util_runcmd.c:352(samba_runcmd_io_handler)
> >
> >   /usr/sbin/samba_dnsupdate: /usr/sbin/samba_dnsupdate:274:
> > DeprecationWarning: please use=20
> dns.resolver.Resolver.resolve() instead
> >
> > [2020/10/22 10:48:36.521212,
> >   0] ../../lib/util/util_runcmd.c:352(samba_runcmd_io_handler)
> >
> >   /usr/sbin/samba_dnsupdate:
> >
> >   return resolver.query(name, name_type)
> >
> > Now, when i
> > look at DC2, which stayed at 4.12.8, that one is not showing any
> > DeprecationWarnings.
> >
> > And i recently added a 3th DC with 4.12.8 and same no=20
> DeprecationWarning.
> >
> > Im trying to find why only DC1 has this message even after=20
> the i reverted to
> > the VM backup.
> >
> > So i hoped today that after the fix for 4.13 for the start=20
> up, i did an
> > upgrade again on my production DC1, having the=20
> DeprecationWarning message
> >
> > Only that didnt solve it. Its all running fine thats not=20
> the problem.
> >
> > Strange thing here is, DC2
> > is a copy of DC1 and doesnt show this and same for the new DC setup.
> >
> > Anyone suggestions
> >   what this is, and maybe how to make the error disapear=3F
> >
> > Its a very constant message since i see it every 10 minuts.
>=20
> You would, that is the frequency that samba_dnsupdate is run.
>=20
> Could you be running bullseye on that DC =3F
No, im sure this is buster ;-)=20

>=20
> Which would mean python3-dnspython V2.0.0 and in this version=20
> resolver.query is deprecated.
>=20

Good one, i checked this.=20

DC1  :=20
dpkg-query -s python3-dnspython
Package: python3-dnspython
Status: install ok installed
Priority: optional
Section: python
Installed-Size: 618
...=20

Same on all DC's.=20


All run the following setting with netbios name changed offcourse.=20
[global]
        netbios name =3D RTD-DC0
        workgroup =3D ADDOM
        realm =3D ADDOM.INTERNAL.TLD

        server role =3D active directory domain controller
        server services =3D -dns -spoolss
        idmap_ldb:use rfc2307 =3D yes

        # + A manual setup for TLS/SSL Certificates.
        tls keyfile =3D /etc/ssl/local/private/xxxxxxxxxx.key.pem
        tls certfile =3D /etc/ssl/local/certs/xxxxxxxxxx.cert.pem
        tls cafile =3D /etc/ssl/local/certs/xxxxxxxxxx-ca.pem

        template shell =3D /bin/bash
        template homedir =3D /home/users/%U

        load printers =3D no
        printcap name =3D /dev/null

        ntlm auth =3D mschapv2-and-ntlmv2-only

And the shares offcourse..  So nothing fancy.=20

Other options=3F=20

And thanks for the reply :-)=20

Greetz,=20

Louis



