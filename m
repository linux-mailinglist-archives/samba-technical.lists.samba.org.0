Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBCF34982F
	for <lists+samba-technical@lfdr.de>; Thu, 25 Mar 2021 18:36:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=gcKBrCtgKZhf24pBhplTX7U928rBeUtVUipqFZkgnJw=; b=slMaWxmYz6HA6XlnwT0fsB7cBr
	gPP0Jg4L7pQ3sjYSUOymMbugCdWIIC0f0cKUHVQbNEBRqPX92a5cyVo632q2bhL5L2l34QLHqch4G
	QAdAggtgDuOuCkMVAjPyZD56EsulreX0n6j+U4tOtSmOgG1bjhXjUW0pm8le0j+r/urPks8UaWb+n
	V0VB0sJ7PidDxwDxJ6Ph+TChBA0Ra1EndGsSCni2hoBTaMhaJ6vCaQqpymfmCZroZ80kpo3bOFuWv
	VgFjj26UCj29wMwMJvPM9J5ezvFkrd2B0PgNmtNprlq5sd300r+pMlHs7+0ZdA+3A+jxkkixHhzYB
	74rRqt/g==;
Received: from ip6-localhost ([::1]:41764 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lPTtv-006lEf-IJ; Thu, 25 Mar 2021 17:36:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46806) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lPTtp-006lEY-VB
 for samba-technical@lists.samba.org; Thu, 25 Mar 2021 17:36:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=gcKBrCtgKZhf24pBhplTX7U928rBeUtVUipqFZkgnJw=; b=jdCiimNigjPP/HaY/OAg6zrpqW
 ccgc8ZnmpfPAC+iWVnRVOfwVmG5hpgHhIB9lKu7yle8oF0BEVQEYW1UdshtORO+E4f7GTTgUupx3S
 XBwLcw4OhYJseIejYuCn3YxLU3rH2/mrugJzeYw9HacaCSEn7n7ov5i8q345g12sy5ZCCcoOuaYgx
 iycUSA3LlZudxeOI/BtH+UjHS6uF82eNBfz3tVZ1PjZ4efRRoRct6oCO+xuJd+Q5f8ZO0sY830Zuo
 JsbImkr9P/BUlVUmjeZiBkyaCdV2X2BKIG5PXzblWgLc+/z7sq+4/dR0leTT2IUAsEUJcj79BP/S2
 p+sLS3WgSqnU41ITq/5ks991fbywKbmtFOXBFvUiX6DyuseyQ+WQK2bzNlIrT6pWs5HBYyrU4Mrny
 KL09xb1cLBz7b9GnoJUZJcMSSaaAsZ6MW6Q2gUmEmCIZc3cVg4DqopkThL8TKl4dcM3/SOu4KrNTT
 P/rsH8bFO2FtnmPtqxpbVC2B;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lPTtm-00027T-9q; Thu, 25 Mar 2021 17:35:58 +0000
Subject: Re: Drop NIS support
To: Rowland penny <rpenny@samba.org>, Andrew Bartlett <abartlet@samba.org>,
 samba-technical@lists.samba.org
References: <4045140.l1vqqZ3lm0@magrathea>
 <20210324161244.GB818616@jeremy-acer>
 <3742e07eba544478383ae1a7e9e56197beb12616.camel@samba.org>
 <359f492d-7dbd-2e95-1c8c-3178d9e51344@samba.org>
 <5f50518b-d317-f5ff-d9dd-a34497c21873@samba.org>
 <4e8cd599-96e5-361d-28c7-ff26082a7644@samba.org>
 <190c273a00fe5b37f6dd494d4296acfcceb2ca2b.camel@samba.org>
 <eae366ce-7751-27bd-bb7b-fe4b7c5bc286@samba.org>
 <a76c4d92-4b3a-0d42-15eb-aea8951781da@samba.org>
 <d38770d4-0665-efc1-1ab4-6d41f3868497@samba.org>
 <7ca521b0-b710-0069-0360-1aceb6694346@samba.org>
 <aae767b3-f1b5-8e6a-da1f-b5819cb8fc4d@samba.org>
Message-ID: <5cf9b2f2-a33a-71a7-5c1f-9dc002d3aa23@samba.org>
Date: Thu, 25 Mar 2021 18:35:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <aae767b3-f1b5-8e6a-da1f-b5819cb8fc4d@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="DIVVuyKDyGreJ9tyJfSNX9IGfudPSREXo"
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DIVVuyKDyGreJ9tyJfSNX9IGfudPSREXo
Content-Type: multipart/mixed; boundary="sSBgYf2EeKQWbsKwbCYgeKs6fZPCGXdTW";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Rowland penny <rpenny@samba.org>, Andrew Bartlett <abartlet@samba.org>,
 samba-technical@lists.samba.org
Message-ID: <5cf9b2f2-a33a-71a7-5c1f-9dc002d3aa23@samba.org>
Subject: Re: Drop NIS support
References: <4045140.l1vqqZ3lm0@magrathea>
 <20210324161244.GB818616@jeremy-acer>
 <3742e07eba544478383ae1a7e9e56197beb12616.camel@samba.org>
 <359f492d-7dbd-2e95-1c8c-3178d9e51344@samba.org>
 <5f50518b-d317-f5ff-d9dd-a34497c21873@samba.org>
 <4e8cd599-96e5-361d-28c7-ff26082a7644@samba.org>
 <190c273a00fe5b37f6dd494d4296acfcceb2ca2b.camel@samba.org>
 <eae366ce-7751-27bd-bb7b-fe4b7c5bc286@samba.org>
 <a76c4d92-4b3a-0d42-15eb-aea8951781da@samba.org>
 <d38770d4-0665-efc1-1ab4-6d41f3868497@samba.org>
 <7ca521b0-b710-0069-0360-1aceb6694346@samba.org>
 <aae767b3-f1b5-8e6a-da1f-b5819cb8fc4d@samba.org>
