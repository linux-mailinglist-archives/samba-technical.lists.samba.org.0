Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E405B8BB
	for <lists+samba-technical@lfdr.de>; Mon,  1 Jul 2019 12:10:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=Pr5cykbLt9gAivVc06mTBbwYdXPO0eDx+6c6hG9M520=; b=nSJIfyAD8f457WFEoAeSkOWORB
	1SxDb6LqiRd1V9KJlye4CphV7kbFS3GERgfBAOA5lV8ontYpcpbPV7wWKDb8xjJLYQ5l2qp2AFn1I
	F4+R7Kx/W0AWkGHQELjo7Q/fJQ5sIrFKkMfl2JZ+rBhPYaHKWtjVnoc0F0+Xt3GuU8hJEGqDiFzvh
	1OwWidZGJ80Jo+ggHuNf8rbBKVPAul22NwmcmqBF6NDgXuRDRoq/hcfMl5LtRkzdYrLf3cADKCacp
	E8YvjrZ76cqKiNzaD01o0ZV8qSHXADAzhT48BIJo/+0OnNQAuB4wj9T6kcyVpBU0j7K9dSQTPCNgr
	jJ1/yPLw==;
Received: from localhost ([::1]:19438 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hhtFG-004I87-GM; Mon, 01 Jul 2019 10:09:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26586) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hhtFC-004I80-40
 for samba-technical@lists.samba.org; Mon, 01 Jul 2019 10:09:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=Pr5cykbLt9gAivVc06mTBbwYdXPO0eDx+6c6hG9M520=; b=U9dmjNRRQxBFHV1ij/RLrF7Tnv
 2lYWDoLSq8ph/8ikyu8FcTtra8FSTcVtMV3dcrVbncjH7k6H+51AgTNyTxD1btL4jx+PoLeVN7l1C
 mnhT2k1d1clzlEr+//Wx7i5dBWU8zhw03lsn5D+R43gYuC/wfY1YhEI1YFWs37W6CYMc=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hhtFB-0006mZ-KU
 for samba-technical@lists.samba.org; Mon, 01 Jul 2019 10:09:05 +0000
To: samba-technical@lists.samba.org
Subject: communications / mumble
Openpgp: preference=signencrypt
Message-ID: <577da0c5-059e-b88b-53e9-f54a9dc0b888@samba.org>
Date: Mon, 1 Jul 2019 12:09:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Y0aRTuBqkRBjkjVgthtlYDklv63xeR9JU"
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
From: =?utf-8?q?Bj=C3=B6rn_Jacke_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Bj=c3=b6rn_Jacke?= <bjacke@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Y0aRTuBqkRBjkjVgthtlYDklv63xeR9JU
Content-Type: multipart/mixed; boundary="ueYdjnOXZHDH7g0RMUGYhuIboGwKyibIe";
 protected-headers="v1"
From: =?UTF-8?Q?Bj=c3=b6rn_Jacke?= <bjacke@samba.org>
To: samba-technical@lists.samba.org
Message-ID: <577da0c5-059e-b88b-53e9-f54a9dc0b888@samba.org>
Subject: communications / mumble

--ueYdjnOXZHDH7g0RMUGYhuIboGwKyibIe
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

I want to emphasize once more how much I liked that communication
workshop in G=C3=B6ttingen before SambaXP and a big thanks to Jim for get=
ting
this ready.

I also would like to remember all of you that we still have that
wonderful Mumble voice collaboration server (see ./doc/mumble-server.txt
in the team repo for details), which is unfortunately not used by many
of us, even though it's a really great tool I think. I guess many of the
not so old team members didn't even know that we have this.

Cheers
Bj=C3=B6rn


--ueYdjnOXZHDH7g0RMUGYhuIboGwKyibIe--

--Y0aRTuBqkRBjkjVgthtlYDklv63xeR9JU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQRTh3WYB8ykhrzLAI8xQwafzsNCPwUCXRnbvgAKCRAxQwafzsNC
P70PAP9/MW4bzJlREhhi9veq/oGFvg+GJXiaF/spMrry2JWp0wD/daFkU8PI+rgQ
ALpwXHnWqOZm/VKzdWl5ifumbcYh3QM=
=XXX2
-----END PGP SIGNATURE-----

--Y0aRTuBqkRBjkjVgthtlYDklv63xeR9JU--

