Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E11E1C6E9E
	for <lists+samba-technical@lfdr.de>; Wed,  6 May 2020 12:42:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=OMXb5DekiL8X7dKcftjRlT1c5V2801zWN2NT2efig+c=; b=H3TxD9BSjW99NlTBJU2xp4oF0W
	MZ+aAA6AXJNgouvLh3UkwZPQXOyYnZ4z8wmlpuNvsnxezLAJmHvTiv9c0YioExXxHldjBE6tto5AI
	msiWSBxJv9YTTcWAkUccVVooNNqBtr8F+lAGIBvRQxFuPyERYwZC9ByjeQF686y8/+OxFnWVLG6J1
	dgUsQ7Q7bKfc06GlgruWXh+SBTCROkzBnuAqoTLylOx3g15zNsdXst6Et7JawSqgVBeJCI7SeCW1N
	YE1z7pQBu/v7DYWZ02tIDf2j1lqFvg96n8h9gU3y+uvejJkwPZXG9ZJSfOQQZDjxZNW0rcORFFHyj
	1wiKkkTg==;
Received: from localhost ([::1]:38282 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jWHUs-0030Ir-Un; Wed, 06 May 2020 10:41:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40362) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWHUl-0030Ik-UT
 for samba-technical@lists.samba.org; Wed, 06 May 2020 10:41:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=OMXb5DekiL8X7dKcftjRlT1c5V2801zWN2NT2efig+c=; b=awOOJYL6zbO+rvc0DLXlirW0zt
 qViQVvFW8SdFwWxv8OsvlMAG3wv6/v9jRwvYnt/cyAC/aPgype7v1521yOKWH/5oOTVMiXlF1uzFR
 Q1jBd0KkPHfcz+0VapOX5faqfzzyXGFbrRiyCRvRroFB8t7t8p7z2tGzYyqQWoVm7MD5Q9xbx/vf2
 Rhu+gh7rK0b9HgVcEor48s+1jaBYiqWzlxK+NnEF86Kmf5xNoOWcIM8Rw7av0YtYa14TJrYLjuRmj
 87FoXEF9E3/CRRBL66k93CIH9cJp4CP71o+vi+Nsat3El7xuernHx1qZzHALOkt8HAmLmw104MIRh
 3vhwiY/3VAuduFkxRvHohdUg6LB2oC8KMfK8C9KY0Ue2LhQqLpN8Wkk06/C2tdYWt8+PzL1YXaetC
 inC9jdFVj45JPUvP/ObG9nRep3EF6fY6sNOPIFp1bqU5bYv8K6eIEhWUGb6KfTHATo2p9XyiAQwJ8
 KNGPlF0vJf7UeK8nsdGYSeUJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWHUl-0004h9-81; Wed, 06 May 2020 10:41:43 +0000
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
To: Anoop C S <anoopcs@cryptolab.net>, Jeremy Allison <jra@samba.org>
References: <0009f6b7-9139-35c7-c0b1-b29df2a67f70@samba.org>
 <102c824b-b2f5-bbb1-02da-d2a78c3ff460@kernel.dk>
 <7ed7267d-a0ae-72ac-2106-2476773f544f@kernel.dk>
 <cd53de09-5f4c-f2f0-41ef-9e0bfca9a37d@kernel.dk>
 <f782fc6d-0f89-dca7-3bb0-58ef8f662392@kernel.dk>
 <20200505174832.GC7920@jeremy-acer>
 <3a3e311c7a4bc4d4df371b95ca0c66a792fab986.camel@cryptolab.net>
 <48c9ddf2-31a3-55f7-aa18-5b332c6be6a6@samba.org>
Message-ID: <5811bf73-7cd4-125e-ac1d-8dbb9a0d7c12@samba.org>
Date: Wed, 6 May 2020 12:41:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <48c9ddf2-31a3-55f7-aa18-5b332c6be6a6@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="yAjxnJhkQiFDgwsZrcnZdDFxcA54RcpVa"
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
Cc: Jens Axboe <axboe@kernel.dk>,
 Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--yAjxnJhkQiFDgwsZrcnZdDFxcA54RcpVa
