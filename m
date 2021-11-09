Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BA86944B3CF
	for <lists+samba-technical@lfdr.de>; Tue,  9 Nov 2021 21:14:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=6xU4ZJCETxbs+uAniTiYrMxzgTsoK0hWC8Ht20J3fuc=; b=kdGuxiOEuMx5nIEhLHR0IA3h5s
	OQkHMXf7lWi3wruWO+xw45VYSOzD9bGqkVKR1CkYr1A7QMhRSSG7EUrQ583QiqAaABjY6m9NcmAvb
	d1wGljHyd5P0NzWXOMSLp3plRltTkRfppPkKbRZwpESactBE/8NREtAaRw9H5IIZc4LSeCc07kim9
	zGpKC848iRIA5oTtA5nyH9tVGqNaGoc7RXosb3nM6X1k9BNYpqtLavlR1pFUAk4Md4y79EUsUWgqn
	iooeu1t+Gkter/np39NQLsFYIl92TTtPiajNrsr3wFpoUa0BBupb/mudB6Lci9N64N4CXbix7hGki
	6CTdtxog==;
Received: from ip6-localhost ([::1]:55368 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mkXSk-0096ZO-Hz; Tue, 09 Nov 2021 20:11:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57986) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mkXMb-00968H-A7; Tue, 09 Nov 2021 20:05:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=6xU4ZJCETxbs+uAniTiYrMxzgTsoK0hWC8Ht20J3fuc=; b=KW/g+SC4XA1smkBu4RFCVQOsJ1
 9JPi59aT/y+wfQbCii6atpzsNUhbR51V7scdMkXw4jYSY7grF7FtOctNUqmWh20l6oCw5T0yFH9m9
 O9ZueSZjZui7U7EBAiHekaY+HgS9Jfbs8s7ycsptaqnDMKj8LT9GmWcvR52kh6iaVoabP8u38nwJN
 7j4E+ZRRgdkrPSR74zuCyE5/nlGnPmxRGGrjY/THc14nJ6TxNrAYy/vEvM9JihwbLqC1AiYo4dYzq
 TuGHv4zAOhmqyhH68uBXdZjjXOucZ78mL+fYNcIZdjfYkFz5lHmErBM4q5DyMlpO+BGqfV6XvBYoi
 XHCb0n7R0Oge5gcvR65KnfMT8VafLzFddvIWsHVbmSgKXw26AzB/sRrNCY/vNNlqcxev4CdgBgwEA
 bynuMW4bym7tuRXFObRGmtYQk1bSEdjpdbS7IR1LJb8M2/qHri0+gEuR2Q/OKL1kPaXpkYPOkmbrw
 DKBc0x5hC40ZWbdZ/k86TDqI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mkXMT-006AmF-2b; Tue, 09 Nov 2021 20:04:53 +0000
Subject: Re: [Announce] Samba 4.15.2, 4.14.10, 4.13.14 Security Releases are
 available for Download
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
References: <20211109182554.GA3180235@SERNOX19>
Message-ID: <2addf8b4-f050-44d7-e450-ce7de7cb2f59@samba.org>
Date: Tue, 9 Nov 2021 21:04:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211109182554.GA3180235@SERNOX19>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="wwnSkUrHfiSC3B1Zp3mG5kNGITfZYFo7Y"
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
--wwnSkUrHfiSC3B1Zp3mG5kNGITfZYFo7Y
Content-Type: multipart/mixed; boundary="nxvCRjSoezmkYVJCWITI4TEzGJtPzMcaJ";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Message-ID: <2addf8b4-f050-44d7-e450-ce7de7cb2f59@samba.org>
Subject: Re: [Announce] Samba 4.15.2, 4.14.10, 4.13.14 Security Releases are
 available for Download
References: <20211109182554.GA3180235@SERNOX19>
In-Reply-To: <20211109182554.GA3180235@SERNOX19>

--nxvCRjSoezmkYVJCWITI4TEzGJtPzMcaJ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


Hi,

> There's sadly a regression that "allow trusted domains =3D no" prevents=
 winbindd
> from starting, we'll try to provide a follow up fix as soon as possible=
=2E

The regression fix is discussed on this merge request:
https://gitlab.com/samba-team/samba/-/merge_requests/2246

metze


--nxvCRjSoezmkYVJCWITI4TEzGJtPzMcaJ--

--wwnSkUrHfiSC3B1Zp3mG5kNGITfZYFo7Y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQT7piwqO01BwrlU3LLHuFQ7rrL7egUCYYrUXQAKCRDHuFQ7rrL7
ei1hAQDK7JSGx8fGTqJZNofrMrE67s+4NWC6D9fWNchq2sCPMAEAhfyCX2lUiXb0
PrNdgoe/VGAkeKg3KIYzdUyN7bIbrgU=
=Kw9n
-----END PGP SIGNATURE-----

--wwnSkUrHfiSC3B1Zp3mG5kNGITfZYFo7Y--

