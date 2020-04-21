Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5791B23DD
	for <lists+samba-technical@lfdr.de>; Tue, 21 Apr 2020 12:30:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=0NM6xGPJvMrJB3mgc9uPZ6Ci4kXm9OYYpBq7KDG+1dE=; b=qZmb3eO6UbHihEOZpyUYflR/RA
	RM458CgdJOakBEtXXx+SRknE2d3/WbgEM3Tqvm5C/lHiRdrDUZTrPhoZ2FOm2ZoDd6hRiZTBKVDxF
	vEQwHJ8mIcKhrleqQGhEcsfoDUSzOCpprh3dVd0hCBlLmX3k8Bx0xJuK/omLbh8q0UkdTfHYhwme7
	gNljDdAG4lxIPD/mPEXr3ZgEP/x7npi4CgNOOWosqGnqOB9Ly5PNpdAv474RQWX1RwcAy9Z+yjBNO
	ntqdf+qftNVgfraWbenH5IJB2v/o0sE9jAnnJy16qbIhs67+xsOg8/YblGha6zz2u58b9O0a5A7Rw
	WvfnGwYA==;
Received: from localhost ([::1]:21298 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jQqAU-001N2v-Al; Tue, 21 Apr 2020 10:30:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53144) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jQqAN-001N2o-D1
 for samba-technical@lists.samba.org; Tue, 21 Apr 2020 10:30:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=0NM6xGPJvMrJB3mgc9uPZ6Ci4kXm9OYYpBq7KDG+1dE=; b=Bd+jxoQi1BYIzlbyBg54kxU2Oj
 T6/sfyNqmVGIcmMNvc1+Bt7rp7jZl4ZZJdh6fkFM6ksG/GfVWTnrpYEjnMPs9ahDGmSsSx8cvqoHl
 cdlA5jDYEcvAG+3dzlx9sereRrtewdL7890H0O1y3X1YeFG3KfU0j+10kH6LePJWTdYWxKo1Fs0ZG
 46lhP/JWhjGw1ArA9m8owL06tgdnvs9w3GMxgPGtlAt/uGkK/ScqVTNNEJfNU1BeZX/VYd8U5FcNh
 ilqady2kT7QVlu8eFT5S71jF3ylV2actPAZbom+cCbxzI55VCw5Yok2OGyhq8TKMzSkPx/1p9ZK70
 uCTnmoI1wzP1/7mmXhe/93+yLPpCHZ1yFeNlktA3VTY1bZ1cbkbUWuBluw2sUdxwo+x/V6BPXghPH
 JEBGZpSm+06QeZhSSzPtw6zsjtyarKiGnB9LwpUNYPUihUPNzvzae/ZjIhVM6IlOakWY9P2x7oeVE
 a1GyeduQarDE4GTzRlePzZbz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jQqAM-0000B8-M5; Tue, 21 Apr 2020 10:30:10 +0000
Date: Tue, 21 Apr 2020 12:30:08 +0200
To: "L.P.H. van Belle via samba-technical" <samba-technical@lists.samba.org>
Subject: Re: question on testing 4.12.1 on Ubuntu 20.04 Focal..
Message-ID: <20200421123008.285c64b0@samba.org>
In-Reply-To: <vmime.5e9ec3fd.695.3f5eadeb60ec1f4d@ms249-lin-003.rotterdam.bazuin.nl>
References: <vmime.5e9ec3fd.695.3f5eadeb60ec1f4d@ms249-lin-003.rotterdam.bazuin.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: "L.P.H. van Belle" <belle@bazuin.nl>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Louis,

On Tue, 21 Apr 2020 11:59:25 +0200, L.P.H. van Belle via samba-technical wr=
ote:

> Hai guys,=20
> =C2=A0
> I noticed the following with the first packages on Ubuntu 20.04..=20
> So far i seen it installs nicely but i noticed the message below.=20
> Can we ignore it, i suspect this is a python 3.8 thingy .. but as im not =
a coder ...=20
> Well, anyone suggestions?=C2=A0 :-)=20
> =C2=A0
> =C2=A0
> Setting up python3-samba (2:4.12.1+dfsg-0.1focal1) ...
> /usr/lib/python3/dist-packages/samba/emulate/traffic_packets.py:339: Synt=
axWarning: "is" with a literal. Did you mean "=3D=3D"?
> =C2=A0 if (filter is None or filter is '') and scope !=3D SCOPE_BASE:

See https://bugs.python.org/issue34850
  the "is" and "is not" operator sometimes is used with string and
  numerical literals. This code "works" on CPython by accident, because
  of caching on different levels (small integers and strings caches,
  interned strings, deduplicating constants at compile time). But it
  shouldn't work on other implementations, and can not work even on
  early or future CPython versions.

It can be ignored, but we should probably fix all such cases in future.
This specific case can be fixed with:

--- a/python/samba/emulate/traffic_packets.py
+++ b/python/samba/emulate/traffic_packets.py
@@ -336,7 +336,7 @@ def packet_ldap_3(packet, conversation, context):
=20
     # try to guess the search expression (don't bother for base searches, =
as
     # they're only looking up a single object)
-    if (filter is None or filter is '') and scope !=3D SCOPE_BASE:
+    if (filter is None or filter =3D=3D '') and scope !=3D SCOPE_BASE:
         filter =3D context.guess_search_filter(attrs, dn_sig, dn)
=20
Cheers, David

