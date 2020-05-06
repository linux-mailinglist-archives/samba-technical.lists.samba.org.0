Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A0F1C7429
	for <lists+samba-technical@lfdr.de>; Wed,  6 May 2020 17:21:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=leVDtz0o3apLUBP7drHgw2sM4oX/O6KBqwkyy/kPdUE=; b=rjt5GtqaavSHLFq+4Z3PibazAo
	qJwxlQlDWCsZtnV+Rmdl1Wf+co/YJqVy29v7FDWLwVJQtyXy+Tj59faLz2qHFRnYkqGI8Uvwe/u9j
	jKtmTfvhubR2+9Y+8JnkV5HQhjXGLOGSCYWU7tlMnyaI1ud7wgCtDnw1CXdW8EUhSwz43rKVpKDSd
	EN1D12nsOH32cNoGKEA9Z0dpBr9adVKvxFfLPNSNI1yfKaRI533jtR3PkrXkKUok4OamrfG78l5Ct
	9qN6UCOof8Vl+A6OggStPHOfPLXO70jJkcqzRhLdMgT/6swKJrT8Pxxm0Ym+wqcGrJJTzxO1TkkEb
	GJ4H/Wgg==;
Received: from localhost ([::1]:44850 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jWLqX-003296-57; Wed, 06 May 2020 15:20:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43892) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWLqM-00328y-8Z
 for samba-technical@lists.samba.org; Wed, 06 May 2020 15:20:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=leVDtz0o3apLUBP7drHgw2sM4oX/O6KBqwkyy/kPdUE=; b=mq1muRmRIsFoMebjRg7CnSs4B5
 xLkgRhZ0J0HLPiSjkM1yO15RwidVcklWY9b637KPFCiGGqMmEmU6zMgobKd9jA6Mypx5Ut6qbYHQF
 h4nZGmN50NS1EtGySjORDbCfnnYHoblEr2kxBVygkBouTsyxaUA3zQHXRZ7aNFd6Zt0e8ED1ZGkG0
 QiPpyFjy3xb8Sd/LQvzJA983j8ePsZZOPwgak1tzmbu88PvHArLcSMJTBbL0niivC+YKZtnPDCVSw
 UafVM1dLszo/BUfmlwb5K1O4xVjPc8pqb9ARjjxyD4n22kf19eNsRI0Yoe/jknEjazVa+dnU/hUiG
 8ag6Uu26B+3ZN2HCOOyyBiPuYa0/I/LNKFE7LjvXH4qxqTgOpLrhXg0TpOutxYvjYTHJ6WCKOj7QB
 DPk60v3GnTAw0sLbfFA9Ibc8NKjJB3P58EPkC/dVLMThvTMTMM687YgR2yufd6NBEX4pHf+7yyGBZ
 bnXmacifqLt0hn9NUw9Z0hcY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWLqK-00077j-3W; Wed, 06 May 2020 15:20:17 +0000
To: Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>
References: <0009f6b7-9139-35c7-c0b1-b29df2a67f70@samba.org>
 <102c824b-b2f5-bbb1-02da-d2a78c3ff460@kernel.dk>
 <7ed7267d-a0ae-72ac-2106-2476773f544f@kernel.dk>
 <cd53de09-5f4c-f2f0-41ef-9e0bfca9a37d@kernel.dk>
 <a8152d38-8ad4-ee4c-0e69-400b503358f3@samba.org>
 <6fb9286a-db89-9d97-9ae3-d3cc08ef9039@gmail.com>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
Message-ID: <9c99b692-7812-96d7-5e88-67912cef6547@samba.org>
Date: Wed, 6 May 2020 17:20:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <6fb9286a-db89-9d97-9ae3-d3cc08ef9039@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="LpmOi13J4jDkafH5JJ8vghqK2Uv3NKp8v"
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
Cc: Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LpmOi13J4jDkafH5JJ8vghqK2Uv3NKp8v
Content-Type: multipart/mixed; boundary="uytcKIcAe5NP4UdxmS7uQ8Fln0GxZL9m3";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>
Cc: io-uring <io-uring@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Message-ID: <9c99b692-7812-96d7-5e88-67912cef6547@samba.org>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
References: <0009f6b7-9139-35c7-c0b1-b29df2a67f70@samba.org>
 <102c824b-b2f5-bbb1-02da-d2a78c3ff460@kernel.dk>
 <7ed7267d-a0ae-72ac-2106-2476773f544f@kernel.dk>
 <cd53de09-5f4c-f2f0-41ef-9e0bfca9a37d@kernel.dk>
 <a8152d38-8ad4-ee4c-0e69-400b503358f3@samba.org>
 <6fb9286a-db89-9d97-9ae3-d3cc08ef9039@gmail.com>
