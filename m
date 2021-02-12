Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAEE31A019
	for <lists+samba-technical@lfdr.de>; Fri, 12 Feb 2021 14:54:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Rkzr/kgln701u7wGER55k7ysEelQgdQhkpTD+UXiINk=; b=W0WCchqVxiEax/OayuJMWRoHPV
	OJLJibSqwFpuLhTMtHbWYgaRaoxwBYlHuhSLjFA+AmB3SnULOmyWPvYNjOczc8ybWOvpaAjYwGU5F
	WBe/UN3BNz2ttlseWnyZhJgqjK22swgHF0CmJA1gqdVi+u3EO89S9LnGS34p6IM1Vx40RYXSeYGzk
	PNocsceBAsjs+kI6SGToxPGNhzzZ41M+tKJRkaa5i608mRXgBzYl0RrYt7yUQQSH4rhbIvfJ+3oXC
	yveM31+dp3ii3OnVCf0RBumf6d5j7PyJ7dCcjaUGXaCPDFUYje1adlYfNsQmqSzS3v5O5m9Lku7w9
	Ib7RrdJg==;
Received: from ip6-localhost ([::1]:33678 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lAYtO-00CPKU-Jd; Fri, 12 Feb 2021 13:53:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14272) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lAYtH-00CPKN-CR
 for samba-technical@lists.samba.org; Fri, 12 Feb 2021 13:53:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=Rkzr/kgln701u7wGER55k7ysEelQgdQhkpTD+UXiINk=; b=Rd/+KCs9ylq22XpgD1symSRMkn
 G8jtsOG7pScdnch0Vvyq14ZhOrZGyKtkJugefs+SjuJ9EbNmGlswdff/4CkMP9+6qnxvuVmexCnAS
 y4Ipdu3Lxuz6yX2tg7+y+6Gpx+wpLQZyV1DGUdojnJkatB075b06fL/DoFKjjBLJPM6BzdVGwe1DV
 t7PVnmm8t92+ardlatbAyxp4zuRC1jBTkBY0+Gd5ftWQTHa4B25HY8LK8mTHibjxMllp9wWxcuZcm
 iBw+z4LwZcIsZLf3tUF5WtBT21AZqAUYPAMa1QtKOpnzlmHNX4UtBEOQpCPnGQJ8ZWhp6XbmCVFbe
 S1m2aOoAme+igmasvRx8FoFdnEgSpx/A2QJWlwjYCZCRv0+sirE++CSERulonvqTSy9eG4oZpj4pg
 8dmxIrBsd6L50Uw7xA4aKCsSjQ24+LrhskY0npu/T7/R9VoWiazlHGTMaYiB4l4WkiAPcEYa3nf3u
 wXRkVN6ykAWB6nY1kSysnOFp;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lAYtD-0001E4-Ve; Fri, 12 Feb 2021 13:53:44 +0000
To: Namjae Jeon <linkinjeon@kernel.org>
References: <CGME20210126023109epcas1p257c4128a9d8673cb44f81dca636da39a@epcas1p2.samsung.com>
 <20210126022335.27311-1-namjae.jeon@samsung.com>
 <09887b1a-3303-9ac6-1d29-c53951be5324@samba.org>
 <CAKYAXd-rfk26A4SOeqvhMkBV2FcvpE0goj415HX7T4fBim1zQA@mail.gmail.com>
Subject: Re: [Linux-cifsd-devel] [PATCH] cifsd: make xattr format of ksmbd
 compatible with samba's one
Message-ID: <d776f655-f58d-6541-e30a-f10e5b9f0660@samba.org>
Date: Fri, 12 Feb 2021 14:53:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKYAXd-rfk26A4SOeqvhMkBV2FcvpE0goj415HX7T4fBim1zQA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="GztYEeugHRhVtFsKa4YxN1hhOex0bPsAh"
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
Cc: Namjae Jeon <namjae.jeon@samsung.com>,
 Samba Technical <samba-technical@lists.samba.org>,
 linux-cifsd-devel@lists.sourceforge.net
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GztYEeugHRhVtFsKa4YxN1hhOex0bPsAh
Content-Type: multipart/mixed; boundary="8J4LdEJj7LCzGCELBHLCzAAhXR916sLQg";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Namjae Jeon <namjae.jeon@samsung.com>,
 Samba Technical <samba-technical@lists.samba.org>,
 linux-cifsd-devel@lists.sourceforge.net
Message-ID: <d776f655-f58d-6541-e30a-f10e5b9f0660@samba.org>
Subject: Re: [Linux-cifsd-devel] [PATCH] cifsd: make xattr format of ksmbd
 compatible with samba's one
