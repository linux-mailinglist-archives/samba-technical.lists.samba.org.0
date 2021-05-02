Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0050D370FB0
	for <lists+samba-technical@lfdr.de>; Mon,  3 May 2021 01:16:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=OSyNGFLbLJmCK5Qk43LZsCMhxageuFysZdMspFB93Jc=; b=mzKfZp0vwr81ZUttF7livYIRgy
	jzxuGiIII4G0Z2nwQJWdMFJ+TcrLdrJmc/v6jifDa6xy6xHY3gZbWX2G0rB8QU/eE6z38JAy74Edf
	GpP+35KYkQb7U5EctHnLCdRZjFQuFR2PpS1cjOtMRcrDG6qIvmq5+4hg84GKykOwc7vUz1lbmzpRS
	HJmsNqBFlH3P+CHXkmmtneEjDKgsKjCaFczhvbSLkNU9vHP1SOneH4JomCS6wRgyshmKisybfDjmo
	KSk3IaowYrS8uc4ZR0B4FKo7ZEbqWk4YKw3vyJfEjJ61BgBBwbq1vPoEzQEBtZJrHwhIQmPGqpW9e
	n1cMpAvg==;
Received: from ip6-localhost ([::1]:29820 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ldLKO-00FK9Z-Ib; Sun, 02 May 2021 23:16:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29386) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ldLKJ-00FK9S-4k
 for samba-technical@lists.samba.org; Sun, 02 May 2021 23:16:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=OSyNGFLbLJmCK5Qk43LZsCMhxageuFysZdMspFB93Jc=; b=ZLHbV1RjtgctkKvAngb2jLioap
 K8X6Qgwg5b1B6Tv7NBWjcK+A9toclUHVT3dtHU1/giTB5xtTf26WsZMpoVbe/XoSPmeCNPfKGEaNk
 f41KjMyfwcP8HsdEbCZiL7rB+XJkl2RC0J8gjlVXLLwYStvwU7sAnHD4WVABo9cVA6c23W9YId6FO
 06vzWrb8vtXyr6WC8kZ0G+vx+SY7wYQ1+rC8fJgic73N8QyOJTiP9TYq9UgxrXfOHjQkVbhRWYXaq
 Fb8GCIWfpr463wqmtE+9Xz/sY7S+qX7Vnlu5hK1HJSpNfcBxB0huUSAEvGh5s63aQ2D3DCkVK2Gj6
 zTxYVYLE5Jfeu4KNPTNwYjtdCHDcCH0ZQUwpK2kgLPHfrQOdbjg9S5hNUVCaohqhBAg1B7X6N5qj5
 J6vhl7RGfu5urB30++7BiJS9IQGPrOmKTUI7YLYDEV4PQh1LJlt20ACybKIQ2gAPrGkusaumxOnFm
 TLqY7o1Ayjm+1YHiqECG187b;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ldLKH-00056c-1q; Sun, 02 May 2021 23:16:37 +0000
To: Andrew Bartlett <abartlet@samba.org>
References: <3663e2d45ad7855b807286d4d45bba7ef450d9a3.camel@samba.org>
 <a377c5a5-225e-9fc4-a70a-c52145732121@samba.org>
 <30ab21963ccb18678de20e7814e97e8e4b13f3f3.camel@samba.org>
Subject: Re: Kerberos raw prototol testing
Message-ID: <b08f1fca-9a92-ba28-5515-7918522dc5ff@samba.org>
Date: Mon, 3 May 2021 01:16:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <30ab21963ccb18678de20e7814e97e8e4b13f3f3.camel@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0pgrCK1LoHWqe7lARvA0IHNQwId0l3CVr"
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 gary@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0pgrCK1LoHWqe7lARvA0IHNQwId0l3CVr
Content-Type: multipart/mixed; boundary="2ZZa5h207Y9mwUUI74l3tfE2xTTkpMc8P";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Andrew Bartlett <abartlet@samba.org>
Cc: gary@samba.org,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Message-ID: <b08f1fca-9a92-ba28-5515-7918522dc5ff@samba.org>
Subject: Re: Kerberos raw prototol testing
References: <3663e2d45ad7855b807286d4d45bba7ef450d9a3.camel@samba.org>
 <a377c5a5-225e-9fc4-a70a-c52145732121@samba.org>
 <30ab21963ccb18678de20e7814e97e8e4b13f3f3.camel@samba.org>
In-Reply-To: <30ab21963ccb18678de20e7814e97e8e4b13f3f3.camel@samba.org>