Content-Type: multipart/mixed; boundary="sOPnD47novnbsq2n4CvpX5mjZYl80R47A";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Anoop C S <anoopcs@cryptolab.net>, Jeremy Allison <jra@samba.org>
Cc: Jens Axboe <axboe@kernel.dk>,
 Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>
Message-ID: <5811bf73-7cd4-125e-ac1d-8dbb9a0d7c12@samba.org>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
References: <0009f6b7-9139-35c7-c0b1-b29df2a67f70@samba.org>
 <102c824b-b2f5-bbb1-02da-d2a78c3ff460@kernel.dk>
 <7ed7267d-a0ae-72ac-2106-2476773f544f@kernel.dk>
 <cd53de09-5f4c-f2f0-41ef-9e0bfca9a37d@kernel.dk>
 <f782fc6d-0f89-dca7-3bb0-58ef8f662392@kernel.dk>
 <20200505174832.GC7920@jeremy-acer>
 <3a3e311c7a4bc4d4df371b95ca0c66a792fab986.camel@cryptolab.net>
 <48c9ddf2-31a3-55f7-aa18-5b332c6be6a6@samba.org>
In-Reply-To: <48c9ddf2-31a3-55f7-aa18-5b332c6be6a6@samba.org>

--sOPnD47novnbsq2n4CvpX5mjZYl80R47A
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 06.05.20 um 12:33 schrieb Stefan Metzmacher via samba-technical:
> Hi Anoop,
>=20
>> I could reproduce the difference in SHA256 checksum after copying a
>> directory with 100 copies of test file(provided by reporter) from
>> io_uring VFS module enabled share using Windows explorer(right-click-
>>> copy/paste). Only 5 out of 100 files had correct checksum after copy
>> operation :-/
>=20
> Great! Can you please try to collect level 1 log files with
> the patch https://bugzilla.samba.org/attachment.cgi?id=3D15955
> applied?
>=20
> If you use files with only 0xff please also use the
> "io_uring:check_ff=3Dyes" option.

And "log level =3D 1" and "max log size =3D 0"

Thanks!
metze



--sOPnD47novnbsq2n4CvpX5mjZYl80R47A--

--yAjxnJhkQiFDgwsZrcnZdDFxcA54RcpVa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl6ylGMACgkQDbX1YShp
vVYEAQ/8DicmSwUBPLsRdN52QTPQFHjCCGE7jfjJu6w8LQePMsgGA9I9152Lb+Lf
nu1NfEp5gnyAqyjK9kgJlheMi6XmPaCZDmlp08eK0THT212xRRXyWr3Z6grlG2Jv
0uTyYBUPE8KVXMb+T3zAZzxg3d5cv6lwrB4N0rbsyjV8RjPQ3Halnto3pbXZ5UdV
EenNeSqRKs04/pQoT4ITDCMzLeW+c/OSsbMh2PterUSGB5EbDGz8RXmB0PuzQcpA
wBgwcqPtL8pv8DNmMbAadpeeiPfXIdpaq2Y9aysHuZDKjlQn/PLnFeuFbQwMG6f5
NYWfMOFgxNupSyjZuxeX1Mmc/0skV5sjCHoriPyFzx9GqhFH/o8Lpx9daLId1bSB
iNk/fXZSgJkJPNZyVWZS1DCpWcbW8Eo1bw6oj7v3yO1Clm7bHQRsWyrBxre24JRE
dm8qDU2RKWb6MaAVUtRPlA3GwyM0BvmCs+OD4WVw/oNWTHT0qrOR3DVcvvwqfybE
fgkptS/lV0NRutPCAMyNqivneXBm03pm8KZTcFbUgddgaTz3FWZId6UAjeiHKAlA
4vkEgMY6N0wLzmhU2RFczN5ZVGlZSjc+8PnHdN+LM33MHELqGYkKjXlJByW9U7jN
VnVNexxXPJPI5TWeu5Aj+bK3kiUm9KejI4jtNYTHMvI0ONAJVhE=
=nUg1
-----END PGP SIGNATURE-----

--yAjxnJhkQiFDgwsZrcnZdDFxcA54RcpVa--

