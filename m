Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A437216B13
	for <lists+samba-technical@lfdr.de>; Tue,  7 Jul 2020 13:08:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=iKdaO6CEUDG6IlkJxvmHDRV/GglQUt9ttwh1Iyt2hBA=; b=wYHsSM1P7tst05aRXe369hxZZJ
	dgXouakp7DxRZvx2xPdvgsuPNxJdtDus0mE81BqVxGh3t5hWRlJKgdW2sITfoUPfeI2KFYaBKiFMo
	kmsK4JLB6+OQmS7yYE5t8iHq4eFwIhdip+V0xhUVBBvwK51dtWRxIqqTIQ3KdSdHZmJFtDaqOg77/
	UIqaWrq86/CdAFWI9sNtE4dzFGUxYnTA7c8qsoJEguQRyjXQxbm9BIBRqE6dUVE0PJDrkbdiipCon
	koOl7HSTrrmDK4gu6XPIrzGIluS/pjGKBfFTsHWamAGLMphhyjkN/DEI+ZBk2qnaiq8Q7WYicJtPC
	WsZjE0sQ==;
Received: from localhost ([::1]:52748 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jslSo-005u5d-I1; Tue, 07 Jul 2020 11:08:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55912) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jslSi-005u5W-Hv
 for samba-technical@lists.samba.org; Tue, 07 Jul 2020 11:08:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=iKdaO6CEUDG6IlkJxvmHDRV/GglQUt9ttwh1Iyt2hBA=; b=m28B1bwJCPVRz348LoYF4SOibb
 GeQ1KAcs7u67bO1aRNUVbLt3ib6iBnXs5w6M7taHg5iRUpASA3DSkJytRNKbWc51pmNMWAWJ1VMQ/
 TXJ+chJBzRjbes2/iUaBIP8vS/apwhRM6f5V5AhnZMOWHAQ4zNridJdmPMFtA05vuYfCm0iyOgxLB
 Oi4ZFyGf6XNOObYw/ujjSPr8gPj6AmqF79WwIjm2z4i3GJQ0NQvnEO8tcVe38dG4abbdS363ZOe6x
 tv+ZimH8t9oAnxeVRtSKq9SSh1Y/M64XXm6cm7juvB0ZMG99l1BbGDULuailVilqLGblbL6r4Ypem
 OJ6jGUvMQL67uMtjepOQUTKUcKyDwXq3B8v5riWEO1snweNVvSL0NYfzZsF2xMW+yBS9RzFNpHkMI
 sLEsdwdxInLQmr8X8ZT38u6NKrBgnucWVeGumviY0VyHnh5sGx9ZbveTC4UAW7uDHfHY3MoaJNK5/
 Xe1E73Q4ntSOwKlLRrXUB4Hx;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jslSh-00031X-28; Tue, 07 Jul 2020 11:08:31 +0000
To: Isaac Boukris <iboukris@gmail.com>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andreas Schneider <asn@samba.org>, Andrew Bartlett <abartlet@samba.org>
References: <CAC-fF8S_WZuALxjhjFKhYeaKjhrccjq2XG6k=db18o3RYFpWrA@mail.gmail.com>
Subject: Re: Deprecate net -k?
Message-ID: <7201cbce-7e3c-0fdf-6334-43443d3582e2@samba.org>
Date: Tue, 7 Jul 2020 13:08:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAC-fF8S_WZuALxjhjFKhYeaKjhrccjq2XG6k=db18o3RYFpWrA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="gfxphCcKXTRyM3hrSZ9nlKflz8njklDQP"
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--gfxphCcKXTRyM3hrSZ9nlKflz8njklDQP
Content-Type: multipart/mixed; boundary="NN8Di3xtXpWuHGUO8sSBlnJC6vb4HfvZQ";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Isaac Boukris <iboukris@gmail.com>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andreas Schneider <asn@samba.org>, Andrew Bartlett <abartlet@samba.org>
Message-ID: <7201cbce-7e3c-0fdf-6334-43443d3582e2@samba.org>
Subject: Re: Deprecate net -k?
References: <CAC-fF8S_WZuALxjhjFKhYeaKjhrccjq2XG6k=db18o3RYFpWrA@mail.gmail.com>
In-Reply-To: <CAC-fF8S_WZuALxjhjFKhYeaKjhrccjq2XG6k=db18o3RYFpWrA@mail.gmail.com>

