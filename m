Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A961C6E6E
	for <lists+samba-technical@lfdr.de>; Wed,  6 May 2020 12:34:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ghYAX0d9yCxVjcF5lcTya2IBPrHRwUVwkdLxbg7w00I=; b=lzQWKaxocwudIaEWQG/9s7lPN6
	6sBt5xQ2z6g59MUeiJ4LB2jm/bQ9JC59OwrNIRz+hwCkXfSWiHSB9Qfr4UBxuvD5ruOXv+/MveLWo
	Y8CpNkqX321ldi9vfFsHxAAfNH7cL4H9cXcU/KaRpy/YlQFHsKK99AStqgxdll+lsnGsxYYHFlMqv
	gnKZQwVec1XUZTWkxcLa8QwH1Leo9pOTpuN/ov+CliWJO0AZ7I11qZ8e4NnOtRYSzdhtU9tZnOjoN
	zquftuAuPXio0UGBH9zqwligIcR7aIgef1jGL0J1nQsLqsfym8PgffaCG1Qgf4ejep2R9RcDdlL1a
	ejoUdKsQ==;
Received: from localhost ([::1]:37530 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jWHNX-00308F-HZ; Wed, 06 May 2020 10:34:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37802) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWHNQ-003088-4H
 for samba-technical@lists.samba.org; Wed, 06 May 2020 10:34:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=ghYAX0d9yCxVjcF5lcTya2IBPrHRwUVwkdLxbg7w00I=; b=u4UdWd/ARq9h4vogCaLKeA2r38
 Rd5X+yxUAWOAcx0xDH4H91RiLlrxK9rD/vTFZyZXGvqTsBMFpqbluc0eC2Lz9WQrqTgwn0Jf7MaL0
 1zbPZiBXICbmCjLLhef0pP8GglRD/YbTsqhxTZzQRyts4n+lUfn33CgO8JMQ7dnaJZfXpDd7W8NJm
 jLuG92XSzTa5V94gr3gSJn3xkUH1by3gJIaYGI8eYhnSA/9LOloJcmC/qa4p9oD7mPk6q5wdRLduG
 8uli5jyjIW6ZLQyNdOXYdcKQ6+1PAK8/h0ONitUyY27/f73HWMxbFFGl2UVj5bzMwwqEGqWiDjf7S
 bh7xcgNuDs+q4Yc/JCYo6QqaB9KHNPbpFGwhbkzXcXvGs9u1GwJVFhb2ShcsX/bHOvm3emG+F9jXv
 CagJJIzJaQGQpzCjITNpgY4UxQGCIXQVx0GIbCJrZO6xDHBW/Vn+boPnPI0t6OcWBgE7J6lIJIq3P
 yCFhs4D6IAIWTC/2U/N1VNPS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWHNN-0004d9-OC; Wed, 06 May 2020 10:34:05 +0000
To: Anoop C S <anoopcs@cryptolab.net>, Jeremy Allison <jra@samba.org>
References: <0009f6b7-9139-35c7-c0b1-b29df2a67f70@samba.org>
 <102c824b-b2f5-bbb1-02da-d2a78c3ff460@kernel.dk>
 <7ed7267d-a0ae-72ac-2106-2476773f544f@kernel.dk>
 <cd53de09-5f4c-f2f0-41ef-9e0bfca9a37d@kernel.dk>
 <f782fc6d-0f89-dca7-3bb0-58ef8f662392@kernel.dk>
 <20200505174832.GC7920@jeremy-acer>
 <3a3e311c7a4bc4d4df371b95ca0c66a792fab986.camel@cryptolab.net>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
