Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1419849E590
	for <lists+samba-technical@lfdr.de>; Thu, 27 Jan 2022 16:15:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=GJRA0LA/y4xNj/fXB3yKZdH9usHcwOVuw+PdX0WE/xA=; b=mA2Y29yMgnLf36l2tUCfsVI48U
	1C+i11hbgYyRgyBuiQqq91pfjwWa0kMLa71qqQKlnCmi5JsngSZv/C22pZQkJEupQVC2itX+k3/VY
	bqkKOnRJtrd1sRfHsrVZu8gliLO11U8jYpMKPyELr45RYjP0bDRZy32KocgTbt9gZ2Zc+ZhGe5Fpo
	izpflOj9DKndEdl+E+WDT0ZeCsNpEcnwQJZ4P1NOMFMKmmMr/mQt/wfkSlpfJzI4lEwerW8L170Ij
	6RDgnpIvyOr5OSLmOcKynSUeZzB/XUgEr09q8otnfg5hh2qIfkp+9QvK4kq5q5mtOjEHfbu2MHdsU
	dupSTjCw==;
Received: from ip6-localhost ([::1]:37480 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nD6UY-001fME-C8; Thu, 27 Jan 2022 15:15:18 +0000
Received: from mailhopper2.bazuin.nl ([92.66.229.69]:60620) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nD6UO-001fM5-Lg
 for samba-technical@lists.samba.org; Thu, 27 Jan 2022 15:15:12 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1643900209.81897@2kHdppuNgPZTx9e6b4fjBA
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: 821F711EE63.A6B9E
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id 821F711EE63
 for <samba-technical@lists.samba.org>; Thu, 27 Jan 2022 15:56:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20220103; t=1643295409;
 bh=FZqR55R0Pe32wsqOWJKfP7kK+vB51JOudJKYexLpLxc=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=B6hIBC+fyn6tMYr9r2fNkCwizK8mmV6xp58FvFHnBDjMaDKYV54PG+N57AmS49wgz
 0emhPQY744w+WmKVKEl5FLgIHo2iDb8sjzeLcSdc94uy4YT7t/vkz9bgBsQN/EjssO
 XAZx1vTdU4u9rOCumufyWWBYTGWFzzLbL8cECTNkoFP74fcSB9Ef8RBtQZatG/guQy
 NuYGOa9yZ1nWYx4hE8gkfHurOYaMSwpkCotD+FCdAjYclFzOCiRQ3uZSqhyE9UPgw3
 Ji7ZTaFbVZpBbp6mwGMvDWhUvsdBKXYo8t/mCrcwb5EtMCoLwZzkkeRYK4ko55gcoy
 MgLzxBFomp6fw==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id AF1D018C237A
 for <samba-technical@lists.samba.org>; Thu, 27 Jan 2022 15:57:04 +0100 (CET)
Subject: RE: samba-tool gpo not finding DC's
To: =?windows-1252?Q?samba-technical=40lists.samba.org?=
 <samba-technical@lists.samba.org>
Date: Thu, 27 Jan 2022 15:57:04 +0100
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAKYNSb7s=NsbZG6XxnvxhegnrWKTS05oVVa2MBkQ-528AqbnRw@mail.gmail.com>
References: <CAKYNSb7s=NsbZG6XxnvxhegnrWKTS05oVVa2MBkQ-528AqbnRw@mail.gmail.com>
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: AdgTjiRZOxlykRU7Qxq/jh+iRF34sw==
Message-Id: <vmime.61f2b2c0.1d1b.422263405fa1fec0@ms249-lin-003.rotterdam.bazuin.nl>
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
If you have this in nsswitch.conf=20

hosts:     files mdns4_minimal [NOTFOUND=3Dreturn] dns

Change it to=20

hosts:     files dns mdns4_minimal [NOTFOUND=3Dreturn]

Since .lan is "also" a registered TLD for mDNS.

For these GPO problems, what is windows event viewer telling=3F=20


Greetz,=20

Louis


> -----Oorspronkelijk bericht-----
> Van: samba-technical=20
> [mailto:samba-technical-bounces@lists.samba.org] Namens=20
> Alecsandru Chirosca via samba-technical
> Verzonden: donderdag 27 januari 2022 15:04
> Aan: samba-technical@lists.samba.org
> Onderwerp: samba-tool gpo not finding DC's
>=20
> I have a strange issue with samba 4.13.14 on Ubuntu 20.04 LTS=20
> where almost
> all samba-tool functionalities are OK but the GPO options are=20
> not working
> with the following exception
>=20
> # samba-tool gpo listall -U Administrator -d3
> ...
> dns child failed to find name '_ldap._tcp.INOE.LAN' of type SRV
> resolve_lmhosts: Attempting lmhosts lookup for name=20
> _ldap._tcp.INOE.LAN<0x0>
> finddcs: Failed to find SRV record for _ldap._tcp.INOE.LAN
> ERROR(runtime): uncaught exception - ('Could not find a DC=20
> for domain',
> NTSTATUSError(3221225524, 'The object name is not found.'))
>   File=20
> "/usr/lib/python3/dist-packages/samba/netcmd/__init__.py", line 186,
> in _run
>     return self.run(*args, **kwargs)
>   File "/usr/lib/python3/dist-packages/samba/netcmd/gpo.py",=20
> line 464, in
> run
>     self.url =3D dc_url(self.lp, self.creds, H)
>   File "/usr/lib/python3/dist-packages/samba/netcmd/gpo.py",=20
> line 127, in
> dc_url
>     raise RuntimeError("Could not find a DC for domain", e)
>=20
> DNS is resolved against the integrated samba DNS server=20
> (127.0.0.1 and LAN
> address).
>=20
> Dig, on the other hand works as expected:
>=20
> # dig SRV _ldap._tcp.inoe.lan
>=20
> ; <<>> DiG 9.16.1-Ubuntu <<>> SRV _ldap._tcp.inoe.lan
> ;; global options: +cmd
> ;; Got answer:
> ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 22559
> ;; flags: qr aa rd ra ad; QUERY: 1, ANSWER: 2, AUTHORITY: 1,=20
> ADDITIONAL: 0
>=20
> ;; QUESTION SECTION:
> ;_ldap._tcp.inoe.lan.           IN      SRV
>=20
> ;; ANSWER SECTION:
> _ldap._tcp.inoe.lan.    900     IN      SRV     0 100 389=20
> adc.inoe.lan.
> _ldap._tcp.inoe.lan.    900     IN      SRV     0 100 389=20
> adc1.inoe.lan.
>=20
> ;; AUTHORITY SECTION:
> inoe.lan.               3600    IN      SOA     adc.inoe.lan.
> hostmaster.inoe.lan. 134 900 600 86400 3600
>=20
> ;; Query time: 0 msec
> ;; SERVER: ::1#53(::1)
> ;; WHEN: Thu Jan 27 15:50:07 EET 2022
> ;; MSG SIZE  rcvd: 133
>=20
> same for samba-tool dns
>=20
> # samba-tool dns query 127.0.0.1 inoe.lan adc.inoe.lan ALL -U=20
> Administrator
> Password for [INOE\Administrator]:
>   Name=3D, Records=3D1, Children=3D0
>     A: xx.xxx.xx.xxx (flags=3Df0, serial=3D110, ttl=3D900)
>=20
>=20
> I am pursuing an issue related to the GPO's not being applied=20
> to domain
> computers (regarding department shares) when I encountered this issue.
> Can you please point me in the right direction regarding this issue=3F
>=20
> smb.conf (relevant part)
>=20
> [global]
>         dns forwarder =3D 8.8.8.8
>         netbios name =3D ADC
>         realm =3D INOE.LAN
>         server role =3D active directory domain controller
>         workgroup =3D INOE
>         idmap_ldb:use rfc2307 =3D yes
>         allow dns updates =3D nonsecure
>         full_audit: failure =3D none
>         full_audit: success =3D pwrite write
>         full_audit: prefix =3D IP=3D%I | USER=3D%u | MACHINE=3D%m | VOLUME=3D%S
>         full_audit: facility =3D local7
>         full_audit: priority =3D NOTICE
>         interfaces =3D xx.xxx.xx.xxx/25 eno1 lo
>         ldap server require strong auth =3D no
>         log level =3D 1 auth_audit:3 dsdb_audit:3 dsdb_password_audit:3
> dsdb_transaction_audit:3
>         min protocol =3D SMB2
>         name resolve order =3D host wins lmhosts bcast
>=20
> samba-tool ntacl sysvolcheck and
> samba-tool ntacl sysvolreset
> work without any issues.
>=20
> RSAT does not report any issues.
> The main issue with GPO's is only related to new computers joining the
> domain (Windows 10), old computers work as expected.
>=20
> Best Regards,
> Alecsandru Chirosca
>=20
>=20


