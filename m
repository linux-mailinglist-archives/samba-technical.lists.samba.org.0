Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF1944DC81
	for <lists+samba-technical@lfdr.de>; Thu, 11 Nov 2021 21:28:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=wI7jv+QxzOy9Ylw0x+/8+1j8g1g0okY6/qT8v0KwoNc=; b=iTsrBZkv7B7YKBuuFi3g67uPHf
	DK4QtvuLDmMbpG6D1s/HcxAT1Sd1guICcHdrWClycg4qPTvoWFy++mE8Dr3wQy9bf/jI0XjmZjq3f
	U9Zkz7U/t43pO5IK3plxh44bzSfjs9VVtsJPPDnh3mpIxSP90wuhBDyTM9wVtFyJqp6To9U5JncmH
	KQNm3890eP95vZSBYQPj0eH1x9Tjj1W2fUWpcFiuBYnHGD3qWAttXseFDcPs2w7ov1eWhbIOFsRCk
	cCOyvmr1OKcuDpf+Vi3x6VIPEPgcQDq4BS8DVkKcPWwwTjbd0k+ZlGb33Oik6kfh+aUE5wBG8iXy2
	Zm9QXR1A==;
Received: from ip6-localhost ([::1]:43570 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mlGft-000fQI-AF; Thu, 11 Nov 2021 20:27:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58200) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mlGfn-000fPz-9Q; Thu, 11 Nov 2021 20:27:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:To:From:CC;
 bh=wI7jv+QxzOy9Ylw0x+/8+1j8g1g0okY6/qT8v0KwoNc=; b=nAxu6f1ckFXPwBdbF1gxx2OclG
 ys7cJk6mKV4/wEuqMnsMtmZxPeHWbqrq6U4KlMXmEej5LzMmy7Jxqum0gJMvDUecZXcjI/Myj37SS
 oZdGwydB1F8QBo1uiucGLerKEokWkGQ5v3BkHl0haH2FJiCbdNit4QCgNeWlVrov0r2XoOKvFEMFW
 8Aoz69VDcvxhbUImxXr8h0jnxTxBZxZy50UvKd3MYh3ntxxzbslTVGUqd8f49ljeuTYYbGnzsSrR3
 4OiELaUbaFmSskQ1x49T3rh9KeXQYZULMTEN0SBUV4w9H0KMfsNDPDtpnNd50D4yMoe/n+rALhZnV
 MKu2tG93TbyRO8dUhEUmWb7i7T54oBpzBahNrHyX4NEUdEhiZOtCSV9MnLNJMx1+LMbAW+ko5N81v
 HYV5ysgLKgzaWnPr+BF5Oxhg/iazS4IIvZjqayJqzDKZWKGJePs6CWbVmp7B79cjo7dfM5lVyohzy
 T2gEPYUbmBAcOoMlS6QTRF5D;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mlGfm-006g9u-Cu; Thu, 11 Nov 2021 20:27:50 +0000
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
References: <20211109182554.GA3180235@SERNOX19>
 <2addf8b4-f050-44d7-e450-ce7de7cb2f59@samba.org>
Subject: Re: [Announce] Samba 4.15.2, 4.14.10, 4.13.14 Security Releases are
 available for Download
Message-ID: <7effc378-b912-5a29-b1a6-99439e50e7ff@samba.org>
Date: Thu, 11 Nov 2021 21:27:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2addf8b4-f050-44d7-e450-ce7de7cb2f59@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vVWDfz6M9Sv5KO1gOzS2SHOq3H3taIcup"
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
--vVWDfz6M9Sv5KO1gOzS2SHOq3H3taIcup
Content-Type: multipart/mixed; boundary="tWOZ856FOoyumslWcAmqs9GLYibxhzY2h";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Message-ID: <7effc378-b912-5a29-b1a6-99439e50e7ff@samba.org>
Subject: Re: [Announce] Samba 4.15.2, 4.14.10, 4.13.14 Security Releases are
 available for Download
References: <20211109182554.GA3180235@SERNOX19>
 <2addf8b4-f050-44d7-e450-ce7de7cb2f59@samba.org>
In-Reply-To: <2addf8b4-f050-44d7-e450-ce7de7cb2f59@samba.org>

--tWOZ856FOoyumslWcAmqs9GLYibxhzY2h
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


Hi,

>> There's sadly a regression that "allow trusted domains =3D no" prevent=
s winbindd
>> from starting, we'll try to provide a follow up fix as soon as possibl=
e.
>=20
> The regression fix is discussed on this merge request:
> https://gitlab.com/samba-team/samba/-/merge_requests/2246

The backported fixes are available at
https://bugzilla.samba.org/show_bug.cgi?id=3D14899

Please also notice the additional fix and advanced example
for the 'username map [script]' based fallback from 'DOMAIN\user' to
'user'.
https://bugzilla.samba.org/show_bug.cgi?id=3D14901
https://gitlab.com/samba-team/samba/-/merge_requests/2251

metze


--tWOZ856FOoyumslWcAmqs9GLYibxhzY2h--

--vVWDfz6M9Sv5KO1gOzS2SHOq3H3taIcup
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQT7piwqO01BwrlU3LLHuFQ7rrL7egUCYY18vQAKCRDHuFQ7rrL7
euLRAP9Bjx7mj1qwThTnDQY5Re/H818eVhR62bZ2Qczr+SlI+AD/drJoqOZB+J1h
O3B08OkcOBR24G2PV54jhOSyg840pwc=
=JN/X
-----END PGP SIGNATURE-----

--vVWDfz6M9Sv5KO1gOzS2SHOq3H3taIcup--