Message-ID: <48c9ddf2-31a3-55f7-aa18-5b332c6be6a6@samba.org>
Date: Wed, 6 May 2020 12:33:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3a3e311c7a4bc4d4df371b95ca0c66a792fab986.camel@cryptolab.net>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="5Bi5nMIt7JpNqwwd1UNbUsQj7bbkVxNto"
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
--5Bi5nMIt7JpNqwwd1UNbUsQj7bbkVxNto
Content-Type: multipart/mixed; boundary="EVV2tXuzIhCj0wS29cz0ZK508UL2FrMg7";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Anoop C S <anoopcs@cryptolab.net>, Jeremy Allison <jra@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>
Message-ID: <48c9ddf2-31a3-55f7-aa18-5b332c6be6a6@samba.org>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
References: <0009f6b7-9139-35c7-c0b1-b29df2a67f70@samba.org>
 <102c824b-b2f5-bbb1-02da-d2a78c3ff460@kernel.dk>
 <7ed7267d-a0ae-72ac-2106-2476773f544f@kernel.dk>
 <cd53de09-5f4c-f2f0-41ef-9e0bfca9a37d@kernel.dk>
 <f782fc6d-0f89-dca7-3bb0-58ef8f662392@kernel.dk>
 <20200505174832.GC7920@jeremy-acer>
 <3a3e311c7a4bc4d4df371b95ca0c66a792fab986.camel@cryptolab.net>
In-Reply-To: <3a3e311c7a4bc4d4df371b95ca0c66a792fab986.camel@cryptolab.net>

--EVV2tXuzIhCj0wS29cz0ZK508UL2FrMg7
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Anoop,

> I could reproduce the difference in SHA256 checksum after copying a
> directory with 100 copies of test file(provided by reporter) from
> io_uring VFS module enabled share using Windows explorer(right-click-
>> copy/paste). Only 5 out of 100 files had correct checksum after copy
> operation :-/

Great! Can you please try to collect level 1 log files with
the patch https://bugzilla.samba.org/attachment.cgi?id=3D15955
applied?

If you use files with only 0xff please also use the
"io_uring:check_ff=3Dyes" option.

Maybe the problem is really triggered by short reads...

Thanks!
metze


--EVV2tXuzIhCj0wS29cz0ZK508UL2FrMg7--

--5Bi5nMIt7JpNqwwd1UNbUsQj7bbkVxNto
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl6ykpcACgkQDbX1YShp
vVZsMg/+Jnnm4vqVAK8ghWxaEB+YCij64ct0oSmXfQWcA72pyJYL8gJqUYWqd06P
g4C4KMRnZwpIboCXsux33xd9pod74IK4oBu2MVOidNfOiTkho/pgrREZKZEreDXS
jYI5FD1XoA2UCg3NpVcOSOfRhKV1OVQ6VTj+a1qlun6E9Jl/k6s03hZ7eK5e3vDa
X712fHAPdzHcbMVzduf6nwPhrt99P7gYFEwL/Hogr6bqXVV7XOArNQoiq8AKBrNH
XbUpA/6Z/FarC9wCoWlHrA/+tjmEc695xnKQgQHI1CkF09ojU6xxj8Cus9lWjEsK
Low3EBW1myVOzQfNV9RZy/73JJNf6QUzEh7K2Z0keyvPlF+eIBsBaXi8BtOBvT55
+jdKnj0JFrfHVEJxSx8Uprdhv7WaHceNnjrfxtcEZJuE51mRH4q0viW+ynxfQMT2
9LMoIBKE1mKwbk94bKsm3qabQCtMjSTtcaXg8aqmxTatKeQhGYvnlU9zaaRWuZVz
mq8XpJbW6sVBNeq50xOmGhDUSWB+Qkd+gBeZre+mWjjdm7o2Gcd8HRaJUdLWts2c
skFPQfx23JzY46EYrfUVH3CYpuw/47mtNAlMHZr9u/0S/VoJeyKEYKWL3AdGoYqL
vzADcbDjw5PcKqsQjUVd4o+2djt1uRfRUe4Uc5yK5iqHtH9/dCE=
=2PRY
-----END PGP SIGNATURE-----

--5Bi5nMIt7JpNqwwd1UNbUsQj7bbkVxNto--

