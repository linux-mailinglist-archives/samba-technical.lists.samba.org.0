Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE6D1D54E2
	for <lists+samba-technical@lfdr.de>; Fri, 15 May 2020 17:38:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ICvbfda0fFPM4uG6N1nRYmHRd1wo3bK3PWDlEYsU2E0=; b=zURMDPb4qb5tQejucTmujDJYok
	vF9CcVv20NUt3D3YTq3WOAGEMntCWr/G9M/5UV9D2B8R9m/gQ3bz6667RtLw63Hk5RcKy2VSHC20f
	SIDkFvzcz8pyNl+15YM2gotzn3oCBjyjvv3G8p9DETwAvqvT2tEp59+r0+xoCPL+QfTgEls86rpze
	9otkUxw1oK+g8k1Mkj4Bb1EiawivZ2vOZkQCfndWeNhOmBAd6jUAGAKR1TUqB8acX8uF95vNCk2nc
	+WQsaNZbmMzd/lsy5n+M4poQ+aI5DlvOo3LU4FimBWmJ3vUR9buqwBsZHNtR67MOXDd12nSRV/yck
	g8M1vVqg==;
Received: from localhost ([::1]:22484 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jZcQ6-004Zez-T6; Fri, 15 May 2020 15:38:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50204) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jZcPz-004Zek-Pi
 for samba-technical@lists.samba.org; Fri, 15 May 2020 15:38:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=ICvbfda0fFPM4uG6N1nRYmHRd1wo3bK3PWDlEYsU2E0=; b=Q2X9ojNC0hVqOmum7ceDEnDrqc
 DMZeViRlCQ3BoxOSY9vX0Rn8zXDBap1OPtpUIHBL30SpJB0/fWgzlhZd+VAbWqr74lOi0n8gCJekh
 S3AgWudd2JP84UmtCYLVlZgCtt7Lf8YEwadwNJhB35FBbk16Xzf4Sj6l9ZWQZ4N2yM02rIFN+YmbU
 9c9AogM8COP6a91mirrqN7brvn93DXdtmbwWIWVL9M+8NXxvauVpnHEN2j1UOOvi9GgvCUfGTk5Qc
 +TE2HGpNA4lXZtGEGgq2H4htd4r+MK5wRPC+0k+n7Yn5961OrnUAAEz/oVeTpd53qIAdjTZ/41jP7
 mveDBKJfZZivIAA1mJAu5dySbpVDyiu8NN7tygokjUCpI48S56zQYvnURNgZnnJ5KVCUUqPcLgVcp
 SVe609uWvNDGaVCTDQeiUU9e3ddBWUKwDKVMNk/+VMA934fVHEQeR2mZy9cGsI+7pzNZrqpKKnr01
 /tm20jyVHDmaD2j9qCM0tlmx;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jZcPz-00004t-4Z; Fri, 15 May 2020 15:38:35 +0000
To: Andrew Bartlett <abartlet@samba.org>
References: <e245b5e81ba6066da467f371bc917d6a052ccb8b.camel@samba.org>
 <02c579f8-1021-52c7-0671-a85645e2f353@samba.org>
Subject: Re: Heimdal upgrade tasks
Message-ID: <803e3c00-a223-4585-569b-6170576b7b8f@samba.org>
Date: Fri, 15 May 2020 17:38:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <02c579f8-1021-52c7-0671-a85645e2f353@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="UIbxdryysDEboeX33APBjZGaCO43f4TYz"
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
--UIbxdryysDEboeX33APBjZGaCO43f4TYz
Content-Type: multipart/mixed; boundary="1kAjFPzdxIrTNXReDYTcMZV7UAlmYDPmE";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Andrew Bartlett <abartlet@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Message-ID: <803e3c00-a223-4585-569b-6170576b7b8f@samba.org>
Subject: Re: Heimdal upgrade tasks
References: <e245b5e81ba6066da467f371bc917d6a052ccb8b.camel@samba.org>
 <02c579f8-1021-52c7-0671-a85645e2f353@samba.org>
In-Reply-To: <02c579f8-1021-52c7-0671-a85645e2f353@samba.org>

--1kAjFPzdxIrTNXReDYTcMZV7UAlmYDPmE
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 15.05.20 um 16:49 schrieb Stefan Metzmacher via samba-technical:
> Hi Andrew,
>=20
>> I've had a customer offer to commission some of the work towards Samba=

>> being a 2012 FL DC, and I've suggested that the Heimdal work you are
>> doing might be something I could help out with.
>=20
> Great!
>=20
>> Do you have any suggestions about how I can best help you?  I don't
>> have a big budget, but if you have some ideas on what I could do in a
>> week or so effort that would be awesome.
>>
>> I'm well aware of your tree at
>> https://git.samba.org/?p=3Dmetze/samba/wip.git;a=3Dshortlog;h=3Drefs/h=
eads/master4-heimdal
>>
>> What is and isn't working with that so far?
>=20
> Try to find the pipeline with the related commit or run a new one.
>=20
> I think most of it was related to the test cases which rely on the
> internals.
>=20
> I guess it would be good to work on top of
> https://git.samba.org/?p=3Dmetze/samba/wip.git;a=3Dshortlog;h=3Drefs/he=
ads/master-auth
>=20
> For a start make a copy of python/samba/tests/krb5/as_req_tests.py
> and try to add the canon tests.

I think the key thing would be to use _generic_kdc_exchange()
with as_exchange_dict() and tgs_exchange_dict().

Maybe it's enough to use _test_as_exchange() and create something
similar for _test_tgs_exchange().

Do a grep in order to find some examples.

Thanks!
mete



--1kAjFPzdxIrTNXReDYTcMZV7UAlmYDPmE--

--UIbxdryysDEboeX33APBjZGaCO43f4TYz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl6+t3cACgkQDbX1YShp
vVZPSQ/+Pc+3UA1WUjTRaDpRc0gEKOfrdBzJSYYT5US/WWvT3WIXyPmL4gImgum6
bzAjS3wo/ja1dXmUK0cUZcvXJIiWfdgeBbR8eFORzzv071zvu8KFFXquN0NmpMIY
b41W7YxC40fYP5Z6hJFD9QVBrbijdAZf64Ps+7riEeHcFu1FPPpyUzX2N5v/vPEO
5opTT/9y/mW4uKrDGHtDassq9i1VDY3reNFoqpvkxFTH1WcO/iXYeironVt80b6E
ttMR7M03VgjmFTw48kVVDjtn1lW/2zILJdpVznYj1MWxzKVxld9l/QpCRt9n3NWg
0r/IxUo42EH+lQ5rauGvhF5PLDudaUPigvhur03koO6eYJvKj9jUGGZPU/tJ16j1
dJrjrkGINZMUr3wYW5TAa4kOk4g76su2HNpeEY0VWCzTGB23TKdzKhgQsltTkHpq
4zLjCnSZmYQyH7e1lLTv02++aZoYjkwgk7I1S4c1qv9hcEOKn+P1yYeO+/3khQi1
NeCqa17O6Eqn84sziv19vQ9RXQJkUThDildq7jsNWTRdJxW1S2obCRIFqk8Owx70
Kw/yLmPkgzLehRITYt7fkRiPBfhEGJyPB0VIx7acvPAYDi8NlXZDeAvwbB969odw
82hMcudRwWkjM3UdlIpTKhoo28PPBwO0YUADspnr62YTx90HWt0=
=0w9T
-----END PGP SIGNATURE-----

--UIbxdryysDEboeX33APBjZGaCO43f4TYz--

