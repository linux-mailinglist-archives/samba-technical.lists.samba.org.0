Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 008C4A27A0
	for <lists+samba-technical@lfdr.de>; Thu, 29 Aug 2019 22:04:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=gHEtZGvCTPiHeu5xLYf+ZE7GPl2WUMDclLbBgOpUqD8=; b=bHdKfTKrY4rlNYD2UsBehFL9BQ
	SZRnst47XXOPxi9jVs5SBu83HkAWhnu5fOSNxrGF6KTOl9Nlv0cIR33aNHOy1VpFN9p+M7cr0xDFJ
	nPCOr+I0xEsF6GNyiXOlTz7NYeencypkOGsXNNaSnaH1sBRuIr47U1kpy9oyz8gBoRN2tY3+bLzRv
	K7A8IZ/N6BJoG7lOtWo1FbStwy71JwuRnN0NYZem+rNtu2bC2S7srj72G2FE46DA1FEGwLPQ2Bv9x
	iQcUukIP3CYVFJ5I2H22jxpQ4vn5keJf+OfdJs9EQRwTZH9Z3kRxJHS/W9YtQH3peLV7XhX/MTQDB
	xfl6vsdw==;
Received: from localhost ([::1]:26676 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i3QeK-000OBl-Ki; Thu, 29 Aug 2019 20:04:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46322) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i3QeF-000OBe-Kf
 for samba-technical@lists.samba.org; Thu, 29 Aug 2019 20:04:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=gHEtZGvCTPiHeu5xLYf+ZE7GPl2WUMDclLbBgOpUqD8=; b=k8h6HFaCMcUfg1tFN1ngfw5iTc
 7BB/7/JCnrGd1ymXTEBhuh18Unokrpl0zk8XrnItVdiLO6mztbeXOBH2gpLw7u8BkQG/eKn18MyzC
 hRYINAgq4Gyxu3RxbaipXqoO4LKYaHTXhLsjt4tS6JJYxX7Fs6W87jsRfFCBz9Nh0z0w=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1i3QeF-0006pb-4G; Thu, 29 Aug 2019 20:03:59 +0000
To: Isaac Boukris <iboukris@redhat.com>, samba-technical@lists.samba.org,
 Andreas Schneider <anschnei@redhat.com>
References: <CAEiGmB+e_BcL=shJ6y+ePa2Ja4d8xw1NpZSXc3sym6EGV=DD-g@mail.gmail.com>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Subject: Re: Join a domain independently of local hostname
Message-ID: <15a0e30a-e2cf-e52d-f4c1-8725d2f4f641@samba.org>
Date: Thu, 29 Aug 2019 22:03:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAEiGmB+e_BcL=shJ6y+ePa2Ja4d8xw1NpZSXc3sym6EGV=DD-g@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="N5ovmj3cVoGSimFDJ4ZyaYGQVjDoYS06M"
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
--N5ovmj3cVoGSimFDJ4ZyaYGQVjDoYS06M
Content-Type: multipart/mixed; boundary="GX79yYr8W9CdA5yMKTSRVx4zkfT4SrhEu";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Isaac Boukris <iboukris@redhat.com>, samba-technical@lists.samba.org,
 Andreas Schneider <anschnei@redhat.com>
Message-ID: <15a0e30a-e2cf-e52d-f4c1-8725d2f4f641@samba.org>
Subject: Re: Join a domain independently of local hostname
References: <CAEiGmB+e_BcL=shJ6y+ePa2Ja4d8xw1NpZSXc3sym6EGV=DD-g@mail.gmail.com>
In-Reply-To: <CAEiGmB+e_BcL=shJ6y+ePa2Ja4d8xw1NpZSXc3sym6EGV=DD-g@mail.gmail.com>

--GX79yYr8W9CdA5yMKTSRVx4zkfT4SrhEu
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Isaac,

> In the join process, if we get an fqdn from getaddrinfo for local
> machine then we prefer to use that for dnsHostName and fqdn SPN over
> nbname+realm, see:
> https://github.com/samba-team/samba/blob/1f923e067dbe358c17cbccfe179baa=
811aa3b8b3/source3/libnet/libnet_join.c#L523
>=20
> I'm working on a ticket where the customer wants to be able to join a
> domain based only on netbios name from smb.conf, independently of
> local machine hostname (reportedly, this used to work). The problem
> they are facing, is that the fqdn returned from getaddrinfo, sometimes
> has already got a registered SPN and the join fails with "Failed to
> set machine spn: Constraint violation".
>=20
> I wonder how can we accommodated this use case, maybe we can fallback
> to nbname+realm if we get this error, or perhaps by adding a new
> parameter to net-join specifying the machine fqdn, or a new smb.conf
> option ?

I think we should not use the machine fqdn.

Just "netbios name" and "netbios aliases" together with the
configured "realm" via the "lp_dnsdomain() function.
I think we could have a new option "dns hostname aliases",
which can take a list of additional names.

This make the whole join process much more reliable
and avoids relying on /etc/hostname values to
be correct.

metze



--GX79yYr8W9CdA5yMKTSRVx4zkfT4SrhEu--

--N5ovmj3cVoGSimFDJ4ZyaYGQVjDoYS06M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl1oL6sACgkQDbX1YShp
vVZCvQ/+JwAjCFb9uydRyUWGfxShGrbDnLRe+szyMHxGsb4Av2savKH3stRkD0MT
t5TxCfj375xv/AmtMsmNDFrt6sZqY3ZydyDukHZWrPPQsxibVRmsZTKXr16CcGbG
64LqXmPy8LX5WSP4F3P/fWTK23ktrtPrVKWmQRTn4lr9QxzLX14RWYl1fHaWZ8y7
Zu/B1KUvx9aDDTRDwylBEOS0wYM1yYSmhZGN3SDHKmomm54sxGFkTQL3s+41BPTf
3YFm7bdtc39GEC4xHPnxTav0p+R+2qsVOZNAn5KLdbc4ytthL5f63PzB+XAnCGDc
SN4CNLymFBrxTvimSgDP+ahJDIozgs0vStrf7Pv/vKhJ9kgD1zoS55zTUc4dZShk
opfTOSXLYjDdMTzGnlDWbBCfZFNnQVWB7UP1xtCIB9xo32W0frtbbznPIue4G9+5
8eyWWbKUqZrpW385eYaj0S8uAMFDJ7HONk7klPROdByW3BPWt2Bkq+8sX2+f6CkK
X4dpZuST7eRkF2bJlDOLIvQZ7tpEtinOLOxnNsF4kSkMMm95Vt9tgJ8yhiVxbf44
xZmZtp7jb+HblkPJBbsJuZH0mtaunFfyBxTeQzCBEJ+xRrPeQ+OGTkVlCk+VdDYs
I05KDbtZy043M/1kGAS0Y7gi2h9b9KQZYnMLpx/HbypN6OubeAQ=
=4B6W
-----END PGP SIGNATURE-----

--N5ovmj3cVoGSimFDJ4ZyaYGQVjDoYS06M--

