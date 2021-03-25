Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E3B3497FD
	for <lists+samba-technical@lfdr.de>; Thu, 25 Mar 2021 18:28:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=bnvaQzVqIqdk5ol2FZoIM0ypBCMJEQ5y9JsHHZZl6/0=; b=QSwtsXcf8OBU5M3+n/rtu1iwpF
	nY7dKjkIULRhqtMTQP4M0o7UGZQTybDdwjFECtyUtC3cEWjP86Lw7oMDGkICbSYT7yLhyic+zMfbW
	sPV1QFESrrf11/6zQzh23h9BlSU2LgHeAeySQ1O/JXKnXMY+csubAgHG1zKsbNwJU2aDGxj4s/xCI
	xwbUzJilP/JvFcVSutWsA1+RAMzTEtg+5qH6LjMsQ/x1MfOXK5Atk9lyFXmfw5kjyiJPoch6/4FIk
	JA30VwIyHgUi0MAAUJw/EcmhSKYTq1LUFgCNPvmCj5Xtj2JsE7dAczI7eWF/LnSZu2B6TkDPVLmRd
	xVqUSiEw==;
Received: from ip6-localhost ([::1]:40366 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lPTl2-006l2k-4z; Thu, 25 Mar 2021 17:26:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44058) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lPTkr-006l2b-U8
 for samba-technical@lists.samba.org; Thu, 25 Mar 2021 17:26:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=bnvaQzVqIqdk5ol2FZoIM0ypBCMJEQ5y9JsHHZZl6/0=; b=TbBFh4LmDmKI2QX0l49qH+Zb9s
 W/58XEhfuvBxiNhegmPQ6K1oandPlD+oZjoT+VR00ZVXVImNsdfBmyRgt9OqwcOi4O9SZ5BJV0p9q
 lJSXoZBvsaE3tzkXQFNTbBDRxOSJltgVYRcS1i0p1yl2caB68qXDN+qBOzZrKX10BT6XrAJU+Ipdz
 G8waWCPpC43SiXFy+UH62V7VD8r+9vDGa4jSXn7US7WcJVsC4fPpnTJB9ehqpWqHXpHaxf2FTvqoL
 b/7W5uHWfAe/zCh6jiubGVUK/ZvINO9worBJB2iCq0EwTNzv4g1a/v+qr9Uq1C/rN5lK+7OCas2Qf
 wYlYakYSKJdINORz084zcrFRkOBkvnIKdTBe5eHRzGcHgcQUkf4ws384uQP5GwLmItfTmi/ks7SaR
 lzSn1V6KRuY00OQI/spdwKT7CSzNmiWQn3YPqd+yIpSYzXiRaKBDOK0VPzzCwptIHY5bqebNMZcA/
 asBxSiMt3XxbPZbeb3hOqNNU;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lPTko-00020s-2V; Thu, 25 Mar 2021 17:26:42 +0000
Subject: Re: Drop NIS support
To: Rowland penny <rpenny@samba.org>, Andrew Bartlett <abartlet@samba.org>,
 samba-technical@lists.samba.org
References: <4045140.l1vqqZ3lm0@magrathea>
 <20210324161244.GB818616@jeremy-acer>
 <3742e07eba544478383ae1a7e9e56197beb12616.camel@samba.org>
 <359f492d-7dbd-2e95-1c8c-3178d9e51344@samba.org>
 <5f50518b-d317-f5ff-d9dd-a34497c21873@samba.org>
 <4e8cd599-96e5-361d-28c7-ff26082a7644@samba.org>
 <190c273a00fe5b37f6dd494d4296acfcceb2ca2b.camel@samba.org>
 <eae366ce-7751-27bd-bb7b-fe4b7c5bc286@samba.org>
 <a76c4d92-4b3a-0d42-15eb-aea8951781da@samba.org>
 <d38770d4-0665-efc1-1ab4-6d41f3868497@samba.org>