--2ZZa5h207Y9mwUUI74l3tfE2xTTkpMc8P
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 27.04.21 um 12:31 schrieb Andrew Bartlett:
> On Tue, 2021-04-27 at 08:31 +0200, Stefan Metzmacher wrote:
>> Hi Andrew,
>=20
> (brining this bit back to samba-technical)
>=20
>> Please be aware of the WIP merge request:
>> https://gitlab.com/samba-team/samba/-/merge_requests/1896
>>
>> python/samba/tests/krb5/as_req_tests.py is the relevant part
>> as well as the get_*_creds() helpers in
>> python/samba/tests/krb5/raw_testcase.py,
>> there _generic_kdc_exchange() and the _test_as_exchange() helpers
>> make it easy to also check the encrypted parts of the exchange.
>>
>> _test_as_req_enc_timestamp() demonstrates a simple password based
>> authentication and checks almost every field in the response (also
>> in the encrypted parts and cross checks encrypted and plain fields)
>> checking the PAC including the signatures shouldn't be that complex.
>> Also extending it to do FAST and regenerate the same packets as
>> seen in the windows to windows captures.
>=20
> Thanks so much for the pointers and the code. =20
>=20
> Thanks for keeping this tree recently rebased, but how do we go from
> here? =20
>=20
> Should we just learn from the concepts and implement the narrow case at=

> hand (FAST testing) and you will integrate it later, or is there a
> better way?  How can I/we use your code?
>=20
> I'm sorry to say that despite having worked with you for something like=

> two decades, I still don't know how to practically and respectfully
> work with your WIP branches.
>=20
> To date I've generally focussed on picking out and merging the few
> patches with a full signed-off-by on them and (say with the Heimdal
> trees) trying to keep some of the rebasing current, but otherwise I'm
> very lost.
>=20
> There is clearly a lot of effort and value in between all the 'sq',
> 'fixup' and reverts, but I don't know how to sift that gold out
> properly and refine it into an 'upstream' state.
>=20
> So, rather than wonder another decade, can I get the quick 'working
> with a metze WIP branch' HOWTO?  (I need this for the Heimdal upgrade
> branch as well).

Just look at the complete diff of that branch as_req_tests.py and
raw_testcase.py, and work on top of that. If you're ok with it I can just=

squash almost everything and propose it as one large patch in order to
make progress and get it to master. Or do you think it would be useful
to have some of the preparation as individual commits?

metze



--2ZZa5h207Y9mwUUI74l3tfE2xTTkpMc8P--

--0pgrCK1LoHWqe7lARvA0IHNQwId0l3CVr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAmCPMs4ACgkQDbX1YShp
vVZLshAAjJpnXnaHt2pvmORuUVA5m2qfxmXir+9qTGONdQSDcqPD+JTY6iHW0pzC
hwmj9QYVxJir+vNAR4pr6dj4+leCumYs5EehwQierwg9KOXj2ff9C6KdQ4Cb0b4o
54P9ZIalpoRTLAqT+CEe0W80hqLbqsAIvzRtqvs0RTfOILKHPy4E6hnOJQNIAf7V
tU6ana7Fu9ypktDHJxTf5S17IGUtAFbLvVeDp3FZLjT2Q08nUdPmmmgopOKKQs9z
L6BGYDgY3EQs4n3d4I7++smErtle8+taaItNtPq6saxJl3vLltZU/XgURlzT0A5M
0HEp3lgjndixCGFbK8pKLszgDsEu90n0DUcJNVkqtoCceDN9gYz2OAoWsf5jbknm
ItjL9h7/xNx95fFuUgUcaAeqMhJCV0KLjQHuWl4LP05la8DZpVXsetnWMyMCJkyM
7QVZVwamaXWcqZft432n1EW4bUT+twNXVmlddGR7NdJ2HyWHfoFJTYwhYUHS7Qzd
BB00fVv/fi7Xq0tiGAGHLtr+mkipdxLMNr9dYcJZdp8UnnOlBrw0swKCGna1lE/7
afxdqK7mcdeen83yjAfQ6cxfav54+q7yRbfsK+V3jRYShwagpcAz6mmDbOSYsFMS
glNBiy04P4uuBVlYXRVGxy1fPSlMVlE1ZCacX3gEaK/k7/zPOZ0=
=JeBw
-----END PGP SIGNATURE-----

--0pgrCK1LoHWqe7lARvA0IHNQwId0l3CVr--

