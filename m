Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A47CCF7C1
	for <lists+samba-technical@lfdr.de>; Tue,  8 Oct 2019 13:05:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=IWrxdoy0oQw3+g5XSppeqU1XaqSBBh3nAyhNyblBzpk=; b=l1+sAs5hUYuSPNrHg2+SVwWhYS
	XLX8qmvc6L+Y/n8Yl6UKeg0Ql3ReugBafeWLog3KjiduXLSoYuze3Vxyr2biDROrr3p59BZOWcDvO
	0qcgl8wcna1Sq8U1q86Jw1f6qKeAeHJYLGapwCS7BE2Fab6+mRXHU6C0AlbE02pN3lAIvT/y/FgMq
	HCNRR+XaGPAzMIeotcCTiaOlrgxlO4f8qqdYbP417yxHkRhJE6yJgbl0Ijtbrep/DR3iFM/UkSG0d
	ZGzqhPZ0oyCPjrj/qyAL5DD0mPLrcI77Lm8egm/AGupu2aociR1GF2B3TXoXkVKypuMG9Tng9BWs8
	OYAB1OAw==;
Received: from localhost ([::1]:44172 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iHnJ4-00248J-Gc; Tue, 08 Oct 2019 11:05:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55312) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iHnJ0-00248C-Ju
 for samba-technical@lists.samba.org; Tue, 08 Oct 2019 11:05:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=IWrxdoy0oQw3+g5XSppeqU1XaqSBBh3nAyhNyblBzpk=; b=uqkPq/BU2pd5GsfAvoiyQrh7XO
 uTMEjHKep6qcNVuSCkcWssapUYSQ4ctPEaU7CEGadT8jHYHeb29z2qBGtxRiNNm7OP4f9uPAy+kVn
 vHBzDKolCazikXDByaKbYWSu+SKukwjTCDFT46WPOsh0F28txFpnautRS02CCCEEaJ/w=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iHnJ0-0005fv-3S; Tue, 08 Oct 2019 11:05:26 +0000
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
References: <5849953.E8HlOTvGIY@magrathea>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Subject: Re: Samba and legacy Windows support
Message-ID: <d7532a8d-aa6b-4f30-efde-891b7b5b8333@samba.org>
Date: Tue, 8 Oct 2019 13:05:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5849953.E8HlOTvGIY@magrathea>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="pkXA7FpNaOshPlgb1dOfBaPjlziuLhlpU"
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
--pkXA7FpNaOshPlgb1dOfBaPjlziuLhlpU
Content-Type: multipart/mixed; boundary="yyRj6RwnLZKbg2xBEUBZEBSUpcNprSw1d";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Message-ID: <d7532a8d-aa6b-4f30-efde-891b7b5b8333@samba.org>
Subject: Re: Samba and legacy Windows support
References: <5849953.E8HlOTvGIY@magrathea>
In-Reply-To: <5849953.E8HlOTvGIY@magrathea>

--yyRj6RwnLZKbg2xBEUBZEBSUpcNprSw1d
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 08.10.19 um 10:59 schrieb Andreas Schneider via samba-technical:
> Samba with version 4.11 currently still support a lot of systems which =
are=20
> already out of support. We still get bugs to either fix support for Win=
dows=20
> NT4 or OS/2. Also we know that Windows Server 2003 with Active Director=
y is=20
> still deployed.
>=20
> In order to remove support for those platforms which are very long EOL,=
 we=20
> should try to make announcements when we plan to remove support.
>=20
> ## Steps planned
>=20
> With Samba 4.12 we plan to disable SMB1 by default and then remove supp=
ort for=20
> it in Samba 4.13 or 4.14. This means end of 2020 or beginning of 2021.
>=20
> If we remove support for SMB1, we could also remove support for NTLMv1 =
and=20
> Kerberos support for DES, 3DES and maybe RC4. Already on Fedora 31 use =
of=20
> these encryption types is blocked by the default system-wide policy and=
 is not=20
> available through MIT Kerberos. DES support is fully removed from MIT K=
erberos=20
> 1.17.
>=20
> NTMLv2 is still widely used and it uses RC4. This means we can't remove=
=20
> support for it till there is a valid replacement for the pure file serv=
er=20
> case.
>=20
> ## Questions
>=20
> * Can we remove NTLMv1 and LM keys for Samba 4.12 (remove `libcli/auth/=

> smbdes.c`)?

I think we need to deprecated that first.

> * Can we remove DES and 3DES Kerberos support for Samba 4.12?

Yes. The question is how to store the keys.
Is there a way to disable DES on Windows, so that we could
check what they store in the Primary:Kerberos-Newer-Keys
and Primary:Kerberos blobs in that case.

> * When can we remove RC4 support with Kerberos?

I think we need to keep that, because not every account
has aes keys, as the password might not be changed.

metze




--yyRj6RwnLZKbg2xBEUBZEBSUpcNprSw1d--

--pkXA7FpNaOshPlgb1dOfBaPjlziuLhlpU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl2cbXEACgkQDbX1YShp
vVaOAw//bzvu3xX7Ad9DxF1iDRn5fiZaO6CM2IFeafRsw4puRW3aGu2f2PFyAqRG
RiYECtJNck3ket3/HlO1yG1ypO/xm74f7rhj5v8Su6CzcXo5SdwJ++XJS3o+eRK6
0aTcS+oxtTqbXdxxYmmFK6YEN7zzjwH1Ryl9JSaYvjlgqUH0RWd55n3WpREhErjE
mFQ9Do9gj0sSANa310TTMuRURFNW5aNEoDGNG+WZ0tqQ79GmzDC5LjN3th9OpSHB
QHRW8rLQiblZKg2bW2Pn2P825TTu73SCQo8BYFJ0I5GfXI6hSnRpvvvX5pWE8hAF
lv1Y0/FP9vJpXdhp/2jEyhljboInxDFUkmYXWrjLOoj2k67a/hnN3iq+plKR6aAP
7G5vPJFArGGdChj9oPfu0sXIGvGjgrelGBtnlDWYSESxrcWp0OEfal0RWxhcSGRk
OJugJ7PSx4HVdtWIMullpaRxaIQBV/MhX5vpqkPIUFZZqvmkPehQ/xMkOmytHcEn
8pXqEDWoH+Q3GscSWmVBCFFRoiJj6GLH+SLOwRv/2ut+CcuqxpOxYOaS9xwnrUeJ
1PM7oLBTTf7beft4rPVMN+kwOqcqq+mXfq61l2I/Y/wL0ngpbxsrz2xgUF+Jx+a3
TPQ1np21EKaOlu4E4XQgFuGkVfrfkJVEy25wh+COQ5YsNI8BNvc=
=9qZZ
-----END PGP SIGNATURE-----

--pkXA7FpNaOshPlgb1dOfBaPjlziuLhlpU--

