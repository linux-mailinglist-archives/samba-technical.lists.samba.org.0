Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AD61323F207
	for <lists+samba-technical@lfdr.de>; Fri,  7 Aug 2020 19:38:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=QOuzjLpBoZ06wG4z+/mxip0FqF3y4C7kIEKxyfOyZhU=; b=q40zdSfLmRrTZtWfe88GFxSpAP
	RwIbggx/n2Ntpv2L6gKbIyG9st8wW3N75Ys2krdMISy08lnxLwXNO2RIQS+lGlM00n5DDmOvGVNpT
	R0RoAY+HDXwuFdCqQuGW8dchTpQsibfqZbRqubgfb1bdWqWYV4iVYvvvKq972s0cBDwBZK6tOcJJE
	qSF4M2Ua7oAcWM9kbwGchWql+hXklwhddjFlaoiniDjPnX5uzJWCA/MP7m+BO/Uqbk+lHu1diNy9x
	uQYLKhnwVvZNjflVIGhRLrI2VvS/2iCN7xIE8w8bjZeoj1Bgx6FWhybf3Cm//ICLtzvhviZqLwXN3
	/O2bCmmA==;
Received: from localhost ([::1]:18274 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k46Jo-00Co3A-UI; Fri, 07 Aug 2020 17:38:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54320) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k46Ji-00Co33-Gk
 for samba-technical@lists.samba.org; Fri, 07 Aug 2020 17:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=QOuzjLpBoZ06wG4z+/mxip0FqF3y4C7kIEKxyfOyZhU=; b=3sZNrsClWRYGilWfVNBiaeG536
 2IiqS/JB/4KScC3IXM+GeRF6IF85fvslwYX7dVjaFlavTQ1wZQEL6nX4bizO758Px0/FrcnVMFw48
 Bdvn5shJP3Y6YrR+QBBtnTbJYmiNhyj/6cl7OI/fEdteElcNBTXOp2cxkPmygm6G2CTQ2HIjbV+NZ
 vk3IUlwNl3ExMY3IFpAK0YlKiqjUADN3wSxi8izaZ9mrqqIqGjgLKuSuagW1lrTMqjl3ZaYaXEEHS
 aSuNlzdJ63Ny74T1SBc6A4zSbr4y6ulVtmcbXeeBa4uJli2dtttJ58+NyqfxVx2zoMjgpS2Gv4O1z
 G/LA1BcoLZvxeB8hHMNP8B15KleynBStY2IOsYoX7L4J7qYiamoEcmyUCKia4VqfzDxvJUHaphbAm
 s2CVtjF3yWD1zrOV6PaJ3x5g445LR27/481AP2MKguWzpBpOqIs/B7dQr9u/hZCWNesPLJ86GRc+/
 oEXyVs2+a5o/x1YqX6Azp+3m;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k46Jh-0006xB-4X; Fri, 07 Aug 2020 17:38:05 +0000
Subject: Re: S-1-5-21-Local-SAM-SID-513 -> LOCAL-SAM-NAME\None
To: Jeremy Allison <jra@samba.org>
References: <83e89636-75d4-547e-c93f-4184da64255b@samba.org>
 <20200807163743.GE6866@jeremy-acer>
 <be19ade3-451a-7565-4a1d-b9609648c490@samba.org>
 <20200807172522.GA29361@jeremy-acer>
Message-ID: <d317225b-2a18-fc76-9f35-859e480e6c66@samba.org>
Date: Fri, 7 Aug 2020 19:38:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200807172522.GA29361@jeremy-acer>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="UZZBs5vGmI7AJvqQDu3cp1WdjoVrtuH4J"
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
Cc: Stefan Metzmacher <metze@samba.org>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UZZBs5vGmI7AJvqQDu3cp1WdjoVrtuH4J
Content-Type: multipart/mixed; boundary="lIqMvnk7nXs79CMdNWhDpMg3rk5rQZpMj"

--lIqMvnk7nXs79CMdNWhDpMg3rk5rQZpMj
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 8/7/20 um 7:25 PM schrieb Jeremy Allison:
> On Fri, Aug 07, 2020 at 06:52:24PM +0200, Ralph Boehme wrote:
>> Am 8/7/20 um 6:37 PM schrieb Jeremy Allison:
>>> OK, what it looks like is a call that can *never* fail
>>> on Windows - e.g. looking up S-1-5-[LOCAL-DOMAIN-PREFIX]-513
>>> must *always* map to "Domain Users" group.
>>
>> but why on earth do we return "None" instead of "Domain Users"?
>=20
> Well I'm guessing that there might already be a UNIX "Domain Users"
> group, but someone didn't map it to RID-513.

hm, but that doesn't interfere with SID <-> Name mapping, only with SID
<-> id mapping which is another story.

> "None" was probably considered a safer choice. Dunno though.

Why not call it what it is? If you query a Windows machine for the local
RID 513 it will answer "Domain Users" so should we, shouldn't we?

> Ah, look here source3/passdb/passdb.c:
>=20
> bool lookup_global_sam_name(const char *name, int flags, uint32_t *rid,=

>                             enum lsa_SidType *type)
> {
>         GROUP_MAP *map;
>         bool ret;
>=20
>         /* Windows treats "MACHINE\None" as a special name for=20
>            rid 513 on non-DCs.  You cannot create a user or group
>            name "None" on Windows.  You will get an error that=20
>            the group already exists. */

oh, that is interesting. I'll check if this is still true later on.
Thanks for finding this piece of code! :)

Thanks!
-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--lIqMvnk7nXs79CMdNWhDpMg3rk5rQZpMj--

--UZZBs5vGmI7AJvqQDu3cp1WdjoVrtuH4J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAl8tkXsACgkQqh6bcSY5
nkZvURAAmfKAlVkjKAHJcoG5I0PRGWmYjgwp76/zf5dNZt1hK2L21ZV6Yz73Max/
jOksQVdNeMeP1mh2ndMZu9jwWbLVUR4uCuUwvgGYt/Bk5/8+pvC9CBvRQvfKtFQU
RFe3D+u70NzPw6YeYdW2USi218hK8HkLpEHMhkKNq2qxpj8YnO3xQI/bVkGfYD7D
1qLruDpj7oDZORKr6K9JyZ/S4og7fXoNH8Kqioj7OjlkSX83rKoW3l1A9gv2z+5B
KPsYQL9KZzpvKm0SMJShwZfpyse5qQbfpyZIK1jIfZkl5hVH1UkNa4gR8zoYwCGF
bm2mDCnhm2y9Z072uz1hTLWjqLDzaoJs5/LKa660EKSbTeve4/WblbA1tetLhsYh
wV0+VkJZnNkqqqrdcOLxf3doY7KZ/KWoDud42LVJrCT0JfmA9QtojTnPPOtvKFdg
A3aI3DH/sLZAqRqzXJMSfTlkGsm/rNTRhAvxYWF9tpJTpOuxB/YCAMdPF/xEGkJ4
02Zbq+n/ti/IhbX+/5dL8a/53KmYSdXg0YGMPxgWikWs0q8Pw5pumbaT7kP5VCFD
v2Qzwp1RBpIkJVssRzC1m/1KsJN68qI6tLz5+ENAhlgVcXnIBss5gVBdfTPR+Dr/
66lihyAN/5P2ewI7P4Tl5ZQANh02spsmP7chmCxD2hpCsXDg3to=
=hZxL
-----END PGP SIGNATURE-----

--UZZBs5vGmI7AJvqQDu3cp1WdjoVrtuH4J--