In-Reply-To: <aae767b3-f1b5-8e6a-da1f-b5819cb8fc4d@samba.org>

--sSBgYf2EeKQWbsKwbCYgeKs6fZPCGXdTW
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 3/25/21 um 6:33 PM schrieb Rowland penny:
> Which part ?
>=20
> 'DO NOT USE THIS MODULE!' which he says three times
>=20
> Or:
>=20
> What I personally want or would like to do myself is
> to remove the idmap_hash module altogether. But
> unfortunately that does not seem to be feasible,
> since it is used out there.
>=20
> Or:

the part below. It explains the internals and warns to stay away from it =

which is as far as we should go at this point.

Thanks!

>=20
> The idmap_hash module calculates a Unix ID for a given SID as
> follows:
>=20
> - Write the SID as DOMAINSID-RID.
> - The module calculates a 12-bit hash value of the DOMAINSID,
>  =C2=A0 i.e. a value hash(DOMAINSID) between 0 and 4095.
> - The unix-ID for SID is then calculated as
>=20
>  =C2=A0=C2=A0=C2=A0 unix-id(SID) =3D hash(DOMAINSID) * 0x080000 + (RID =
% 0x080000)
>=20
>  =C2=A0 (Note 0x080000 =3D=3D 524288 and 4095 =3D=3D 0x0FFF.)
>=20
>=20
> Hence:
>=20
> - Each domain has its predefined fixed range of
>=20
>  =C2=A0=C2=A0=C2=A0 hash(DOMAINSID)*0x080000 -- (hash(domainsid)*0x0800=
00 + 524287)
>=20
> - The overall required range to be able to map all SIDs is
>=20
>  =C2=A0=C2=A0=C2=A0 0 -- 4096 * 524288 - 1 =3D 2147483647
>=20
> This leads to a few issues:
>=20
> - Any range smaller than 0 - 2147483647 will filter some SIDs.
> - Since we can not start the range at 0, some SIDs can *never*
>  =C2=A0 be mapped.
> - Some domain SIDs will be mapped to the same range.
> - RIDs will wrap around, i.e. DOMSID-RID and
>  =C2=A0 DOMSID-(RID+524288) will be mapped to the same ID.
>=20
> Hence the recommendation is:
>=20
>  =C2=A0=C2=A0 DO NOT USE THIS MODULE!
>=20
> If you have to use it, then make the range as big as possible.
> I would say start as low as you can afford, i.e. 1000 or 10000.
> That way, you'll at least catch some IDs of those domains
> that are unfortunate enough to fall into hash value 0...
> (Note to Andreas: If you want to start at 520000 instead,
> completely filtering hash value 0 domains, that is a point of
> view as well, which comes closer to not using the module at all...)
>=20
> All in all, I can only repeat:
>=20
>  =C2=A0=C2=A0 DO NOT USE THIS MODULE!
>=20
> Rowland
>=20
>=20


-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--sSBgYf2EeKQWbsKwbCYgeKs6fZPCGXdTW--

--DIVVuyKDyGreJ9tyJfSNX9IGfudPSREXo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmBcyfwFAwAAAAAACgkQqh6bcSY5nkbC
8xAAktIWnZHEqMqM3NDHuXBjWsiFHeBAhvVG4suBKAzEcZoW+fWnldXPKTrXp4/xP2/tnF9oDK0i
1qMAOj3Wf7zt1RAStlj7+zcGZ1xZOGagIpopiCaopWDlZ2UlK9dWy/uVTjbgdWB/XzRFzJ9e8tIo
M9ByMdPkFL7rZyrGWhGE38NKaWqMuAW9xKZhR3DCMMFOL1RCFpqndbHGdQ2VWRLDpc4uiPo2bK4u
EXBisFtQwCbYvMkrsXpAkO6sqxKR9CLxIAlLj1HUTHbXiueciAB+H82n/kCjufq2yQ4M92Fo9P4/
NluJpY0wmniTnb/V4yQHC85EgU9oc7GUChUxDwwh4NYbea6KlNSBb39eTXoHtYbrYlje7daMuC8+
55T9QvBVkXlpTN8LcrX348u1XymjMcUXVgWIx4SHFrlK9/5dZDF6TSILosJhWJqnBy24h6R8AkfR
PO8QLFjq7maiJxC8SXhXv0o3eDX2+esRAaZXViLJFZpmzMXQjUMgGy9GgLOvyTB2ih+l921sahjR
8G2DQmeZb4oi9P4lCInL+2vK/96OFTRCHZK2ml6/yuGw3IKpHsTPlhSrfHcn2mkFSKHOyp2oGXO0
M3Egc0NJ0S/nJ4H734OATvR1uJpgAiPg4Ru7pXoXVNZa4mx8sgcaddQbmzOBSZCcjtwbZ0MYuNSm
DRA=
=eMlB
-----END PGP SIGNATURE-----

--DIVVuyKDyGreJ9tyJfSNX9IGfudPSREXo--

