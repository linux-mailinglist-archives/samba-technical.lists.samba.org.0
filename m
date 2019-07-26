Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FC275C25
	for <lists+samba-technical@lfdr.de>; Fri, 26 Jul 2019 02:47:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=xZFxjdRrAW2GItL/lBbUYpvqXmWi9Rz9kNTWmANoAck=; b=wIdo+QGhLBTYv9BfSRbuktuJWY
	MWJd7Bn1c/cpoIYaEwHY+iQ38mjAMwVahHotcJBITWjvdH1BUPp+Jmq/PCcvvTEcAbuWt8Ht93Fui
	rRjSKoKkFyzXBWFxyJaXsgs0NTABigt6xjPv4Y0ZeW67CoHOQNXFppv1SntnaoOjTjMB+ZxmWxIpJ
	cx53yQGhQgWEjslcUzRhp2wdZprZT4jMyf855Csn20etWGBhKx0q4Q0tb29ipatrhO3s9uFRWTzft
	sq0OqRf+BehoxbYE8jjWrSzXuBzEOcp8LP25dcUNE7RJhv0BNzYPANTTtUKh4OQH/gd0XoGxIWssB
	oGHkbK3w==;
Received: from localhost ([::1]:41668 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hqoN1-000NjH-5I; Fri, 26 Jul 2019 00:46:03 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz ([202.78.240.226]:37894) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hqoMp-000NjA-Nb
 for samba-technical@lists.samba.org; Fri, 26 Jul 2019 00:46:00 +0000
Received: from [IPv6:2404:130:0:1000:7c79:69d9:b196:afb3] (unknown
 [IPv6:2404:130:0:1000:7c79:69d9:b196:afb3])
 (Authenticated sender: gary@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id E4D13801CD
 for <samba-technical@lists.samba.org>; Fri, 26 Jul 2019 12:26:36 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1564100796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 openpgp:openpgp:autocrypt:autocrypt;
 bh=xZFxjdRrAW2GItL/lBbUYpvqXmWi9Rz9kNTWmANoAck=;
 b=wUayluCYQAMK8BicubfLwTAIRKwJosCdno11lH3xBKcFWx3JM+XEgjiJ0xMULFNH6qnWYI
 Brzj5c2dBqsk5WrIGm/yz1BSdPY+bLaFRqawT+o+90D9zvqOUb4j0+rw5hWVSNqwdyq2Tm
 kJ3BxtEmfb8Wr0rVPTzPmB6HsZeq3evJNZqZw9n+DFB6Nh6FTbrcTPf1G4l6YBRWcs9Ya/
 jh0S4LWQvDlQ+QHIPpmHHdE0CIMiK3LVczHCMXtCBSe6OR1Q5g2jffZ1P5iFoyuhpEKofH
 3qFGG1a/Oc4G5tRGTJwTQ6+lXOVTKb7URLp/9//6Mx2LlgC0NYF5sGx/g2N6Kg==
Subject: DNS performance.
To: Samba Technical <samba-technical@lists.samba.org>
Openpgp: preference=signencrypt
Message-ID: <7860b3f6-995c-9d5b-e337-7ca579ea1b05@catalyst.net.nz>
Date: Fri, 26 Jul 2019 12:26:32 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="XBAPUnFnBU7E4faeXt6lCqvfO5jRFWe1B"
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1564100797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 openpgp:openpgp:autocrypt:autocrypt;
 bh=xZFxjdRrAW2GItL/lBbUYpvqXmWi9Rz9kNTWmANoAck=;
 b=p9RPG5exmLobLWSJlGZrO89ng5kJv2/pqoRjWDXjKsnD0iT+Mzqw1ACAoddm+T46+XZLyy
 8MBGUBZM0eTswYX7++vlhnuSxAkFImsNr8Nwu4aQzdZuVGR8g+9za6ZpvXvDqrdw1iylz9
 R70f1AGRV2nB64X+O40Mbc4ZYBtb4q5/v3qTNkxJtZD5IZp0tli6SVfXaGhTvEaUF/bq8u
 fre+sCsiRt6j1AGzx/j7oBA4HjXrG+6sCaz9vGXSv0P4nmVMQUo4BZ1Pu0nlRDcH/9dSw9
 AYs2jpOKFzhmNc7T5f8YIMH6j3N3NN2bCfvP2Tz543k4H7sQZmAcGHIbUxGuKA==
ARC-Seal: i=1; s=default; d=catalyst.net.nz; t=1564100797; a=rsa-sha256;
 cv=none;
 b=MpGBHuPG/zMrM7EGkLlSd1ovd2IYcU3y8SSjmOOISDCLt8tdA9vl7PVYomQJQk+hVfInX3
 56uwSKMV0Sm11GYfI1XjAFLyem52CKgXjidOGGJvupkENnMAG6k+jQgeAtZ6tZBih60Jz6
 SbRaHtyY42P0BiNDTU97rMbDDEkzSn4Vl4FehpJNO/oEGoR1CcaRsmEC+CKhwW0+8KOmhL
 JEAhnT2tjgrgT7mGGfgezFnU0bF21HJuquXr3OLnAu+334wfllxqO+6GCKFTau/pOmN9ZP
 OBALZ04hf7bv+T2Cbc78ocYU1wLbZllrkaPcqher/IPnGHXz86NOfRns/5kGUA==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=gary@catalyst.net.nz smtp.mailfrom=gary@catalyst.net.nz
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
From: Gary Lockyer via samba-technical <samba-technical@lists.samba.org>
Reply-To: Gary Lockyer <gary@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XBAPUnFnBU7E4faeXt6lCqvfO5jRFWe1B
Content-Type: multipart/mixed; boundary="88kzGBwO2rSW1Udtrp6GxJm7cwF7o6QfF";
 protected-headers="v1"
From: Gary Lockyer <gary@catalyst.net.nz>
To: Samba Technical <samba-technical@lists.samba.org>
Message-ID: <7860b3f6-995c-9d5b-e337-7ca579ea1b05@catalyst.net.nz>
Subject: DNS performance.

--88kzGBwO2rSW1Udtrp6GxJm7cwF7o6QfF
Content-Type: text/plain; charset=utf-8
Content-Language: en-NZ
Content-Transfer-Encoding: quoted-printable

One of the performance bottlenecks that we're seeing on the AD is DNS
performance in both the internal and BIND9 serverts.  I've taken a quick
look at enabling pre-fork on the internal DNS server this mostly works.

Queries work, but updates don't

The updates use DNS TSIG to do the authentication, which requires
holding authentication state between requests.

I did look at using shared memory to hold this state but could not work
out how to copy the auth_session_info and gensec_security strucures into
the shared memory.


A possible approach would be to:
  * Launch a crypto worker process that handles the tsig processing and
    maintains the associated state.
  * The DNS worker processes forward the TSIG packets to the crypto
    worker via messaging, and wait for the response.
  * None TSIG queries are handled directly by the DNS worker process.

One possible issue is that we would be limited to a single crypto
worker. However the assumption is that query loads are much greater than
the update loads. And given that we currently only store 128 sessions
this seems to be likely.

This should all work, the only bit I'm unsure about would be waiting for
a response over messaging, but believe that this should be doable.


Ng=C4=81 mihi
Gary




--88kzGBwO2rSW1Udtrp6GxJm7cwF7o6QfF--

--XBAPUnFnBU7E4faeXt6lCqvfO5jRFWe1B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEDO84T/PRptSsMEixei/9ZKIyR1MFAl06SLgACgkQei/9ZKIy
R1MsUggAoXq+HCYDFAPHg5z2be6DyrV1NEgNGwqtHF2O9rzask4jT4BB+PIZ8Ia6
wPvM0zvebDgDOGYYAm8dTKyBRtMWaWoDdkxmwxKVCm42Xv9vR8domi1z54NpPjLw
NC4iI3Ks3NHCkd4h29G595bOib7l6om94bVSyfir4DnaKHyEe9NZU0WzspbgW2UO
aShmKaPky2sUD4ey7joilK0xyjRX/UcoAP2kfuGF8z3k5pivUvJArZBqjFilBga1
gVwk4qRGjpkcsCsq87mqKjrREFuDT6HY13pQzqUKWohL062whezFq58ufGqerCDj
huLCgbLFLwBfZ6PPsNuVJZlqmSb3kw==
=nbON
-----END PGP SIGNATURE-----

--XBAPUnFnBU7E4faeXt6lCqvfO5jRFWe1B--

