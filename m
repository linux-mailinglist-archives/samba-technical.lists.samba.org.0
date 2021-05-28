Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BF43944E3
	for <lists+samba-technical@lfdr.de>; Fri, 28 May 2021 17:15:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=oHRJ9db7NJBsvmKi3fLturb+lcyXWosjHkcaEDm5kpU=; b=uYPTfXWcd2o9a/05/kzvKwt1TH
	7zjHQcm0Ld+i17luvhPAZg/QfTCBYnhOB+bRv5uO5zReV158pfJOXsg7ZC2VI9I6v3j2a1CZapzBq
	lSusP1d4PIgRWsjSbsMSoRfNJqIsWWbLBQoebZJ4eyu9JkEr7hqyyB3XG5zFUsLxVb+k9HU3/wMzA
	XXuTrLrZotCxnPqkvLIUl/QLZVmta5b88xTto6fjj+1WgNOzM7vI97uDvteY+zvNfJ62ZNBpIQYJ4
	sINUB31DOWUrzLDXlrZOquw93gh8QuNmMNDi/ek339U+FMnIOso4rHwealnKvnDdZMo0sQQahCKAB
	lLqahbBw==;
Received: from ip6-localhost ([::1]:61784 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lmeCw-0056jE-4V; Fri, 28 May 2021 15:15:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58358) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lmeCq-0056j5-Cj
 for samba-technical@lists.samba.org; Fri, 28 May 2021 15:15:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=oHRJ9db7NJBsvmKi3fLturb+lcyXWosjHkcaEDm5kpU=; b=o2hTaDR3LLMJB8wuBKAv+/LONd
 FCUqX4mtrwpioBf19zjoP6i+Ni3sUvU2ivfP7dejbpSX6Y7KMO+BvwGRYMbmMGzd3Z08fgkxEIyIN
 adtSS5qNDztRRLF/4n3RLI9c5nbsoZOTbhhUYd+0XeV2jhYyFrYRW3acGbHlIKDAGoAwokvWo/lAQ
 OGTDKWt41PGxOVXIDrU5FxyM7oigBCYSe9Efqom8S3k467g3YY2NA2bj1HYXFWKyR859H1cvWMgca
 Yu/68j/Ot7TaSXISb+HaJ+q/ctcw0+QC7fvOl+UHzdqv2BbyS4furdM+nesWvwL5Ao/PrWIS5hYdW
 4x8NwVYZljDPauowtD0DX2BBMGClg/IVgAplCyHMlzP5aE7+URWQ6ZSsiQ1yT22oHhlaZ9C8avwCm
 QhkEiLE4jqCra9ybEZaLSInThEvSmvL1k2T0nqcyUy/ErQ8PUrKKAHrxvEBtst8TORJDD/fRVevCw
 SrXXTIafFAGHxlCBbWkzBfwR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lmeCl-0000ty-BF; Fri, 28 May 2021 15:15:20 +0000
Subject: Re: JSON input / output for CLI utilities
To: Andrew Walker <awalker@ixsystems.com>,
 samba-technical <samba-technical@lists.samba.org>
References: <CAB5c7xqUC9mZ8-VFDmM44b=EL49yBiWkMikf8BWgU0FjC+25MA@mail.gmail.com>
Message-ID: <562c85d7-c1d8-c978-6136-3ca538d12857@samba.org>
Date: Fri, 28 May 2021 17:15:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAB5c7xqUC9mZ8-VFDmM44b=EL49yBiWkMikf8BWgU0FjC+25MA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Q1XnSrlcoWSwfF8StOmDoQGdy6U2qF0Yk"
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
--Q1XnSrlcoWSwfF8StOmDoQGdy6U2qF0Yk
Content-Type: multipart/mixed; boundary="JAYlT8PMNn5wE2OXhYaxU2ukRdjV52Nw4";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Andrew Walker <awalker@ixsystems.com>,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <562c85d7-c1d8-c978-6136-3ca538d12857@samba.org>
Subject: Re: JSON input / output for CLI utilities
References: <CAB5c7xqUC9mZ8-VFDmM44b=EL49yBiWkMikf8BWgU0FjC+25MA@mail.gmail.com>
In-Reply-To: <CAB5c7xqUC9mZ8-VFDmM44b=EL49yBiWkMikf8BWgU0FjC+25MA@mail.gmail.com>

--JAYlT8PMNn5wE2OXhYaxU2ukRdjV52Nw4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 27.05.21 um 23:42 schrieb Andrew Walker via samba-technical:
> I know we've added JSON output to a few of the CLI utils. Over the past=

> year or so I've added this to various utils in FreeNAS (using libjansso=
n).
> Is there an overall strategy for this? I'd be happy to upstream what I =
have.

I guess as what you have worked for FreeNAS/TrueNAS and unless it's=20
somehow tailored to specific usecases, it should be good as is. :)

> Also is there an effort to add support for JSON input to them?

Not that I know of, but that sounds like a nice addition for some tools. =

For which tools do you have JSON input support?

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--JAYlT8PMNn5wE2OXhYaxU2ukRdjV52Nw4--

--Q1XnSrlcoWSwfF8StOmDoQGdy6U2qF0Yk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmCxCQYFAwAAAAAACgkQqh6bcSY5nkZX
HA//avCd7ZMA3ECT5MGluFiBc43bLxCXRYOcUzB7iu66+hjcTsQgk+imSjq5pewxE9XdnrOvlprG
wgGekmAWjEgd8Y4NTWsXFR/4Ke4+HZKRtnjdIfcZ55jXNGzNUhYZ+zbNFrV+qN8DDRr9MDcEk1Bq
oO3oL+24JWDEzSv8++CV9RigPpI7lYGvcr9S49xPHaUjQZc5q7gHtRLcPK35Bocee+AaPb37j6Zv
6kZ8nAVRUjow3h/mYbJn+Ze1aYoiZbma2VamTvxx5n7Ju3juubqnVCrvgacfW3sqgkUv4e8h/H3K
0m8OUgaIcSKpD8j8/i9rudWSX3IuvlqmGtX8Vl9/6MqwNMUIG0KsHH7gfXUEq1xKj2lzeymXGmLu
Pm1hjxjwCDHxV79xjFlKaDCumTEEBRjJ/i2vscL78RHWo3SwLA1DPVJTtwtX38y9TSP4/eGebVO7
MTzjupYQVIOLhpQBG5rW05MbTXl9MABMucVLa2X2T1ScHnE0enhUvx9Nf6buDUFvfuESe5J7VM5L
GofRkXHQSV5N9OYMIx9phU8ZsTqq9xZ3NfcSujY4r1gZQ1fPXs6cBsXyMMLlYyuvyOlFRyHcMku9
udniac3DC8ZhyJxK7K5Pno/sSrA0Zfzm7TehKPmIYxhcRHBrjOndhch7yxy/1qQFVEfGGpnaQMBl
2tI=
=ifNw
-----END PGP SIGNATURE-----

--Q1XnSrlcoWSwfF8StOmDoQGdy6U2qF0Yk--