In-Reply-To: <6fb9286a-db89-9d97-9ae3-d3cc08ef9039@gmail.com>

--uytcKIcAe5NP4UdxmS7uQ8Fln0GxZL9m3
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 06.05.20 um 14:55 schrieb Pavel Begunkov:
> On 05/05/2020 23:19, Stefan Metzmacher wrote:
>> Hi Jens,
>>
>>> Got it working, but apparently the arch samba doesn't come with io_ur=
ing...
>>> One question, though, from looking at the source:
>>
>> Thanks for taking a look!
>>
>>> static ssize_t vfs_io_uring_pread_recv(struct tevent_req *req,
>>> 				  struct vfs_aio_state *vfs_aio_state)
>>> {
>>> [...]
>>> 	if (state->ur.cqe.res < 0) {
>>> 		vfs_aio_state->error =3D -state->ur.cqe.res;
>>> 		ret =3D -1;
>>> 	} else {
>>> 		vfs_aio_state->error =3D 0;
>>> 		ret =3D state->ur.cqe.res;
>>> 	}
>>>
>>> 	tevent_req_received(req);
>>> [...]
>>>
>>> I'm assuming this is dealing with short reads?
>>>
>>> I'll try and see if I can get an arch binary build that has the
>>> vfs_io_uring module and reproduce.
>>
>> I guess I don't expect short reads for files unless the client asked
>> for a read beyond EOF. Does IORING_OP_READV may return short reads
>> similar to preadv2 with RWF_NOWAIT? And if so, did this got changed
>> since 5.3?
>=20
> AFAIK, it can. io_uring first tries to submit a request with IOCB_NOWAI=
T,
> in short for performance reasons. And it have been doing so from the be=
ginning
> or so. The same is true for writes.

See the other mails in the thread. The test I wrote shows the
implicit IOCB_NOWAIT was not exposed to the caller in  (at least in 5.3
and 5.4).

I think the typical user don't want it to be exposed!
I'm not sure for blocking reads on a socket, but for files
below EOF it's really not what's expected.

If that behavior is desired RWF_NOWAIT can be used explicitly.

metze


--uytcKIcAe5NP4UdxmS7uQ8Fln0GxZL9m3--

--LpmOi13J4jDkafH5JJ8vghqK2Uv3NKp8v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl6y1asACgkQDbX1YShp
vVaXHQ//b/UFVrj4B40+H6+lzZS2aDxxOU+ZI5e6/zihc9H3ZAqy3rDN+baqN/F+
YHcMusFbLLn/2gShl1HOx1XSQqOH0FMcZ5/dFB7GDEvParOfkT7aDzr84XamEX5J
aSRN6RzK0RYXIC1/EqAJ1LIbjLSezIOS1bP8yKkZZZPewKjSrMGu0wb8PoUT8v9Z
A2fsfv/S+DnumdlEK4NzQg7XK5oMJv23yks8MNYh32SmqNDY1RGniTAVBze/tvvp
z8qp9SRwcdszESmfmKcA932KN9xSDzMfn5RbXgZZBRXuEcvhBLN35Vjy9+N0/fVT
YhFwlIjF6EjhdRtNShseQLbayYwsKmxDS6ZiS7IL4vpyw2rd9dapqT4uQU/janTR
kAwTJ9CYu7KMTjvz0K5Q56tPeLb8zBCVNmgK3kLrJDsZi0eUpBT88hS9Jg/LpfPX
3L3tYqtJTEet6PcSHjyqizLNTHP1V9t5CYWt5CpvNCvl61lEr7H7eCOur4mlTldB
dpiSolYr9cyoqq4Sh1mghvI1ydr40hc1dSacJQt+F7y/FEyV3n2RrLwxpavJVYmx
JiJC47VI6UFl/KRREZ6ZYSsm+mqiPihWdikcgpnIRQ+dqXj9jUy1UrnLkJfgsQw4
0qkwD7/ZHLt88TwRd8GzrMnyvcsf9Z8afSkRO+w+XZ4EsmkNqKA=
=7OxO
-----END PGP SIGNATURE-----

--LpmOi13J4jDkafH5JJ8vghqK2Uv3NKp8v--

