Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F845170168
	for <lists+samba-technical@lfdr.de>; Wed, 26 Feb 2020 15:40:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=HaeDymBadrinRqucj62V1PBr3RXGH+AO+sgrmEiny58=; b=qSvG25SOKq7sjBsJvd4TPP5E20
	b6gU3G3bFdQf8ROX+pU+CxHYnC1bNbxtr6iQZczQBxSqz26DdVIZX7t3Pl6tmha8/8EAnwDruInyZ
	NEdSR4QOSwgZ2DgnBezgchZBvpq60FdkerrdNajhd3zEQYtnC6/35+YLBjL6001iQ2DztoTzG80d7
	6DOp/Uvd6bXYJ+rwZNafFHLm05WwnLaTvvoAmAL9TmozmL+pGFYlKHXbmOjAsbL9q11jhRrYxuAWR
	wOJ7hvRdZ0nvDruqxnf7ptriw2e+3PGUecGnEPXu41unoRWM+wAP0DCeXwmEVO9SuAVYUySyA2Jmb
	S00dwkOQ==;
Received: from localhost ([::1]:51936 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j6xqa-00BnDB-Bj; Wed, 26 Feb 2020 14:39:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22488) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j6xqV-00BnD4-Po
 for samba-technical@lists.samba.org; Wed, 26 Feb 2020 14:39:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=HaeDymBadrinRqucj62V1PBr3RXGH+AO+sgrmEiny58=; b=m8KxgsDIcWqvhBP542QgN3a57t
 ieqf68VzcVoYMpL6y4rQrJeseSOe4IyVah4UCT1LxoK3BI7v+aUuCAOSUJyjoFh0En69RbL6cr5vL
 At3Nw7IXIttn2SFk89C2ig0RFkS7OfPYRTU8YTti6cZX3QwXVhFteFyw1BoHU33TSOF2ak4mXNYA+
 d32Y3wIsYjpFYz/95bPgDBLZQCLqdu2G8EgIol2TOKICJJXB2rg77qgHGfUiCwocUTZYVnFaYU5I+
 zQb3J8qLpKMECtAqbIKOl2IfhQYFaX4xCs+79Hd2aATsY5lIj3KQFENQRr1ylgPHTKS0GelcjyjeH
 l8OIY8lUVO4M7C3q0N/puu1vtkfKl0Ghe5T0JE1w85QjFhg+sn1TOoIGj+ysK/kihCfECO8fAtL3s
 nHZOMM+yNUzzvCPUxDqEJ+ZspInzjmrdcJmUU3vT42ap7IpfHbD5FT4p5MJGvZEX6K/LmYtD+/lQW
 aEtq6FE46iowjFeMZC0scFks;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j6xqU-0008I5-Di; Wed, 26 Feb 2020 14:39:30 +0000
To: Isaac Boukris <iboukris@gmail.com>
References: <CAC-fF8Tp_mPkza63VxtiXm3fdnDSfr616roVnK-PwDXqBodnhQ@mail.gmail.com>
 <6408dd32-53f3-2622-d6b9-04928793cc8b@samba.org>
 <CAC-fF8SF+FUQBWxsPnSRtAXEqE=TWBm0Meb8swERSvHqpQf0yw@mail.gmail.com>
 <CAC-fF8SFX0ndOpY2w9zASJd8FagnT_6Mh0Xd4=ejQKQYDcK-uQ@mail.gmail.com>
Subject: Re: ADV190023 | LDAP channel binding support
Message-ID: <374481b4-af4c-7b0b-cb80-feec96046b53@samba.org>
Date: Wed, 26 Feb 2020 15:39:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAC-fF8SFX0ndOpY2w9zASJd8FagnT_6Mh0Xd4=ejQKQYDcK-uQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="kiKSvCXXFC6wKkaXj93Ec6dgH2TjAD2JJ"
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
Cc: Andreas Schneider <asn@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--kiKSvCXXFC6wKkaXj93Ec6dgH2TjAD2JJ
Content-Type: multipart/mixed; boundary="pOLglqijRdriTimyPymi8p1KuNJgjMnmM";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Isaac Boukris <iboukris@gmail.com>
Cc: Andreas Schneider <asn@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Message-ID: <374481b4-af4c-7b0b-cb80-feec96046b53@samba.org>
Subject: Re: ADV190023 | LDAP channel binding support
References: <CAC-fF8Tp_mPkza63VxtiXm3fdnDSfr616roVnK-PwDXqBodnhQ@mail.gmail.com>
 <6408dd32-53f3-2622-d6b9-04928793cc8b@samba.org>
 <CAC-fF8SF+FUQBWxsPnSRtAXEqE=TWBm0Meb8swERSvHqpQf0yw@mail.gmail.com>
 <CAC-fF8SFX0ndOpY2w9zASJd8FagnT_6Mh0Xd4=ejQKQYDcK-uQ@mail.gmail.com>
