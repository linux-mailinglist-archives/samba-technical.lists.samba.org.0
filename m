Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EA9148DFE
	for <lists+samba-technical@lfdr.de>; Fri, 24 Jan 2020 19:50:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=aotqFclUsyGak4bzm4HJPtixoJf0doZS8Z3ZZwR315M=; b=LlLN57M9pjSb3v/uW0QaWticar
	7Cz4xFQQth+d4MW10OjiCjDW2Lax2bFCuPeRNDeGZwtvn15P0ICZzgz0uUEhT/QGK5QtPCUQhXE1D
	W8VYYhwdU9f45HofEP7bKfTPiz+qN09QpQavkOiUJwj7EqNC2IFRz5WN5CEAUXDF9FB7pAP33EJ/B
	UeMXQOSpT0Zv12fheKqGVV/2KW8BUH/tlqEeeXIYsdnsCEgDqKA/4MpQRxla3PRVLL8uOqthXJ/je
	A24rEnQuU522m07KOP09idT7SFxU8A9QmBod5qgg5ptyAZ6Gu/Js4tV3i9C1bLz2JSsTb0kuARQr4
	0CTkZCIg==;
Received: from localhost ([::1]:50676 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iv41d-004d3p-5T; Fri, 24 Jan 2020 18:49:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30552) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iv41X-004d3i-M8
 for samba-technical@lists.samba.org; Fri, 24 Jan 2020 18:49:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=aotqFclUsyGak4bzm4HJPtixoJf0doZS8Z3ZZwR315M=; b=2Ds89d1XPLnMVdCzYsdvwfmwVk
 s5S/VYyOAj3VBX95KeORyHys/vCrx5986qwyRUW+AQ6gvQZqD0zKEu5B4xU5dbowp6PWMUhIHF3vX
 0v1A3MroRgpyGu9GwLdIh579GwzqNFcQ5y5fsgD//wQf+0NCYrH1yIWKvOwZDBu6tmcOlI9C1T6Qd
 rixtVtE9k7MBWSWgS0FNlfB69aoTxJT3kHO4w6xrKvXaHjkmqXaulAbXiVIDvq8obzqQnAias/aSD
 xLn4HTysw8Uc+Qi0SWMoISRtGPV1wQ4ntcaeUVdUOBsJnHwatsu/z80jSqAZULZtpa4YS4RAAwujX
 roaxZc8tGmKLCsHszqA1QkVuT8uEo9ZazhJItyLWNclW828DXcqw/DW0LinQYszVzC139ijf2t190
 VBAWw1vuDeOPf0+WW5BHdd4CL4eiYVUtSZtrasasotxs9jta4+ZTHpYiOABfE6xfPuPfPf6vJg7/V
 L9gxbAHeEde3Lhfvk6exoGC/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iv41W-0006TX-3l; Fri, 24 Jan 2020 18:49:42 +0000
To: Greg Hudson <ghudson@mit.edu>, Nico Williams <nico@cryptonector.com>
References: <69d80d24-d461-1652-3cfb-e55d90d31fbf@samba.org>
 <ec067a72-313e-1878-33a0-a3259d2979d5@mit.edu>
 <1503578184.3428.19.camel@redhat.com>
 <db882372-aa1d-e58e-4c94-a268539bd2ee@samba.org>
 <1503596189.3428.26.camel@redhat.com>
 <F363B51E-FDF7-4C91-9ABD-B623B5CE97BC@dukhovni.org>
 <8f68cfb0-2d6b-d86f-4ff0-a9282aa0bf55@samba.org>
 <cb0d7433-9e23-5bce-4e06-1213bf88cade@samba.org>
 <20191121223908.GC26241@localhost>
 <22f96c93-0217-0b2b-d7e1-684f9269fba4@samba.org>
 <20191122224526.GA28614@localhost>
 <8b72197d-2fcc-5b4f-4392-12d53d1ec624@samba.org>
 <5bcc2951-afdf-0849-5c16-f542afe214a1@samba.org>
 <3d693bdd-9a4c-7135-318e-593e18e52cd0@mit.edu>
Subject: Re: [kitten] Checking the transited list of a kerberos ticket in a
 transitive cross-realm trust situation...
Message-ID: <9062428f-f26d-4f10-b71f-f54464df2ff4@samba.org>
Date: Fri, 24 Jan 2020 19:49:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <3d693bdd-9a4c-7135-318e-593e18e52cd0@mit.edu>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="LxF0Z974iCZU7T90v4oJNAfxKO60yEMcU"
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
Cc: kitten@ietf.org, Samba Technical <samba-technical@lists.samba.org>,
 "krbdev@mit.edu Dev List" <krbdev@mit.edu>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LxF0Z974iCZU7T90v4oJNAfxKO60yEMcU
