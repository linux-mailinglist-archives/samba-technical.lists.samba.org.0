Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A4727ECF
	for <lists+samba-technical@lfdr.de>; Thu, 23 May 2019 15:53:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=PDb707NtZTM/aBvJ7yfXoIAOllAZeZbvC51CllKIU10=; b=AACmk8KDyO2rnqqXhrGLsgoZna
	wPuOwEwmkDQmR46uZQba6mlsfczcX9GC/ZVh+BEiSPu8yABYeTm/edbTeYH3dyv34j6CnzH1mpfEf
	pdnU0iWCgcprAda1Axp7v9yN5z6FMq8bLAkh/hBK80MpMxrNmWTA0Z0qRJ8fgAhKj2axmr0AV3fvL
	z+v4DTLy7Sc6hm9dzCq/sHwW+J7zGUVqghvQjWcdnG2A8BAIoR19kZpNL18Tmi7TXqbRptft4JT8T
	LR/H5REiz1MGaNHCq2Ic6s80Rsapd9oGUygBJ1HDxlcIa4LUbTDPO0KI1XOOSxyd/ErEJngQiFz9c
	K7DtWSNQ==;
Received: from localhost ([::1]:46264 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hTo8a-001RLx-4x; Thu, 23 May 2019 13:52:04 +0000
Received: from [2a01:4f8:192:486::147:1] (port=47290 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hTo8V-001RLq-60
 for samba-technical@lists.samba.org; Thu, 23 May 2019 13:52:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=PDb707NtZTM/aBvJ7yfXoIAOllAZeZbvC51CllKIU10=; b=jQT2fftXW1Vl/reNYiELgEhGDI
 bAQdHnm+R56DYFGJ1pENlDVsvy01XfBqMihRwQp+qgiET/FX3yfY3yBX08dxK3ncokjt+1Gylh3Tm
 LL4zlEHh6XqX7Hcj8eNaXkg+SAzX48pdL+uVx4wpkHtafbdn2VbnKkSHXhE1uLppT+Rc=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hTo8N-0008Pq-5F; Thu, 23 May 2019 13:51:52 +0000
Subject: Re: [PATCH][SMB3] Add missing defines for new negotiate contexts
To: Tom Talpey <ttalpey@microsoft.com>, Jeremy Allison <jra@samba.org>,
 Steve French <smfrench@gmail.com>
References: <CAH2r5mvEYMEUjz8BDRUumn0yGq__VntNKx-8AzWcZgCDOJQv-Q@mail.gmail.com>
 <20190418172353.GB236057@jra4>
 <BN8PR21MB11863B736AA5D284CC213118A0220@BN8PR21MB1186.namprd21.prod.outlook.com>
 <CY4PR21MB0149DC81B079BCD36D580AC5A0350@CY4PR21MB0149.namprd21.prod.outlook.com>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Message-ID: <4591362b-cb4e-7e22-00a6-bf7239584957@samba.org>
Date: Thu, 23 May 2019 15:51:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CY4PR21MB0149DC81B079BCD36D580AC5A0350@CY4PR21MB0149.namprd21.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="mFFEKhsXWfIBEUS5bTWYk99HOukjRePUi"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--mFFEKhsXWfIBEUS5bTWYk99HOukjRePUi
Content-Type: multipart/mixed; boundary="Q4zF25MSWowUMmT5aCjZ3NgdxiH8iFLuU";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Tom Talpey <ttalpey@microsoft.com>, Jeremy Allison <jra@samba.org>,
 Steve French <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <4591362b-cb4e-7e22-00a6-bf7239584957@samba.org>
Subject: Re: [PATCH][SMB3] Add missing defines for new negotiate contexts
References: <CAH2r5mvEYMEUjz8BDRUumn0yGq__VntNKx-8AzWcZgCDOJQv-Q@mail.gmail.com>
 <20190418172353.GB236057@jra4>
 <BN8PR21MB11863B736AA5D284CC213118A0220@BN8PR21MB1186.namprd21.prod.outlook.com>
 <CY4PR21MB0149DC81B079BCD36D580AC5A0350@CY4PR21MB0149.namprd21.prod.outlook.com>
In-Reply-To: <CY4PR21MB0149DC81B079BCD36D580AC5A0350@CY4PR21MB0149.namprd21.prod.outlook.com>

--Q4zF25MSWowUMmT5aCjZ3NgdxiH8iFLuU
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Tom,

>> The Windows protocol documents were updated on March 13 for the
>> upcoming "19H1" update cycle.
>>
>> MS-SMB2 version page, with latest, diffs, etc:
>>
>> https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-smb2/5=
606ad47-5ee0-437a-817e-70c366052962
>=20
> So, there was a defect in the published spec which we just corrected, t=
here's a new
> update online at the above page.
>=20
> The value of the new compression contextid is actually "3", but the ear=
lier document
> incorrectly said "4". There were several other fixes and clarifications=
 in the pipeline
> which have also been included.
>=20
> Redline diffs as well as the usual standard publication formats are ava=
ilable.

There's no server behavior defined for
SMB2_NETNAME_NEGOTIATE_CONTEXT_ID. If there's none, why was it added at a=
ll?

metze




--Q4zF25MSWowUMmT5aCjZ3NgdxiH8iFLuU--

--mFFEKhsXWfIBEUS5bTWYk99HOukjRePUi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAlzmpVUACgkQDbX1YShp
vVYhNRAAh6H/tLfGej+8sNPQx7thEJTKiIqdAoPEJL8P6aIjdZzGDRiV9GvPIJl2
1TJWh0bfjzUIkYhwrokcvnBSM8g4pIGW4MNFwY3mp58p4/o+Xvct7TkGQ3hGOtf8
zJQe0Vs/+NCpnw5LrCmVc/MnZ9VPg2UjFEsB5bjq5OLS8TSxP4VMx19ikucL8YEa
YieWybGWmCYuTKGJWOJbn3DeFeIjkmpMrE4Ee81q2+ERM9VO0os4B0K2D9OYzOBk
HHmFQ1Wo44j87k5DEyjyYkBSCsFbQeIXmb/TJKVuBc81gKE7UEAyLORMCiPvzCQq
x0mzNXEoa0nDv8Moef4a6bTY0Xvgfyb7EaKOSc7Q/nnSNvNNYiWzvZEMbpCGAR+6
EaEnerqOy2gNDb+QncqfB3gZG/AgqO4bwRqOVi01OohwaITtDwgLd391IAfFV0TS
Pfztr3BmdfREu42oM2FEHBxNPUbGoNecO45+tsGhmcslgsme88vgfDXmdYnm3RQb
9LtlxjQGcx8ccCR5tzauT611BJuaECFVkbFTod9N+CthCIXCwReVpXhCjx/9aC30
gJYDrFw24w9zwdT4f5ZXkVxQlEndEUZQWiWYH0UtwWj4gAt+KegBZUhVAfu+ge3n
4r84UsyaEHE0wWCezTHNs2viSeMJVbU13vmv7TtZttH3/S5Ce7Q=
=SL/w
-----END PGP SIGNATURE-----

--mFFEKhsXWfIBEUS5bTWYk99HOukjRePUi--