References: <CGME20210126023109epcas1p257c4128a9d8673cb44f81dca636da39a@epcas1p2.samsung.com>
 <20210126022335.27311-1-namjae.jeon@samsung.com>
 <09887b1a-3303-9ac6-1d29-c53951be5324@samba.org>
 <CAKYAXd-rfk26A4SOeqvhMkBV2FcvpE0goj415HX7T4fBim1zQA@mail.gmail.com>
In-Reply-To: <CAKYAXd-rfk26A4SOeqvhMkBV2FcvpE0goj415HX7T4fBim1zQA@mail.gmail.com>

--8J4LdEJj7LCzGCELBHLCzAAhXR916sLQg
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Namjae,

I played with this today and found a few things.

>>> Samba team request that ksmbd should make xattr format of ksmbd
>>> compatible
>>> with samba's one. When user replace samba with ksmbd or replace ksmbd=

>>> with samba, The written attribute and ACLs of xattr in file should be=

>>> used
>>> on both server. This patch work the following ones.
>>>  1. make xattr prefix compaible.
>>>     - rename creation.time and file.attribute to DOSATTRIB.

I just noticed that you use xattr_DosInfo3 instead of xattr_DosInfo4,
Samba uses xattr_DosInfo4, starting from samba-4.11.0, so all supported
Samba releases write xattr_DosInfo4. All versions from 3.5-4.10 wrote
xattr_DosInfo3. Versions before 3.5 only stored the hex-string.

So it would be good to read hex-string-only, xattr_DosInfo3 and xattr_Dos=
Info4 and write
xattr_DosInfo4.

>>>     - rename stream. to DosStream.

I noticed that "vfs objects =3D acl_xattr" is allowed,

"vfs objects =3D streams_xattr acl_xattr" is not handled at all,
even acl_xattr isn't detected in that case.

>>>     - rename sd. to NTACL.

There seems to be a problem, when a new file inherits acls from the paren=
t
directory. There I see a strange owner sid:

                        owner_sid                : *
                            owner_sid                : S-21-2276714256
and

WARNING! 20 unread bytes
[0000] 00 00 00 00 00 00 00 00   00 00 00 00 00 00 00 00   ........ .....=
=2E..
[0010] 00 00 00 00

I used this command to analyze this:

getfattr -n security.NTACL WHATSNEW.txt | grep security.NTACL| sed -e 's!=
security.NTACL=3D0s!!' | ndrdump --base64-input xattr xattr_NTACL struct =
2>&1 |less

metze


--8J4LdEJj7LCzGCELBHLCzAAhXR916sLQg--

--GztYEeugHRhVtFsKa4YxN1hhOex0bPsAh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAmAmiF0ACgkQDbX1YShp
vVb6DA//ekho9ECK03e9JRJkDXcF36BNTEcfTi6aEWMQe+FUT+vNARIa3yazmG4B
pVh+9dBVNG7FKxbo7y14P4BEBWDph2njIr219njanhphWTU4WJmJoDOCW4kdd3ud
5I6Q/XAP3TOEPZhsCOQtRZghS71OuO/GJgWACauYJ8aMRs6Mx2NeWe/FPZkJKXn4
dmU+AtDoP7wKRVVOiPeMSJ8UUyFRMcF6w4crDADBGaBEXE87raVTAuAzsH8i0/sS
VMMhn/kN3bmevI+FbgdKLA3FD3nGXAqTZeNjq+MZNP5ilkXFp5uVzo74/dEIuwPw
XlkN8vmHUsR0WgSH2y7loLaALOpwN833gDJVj+5QSOHIxkTflch2YZcbE2ZdU8ON
Mrum/Zd1RlFVBeZqcSkWNq6wsRvWVGGokdeh/SBt9f8y2Xbg/QNlFrc3riTsrV+3
v30lpTcFjLLdo/JmgQCc4X2PvHPNJYwb7Hf5FYDJKJJU19bdNQ4OSVUL6ixMs+7i
j1/TYJgdzkxzUnkehl1V5Y2WUVlvwQ9yi0zZ3NhNr6qimCLp9JcD7Wh6UP2xS82e
WzmowsIprCXjXIIvxrBSf2h8JJ1rcs3N0T07rs1DmCjR4YXYNYTfimhmSa/v8+gv
8zVfmHGnrdnJaZxTDb8YrCkBO2ZEjjdQek8KANc6v9w6Bn2NKTs=
=3tLT
-----END PGP SIGNATURE-----

--GztYEeugHRhVtFsKa4YxN1hhOex0bPsAh--

