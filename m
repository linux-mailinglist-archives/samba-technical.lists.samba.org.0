Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DA21E40F9EC
	for <lists+samba-technical@lfdr.de>; Fri, 17 Sep 2021 16:05:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=ukhihKCxa5cNWRVo1NM9wHFn3rw3mn8UBWNlj+wYfY0=; b=BOd/UwGzYfHakikX6J9qYd5A1C
	7jxWMSA1g/Ok5xCIWj0GUWIHjzN3q/NFbbfedmkdlTqh2zNZQFQOf9OzDZ5iHAaxUNVuY5FFXGuTG
	16t9WGonBurX2h+lMqW4hqp4QHNC7CwNSmWf+B86X2yQJSED4y++fT9xl42YALijR3551t4zbhh8C
	7NdnwJjoj9zS3AI98vOHWnA8uZkEIFFuctpHhiJOqsS39DRmZkIqWIj5VeQqPgJUkCsQUQmGxZNRl
	uYaAbYjttt8BnA2o5PkatJDd5e7UrjUV91WNUQqRZqEly362LkuYobdmahnANS+z/1NTpoS8x6opp
	I02e2coQ==;
Received: from ip6-localhost ([::1]:33854 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mREUE-00FZKU-Cr; Fri, 17 Sep 2021 14:05:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47146) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mREU8-00FZK8-1Y
 for samba-technical@lists.samba.org; Fri, 17 Sep 2021 14:05:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=ukhihKCxa5cNWRVo1NM9wHFn3rw3mn8UBWNlj+wYfY0=; b=TwGDLHgz7MSKQeRPJhcEsa3ATQ
 uTAprdC+qxJH2zcLZ84ezbny87D27hS35eBPwWqMBDSl0khmlNUi4eVqg0/F1WSw05f8wVUjFAVRg
 O2poy9CaDrgr7VXX20iaa9eijbKVMOwwMHZ1MRwUHXfqOnClYUQ+pBH3+jCWDc5PrMJJLH0ojPFo0
 Cb4js+/rCuI81waarBnuDFS1bqgdxxIl/iZRdG3kfeialW5mjhc8t8D9I62y+JZOkAK3ZwsEOH+2K
 9un+vnXJvshD1ssQ9iaSkypKoVexudiGBhNXy7GGDskYHTjxAid/sBZhctbVvVsrhi65U5JAq3Cay
 JIUGbkWOF84061LTlYcf/MEeqezdYBo7IUW54/9enH6aYRjng/xeY8HXlN2tll0lfzVFLwdXJ1mPs
 yUSy4S5anEF86ol9wzDP0pf+oQLjbenC61QfOOjj/HmgDhLFDgEhh/Yu9nhotOpGrgBRR2G8miFIy
 4OhJu4bPX7uYsuhkr3ShWVxK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mREU7-006d9f-EA; Fri, 17 Sep 2021 14:04:59 +0000
Subject: Re: SMB QUIC
To: Hampus Karlsson <hampus.karlsson@newtechit.se>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
References: <AM6P193MB03607607E62A2C31262F99D090DD9@AM6P193MB0360.EURP193.PROD.OUTLOOK.COM>
Message-ID: <decfcc88-517d-d68e-4e99-66a540fa85d3@samba.org>
Date: Fri, 17 Sep 2021 16:04:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <AM6P193MB03607607E62A2C31262F99D090DD9@AM6P193MB0360.EURP193.PROD.OUTLOOK.COM>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="12AmvIFz28wRXrgs5NmPvBy073yZHCQfb"
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
--12AmvIFz28wRXrgs5NmPvBy073yZHCQfb
Content-Type: multipart/mixed; boundary="m6ubBi5ycc055czmykJLGp0yuIbfwjHNn";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Hampus Karlsson <hampus.karlsson@newtechit.se>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Message-ID: <decfcc88-517d-d68e-4e99-66a540fa85d3@samba.org>
Subject: Re: SMB QUIC
References: <AM6P193MB03607607E62A2C31262F99D090DD9@AM6P193MB0360.EURP193.PROD.OUTLOOK.COM>
In-Reply-To: <AM6P193MB03607607E62A2C31262F99D090DD9@AM6P193MB0360.EURP193.PROD.OUTLOOK.COM>

--m6ubBi5ycc055czmykJLGp0yuIbfwjHNn
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

Am 17.09.21 um 15:37 schrieb Hampus Karlsson via samba-technical:
> Hi, I have a couple of questions regarding  the work on implementing
> SMB QUIC at Samba.
>=20
> Do you have a set date of when SMB QUIC is available for Samba?

I'm not aware of anyone working on QUIC support in Samba. Afair we're=20
waiting for Linux kernel QUIC support to materialize, consumable via=20
standard socket API calls. This would make it MUCH MORE easily=20
consumable for ALL userspace programs including Samba, instead of using=20
a userspace QUIC library.

Cheers!
-slow

--=20
Ralph Boehme, Samba Team                 https://samba.org/
SerNet Samba Team Lead      https://sernet.de/en/team-samba


--m6ubBi5ycc055czmykJLGp0yuIbfwjHNn--

--12AmvIFz28wRXrgs5NmPvBy073yZHCQfb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmFEoIoFAwAAAAAACgkQqh6bcSY5nkYe
LRAAqGz+asrJR0OvguhSiJzbsSvZNJTvSb6xdsPaVGiVJC7/wme9XKDJLgjvx5TNxySSpP9jTDDZ
glIQ75D70fjrxWX3oYKwLBDKmzFsudFdQT1HFSbeqWsJLt52uMNJc9OaioVdUU3//cQ0QUuRonjy
+2CfzIbfV3HaAv1/UsVRsQuYswiQK5D+QbCfBdY+wVmjmwMtT4D0xcmif+5D0NV68s0TR+VcJd6w
PQwkLQCcFrnYsPUNfimNsOAKsascZFljqT5+tRe8nAJg1sQjo2V0JfhQ1uYi58WrVJmp578i1yFk
gARClBH+7ffN9ooJKziyinL2zZcrcC0k3HmxFlUA/O8V6c0Tv41n/nJoMcs9BnMOtjrBMxWNID/M
8KTNECj9twYKe33jR4W6Jx660KYaOuqIFOMPz2XohPd+owAm/7boRjdl/AtZTptylOVBV7eBQyfj
qX4ILQ3A31V3N9BQCOFVqUWDLoh68yfu/uM2ZV2Fp/OVcZKx5+c4oAIIsn5QwYOEpYdJl05f0I/F
PzIeamTq2AoZAunS6B/fQ8DUOfWgvNMnY8N6yNwKWWmQ3hmWKMFItJmm6UkBE1bBWrkWOXGhyRUe
PD7A1Fw2U3ypYAUgyBke5X0vzP9VItJCbhWBdHApXo+HU5UIybYpwnMEhvPuvhAdZwLREaP9PqTx
53Q=
=jKuc
-----END PGP SIGNATURE-----

--12AmvIFz28wRXrgs5NmPvBy073yZHCQfb--

