Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A4581400F32
	for <lists+samba-technical@lfdr.de>; Sun,  5 Sep 2021 12:57:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=AEQ3i3Rt4eTkBDslr18mbVp3bCey+qYU9d6kgSOc3PM=; b=1fQfuViQDVQbfH+O2wn9OMnoK2
	xLOS4MxbP9Us9QbwHlqvJro0OySm/UwZvYOC6f0PrVrjQURKZP5wG4lp6gOAZYVYOfVCOONum03uD
	N0ssphSUV00v21Rm+OILGUh6IJDQ0bJ1JrdhyI53nUzkzUSbMsLEdVCRhHhnlWY/A83xna9CB0g5G
	vHmeeD1r4nUUzRh3rKjmhQTXSLozeYaURJGh52E5BTub/DKTtHbVI6T7MkUYJZq8TRBtLWThni/sF
	8wNXDYXJFTsRLyiAnYnVTaSceiGPXd3H1j7qUl4vMHsPgFd7qIhh1ThUwksJmOflW+VUaLKln6tSg
	cTlVhMkA==;
Received: from ip6-localhost ([::1]:27978 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mMppI-00DOnp-Of; Sun, 05 Sep 2021 10:56:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48292) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mMppC-00DOng-44
 for samba-technical@lists.samba.org; Sun, 05 Sep 2021 10:56:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=AEQ3i3Rt4eTkBDslr18mbVp3bCey+qYU9d6kgSOc3PM=; b=XaZl6y7Qtwms7N1mJMkrH8y2xn
 cWQK3JPWeGoM4YLxIZ8J35Xkvu67RJ7M+sbWADftzE/zIgma8b3VzXqhQiyWUYm8FjLoa4TECqqfj
 sI2subbgPanNIhnBiXjLDeSdT5wdqZ00igPFfZlRUXz6BBFuKw4DbKK8lrPHri6amJ8NbKldFM+wF
 YFXRLn5YgY01mnDHDI33qUNu5C3gcRpce8hpnL9uuNilE5F1L0x5hHJfvNRjSDDtGbQ0goAxYUHdY
 lbnIZl0sGHi/6LUKyvJ8fBAM77WmG29ncYxiNeLMzuknAIICQouqZ7nVlm7bluNHPgSkIFkGkOUfc
 xuSQIqUT/GRBnjTWwyBYiTI0v/wcoIH4Hq/vLY9X28tZFvhFEsH6g9J7QF3TEmKc6HoYyKgPQFsYa
 tVQVv2uJ0G/x35rHS7uE6ARmxzWo/PN9DilGspe/NxVq5KdTiYkuCbGn57Ie5Bim6S9q3Yt4svL7M
 998VuYcv4oc3vfcqSKTq8e9c;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mMppB-004k7l-1g; Sun, 05 Sep 2021 10:56:33 +0000
Subject: Re: HEADS UP: The Joys of Logging, or subtle behaviour change of
 logging in the daemons in 4.15
To: Andrew Bartlett <abartlet@samba.org>
References: <f4ce9085-24be-55fe-e71c-ac7c67b845e4@samba.org>
 <007822c852b35cac5035eb2651380806b306d151.camel@samba.org>
Message-ID: <15d88920-f642-181e-e710-2e072564a54b@samba.org>
Date: Sun, 5 Sep 2021 12:56:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <007822c852b35cac5035eb2651380806b306d151.camel@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="I2NRcp7Dh9SoHKGStrnZLroKfmd9xe6Dj"
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--I2NRcp7Dh9SoHKGStrnZLroKfmd9xe6Dj
Content-Type: multipart/mixed; boundary="D36WaPjoBAxYNxPl9wXxuKh21NsTPjxw8";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Andrew Bartlett <abartlet@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Message-ID: <15d88920-f642-181e-e710-2e072564a54b@samba.org>
Subject: Re: HEADS UP: The Joys of Logging, or subtle behaviour change of
 logging in the daemons in 4.15
References: <f4ce9085-24be-55fe-e71c-ac7c67b845e4@samba.org>
 <007822c852b35cac5035eb2651380806b306d151.camel@samba.org>
In-Reply-To: <007822c852b35cac5035eb2651380806b306d151.camel@samba.org>

--D36WaPjoBAxYNxPl9wXxuKh21NsTPjxw8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 03.09.21 um 21:52 schrieb Andrew Bartlett:
> On Fri, 2021-09-03 at 18:22 +0200, Ralph Boehme wrote:
>> 1) isn't really problematic, but what shall we do with 2) ? Go for
>> stderr as implemented in the MR or rollback to logging to stdout as
>> we
>> did in 4.14?
>>
>> I'd vote for stderr, what do others think ?
>>
>> Please note that the 4.15 release is handing in limbo until this
>> issue
>> is resolved one way or another. :)
>=20
> A major release is the time to get some consistency, we should log to
> stderr, that's where errors should go (compared to stdout).

yep, that's my take as well.

So if I don't hear any objections til tomorrow, I'll push the patches on =

Monday.

Thanks!
-slow

--=20
Ralph Boehme, Samba Team                 https://samba.org/
SerNet Samba Team       https://www.sernet.de/en/team-samba
Samba Development and Support, SerNet Professional Services


--D36WaPjoBAxYNxPl9wXxuKh21NsTPjxw8--

--I2NRcp7Dh9SoHKGStrnZLroKfmd9xe6Dj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmE0omAFAwAAAAAACgkQqh6bcSY5nkb0
eA/8C4aDqx7IG/BTEWtfUjPzgOIJGZTidwGpgepaBUNRiDtfDobl5q9m1Wx5o/F/Cmg9XDmQDQSZ
J7Rvuke2TQxxZrkSPRDRCnXios6TU5Q10h2AiN+pIKI7ZgckFm3MVzki7yDR6ptzI6fona4jxaQY
rt7sQfXFaXwIXv+qaeX3NC3GziLTA5nRuI+orDaPV/XMXd6VpaGPiayEcpXjivxxrIX9NbCnMYIi
6ST5xwj2vV/HRmad9ni3hTlU8mM3V5EB7k7UDzAlMmqqf/VLlmNW3p6ryxdwpTgaMdbowZseyI6F
GJlBIt4mGeHqszdur97X1xAGzZ/2E2541vzOquU/i+PtU8lyc+Z3hhpDDmt2uaz/fAQ5XxB2uCGX
RY168jI11EGHTjvfQde9WPl4Q+3JTDhKHQYfMmdxtDjaW4GkxTFid4OvDollrqZ7ZIzt3/KWxN5l
iRuGx0Xkrj7EtbkxaoUFMZHCyw+XhRk41sjSEMLuMGsu0dEdFzBJZ4zWW5mffuaWzeb9pUyQnivh
33VJera7f/zi0/py4EIAPQjSot6R6txlvwXcmDWQsf+PLazR7zrXW76NAYiZ6IRSeSLX/yY6kXph
l2duQpSN++c4UhCIH2qPK4v+vzwEDBvXp4kmPqKvmDV39sS/HczPZcnOh4kfHi8RAZpiCgpJEiWM
0W0=
=yYVs
-----END PGP SIGNATURE-----

--I2NRcp7Dh9SoHKGStrnZLroKfmd9xe6Dj--

