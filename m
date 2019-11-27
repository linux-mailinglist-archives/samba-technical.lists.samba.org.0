Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE5A10ACA6
	for <lists+samba-technical@lfdr.de>; Wed, 27 Nov 2019 10:34:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=GG9fJkAGgdpgyAgGuz2h0IGB3BT4HXagVWk1Evh1V8c=; b=aYqJpGFe/IkjoL6bwi/fLHn1zx
	vcCEV4iE1Oh248KU4kQfQh0F8FZam4+Sk6DWuiIYqYrCwdwSLVQErI9ox01pEnGGlhOJIcKTbGO0j
	Zb/ip6U2zOJd3GmFPjXgWIXxCB4bjxLMrVXMHQMcrubm8nmDh8nEWxeKAD9xFKllGneX5f7iV2hNq
	iIeT4LjSfnRpfnRVdAxKG28zxgOiGI4jkw/uueGXHnA/WXN9Jdsuyk9CnUlEi2+kdGmdVlnr5dcEJ
	LPRG3AUNefe7qvPSnLQvegcCrNrgLQbG0y1TTmmM9EyUHAk/n9O5Hhw7EBylueAD3CZo6TjT2frmd
	vtyheUTQ==;
Received: from localhost ([::1]:27898 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iZthm-002dU5-4a; Wed, 27 Nov 2019 09:33:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40958) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iZthb-002dTp-JX
 for samba-technical@lists.samba.org; Wed, 27 Nov 2019 09:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=GG9fJkAGgdpgyAgGuz2h0IGB3BT4HXagVWk1Evh1V8c=; b=EtlBRqAxnPZFFcfqPvRJdSeDWX
 62GIanjtEthVt9az2mbrmEGH/SGnytKJv6V0Th9Sd9itd5al0ReK1GJdZEy7pMhd6UG5mzJf6gxZE
 DCsV8Ad7JSGLvlCMuCUtlDea99mF+5ZipIFuFtDy/2iE7wZDn8NFJIMj3Bn9P58S/4Re5ywSiwSa3
 CQ2ItSqvbkFRcDjeIYpZk9D0w4Pno6LqiTRmzhhlmXq0yH/722vfZkOUfep7Q+W4dgc6Qp81QBKUC
 rcPIkE8VQ8b0SjZJvQ27yAkCSQdH9n9EKG3ipJRWfE2FAWuX68/IwrCldYOPciyoclLzzYajF2eNr
 Xn4U9MWEltZTgielNKUL4HPX3NKkTcV5auiQQtNqIq0qaYAKKgy8KUPTuUnLoC+rlE0mDV1Vyc8Pc
 AHnijvGuaxxO2OiwnxCIjg5IBobYIFaaQ7ZUi7AdgIKbXn3tUzSQeW8TFs2T5aRTA6dsPb2mRfm/X
 uSsKR9B5XU+eJH88MQNIAY5Z;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iZthb-0007yo-0y; Wed, 27 Nov 2019 09:33:39 +0000
To: "Nathaniel W. Turner" <nathanielwyliet@gmail.com>,
 samba-technical@lists.samba.org
References: <CAPw4iV5nHkd8E=9PfbYepaStPRoqWJX+iZRVicgrRf2vcHK3uQ@mail.gmail.com>
 <CAPw4iV6qTv5ssFZEFUN0zuVuZ38ofXq_x+QSTUHT8QFrBtmRhw@mail.gmail.com>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Subject: Re: Why is smbd looking for Kerberos principal cifs/host@DOMB when it
 is a member of DOMA?
Message-ID: <fcf29df7-34c6-d30b-f2ee-d46a8c9a3d41@samba.org>
Date: Wed, 27 Nov 2019 10:33:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAPw4iV6qTv5ssFZEFUN0zuVuZ38ofXq_x+QSTUHT8QFrBtmRhw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="xriLs2qWNWPM1pfFVHjexeloyAgyAXS3B"
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
--xriLs2qWNWPM1pfFVHjexeloyAgyAXS3B
Content-Type: multipart/mixed; boundary="K4iIZnwfSAP6JvhhvYZcaB0MYOseyy2Im";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: "Nathaniel W. Turner" <nathanielwyliet@gmail.com>,
 samba-technical@lists.samba.org
Message-ID: <fcf29df7-34c6-d30b-f2ee-d46a8c9a3d41@samba.org>
Subject: Re: Why is smbd looking for Kerberos principal cifs/host@DOMB when it
 is a member of DOMA?