Message-ID: <7ca521b0-b710-0069-0360-1aceb6694346@samba.org>
Date: Thu, 25 Mar 2021 18:26:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <d38770d4-0665-efc1-1ab4-6d41f3868497@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="f7UhxWrkOMzUQylRQHGElkHq8aXAREgm5"
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
--f7UhxWrkOMzUQylRQHGElkHq8aXAREgm5
Content-Type: multipart/mixed; boundary="jJ41aVtGThZ6uvCHfRHRw6KbpfCDhUdq0";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Rowland penny <rpenny@samba.org>, Andrew Bartlett <abartlet@samba.org>,
 samba-technical@lists.samba.org
Message-ID: <7ca521b0-b710-0069-0360-1aceb6694346@samba.org>
Subject: Re: Drop NIS support
References: <4045140.l1vqqZ3lm0@magrathea>
 <20210324161244.GB818616@jeremy-acer>
 <3742e07eba544478383ae1a7e9e56197beb12616.camel@samba.org>
 <359f492d-7dbd-2e95-1c8c-3178d9e51344@samba.org>
 <5f50518b-d317-f5ff-d9dd-a34497c21873@samba.org>
 <4e8cd599-96e5-361d-28c7-ff26082a7644@samba.org>
 <190c273a00fe5b37f6dd494d4296acfcceb2ca2b.camel@samba.org>
 <eae366ce-7751-27bd-bb7b-fe4b7c5bc286@samba.org>
 <a76c4d92-4b3a-0d42-15eb-aea8951781da@samba.org>
 <d38770d4-0665-efc1-1ab4-6d41f3868497@samba.org>
In-Reply-To: <d38770d4-0665-efc1-1ab4-6d41f3868497@samba.org>

--jJ41aVtGThZ6uvCHfRHRw6KbpfCDhUdq0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 3/24/21 um 11:19 PM schrieb Rowland penny:
> You might want to read this thread from 2017:
>=20
> https://lists.samba.org/archive/samba-technical/2017-February/118705.ht=
ml

the stuff Michael said in

<https://lists.samba.org/archive/samba-technical/2017-February/118808.htm=
l>

would be a great enhancement for the manpage.

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--jJ41aVtGThZ6uvCHfRHRw6KbpfCDhUdq0--

--f7UhxWrkOMzUQylRQHGElkHq8aXAREgm5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmBcx9AFAwAAAAAACgkQqh6bcSY5nkYS
ww/+KaITJha5xYPEiqCpexClUkDIoH5W3zMGx9qUl39V2khUkkuQlA3cplu8mGRVI2MfgDrsPQh/
olQrL11VREpSDyiCgUf2W1/Zd3gL1g6Z2cooh45Hfng1nwQV5brz1GQigUBcXpGETCDgLFkjV9nM
cF+h8euCjR5mCqFc0jfbtOrm7w+1H7RPei4/yDdpzY7Kjyn9U7UK6hklX0uhEV5bm5jvLt3K8ov3
5+C7eq5jrMkE8E73/4vtBii9Il/XjBNfR3mItrOa0VEP91fgn6DFKxwicWBVkIb2nJEAIvqoug9F
G3IpsknGeoywu/YlI4st0+94H4HmWTRnBZOC24UtCvoMyl6ycDd7tyX6jaojCJsaKnOj8z0m0N1x
6kKUIeKwWFt8wGKDN9WYQifeR65af/c5z4dAfstJFM2YN7IkFNP3n3BYKdtI8y4cpL2WjsMhfsIc
uNvADpLHN2VExkUQn3ZitPybPTMUlQ9JEn5sCuQ7nIwXbY/g8F20dW7x6tyPJUGbE9nilHEzd4UD
L9O59UKP9uzuBMN3S7aFxd12Fe3eEj5L3MeTHYHA6rZc00yT3b3OJHgABjSCVDSvrP9wClv+NwgK
OefO5vj0rG6ip8E8sv0vQGg4x3Agm2WgAiraf8vBDVJ1UaoC0pKxZliAdjyurWvn+gYKYPbF7l/0
hjQ=
=fQfo
-----END PGP SIGNATURE-----

--f7UhxWrkOMzUQylRQHGElkHq8aXAREgm5--

