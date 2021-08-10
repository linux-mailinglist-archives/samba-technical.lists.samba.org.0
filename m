Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 422193E542E
	for <lists+samba-technical@lfdr.de>; Tue, 10 Aug 2021 09:18:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=Wc35n16FUWW51qEzO5q8jZYrmLcBVJsTlaOtG//1XCs=; b=SQ2snm6+/MpUaEUbejDXV4vmvs
	7h5itCprHwuagwtQsfcCjB9Xl9ZM4cVX/EL319mDCmikeVzt+GECD86Sn0UvXM7C+3w5r+ViSLCFi
	SPSTd3keK4ILQS+KCKhzPG4w59oWAvQUKUWzJcZlBwWRWZxQG9fAEDl4hIGe/0hwITcnXdKYnGFqF
	Xj9EE9wTGg7AdG0Hl0LzNIUw7QsgAqLvSLD9/8kqeR7/1mIyzK+E7vdmvBXKTlWa1NG+TdklcpJAR
	Q4KT63iFkQZdScUflgCikxMvKvviptw2VT7vjE+DB5E2SAoJynK+B1DRrjRfLCF2OaGGrIwMM/VyX
	6+8r4A5A==;
Received: from ip6-localhost ([::1]:48762 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mDM0Y-005PDw-1s; Tue, 10 Aug 2021 07:17:06 +0000
Received: from rs07.intra2net.com ([85.214.138.66]:36434) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1mDM0L-005PDn-7L
 for samba-technical@lists.samba.org; Tue, 10 Aug 2021 07:16:55 +0000
Received: from mail.m.i2n (unknown [172.17.128.1])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by rs07.intra2net.com (Postfix) with ESMTPS id 5674115000D8
 for <samba-technical@lists.samba.org>; Tue, 10 Aug 2021 08:59:32 +0200 (CEST)
Received: from localhost (mail.m.i2n [127.0.0.1])
 by localhost (Postfix) with ESMTP id 32CA3A37
 for <samba-technical@lists.samba.org>; Tue, 10 Aug 2021 08:59:32 +0200 (CEST)
Received: from drift.m.i2n (drift.m.i2n [172.16.1.85])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: smtp-auth-user)
 by mail.m.i2n (Postfix) with ESMTPSA id D66BDA06;
 Tue, 10 Aug 2021 08:59:30 +0200 (CEST)
Date: Tue, 10 Aug 2021 08:59:29 +0200
To: samba-technical@lists.samba.org
Subject: djoin support
Message-ID: <YRIj0dl5akyHjPQh@drift.m.i2n>
Mail-Followup-To: samba-technical@lists.samba.org
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="LOaq3dzcsfvhmD/D"
Content-Disposition: inline
X-Sent-From-My: toaster
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
From: Philipp Gesang via samba-technical <samba-technical@lists.samba.org>
Reply-To: Philipp Gesang <philipp.gesang@intra2net.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--LOaq3dzcsfvhmD/D
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Samba team,

I=E2=80=99m excited for the =E2=80=9CSupport for Offline Domain Join (ODJ)=
=E2=80=9D that
was announced for 4.15. I remember dissecting some djoin blobs a
few years ago and successfully extracting the creds.

I=E2=80=99m curious, did you guys receive any official documentation on
the format?

Not sure if that changed but back then MS didn=E2=80=99t specify the
contents of those blobs so we couldn=E2=80=99t assume they were fully
understood and would remain stable. Which is unfortunate, I
think, because it=E2=80=99s the closest thing to a host configuration
file one has when working with AD.

Thanks a lot for implementing this!
Philipp


--LOaq3dzcsfvhmD/D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEnZTDO4wmd424wPWRCSLGx8z5U5wFAmESI9EACgkQCSLGx8z5
U5xIlBAA4oH71l0Yg2awseMdrzYoTyzNwg4+oVwAzgevBri6K+4rbUK+Qy+6EObN
UCdKDY20IWlkGFJPNrWjGXo2SBuGdcWf+i546H+0vHEfxcUHcPTH3b8q8QKHUgLA
fgkT1VAvaGTuRTt0EhggDz5LnNWG2IPf2cNPygM2iNdK936k9kl8e3xW2zxeHvfs
fTZZufIKREV3lbYm3xkB8dEGfc3L08GL9gKFtLMmoLIRtMf2TN5bblD5U8ntnP8R
c7Rc5e526BPLX+YN4zXoNby8w0Byi/MI3Uw4CdBXSjTaijlzLTy+Y1pjRKH39E0p
x/IinLvnM4LL9qlXQBsv5un7qDWHzTCf5Hs5SqFFVjZSDd4p2/rUl+/2ZVDgMK9K
HkIuDsJWU70eCHahvDt+CAi5fy0P+buExW2bACMr11w4vTgR6muvXqDres9p+Tqj
qzlq19426/MSUINSTBmvEYBgtvSlT2Bwn6R/Rb+hpww1wsE3lgeK1kcXRrX4Ih9M
kCvyiH8OWisqgWWz2REj1vH/FKzOxXp934f+4Epviid8mFpJU4r0nQ9NLqPgkJq7
zGvgBQpNpAArnGcjJwR1WDdIfWOaY3QK/OrBmDD6ogvJNiCNs4YEYbiraHxOgLUK
qiiAIwDixaKirdN9CBuDuP7YVpNg5cL4L6uyNXPNSbJRrCgDmlw=
=ACWm
-----END PGP SIGNATURE-----

--LOaq3dzcsfvhmD/D--