In-Reply-To: <CAC-fF8SFX0ndOpY2w9zASJd8FagnT_6Mh0Xd4=ejQKQYDcK-uQ@mail.gmail.com>

--pOLglqijRdriTimyPymi8p1KuNJgjMnmM
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 26.02.20 um 15:21 schrieb Isaac Boukris via samba-technical:
> On Tue, Feb 25, 2020 at 9:17 PM Isaac Boukris <iboukris@gmail.com> wrot=
e:
>>
>>> I looked at it a bit, see
>>> https://git.samba.org/?p=3Dmetze/samba/wip.git;a=3Dshortlog;h=3Dac8fd=
11f1d4b9deb48d6c7942af0c83b52d69d7f
>>
>> FYI, I got net-ads working against AD server by adding some logic in
>> source3, look:
>> https://gitlab.com/samba-team/devel/samba/-/commits/iboukris-metze-cbi=
nd
>>
>> However the fixed clients aren't working against samba server yet,
>> unless require-strong-auth is set to "no", while non-fixed clients
>> still work. I get this error (I also wonder how can I trigger the
>> source4 client code).
>=20
> Actually, Windows client seem to work fine against your source4 server
> code, even with require-strong-auth=3Dyes.  So I'm still missing
> something on the client side :(

Why? I guess the server just completely ignores the channel bindings.
What application on the Windows client uses ldaps?

Note that I fixed the channel binding checksum for NTLMSSP here:
https://git.samba.org/?p=3Dmetze/samba/wip.git;a=3Dcommitdiff;h=3De5afb9f=
f2aa23d43d0b968a3eca7ceffe1c8d606

With this commit where're able to pass the LdapEnforceChannelBinding=3D1
checks:
https://git.samba.org/?p=3Dmetze/samba/wip.git;a=3Dcommitdiff;h=3Dad59689=
961c860e38fb1d0e8c8996070faf77180

So for NTLMSSP the presence of MsvChannelBindings means strict checking
of the provided channel bindings, even if 16 zero bytes are send.

For kerberos only AD-AP-OPTIONS means strict checking and not ignoring
16 zeros.

And MsvAvTargetName is similar to AD-TARGET-PRINCIPAL.

metze




--pOLglqijRdriTimyPymi8p1KuNJgjMnmM--

--kiKSvCXXFC6wKkaXj93Ec6dgH2TjAD2JJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl5Wgx4ACgkQDbX1YShp
vVb/eBAAujKU1xiTpo7OZouP3fLP4lW0KbDRsfsmPx55G5enXSVmmawYJOkiX/2o
VrewPmPZ7wBjIPZgWEv+5b9WOG6uZwke8Fhp93NTfAAH9oQqGt0xB3VH7gREtYg1
sDq4auhoFV6QfXyp+hBhubN3gpvdCQh/qeR3wcqknQnpKK695XOrH8Eo53TEUCcb
WwTUMbp5GpRB4aAaYyFYyFiVV3TX+3pFhSghnrMoOrApTqe6I7yYoRc0idZt3dZ2
/56C08R0NjNFW7xfULlryJf6SAvE7JrgCjQirlafxFFFRv1TfUfCGtHCyx3zCqIH
cY86isoZ7prchnbMGKohvT0q1LSm3sdvG3GuEapBzbEB1WUaqg1t0JJcIvTFQW2q
PlZyAZBALJnvnoxrj5inLeBu/N9ZhVx2KLPBukFyucLS1kDj6XxiMxxKtCgHzTb/
1c5uqRySygAzY0hfk/O78tXlxD6dTatrsqxJoU94BdBuAsJ1iRC8WghW1/KNEXEg
xDWYiaMDK6koKwzYlhaxn3rqUYyBe5HvhZeMvcfRdgFybIeMb4mhuregqvdHVecg
XiAOzgvCsE7dxlwHIv3DrfNmrnzG2Es3OaSR3Cvd1MknS6ZbXUf6AYBtwt1Nd8Af
XZYbpIp/SXMD2Y91JW1TIwD4VM5iCQkBj8FGK68JJYVLIWY1xaI=
=NIsb
-----END PGP SIGNATURE-----

--kiKSvCXXFC6wKkaXj93Ec6dgH2TjAD2JJ--