References: <CAPw4iV5nHkd8E=9PfbYepaStPRoqWJX+iZRVicgrRf2vcHK3uQ@mail.gmail.com>
 <CAPw4iV6qTv5ssFZEFUN0zuVuZ38ofXq_x+QSTUHT8QFrBtmRhw@mail.gmail.com>
In-Reply-To: <CAPw4iV6qTv5ssFZEFUN0zuVuZ38ofXq_x+QSTUHT8QFrBtmRhw@mail.gmail.com>

--K4iIZnwfSAP6JvhhvYZcaB0MYOseyy2Im
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 26.11.19 um 20:55 schrieb Nathaniel W. Turner via samba-technical:
> Perhaps someone on samba-technical can answer a slightly different ques=
tion
> about this: Since I know that this configuration can successfully
> authenticate users in both domains when NTLMSSP is used, it would be ni=
ce
> if it could fall back to ntlmssp after gse_krb5 fails to find a keytab
> entry for the (seemingly bogus) principal name. Is that possible given =
the
> protocol constraints?
>=20
> This seems similar in some respects to
> https://bugzilla.samba.org/show_bug.cgi?id=3D14106, though that case is=

> different, as my server *is* an AD domain member, and in that issue, th=
e
> server is *not* a domain member, and is starting out with GENSEC mechan=
ism
> spnego from the beginning, and just choking on a client token that does=
n't
> make sense in that context (if I understand it correctly).
>=20
> If it's not possible for the server to fall back to ntlmssp after going=

> partway down the gse_krb5 path, would be be reasonable to somehow
> disable krb5 for client authentication (while still using it for
> communication with the domain controllers, of course)? As a practical
> matter, Windows domain member clients seem to work fine when samba just=

> uses ntlmssp (which it seems you can force by using an IP address inste=
ad
> of a hostname in the UNC path when connecting), but maybe there are
> scenarios where that's not the case.

Did you take a wireshark capture to see the kerberos related packets?
Does the client really provides a ticket for
cifs/kvm7246-vm022.maas.local@TC83.LOCAL?
Maybe the cifs/kvm7246-vm022.maas.local principal exists in both domains?=


As far as I know the principal name is ignored when accepting kerberos
authentication, but maybe you hit
https://bugzilla.samba.org/show_bug.cgi?id=3D14125
or the ticket is just not for the server you try to connect.

Which kerberos library is used in you setup?

metze


--K4iIZnwfSAP6JvhhvYZcaB0MYOseyy2Im--

--xriLs2qWNWPM1pfFVHjexeloyAgyAXS3B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl3eQu4ACgkQDbX1YShp
vVbA2g//aE9vL+lBO8qbBsDuzm/cITZEWbAH7NBnamW0CRDGeq4h4Tkpvg/Bf/64
I9ibJnquG7SMzxMYfpmTkf4sOjmAOpHS9RpiHzB/f0IErZAbODlsvbAXSt3cugWu
j9jiG8jKWnES8F2DJ8Mq+icN082g0m8nrgZfiUv231gwfyhUMDYBZKu/4d0JEu9c
/RcRpFEaEs2Qc5ViD0D0pJZ+1PCvoB9x/Mpo8JTgI9ryMoA4BlLGNURAlINcOL4P
NGFlD98mXTWRImozuD2/P+jHDsIxqIwznzJUNCCTKs4DEnWYTWYoDMM/BhJmV4Cb
S43NbgOmtZjr8KfWSMztNzChpbD7e32tOKPT953CfnEPx7f9MIVMKrUuAZDQjS3x
MYMfhvQNAjO6IC+LjG0Zxl8hMGg++P6FJLY+UzXFj86k0JtkTMx8xfo5YCILA75s
nxrZjKhEjddMGiAyoWiduM7N0J2xltLPqtcxZGF7TlG5XrwvvAzokCGJkjynXl67
wlHZGGzGvRk09Eqln156Vt1LPxx6zUnw9Bi8bAek+C0XH/E7YH5M8N5kHtqAdfRA
T3/0syfgCipORjqLjiYrGC5H+dVKeswjbxgytxCEfC3Bypl0dZYx7UnIGYYm2BMW
9HZ7Eyjg//Ic9Rgh6ZnjaqH+Rg/VGzoTkPLVS81f3I6f3jxMoFI=
=1ZPV
-----END PGP SIGNATURE-----

--xriLs2qWNWPM1pfFVHjexeloyAgyAXS3B--

