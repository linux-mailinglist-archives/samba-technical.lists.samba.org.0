Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A7234CBD0B
	for <lists+samba-technical@lfdr.de>; Fri,  4 Oct 2019 16:24:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=V+w5sotFC7UlY0pTWVwvyaScIJyk6rIpUbap9We0wSQ=; b=o9INisz2Oi7vCVwcJjkjmXKt4K
	QA/491ymhPbewvHNKPXLji5snh8sz5bvylsFzXAZcrojqA7zI49dDOwEEJywR0n9Jmtf+jI6WLfJb
	XBejAQrMgBTdcSRZDZ53FrBB9IruTGp940IplNlbCqnbT+7rHcN9UEldb/Z4+4aQsP+V9FnpnjKTZ
	edi191wUolzv1JMLghBuFD2qUQA8Md1tVI7VPe8Jvg45k5jbrS7u/7D3HlQWNrvl2F5tksQx+PgxH
	rp1vbAlIyR2UH0MkI2eRt7Q2yUS14jFLIimruJ5k5qgdcy7TzEkkMV2ikJSEh92MSl+TAJxZk/0ZS
	ypFPeBZA==;
Received: from localhost ([::1]:33562 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iGOVK-001AwH-J3; Fri, 04 Oct 2019 14:24:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16276) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iGOVG-001AwA-0h
 for samba-technical@lists.samba.org; Fri, 04 Oct 2019 14:24:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=V+w5sotFC7UlY0pTWVwvyaScIJyk6rIpUbap9We0wSQ=; b=AgxqHtiWYocG4XA4rAWWQfY128
 zZMikHThez76g/p2IlkR8+soLXduVQ6CqLZQQDw+t9Bq7nlFdA5uQ/8jYoyhjZKnRyplY3+W+F+yX
 Bhgf8lVExCYCcRhDQ3oER1ZgZTjMomuPfUnw+YYAbqRIY6UxqjwbSEQRAqnQXxGQmRMo=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iGOVD-00010j-Qv; Fri, 04 Oct 2019 14:24:15 +0000
To: Richard Sharpe <realrichardsharpe@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>
References: <CACyXjPy5LL=yj6i_T_W0J=DOXHxHB_D=0-ir60opyEV7ftaQ=g@mail.gmail.com>
 <CACyXjPzDX=F2BJX3N7PNMGpTmZCJZ2NU4O9B0uBvyLVKSaQi=Q@mail.gmail.com>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Subject: Re: Has anyone seen a Windows Server return zero results to a CLDAP
 query for NetLogon servers?
Message-ID: <2f5a26a9-bf75-5926-a2fc-fcedbebba400@samba.org>
Date: Fri, 4 Oct 2019 16:24:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACyXjPzDX=F2BJX3N7PNMGpTmZCJZ2NU4O9B0uBvyLVKSaQi=Q@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="Kz3lv9zInXVx2k6NobmgFSTj0WPcFQYyi"
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Kz3lv9zInXVx2k6NobmgFSTj0WPcFQYyi
Content-Type: multipart/mixed; boundary="I8JOn0PQfTV0WBHVwmyuHTNPaUlk8whoQ";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Richard Sharpe <realrichardsharpe@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <2f5a26a9-bf75-5926-a2fc-fcedbebba400@samba.org>
Subject: Re: Has anyone seen a Windows Server return zero results to a CLDAP
 query for NetLogon servers?
References: <CACyXjPy5LL=yj6i_T_W0J=DOXHxHB_D=0-ir60opyEV7ftaQ=g@mail.gmail.com>
 <CACyXjPzDX=F2BJX3N7PNMGpTmZCJZ2NU4O9B0uBvyLVKSaQi=Q@mail.gmail.com>
In-Reply-To: <CACyXjPzDX=F2BJX3N7PNMGpTmZCJZ2NU4O9B0uBvyLVKSaQi=Q@mail.gmail.com>

