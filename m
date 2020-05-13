Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ED91D1C08
	for <lists+samba-technical@lfdr.de>; Wed, 13 May 2020 19:17:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=aY+ZmU6aNRghvi6Y6SjVMpqUFjOBUYKbEx0wRR83Fg4=; b=ViZKsl001IfkXHelBHlvjm99VE
	+SYSxTGZwXoGVGg3TosNfwUNQbYpu+Njs8o7VtgFMEv363UykpX0uM3KTGo/UPltRSvraMC9JR81a
	/tlqK58ZrToT8dAol6wedyL27C88h6egnQ+Ivw5CaF/BvdDOVjZb1xc4nmBzU82H6atFxHuDiODG2
	iQy4099UP+khMCZIRo0ftQMktuPptPRnKKPBQchlM5JMBOOx9cyzT2KEBWTuGl56oHlVq2gpan2HZ
	Bsi5PAf+1UJkVgVmKVDvD4SnE5/Um6c8NudXSO0ANZhGdP7uVd+VKU27HwtG8WYZM8uCbImbARFuU
	6oiuNVUw==;
Received: from localhost ([::1]:38912 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jYv0O-004E2v-7M; Wed, 13 May 2020 17:17:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55080) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jYv0I-004E2o-K6
 for samba-technical@lists.samba.org; Wed, 13 May 2020 17:17:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=aY+ZmU6aNRghvi6Y6SjVMpqUFjOBUYKbEx0wRR83Fg4=; b=JYS99yu+Rp81nF8b9gGk2GqzsM
 qmtVf+lToZFUuNAbi609BRk8K8e7CBBptchdp7blRfXU1DAaoh7UYz9FShX8mcZVb6U3ETweF/ysq
 Kolvu/y9ZzUEFQw/Xi+Q8CRoGgnDOMx+NFKyHnSZ7uZ9yGe/2Fu3+Y/L+cmBVfT7kIrQpxITlycFT
 wsg3/LD+zTgpQWBZIi905fYMbMWTYhzTl1UbFMXSLdCgQcUytIQxlf4PPDcqG5tB2K6vDIXRTvYAr
 BF+AHU2cB7QIdU5BB8R3/rNNKIzoWV41dwOLADy9ev7q90ZnjfN517daOEF3D6vZ52AVEYWChGiRs
 Xto7S5YHdU7xNPk/OWgatkWGRbf1VUWBJ7U+vxj141gLL8oof37JX66dAt7oAixwS7s0Z5w/+LP3S
 sN2BVL5BZcj2M00XbGK5qdTjc8jwXel96HJGa9Ta2xQnpYz5knSGNoHvIz9HWvEuuyVJRTWNtK9z7
 SUB8fhsPlQNlraVdifxwF8xN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jYv0E-0002d4-It; Wed, 13 May 2020 17:17:06 +0000
Subject: Re: [RFC] SMB2 Compound related chain handling when generation of
 FileId has failed
To: Anubhav Rakshit <anubhav.rakshit@gmail.com>,
 "samba-technical@lists.samba.org (samba-technical@lists.samba.org)"
 <samba-technical@lists.samba.org>
References: <CAGuNez7E0vnWH63JOxCny3eXJNj7DgA9AYRvoACYSZc922Ps0w@mail.gmail.com>
Message-ID: <90e7124f-ee73-01ff-5627-27391ebb0e06@samba.org>
Date: Wed, 13 May 2020 19:17:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAGuNez7E0vnWH63JOxCny3eXJNj7DgA9AYRvoACYSZc922Ps0w@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="GdPM0oMTLvMDJmSYVrBKZJ3ngGf0B6LBU"
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
Cc: hemanth.thummala@nutanix.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GdPM0oMTLvMDJmSYVrBKZJ3ngGf0B6LBU
Content-Type: multipart/mixed; boundary="rpRn3e09EEJEwEktrLD1retaA3tODA7aU"

--rpRn3e09EEJEwEktrLD1retaA3tODA7aU
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 5/13/20 um 6:31 PM schrieb Anubhav Rakshit via samba-technical:
> Issue:
> We have a scenario where an application sends a Compound Related chain
> consisting of:
> SMB2_CREATE
> SMB2_IOCTL
> SMB2_SET_INFO
> SMB2_CLOSE
>=20
> SMB2_CREATE failed with NT_STATUS_ACCESS_DENIED and subsequent
> requests all fail. In Samba they return NT_STATUS_FILE_CLOSED.
>=20
> When I tried the same against a Win2k12 server, I noticed that all the
> failed requests of the chain would return NT_STATUS_ACCESS_DENIED.
>=20
> I believe this behaviour is also mentioned in the [MS-SMB2] Specs
> 3.3.5.2.7.2: Handling Compounded Related Requests
>=20
> =E2=80=9CWhen the current operation requires a FileId and the previous
> operation either contains or generates a FileId, if the previous
> operation fails with an error, the server SHOULD<223> fail the current
> operation with the same error code returned by the previous
> operation.=E2=80=9C
>=20
> I have written a smbtorture test case to verify the above. I also
> propose the following fix. I am attaching code for your reference.
> Kindly let me know if the changes look reasonable.

oh, interesting. Yeah, I would also say that this seems to be wrong in
Samba. Let me check...

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--rpRn3e09EEJEwEktrLD1retaA3tODA7aU--

--GdPM0oMTLvMDJmSYVrBKZJ3ngGf0B6LBU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAl68K5EACgkQqh6bcSY5
nkb0iQ/+IwAmZbfqMoONeBg29Fq+1hPLSSSikGqQqH5HPNyYo0aR12tgGHLmmTHI
1bZ+RoxazFrly+vINWkf5v/Zh51dm26GkcxPX8U8hfYtaHGPqTnc/DNzualKn0KJ
rhjXYwGWqJA1dp6aBS3b0mprbj0L85Mc2ECHmCiWHHAeg6OP5HMe67SUXTNWBYSL
Tfp33hg5QWTn/fmRpGt919tAOGDOpHjZ9jLM28Zt2spFgmwHfsTsBtng3h3eeYlr
7VEqTc9kFNkNzv1Go2qegLrB+DuqEg5ancKFdmCwK0YT3nVaO28/Jea/SLJTrQrD
jSz8hSd6Q/X6bBGmxn1WV6+RGhVcLkzwEoO2H6sZ/uEOOliE9vEftZVr9g6wR1ij
UysOZnvAZ+PecieZQ5lgkkYYvGV3CFso+vi7/r5piVbmydjgSLR7yKVQniGSBBVk
MUcfIr7wqyULd1XrbYcz7gItQM65kTSomMhbiKIjtNDFASrReef2krbsQT1l4yx5
PnuJ42Ntkwm0cMw8QBHfbPCVrJPgtOM+N/soNaepe0LMUieiiA2cZY4eJh1uwGii
Jp3xU5kb57nI7YC2IoSmsVwf+ngzLH4pA792HRClsygUtQkbZ+po5Udz7zfJPDSI
1wX6z5Ft5pGDaj+KJvpjZ2B8mHFePERRZlAvdvf87EmMXX8uh+Q=
=hU6m
-----END PGP SIGNATURE-----

--GdPM0oMTLvMDJmSYVrBKZJ3ngGf0B6LBU--

