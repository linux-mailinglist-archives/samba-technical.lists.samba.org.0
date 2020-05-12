Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E38D71CF213
	for <lists+samba-technical@lfdr.de>; Tue, 12 May 2020 12:02:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=gHJaKfDtQgAd5xQaBuVFyNULq4IDiMOaUbGFxxDyL6g=; b=M9x4w+j4EhokkHFWwS1YD5HJuT
	HHfxkh15O8R7/y9s1ME9RYCQd6MlnJaUiXN+POjBMkiN9eixyK4TwR6guOXLvgg95Ne4UP/QBxqS7
	MgQfJ+MnH1IL1AiQVh1CVYYiMpHAIp32WFuo/TKv7nM4qvT17uL7Yrfr/aBLpUZnCmwaJfYR7xZaF
	CbdTCt/8SFM1JuWEPEP4Cjd7ERi7gtXNgHgMFJrEc3tOFOZR4gghxT+Yq+Wh7aFiC8G8jdWO44/Ub
	/j9J5X3IAsPGyUQAQ6CnpJq8zzjd/W13uHnQGyS+J/yyUF8+4PTiIT/KF+INb2lJBYS16fkVvgWVl
	F3Rbo53w==;
Received: from localhost ([::1]:64618 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jYRk6-0040BH-Ro; Tue, 12 May 2020 10:02:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55094) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jYRk1-0040BA-Gn
 for samba-technical@lists.samba.org; Tue, 12 May 2020 10:02:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=gHJaKfDtQgAd5xQaBuVFyNULq4IDiMOaUbGFxxDyL6g=; b=v7z2Hicm5Jn3eHdHQT1sEGmyea
 4pW0bX+jjGaY/zkmS2mnwLCK3O/ysDV5CUU5LXb4WkCgTbpXjcIbjTmMgMtFXlnTL9DUC7n8VO6On
 j344LIaJByED7kRoo9eI8Eh8AYLk72dQ7RppB4zVDGCmckIP2xyI87NQ698TEDg7gU0ipITWOoFF1
 /IdmtYOneURhn4FjP85zOXucbNQy36fa/bAYAZEqgfjHnUqwFmc3rzn2VulA4H3PEBTbSoqIrrt4q
 dAfvwIJBQaLADbWwgXqJUZ2vt0q3ZHmIjbdpUGZRKdZOsJK1X5/oS52NNoUfXASwMWR3/AN67JdqH
 to3/gBUl/DcAaiByQWNfUWTeEpotik2C+ukydn9t7uwbeoJeCtbVq3i0NNot4kZDKfPa5PZXnXtrJ
 Ws1G59eSoQPyUEEwmjDYjwZfEQQXrZDk21Vf4bQXYN038KiW6zd/QPGGcUlab/hcwbTUvXw/hZDbT
 wIjN/uEE2MZ7DpkKBxdYgfqz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jYRk0-0003jW-8g; Tue, 12 May 2020 10:02:24 +0000
Subject: Re: Problems after upgrading file server to 4.12.1
To: daniele.dario@saitelitalia.com,
 samba-technical <samba-technical@lists.samba.org>
References: <c6c8418330b35b7397a4b55927e98ac66bd2d19b.camel@saitelitalia.com>
Message-ID: <c5a60f12-349f-e6c9-d7e3-62d07a608d23@samba.org>
Date: Tue, 12 May 2020 12:02:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <c6c8418330b35b7397a4b55927e98ac66bd2d19b.camel@saitelitalia.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="GzFbqYz2XramSy1YFTokcdegBHgZ4iG33"
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
--GzFbqYz2XramSy1YFTokcdegBHgZ4iG33
Content-Type: multipart/mixed; boundary="2ZAS3sx38km1GDb8RB163Cn1PyNix0Xkj"

--2ZAS3sx38km1GDb8RB163Cn1PyNix0Xkj
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 5/12/20 um 11:42 AM schrieb Daniele Dario via samba-technical:
> Hi Samba team,
> some days before release of 4.12.2 I upgraded our file server and our D=
Cs to
> 4.12.1 from 4.11.6 and everything went fine. These days of lockdown not=
 many of
> us are in the company and as far as I could test from my linux box, aut=
h and
> network shares were working.

this is probably

https://bugzilla.samba.org/show_bug.cgi?id=3D14375

A fix is underway.

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--2ZAS3sx38km1GDb8RB163Cn1PyNix0Xkj--

--GzFbqYz2XramSy1YFTokcdegBHgZ4iG33
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAl66dC8ACgkQqh6bcSY5
nkY0ZA/8DNrXii9MCNQn5qW/mNAoRnCulT5h2AXceJZiNpeF9twwMzm8mvHvD8qd
ElOngz47foGhAJ1GML1cLqtMHHU40xSDG+6yy6ijr8raRAEp6aNVYnwdrIl2UlUE
OvRCzCC6tFPndTW5zyixad7OYWXlHMnaHAkC1du56FaoqOi1SfI2OIJXd0WC9C4g
oYfj/fbpLmTfO2/dThFZ+DILtHOuDna5s1DbkW7LTGqEKC84It2dxWmtJ6degShS
BHFeRjzAbZRMyvghZC89hUMBP8vQiULjTtWv2fUI2CKLr/QDQ4b2bmhUKpToUW+d
W11Rx5X0mV4BbVQDU7bMB0BSXu1qdC0V1ySTU19fr4zC5XfVlSmqL0hzLGQe7tSV
LnAdno0p7sheaf0vrLxXycEhfQf5k0nfoc1d+NJD+A2S/YmYmvHgg8nPGZxiLMHB
cBXNuQFmLsLB/0lHuWHhqWJrkZj/MYH9KZ5H5Rqc7C2FhxD1uwCPiq2otQ/pUxop
tv2FypvnIUOJs4yHWbhx+3VfGaDLyeSR8eQ1sljOagHfOdUUBtblvxWxnj3MS93I
ZV0faYUJr7hyKz6r0HZhw1heJFbfBWL0c1haze2TYERjdDt1fIka6JvgYXnJ5I9g
lBW85MYYaKURx9xGn7Q3b3qwoQtPLPt+cyM5U4UiHbFYdrosIEc=
=8iv0
-----END PGP SIGNATURE-----

--GzFbqYz2XramSy1YFTokcdegBHgZ4iG33--

