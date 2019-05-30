Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D60B2F7EB
	for <lists+samba-technical@lfdr.de>; Thu, 30 May 2019 09:31:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=r6roCAONU46auZuzhGdPfK4uRmf7+9ms4N0JZm3dtTM=; b=AMRZAbi/C8ue2vldB/4/w/v8BI
	3+V8T1eJ2Z1EA4urg9mkIfWVAMoz6L8kaW9hDgSzH4MI75UDaAaqGfONH+IQYnUC/hN1O6WsDH3D9
	GoAX2eefy9UUQkfqNTOz8MNl+XGoEj7iFaGLLv62bAnaNRVIuX1A75ggxOe0ZeDk5d2n0prMXStNi
	a9Hu3zcJz1nfDAnUxbe9UfsITrP2BYel7SEHxdBu7R1opnr/Ihin+WDWzWVqQ2pEFM6YDEcv8IWmQ
	i3yOJOtOAuGRVXDup+dArIo9YoC4sGmzjlmKZ53AVO9vLeZFzmgrjiGpIakMzVn5yJqTPTrwb7UAN
	NHzq+Q4g==;
Received: from localhost ([::1]:45828 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hWFWk-002Y2l-TI; Thu, 30 May 2019 07:31:07 +0000
Received: from [2a01:4f8:192:486::147:1] (port=45392 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hWFWe-002Y2e-Nh
 for samba-technical@lists.samba.org; Thu, 30 May 2019 07:31:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=r6roCAONU46auZuzhGdPfK4uRmf7+9ms4N0JZm3dtTM=; b=MWDXvHcEM+x8Xk41aDJVtwCY1y
 ubWSaVvRStTaxK106n2PpfakEf8nfPn/2fBSTCZjjaWcVmSH/83fu9SBOZh3QZEElXeQbDUN9YUzK
 yDQs8PnxveF15w/RSs30+zCWn0ScOB9Jtkzaski9gnsjMXM3pg85F/skkrKvK28S5TjM=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hWFWY-0001tz-Gs; Thu, 30 May 2019 07:30:54 +0000
To: Isaac Boukris <iboukris@gmail.com>, Andrew Bartlett <abartlet@samba.org>
References: <CAC-fF8RUTx4Zvj3m_bc_tG7gMzbTy7iHyMLVnFur=6b83+pTtw@mail.gmail.com>
 <CAC-fF8SAdgU992P8tsKyGSLfi0iwcjH7vdWrw8ObqqrcZsdycA@mail.gmail.com>
 <2736033.mZseHfHTOk@krikkit>
 <CAC-fF8Qt3TH-1h0dGjGVWnROOoXMAoeL0GF6Z1dSizd0FWnkbQ@mail.gmail.com>
 <1559167973.29502.39.camel@samba.org>
 <CAC-fF8S=SMej5czuj6VY3yb7xjB_y7ULm5ebWT--JsVxu_2E2A@mail.gmail.com>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Subject: Re: [PATCH] pac-glue: fix delegation info blob
Message-ID: <0d4bfa30-7501-b462-5599-9ec403058b9a@samba.org>
Date: Thu, 30 May 2019 09:30:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAC-fF8S=SMej5czuj6VY3yb7xjB_y7ULm5ebWT--JsVxu_2E2A@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="U1PaS0rUqpnDFjT01m0iNrs5WztcBxdQj"
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
Cc: Andreas Schneider <asn@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--U1PaS0rUqpnDFjT01m0iNrs5WztcBxdQj
Content-Type: multipart/mixed; boundary="DhuPB4IbNsHJowP4SrDL43p0JgAonhDd3";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Isaac Boukris <iboukris@gmail.com>, Andrew Bartlett <abartlet@samba.org>
Cc: Andreas Schneider <asn@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Message-ID: <0d4bfa30-7501-b462-5599-9ec403058b9a@samba.org>
Subject: Re: [PATCH] pac-glue: fix delegation info blob
References: <CAC-fF8RUTx4Zvj3m_bc_tG7gMzbTy7iHyMLVnFur=6b83+pTtw@mail.gmail.com>
 <CAC-fF8SAdgU992P8tsKyGSLfi0iwcjH7vdWrw8ObqqrcZsdycA@mail.gmail.com>
 <2736033.mZseHfHTOk@krikkit>
 <CAC-fF8Qt3TH-1h0dGjGVWnROOoXMAoeL0GF6Z1dSizd0FWnkbQ@mail.gmail.com>
 <1559167973.29502.39.camel@samba.org>
 <CAC-fF8S=SMej5czuj6VY3yb7xjB_y7ULm5ebWT--JsVxu_2E2A@mail.gmail.com>
In-Reply-To: <CAC-fF8S=SMej5czuj6VY3yb7xjB_y7ULm5ebWT--JsVxu_2E2A@mail.gmail.com>

--DhuPB4IbNsHJowP4SrDL43p0JgAonhDd3
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Issac,

>>>>>> Attached patch fixes the delegation-info blob to be the same as
>>>>>> Windows KDC returns, by adding the realm to the correct principal.=

>>>>>
>>>>> Metze points out that this bug is already logged as:
>>>>> https://bugzilla.samba.org/show_bug.cgi?id=3D13133
>>>>>
>>>>> And thank you for all the other hints!

This is related to the discussion here:

https://lists.samba.org/archive/samba-technical/2017-November/123755.html=


>>>> Could you add the bug to the patch comment?
>>>>
>>>> BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D13133
>>>
>>> I didn't mention, but the bug has already attached the same patch
>>> essentially (without my terminology changes, but in second thought
>>> those probably belong in a separate commit).
>>
>> Yes, but Andreas is asking for the opposite, that is our practice of
>> adding BUG: ... to the commit message of every commit fixing or relate=
d
>> to a bug, so we can track in the git tree which commits fix which bugs=
=2E
>=20
> Sorry for being unclear, what I meant to say is that we can discard my
> patch since Metze has already made a patch, attached to this bug (with
> the bug number properly specified in the commit message).

As reference here are the open bugs:


S4U2Proxy requests with encrypted authorization-data are rejected by a
Samba KDC
https://bugzilla.samba.org/show_bug.cgi?id=3D13131

The content of the S4U_DELEGATION_INFO PAC element is filled wrong by a
Samba KDC
https://bugzilla.samba.org/show_bug.cgi?id=3D13133

Padding/alignment of PAC elements is done wrong on Samba KDCs
https://bugzilla.samba.org/show_bug.cgi?id=3D13134

The KDC logic arround msDs-supportedEncryptionTypes differs from Windows
https://bugzilla.samba.org/show_bug.cgi?id=3D13135

A Samba KDC doesn't include the RID of the primary group also in the rid
array of groups
https://bugzilla.samba.org/show_bug.cgi?id=3D13136

S4U2Proxy tickets from a Samba KDC don't pass PAC verification checks
(authtime mismatch)
https://bugzilla.samba.org/show_bug.cgi?id=3D13137

The attempts to fix this can be found here:
https://git.samba.org/?p=3Dmetze/samba/wip.git;a=3Dshortlog;h=3Drefs/head=
s/v4-7-s4u2proxy
https://git.samba.org/?p=3Dmetze/samba/wip.git;a=3Dshortlog;h=3Drefs/head=
s/v4-5-s4u2proxy

> It will be a challenge to bring the fixes to our users
> as it's currently completely untested code mostly.
> ...
> I hope to find the time to create the start for low level
> kerberos tests, using pyasn1 and some python bindings for
> the krb5_crypto_* apis. Then we're hopefully be able to
> build something similar to the dcerpc raw protocol tests.

Sadly I never found the time to make any progress on the tests...

metze


--DhuPB4IbNsHJowP4SrDL43p0JgAonhDd3--

--U1PaS0rUqpnDFjT01m0iNrs5WztcBxdQj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAlzvhqoACgkQDbX1YShp
vVbJpQ/5AasCGQtJsqKW35F3mmzZ+dSbmB01BT6tuiPv+8aQSIZS4nIYSh3dwc6d
psYn9BDuWa2qQjyZ2puMEDum7eAbFWslPdJTs8DU5skn9FTNRREHjcZQ/ecaFs8N
tKRdQtQiXKextyEM32k4tBuRYGOeXRIiON8lUhR2yDf8VVtrj/c8hsERzxEjh7D2
UP+ddWMymzwqSjOFGdgqOL/2Y+UIf42Kw6RRIQU4JLAnNlYZr+9+v+wts/ApYsiP
pY5jnvD1DKVkAUOWHWcP2PIXe1iAsFocN31O6pkANi+cqrX5xvu9WrlvzzZbUCmh
Xx6ZF+Sp6ZxflfKgDKhbpVOmsmWgNsV/n0c1xFG+nUkpDe1PkIQnWf6eUrVZj7Pb
K+rYn5h6JOE1Idu2UvIo1KoXDFQo9Rue/lz1eUIQFUqRlkhLNkdkzkTg+TL/ugy6
GTZa2xbTfxDxlrknepV5kzBF+NbFQqqM6RdPSy7WRLYVLuYxEnvnldpkqowyP3WG
+v97t4BLzgV7qfkmjl7iBY4poo8/nEUdMS8GPUzuv0tPQDRKt7BdSE9c7uA1R1Kg
/uyY9yHC0S1ShpmWJbOIGI3GaEcOqq898QEGWxvSct2fHbz+E8BkIenGMMoPJud7
vf7hOiTO5G5Wgr0M4J3YXVhakHP82oO36g+UYswIU2Je9/e7/5Q=
=PC/z
-----END PGP SIGNATURE-----

--U1PaS0rUqpnDFjT01m0iNrs5WztcBxdQj--

