Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C13D6A9950
	for <lists+samba-technical@lfdr.de>; Thu,  5 Sep 2019 06:22:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=UEg49WKe1BT2ydR+OtQA5WgQFbX6FmRwRArlftjm7Bo=; b=KovnYkJHW+qJHq/IUrfgxY65il
	LQY/4pS01Vz+VCPgnlkXCiup0kD6wMfa0ZlIi3JmZoWzeTVAe2XwnTZ8g213Qgy4MQoFJ45QUXEa0
	fWriO1BOgK8wWN1c3/7ojWaWt0n2rNWnDXQIRABBhjLy9gM8uYipzT0zbUpyTRzT1OENmuGwUxlIM
	ew0ZMBN7vOX/55SQtBtXb5fmwS3U13+4mGvKtbPwdkDTZJQORj8a0ScZWWSRlHg9UdGHrRto7mh0H
	yDmu0w3qJ3XolhpBk+iEQZ97m8uQMaYDh3E0v/omqS633fHDucSAekJ3UBj5kb4LBIKRpBqWAL+9R
	A3fUY8qw==;
Received: from localhost ([::1]:57118 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i5jGy-003Wc8-Q8; Thu, 05 Sep 2019 04:21:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54466) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5jGu-003Wc1-B0
 for samba-technical@lists.samba.org; Thu, 05 Sep 2019 04:21:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=UEg49WKe1BT2ydR+OtQA5WgQFbX6FmRwRArlftjm7Bo=; b=i+v0+ojHGDFBo+L4YMTkzjsY2K
 HvXZ1NdTuHT+dI8Is/Qk4d894WroSz1v7LuzX8EIUr9CaLYpllfcgwwdmgZGkn+8+C2DP8ymZJo+2
 JylbIsYLBjQ/iSYDsxIF00+oegDsj3l/SYj+GLBG3edkkeWLAZdipGf5KiO4uCnsfvQc=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5jGt-0005u0-Ei; Thu, 05 Sep 2019 04:21:23 +0000
Subject: Re: PROPOSAL: deprecate plaintext password support (in SMB1) for 4.11?
To: Andrew Bartlett <abartlet@samba.org>, Jeremy Allison <jra@samba.org>
References: <ad9719c06273cac4686726b293ce9e78fecd8ca4.camel@samba.org>
 <e5796781-277a-5e10-cd55-0322f42783d7@samba.org>
 <20190904155450.GA162682@jra4>
 <43fda24acfc63961446586339798f9d7801601bf.camel@samba.org>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Message-ID: <827f8bfd-22c9-7305-228c-9230d6fa3960@samba.org>
Date: Thu, 5 Sep 2019 06:21:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <43fda24acfc63961446586339798f9d7801601bf.camel@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="WVXofMtpvgDbzRsoAMtQMTB9EA6fSueuM"
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WVXofMtpvgDbzRsoAMtQMTB9EA6fSueuM
Content-Type: multipart/mixed; boundary="TDK8sj7SNpatU51NvJVDoqEIBubjkYGAc";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Andrew Bartlett <abartlet@samba.org>, Jeremy Allison <jra@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Message-ID: <827f8bfd-22c9-7305-228c-9230d6fa3960@samba.org>
Subject: Re: PROPOSAL: deprecate plaintext password support (in SMB1) for
 4.11?
References: <ad9719c06273cac4686726b293ce9e78fecd8ca4.camel@samba.org>
 <e5796781-277a-5e10-cd55-0322f42783d7@samba.org>
 <20190904155450.GA162682@jra4>
 <43fda24acfc63961446586339798f9d7801601bf.camel@samba.org>
In-Reply-To: <43fda24acfc63961446586339798f9d7801601bf.camel@samba.org>

--TDK8sj7SNpatU51NvJVDoqEIBubjkYGAc
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

>> +1 on deprecate lanman auth and ntlmv1, but we can't
>> remove I think until SMB1 is removed.
>=20
> OK, sorry for my late-night patch non-attachment.  I think my mail
> client even prompted me!  Oops.
>=20
> I'll write up something similar for lanman auth.  NTLMv1 will be with
> us a long time due to MSCHAPv2 sadly, but I'll see about some stern
> words.
>=20
> Thanks for the support.  I agree actually decisions come a long time
> later, after we asses the feedback.  We might not even hear from real
> users before 4.12 branches off given how long it takes folks to
> actually start using new Samba versions.=20

Can you do the same for the client side parameters?

Thanks!
metze



--TDK8sj7SNpatU51NvJVDoqEIBubjkYGAc--

--WVXofMtpvgDbzRsoAMtQMTB9EA6fSueuM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl1wjTsACgkQDbX1YShp
vVaY3Q//R70ImLGsT630cEyaWiW4pAehmfacJYkqCh9PrQ81VTQljYNh+VgXBh/V
D8J+hkuaKmzBUke3vI9NpXR4eXRs1e/b0nFiLyQZr2Ua3SxMHnvEBM5MPdasfQEA
n55M6ZLo0uxgH42qsMgNLkEf7DEq3RoV9ovcwe3v/ggumZoZVTLTqBBlk04PEiTv
Z4y9kAviSbug0bqdW+lcdPTpG2OxXOQ6SnbnNVfs0mR5dGEwxq+Ob0lVj2O/qR0L
f5nJbN02sNP0p85yoA1wLWB58gE0ocOXzwb0g0YbJ670f85nenIcRpm9v9RSwQWN
JntZuy7oWxsnREJeNra4ZrDWv0DFQ8so26QPDz3nDgBdpfiCM5QwVPKSeC9f7ZKR
e+jUZmqCAN9FJNM8B8gsvPWTAqU6pXQaEZ5z9J0/4kfCGprtg3Z07yFgHLggWTaV
FQOPha3D4BUQAercQssqeFePzKDvDv0qR16bGHh4NcRrfEvUTc/vU2D1m70hnFvr
sf4Mj9meCGq/SBTP6Cforv4/TrpEbAGnSR/zii2gbC5jALfm8pkGwaXZOcHuixTI
BlJma8ebyH6luVND5FdZweo4sZzyJPdy6KPkXgNtEfUODen98x7ig8ERjGg2aRWZ
4i/DMZ7ooDEOSpd3LEjN0WPchii8vnaXEtSBOiYyj6OOdzAIUfs=
=xnGh
-----END PGP SIGNATURE-----

--WVXofMtpvgDbzRsoAMtQMTB9EA6fSueuM--

