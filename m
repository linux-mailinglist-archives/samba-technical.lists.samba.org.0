Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E0B2EB419
	for <lists+samba-technical@lfdr.de>; Tue,  5 Jan 2021 21:21:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=JC8Ap+VqBNlO5ksRJpVnStBxhtz1Ez2GqJqGM77ag3U=; b=sRmqoIdKsONntoUPzLpljusddo
	t6wBT10Wxhaf+r14bgI9aWRcl7/d/t5udcTnwbx26yuMec7vpva/l1/znfpSsOuZUvgYUyF9mwh0i
	pUoHzYWB0UWl/L+NxKtXcz1Uoi4RVsfhGXOJnXMMs9B9BJ8V1QqPMKzFq5JGf0S8/RN4L11ZN4/Xk
	5HhFJFg4hL7NGqO0DAW0ROzzrX91zURR/V1QYciF88HBybcjZT6ke/OBKyozX9dY4LpJqkcxy8R78
	YBrQzajnkyCAdbjJ7qUfA/0AeGK3diqunP9pJKXvty8jKY80lcvf+TdjOd/crNt9ufiOA1YN2eBav
	7P8NtQlg==;
Received: from ip6-localhost ([::1]:62168 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kwsph-004uU1-V4; Tue, 05 Jan 2021 20:21:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:65404) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kwspX-004uTb-0o; Tue, 05 Jan 2021 20:21:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=JC8Ap+VqBNlO5ksRJpVnStBxhtz1Ez2GqJqGM77ag3U=; b=rCjPOFhVKVJKQx7ze7aUrUJR8C
 enxf2OF/LTmaaU/UdFAEZLgLOGIVlofNqUcfFtS6xTxSF2JrCR45rKqrSRqcvy0cwRVu1GT9rk/5X
 txU3a3kMFWHEaJEDBRvF8/R0bstNXaV4yR0vQrHpWqdHDDSsGc+QH68xW0WlUs/sdgnufOBK7rsTO
 0p7pxDtdJHY/ZqvTYZLaE5Hm2Gt2+Z8mYtul+IFHvhQZGnjh4fBHM/i+x7t4mYtJ7u1iTXYZcfPl+
 +CE2rtvfOyd55mqkGVoJY+W876FH46yM7qUMO0+dt5lbOZMqllcNuzmslNx+AZGPX+0ZFBIak+R5F
 y8nJkVdG8y9SH29M24K2ckm3FMr3Zpbn8LEIuqGPiJS6zvYErPWzZu1pcM13E64UdVfDr2y8ZjRix
 BE9Y6+2PdumQv+96TdIVcdJZYFNUEmoLWyiwVjdEKxjFkb1bhcTVPyMDtA10tTVJPUXUr/aBGWYF1
 ESV/bM8QZyd6+/4uj+ttB0GU;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kwspH-0007hu-Dv; Tue, 05 Jan 2021 20:21:07 +0000
Subject: Re: Samba and Adobe Illustrator locking issues.
To: Yogesh Kulkarni <yoknfs@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 Samba Listing <samba@lists.samba.org>
References: <CAOGdD2oUwmRRCC5JQ7d+0=187ruhoL0N15suf67GtWrav2qhrA@mail.gmail.com>
Message-ID: <290db29a-425f-720b-f8f5-d0e487dbcc43@samba.org>
Date: Tue, 5 Jan 2021 21:21:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAOGdD2oUwmRRCC5JQ7d+0=187ruhoL0N15suf67GtWrav2qhrA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="3u6WM9D7PTho0OZ9LZRcaX5OwelBu9fYY"
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3u6WM9D7PTho0OZ9LZRcaX5OwelBu9fYY
Content-Type: multipart/mixed; boundary="zhmcydoVASKO42CMohkJljdASOoLUGEGx";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Yogesh Kulkarni <yoknfs@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 Samba Listing <samba@lists.samba.org>
Message-ID: <290db29a-425f-720b-f8f5-d0e487dbcc43@samba.org>
Subject: Re: Samba and Adobe Illustrator locking issues.
References: <CAOGdD2oUwmRRCC5JQ7d+0=187ruhoL0N15suf67GtWrav2qhrA@mail.gmail.com>
In-Reply-To: <CAOGdD2oUwmRRCC5JQ7d+0=187ruhoL0N15suf67GtWrav2qhrA@mail.gmail.com>

--zhmcydoVASKO42CMohkJljdASOoLUGEGx
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 1/5/21 um 8:44 AM schrieb Yogesh Kulkarni via samba-technical:
>   I have a strange case of lost updates with the Adobe Illustrator .ai =
files
> and
>   samba server. I am writing this to validate my findings and ask if th=
ere
> is a
>   known workaround to this issue.
>   The samba version is 4.9.5 running on debian 10.x and clients are mul=
tiple
> MacOS
>   versions.

there were *subtle* bugs related to such scenarious that I've fixed in=20
the last one or two years. I recommend testing with latest Samba,=20
eventually the problem is fixed there.

Otherwise you or someone else has to get down and dirty and spent a few=20
days in the strange macOS client bugs debugging hell. :)

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--zhmcydoVASKO42CMohkJljdASOoLUGEGx--

--3u6WM9D7PTho0OZ9LZRcaX5OwelBu9fYY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAl/0yjEFAwAAAAAACgkQqh6bcSY5nkaQ
/g//bY9BnxuWttwqYmv0jF684yDJ9MwtdavBJNmIEgNgTy/7CFfbN9l2wEP+70ntDQrHO0yuuv6D
4dxZmj2iR5ygFH/jYMY8X/nZgEqHinbBXhfOMJTlNEGpuUAfAuL0xeUhd0OJmU58gqVnRbR7BJnW
W/rQxys5lHrSAqCW8MFlK+bqIntIEks/TuXTVY653ilCXVtW4vqjN1nWQPgD07mPYqYjQK3Z/gmC
68E63aHBCZ5os047kQnEqUZejDRKI7bi6k6u7s3lYv6SzNklgw6Jz8prhUuJuR6xVppLY1RlBXe6
x/9oJjFmARVDPLeTMz4bBmxTz+hhbFxsO1tGHNKpzljnSxSuAtdAsOEuFjLkEF0+fbuFBiF8iFOZ
lUbOz1DxOWTTLx/+1EBObvKIojyjofMIGlru5yh0PbBM5p/SPe5PaeSO4KYo9hWyEf8aPbxygMBY
wWxpoP/scu3OTmBfSbxUj0p5qxMU0C3JW/5wFJdLM7TgT/+xCXX4iMdp9YyfqmdgR/W+uvRPu44/
Y3hFmQinJWrwjxjmwfYTlmuyebI/QpthPIheDA98XBP0A9wTuyZFeBIOAChX+5XnhixwPXt6CoR+
EhPIORr4fGLg2keW+vS23lQUK/5Dzos21Wy6ziXA7WJ1Jsa2Z5uVC+tgNneKgI39DZXTEKx3Gs/E
vAU=
=mV+y
-----END PGP SIGNATURE-----

--3u6WM9D7PTho0OZ9LZRcaX5OwelBu9fYY--