--I8JOn0PQfTV0WBHVwmyuHTNPaUlk8whoQ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 04.10.19 um 15:40 schrieb Richard Sharpe via samba-technical:
> On Thu, Oct 3, 2019 at 4:43 PM Richard Sharpe
> <realrichardsharpe@gmail.com> wrote:
>>
>> Hi folks,
>>
>> I have run into a situation where it seems the Windows DC is
>> responding to CLDAP request, but returning zero responses.
>>
>> Samba send:
>>
>> searchRequest
>>     baseObject:
>>     scope: baseObject (0)
>>     derefAliases: neverDerefAliases (0)
>>     sizeLimit: 0
>>     timeLimit: 0
>>     typesOnly: False
>>     Filter: (&(&(NtVer=3D0x00000006)(DnsDomain=3DSOME.DOM))(AAC=3D00:0=
0:00:00))
>>         filter: and (0)
>>             and: (&(&(NtVer=3D0x00000006)(DnsDomain=3DSOME.DOM))(AAC=3D=
00:00:00:00))
>>                 and: 3 items
>>                     Filter: (NtVer=3D0x00000006)
>>                         and item: equalityMatch (3)
>>                             equalityMatch
>>                     Filter: (DnsDomain=3DGPJ.LOC)
>>                         and item: equalityMatch (3)
>>                             equalityMatch
>>                     Filter: (AAC=3D00:00:00:00)
>>                         and item: equalityMatch (3)
>>                             equalityMatch
>>     attributes: 1 item
>>         AttributeDescription: NetLogon
>>
>> and the server responds:
>>
>> LDAPMessage searchResDone(3822) success [0 results]
>>     messageID: 3822
>>     protocolOp: searchResDone (5)
>>         searchResDone
>>             resultCode: success (0)
>>             matchedDN:
>>             errorMessage:
>>     [Response To: 5897]
>>     [Time: 0.001296000 seconds]
>>
>> After that Samba seems to declare that DC as a negative connection
>> entry and cannot find any DCs.
>>
>> Has anyone seen this? Does anyone know how to configure Windows to do =
that?
>=20
> Hmmm, according to the following a DC returns such a result if the
> filter is invalid:
>=20
> https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-adts/24=
9949c1-484c-48ad-b548-a31dd0ab2c93

I've seen strange things when sysvolReady was 0.

metze


--I8JOn0PQfTV0WBHVwmyuHTNPaUlk8whoQ--

--Kz3lv9zInXVx2k6NobmgFSTj0WPcFQYyi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl2XVgsACgkQDbX1YShp
vVbXWBAAneOzlEsjJNTdXOXMQJOsVZBGxdaL7ykgF/a0V1S9llBaaaaA1oiUPWpo
c/e1A3p6rlOCqh6Pv35wKUp4oQZctm+9nNKojoYTYm6xw3J5Rk8kyfVzUYpo7/Cc
yi4qvEdVJDKDzKfYLZAV5rp/U2dkPBLDde3WxKHjyZiUn833OGIg5bmQHq+Nubgy
zgnNEBfRubb2UCDXZeHZDPuxgwoIrmZh4Gqz0g/l99a1vcZ8Mf6XYnErar+1QGUy
W3YKnJwxlnqAlBp+H6PYhU5YL/xJ3s4dHDYZ1oKmJ0fUujo9NXLvcYIwhCA6ivjf
ziqUfIfOScsbhhvJS43ZrZw9YRoiUj5I8MSNj6dng6H+ATn2m2B5RDPiFmLh+UiW
RmPQ9+0TkCO17M9xWWdxa7yTMkxTXYClYddC1aJgv1DtXG1gYqnaFUliWISwLwDr
B/QvaZSxayrPFm3gn90yTKspCqoFMLOxHYdutBqskHFvLkJ/QHmGxLhQn/HbhaHn
IRzaCJu05PGeGUOmQG8aDyZ4305zQrAQ8TbWze91l/ZMLWZ8s7O6rPA4LIxC7clN
IFGbYFMRQYB5lsgM/dIJwq0w9hNBNn30YSSZwN5VYgNQN7svkGX2n9TWoXSP6UqI
qrS+tOasuC2ZB7ch+r0cDEr7EhtqkTodFEewJPXmJ2ugDxgemcc=
=eLwk
-----END PGP SIGNATURE-----

--Kz3lv9zInXVx2k6NobmgFSTj0WPcFQYyi--