--NN8Di3xtXpWuHGUO8sSBlnJC6vb4HfvZQ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Issac,

> I think it has been discussed, but I just want to share some tests I
> did in the context of MR 1402 work.

I also hit this in my preparations for S4U2Self (I'll post more about
that later).

> The man page of the net command says:
> -k|--kerberos
> Try to authenticate with kerberos. Only useful in an Active Directory
> environment.
>=20
> In practice it means that some net-ads commands use ntlm by default,
> e.g. net-ads-join force the use of ntlm for the CIFS connection if -k
> is not specified, even though it uses krb5 for the LDAP connection.
>=20
> Fails due to the CIFS failure:
> net ads join -UAdministrator@ACME.COM%pwd --option=3Dgensec:ntlmssp=3Dn=
o
> Succeeds both krb5:
> net ads join -k  -UAdministrator@ACME.COM%pwd --option=3Dgensec:ntlmssp=
=3Dno
>=20
> Succeeds both NTLM (although AS-REQs are still being performed):
> net ads join -UAdministrator@ACME.COM%pwd --option=3Dgensec:gse_krb5=3D=
no
> net ads join -k -UAdministrator@ACME.COM%pwd --option=3Dgensec:gse_krb5=
=3Dno
>=20
> Other commands such as net-ads-search on the other hand don't seem to
> care about the -k flag and only use krb5 (thus fail with
> gensec:gse_krb5=3Dno).
>=20
> I think perhaps we can deprecate the -k option and just do it by defaul=
t.

The bad thing is that -k is implemented different than in smbclient.
The key part is the behavior without -U.

smbclient only uses the users global ccache if -k is given,
but (at least some) net commands ignore -k completely.

Andreas and I were working on a plan to unify the cmdline arguments
for client authentication across all our commands (including python
scripts). We should always get a cli_crendential structure out of
the cmdline parsing and base all other code just on that.

Andreas, can you post our current plan?

I guess the only thing is to try to break as less as possible,
but at the some point just make sure we have a sane behavior for the
future and announce that in WHATSNEW.

metze


--NN8Di3xtXpWuHGUO8sSBlnJC6vb4HfvZQ--

--gfxphCcKXTRyM3hrSZ9nlKflz8njklDQP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl8EV6oACgkQDbX1YShp
vVbPvRAAnBQ2eMVzazBBUQw+0rJQe0sovfSIVXzqLHdqeczQDeUQNgjmU2vob/OU
tzTVJm54PvakMO3bqdHfumCYtpvFklsTs60evJLVUpt7jzKwKPBVi+3Ubm0OVCZ7
ke691a0PjBvQdZI++iU2powtUZAKTkzR0N6nufDDpvtBFzJomU/rF/ErZB8OScdP
1hxf8qCtQpM8of/9ddbSKnskpc2MMoQk7mn6PL2p12961YNntfGEWn7r/1EZeTNe
L8O+e6S4w87iSq1W9ly4QRobftKZK76Je5cwbHYpdCtbwldaQqrtqM6IQV9gMRBW
D5lYP4MVuAooKm+V4rP5loD8iYfF2kqSyqiqe+8DurOMOcp1xVlBknCSaiGdDMI8
yw4bPhJF5hLKhFvSmVmW8ucE1sfXwPdor/vov6N2dSQInlUkvSiRY2jwo/s/6/SR
FZgL/wgb221HJ7HNtc0DzeWCqp/NXzKwdNUrqFKA8VGNiFJ+YVJqB5jRxwGrfowh
i6EZjwpSfXz4EG6dmVnQxaC3hdVNxHz7RkQMJf1o+srRfGkUAliIwtU9G38/Id0E
AyeVMaYrZtMMRpHlVCrGz9TN5dYjQfdmIu3PVT8HxJxRsCoEe/uuMggsjQoJH1JL
9GX7kbX6Q6491Ay0I8vFNM79JG9NtZe02RBUW0AtNHzPbfyJHPA=
=4BA0
-----END PGP SIGNATURE-----

--gfxphCcKXTRyM3hrSZ9nlKflz8njklDQP--