Content-Type: multipart/mixed; boundary="iRx9yIe5JwdJWumD27fqMuChggaz5M9QJ";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Greg Hudson <ghudson@mit.edu>, Nico Williams <nico@cryptonector.com>
Cc: Samba Technical <samba-technical@lists.samba.org>,
 "krbdev@mit.edu Dev List" <krbdev@mit.edu>, kitten@ietf.org
Message-ID: <9062428f-f26d-4f10-b71f-f54464df2ff4@samba.org>
Subject: Re: [kitten] Checking the transited list of a kerberos ticket in a
 transitive cross-realm trust situation...
References: <69d80d24-d461-1652-3cfb-e55d90d31fbf@samba.org>
 <ec067a72-313e-1878-33a0-a3259d2979d5@mit.edu>
 <1503578184.3428.19.camel@redhat.com>
 <db882372-aa1d-e58e-4c94-a268539bd2ee@samba.org>
 <1503596189.3428.26.camel@redhat.com>
 <F363B51E-FDF7-4C91-9ABD-B623B5CE97BC@dukhovni.org>
 <8f68cfb0-2d6b-d86f-4ff0-a9282aa0bf55@samba.org>
 <cb0d7433-9e23-5bce-4e06-1213bf88cade@samba.org>
 <20191121223908.GC26241@localhost>
 <22f96c93-0217-0b2b-d7e1-684f9269fba4@samba.org>
 <20191122224526.GA28614@localhost>
 <8b72197d-2fcc-5b4f-4392-12d53d1ec624@samba.org>
 <5bcc2951-afdf-0849-5c16-f542afe214a1@samba.org>
 <3d693bdd-9a4c-7135-318e-593e18e52cd0@mit.edu>
In-Reply-To: <3d693bdd-9a4c-7135-318e-593e18e52cd0@mit.edu>

--iRx9yIe5JwdJWumD27fqMuChggaz5M9QJ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Greg,

> On 1/23/20 6:25 AM, Stefan Metzmacher wrote:
>> it would be great if we could make some progress here...
>=20
> Does this need to be an application flag, or can it be in the krb5.conf=

> realm configuration?  Presumably people are currently working around
> this by setting [capaths] on the server; a realm variable would simplif=
y
> this workaround by not requiring specific knowledge of the domain geome=
try.
>=20
> I reviewed the thread, and it sounds like the current understanding is
> that AD applies a transited check (of sorts) to cross-realm tickets, bu=
t
>  doesn't say so by setting the transit-policy-checked flag in the
> ticket.=20

Exactly.

> From the upstream point of view the server's realm
> configuration is in a better position to know that the realm is an AD
> realm than the server application; perhaps that is not true from Samba'=
s
> point of view, but I thought I would check.

In Samba we know that we're joined to an AD domain
and then we want to force disabling the transited check
for gss_accept_sec_context().

For Samba as AD DC we want also want to disable this for
krb5_rd_req_decoded in the KDC too.

A krb5.conf option would also be good in order to support
non-samba services in AD-Domains. But the c library should also
support changing it at runtime.

metze


--iRx9yIe5JwdJWumD27fqMuChggaz5M9QJ--

--LxF0Z974iCZU7T90v4oJNAfxKO60yEMcU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl4rPEEACgkQDbX1YShp
vVZJfw//e+L7fDBHia970YihEOIdwZesgAukiXofB6OQ0ivT9zysNhlBHoryT8Ft
hMucbC1zwz+yIzAjFHcE/QCjf/7Ya/dTTbP0Fqi1JB29YumiqyNNpjrZy4Dirh06
aiSuNneDhee3dPINBmi+mFNSF7ZjNJFyr/Bt1DmIdx1a7MNrwNColKCFdsX7VK9g
0xgU/xfpNhgddg0YaJaGIWHM6TxoVp5tf/2mMIhIDTk9X7rOkez0/QMOi0VzwX8J
E4Ls5Kogn/VO/sqkBufr8DI8hVf5T23y9q+gDchUOnw7g+1bHlmY9KdoiBZcKvPI
y6Rw1dYH5a20/hpYtvedIQPlT2hmZ+ulgJ6RYNH30RR8cB0nlavNCTgdy9xW6IZQ
5t/+NCuYM8R5bmklZQ2l/Jn8bitHH2UKfjVJEN1pNiMpBToEHJfg81NtVMzagDLc
6XLsQp/jXRro5Fp8AKsawECqSSF1P9rUDFbPqPXcRUeW21JB0FDwXQ9AFHw8HhBf
Ru4LcvqqZqWdvCDeJtY/JyOfy2J4jxMQZaMVi963qU4+TCi3vLykpRTgRdiWx8VU
rkVIJzJDLI5t4uu+bTEkc0+Z5LFyMOYtps+Zk9VuPqUVnioZbny44Vdpos0HWHCD
c9i/oLI/3wobIq2wLIqQtmZ/vpYQKKAxA2hBY63iUsBIhb4wYqw=
=NcHh
-----END PGP SIGNATURE-----

--LxF0Z974iCZU7T90v4oJNAfxKO60yEMcU--

