Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9E432968E
	for <lists+samba-technical@lfdr.de>; Tue,  2 Mar 2021 07:57:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=1T6NuhTShTMAP1CH1KsCIDo2Yp+M3qUYYsv3bupa0VI=; b=voRdx7UofR1f+rVKcFCP6tiZQA
	JPdFoJ/wkTwjNEtpaTN+NcxE66RH8C27iZzlvpO0u3FCXtTv+b54tnNyXoO6ougCYk66/rw/UninE
	dWvCQTKy/+Wo9GEsfA6P3eQJGA7VPKL1WgufTeuCVCkngXHgrS/3TiTrTpihxbQJE0/uzgSVOe27S
	W+L62etk0K71pitLqY3lOMigAfrTMdPc44WfwDzVjdYgKPpTN7i5tHv/a6IyEgLdejfsaeQSHHyyz
	BVpUyJgoz1n/YGfQ/nJCXmqo4KY6z9/79jtZ19dqQMS6yCAUJ44jaxtQ13zD+sxObvbhZhoRw85dm
	qzTwoO2w==;
Received: from ip6-localhost ([::1]:19912 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lGyxg-003pGc-Qi; Tue, 02 Mar 2021 06:56:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34542) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lGyxU-003pGU-91
 for samba-technical@lists.samba.org; Tue, 02 Mar 2021 06:56:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=1T6NuhTShTMAP1CH1KsCIDo2Yp+M3qUYYsv3bupa0VI=; b=Fz/YvNwAlETFJnOqROpYI1pKN/
 EOqqB3aNPHuAcEJI2T9d5q8wtiWaqPig0kiVfqMpfCQVgQK/82GQ5m6efy+LrvKxgIWPWp6+SBlkx
 akwHOM5NK+UWQmW3vKwa3ldX9AxiGzmDnsfZ7ISb8q/KJK0A478AAqgMucl7fuBF2uxorOagnnPJo
 ZwGT/kpOVL/AEGegU3HZ4dVjxDO6W1Ii0xN0nN8Y4sAbgxqK5w5bZE+n+OARsGF/YQbLQSfsUMuYx
 vwYmXzwysjwL9yGjy9Gx+gmufFYGsVSRfl9u8RdWnRF5hSF6+7D/NfaprrEC05DyJwpIMeLAF7/1B
 /Bp3Q/YCvRrM1ZgR8lCFA2M+i+rGEIEqnTGb88RLoaXqUZi0fRcf566mjlPFeTOYONGs3qMg0/bH9
 gaVnRCvdsQhjgiiUZzDDoY7rPFKQQ+0LlyuHhDOqljGWh8Hwu8tr2pYqUPFjH02BLScX0gphZhi4c
 jGSjhwZocAPqTnxPPbZLeaBr;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lGyxQ-0003Wc-9I; Tue, 02 Mar 2021 06:56:36 +0000
Subject: Re: TimeMachine support for Big Sur - missing F_FULLFSYNC?
To: Tom Talpey <tom@talpey.com>, samba-technical@lists.samba.org
References: <65d1ab99-7c0b-1fa0-b42e-bce947d9295a@talpey.com>
Message-ID: <3868fb70-aba6-bb75-f831-7bff958d0ebc@samba.org>
Date: Tue, 2 Mar 2021 07:56:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <65d1ab99-7c0b-1fa0-b42e-bce947d9295a@talpey.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="w6WptpZCTZzwymOtAiA15mE5CXi47FngK"
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
--w6WptpZCTZzwymOtAiA15mE5CXi47FngK
Content-Type: multipart/mixed; boundary="CEKmjugqf2rcD7sF3sT3HXbWmMa5n3ASu";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Tom Talpey <tom@talpey.com>, samba-technical@lists.samba.org
Message-ID: <3868fb70-aba6-bb75-f831-7bff958d0ebc@samba.org>
Subject: Re: TimeMachine support for Big Sur - missing F_FULLFSYNC?
References: <65d1ab99-7c0b-1fa0-b42e-bce947d9295a@talpey.com>
In-Reply-To: <65d1ab99-7c0b-1fa0-b42e-bce947d9295a@talpey.com>

--CEKmjugqf2rcD7sF3sT3HXbWmMa5n3ASu
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Tom!

Am 3/2/21 um 4:51 AM schrieb Tom Talpey via samba-technical:
> Does the 4.7.6 version of vfs_fruit support F_FULLFSYNC advertisement?
> I find some mentions of earlier versions supporting F_FULLSYNC (no extr=
a
> "F"!), but zero mention of either fullsync or fullfsync in release note=
s
> for any Samba/vfs_fruit version. Is that just a typo, in which case, wh=
y
> is Big Sur complaining?

You need at least 4.8 for this.

Cheers!
-Ralph

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--CEKmjugqf2rcD7sF3sT3HXbWmMa5n3ASu--

--w6WptpZCTZzwymOtAiA15mE5CXi47FngK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmA94aMFAwAAAAAACgkQqh6bcSY5nkb/
DBAApoSBHJt25I4w6I4jERfnHBvYDnQvQvIcvjqX4QQVrBpGBwwEj0FIrr+VdUw6F3tOcZCOmQ2+
m8D8BuJwWKguTcsyUnKg1I/fUXX0iKtLtAZKRxuV4WJVGK4ONtpV2hjddFNrMk527UiS2R98xTVh
QsTkwJQglhRQDtuhljLWYTuivxXszvtoj0T2AUKCZAZxH1hWt5+i9aaF1JnFhT7Y3fUAejV/9Yj9
rTuZpZEtQUNtVKdIL1uQEehfh1bdLlsjDNx4BkwvxSS/QwmJUdV4OJf3LppDv71IQwxuGL0/2bII
HQfupYA39fBRDevzJpvyEatVskHEDChkZVfjTNFx+kk5dXn1Icw2vW2LN6YmY/NveutKG+nu7YuU
EeTZjh/wBRkBelXRB718XTfmr984Ikk7QY3mmUDkOTG8Mt9tPvjfxMPzylIyvcHq1rmqayl484+O
E6OmXm7FvUAo6Tva+3Xpkq6JYfZpqPk/O3UxNc3qeCb7+p8V2WhxmBcj6xvXa4NZyLZ1LH0bC+kp
2sh0OC1ZyEN3IBGjCcH46OJ0ob9CBBhHmCLAM+DJj9Dt1oEuOr3lNTRM2vhCqCzlwcPJYX1Eaxuz
oXYW47eIqaZuO4+lX6+S/ygLftTBr/jksIGwn+D1yfJAcrP8BwH2UvhueYxYtw1DXwyMRbAOa6wF
Vn0=
=Wt7l
-----END PGP SIGNATURE-----

--w6WptpZCTZzwymOtAiA15mE5CXi47FngK--

