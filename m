Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A081F3736
	for <lists+samba-technical@lfdr.de>; Tue,  9 Jun 2020 11:45:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=6F7UXuF3Xxc47hnHDOkZrzNqGfzzt/5i6Wk77h82Jko=; b=5iVuRkfaTYHemDELEJJsbaTh3n
	R9pRA6gD8B9775c1RNIJqtSREAVObT3ST1FCnjNc9fwJYVSPTFy3Va5yW/fO2G1mwzQinBEfvlgCS
	jjFGd0N8ebIX5UqCD/diLoQ5lqEi961f9w+nozafRo5hizKTg68mYtckbWpaGA64sqq8meSbNBKVK
	WptN30rsdVlPNrwLDu2MDmhLr2WX3QikCYbs8i1VduZyYWtzA8wDJBSLkfhzKvzLc6mxil4TAP/JK
	1jetUPwBqZ0Jee/2n/MS1Wp1bj9hfRvN8pxmKX+IKIV0JdA9ZgitD0uw1S99uIjCwDzAz0jaL5+35
	MkwPwUxw==;
Received: from localhost ([::1]:34480 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jiaom-009aoK-3U; Tue, 09 Jun 2020 09:45:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21412) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jiaoc-009aoD-DJ
 for samba-technical@lists.samba.org; Tue, 09 Jun 2020 09:45:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=6F7UXuF3Xxc47hnHDOkZrzNqGfzzt/5i6Wk77h82Jko=; b=OsNEmd/Tl+kzC8XYDFvPQ2YF0Y
 9/scv6NKQZAW/DDgvB7r1uqB3tufHWtu9UxdyNNxc4YSqwClgC0VVghxzgIcaus3pmX7nHeEakmKG
 nQNjII28yh+auhMzLTyhAhJ8PecAyQpIAE+AW2jimRcqRv08yYmyEYqHzXZtzY1F+uP610ckgVS6W
 quWyXZ8L0sNqy342Q672rx8cdAFPO9STWoa/eKdzVT1btWsUhsqPawkuvGJuTacbHhu3t09GG9ePD
 N1VKIDiOr0f18TN6wTa1ONPcQlCemppoVfyGeTZax9bIh7N892pUijGr7OAd3Ed1T3ASBXlLQqUnv
 fhWvE/KIEthk/EEvPFLB4H0HrpdFWaUlxe8rDChhB8wMhnagoezlJT9igeM1ukE8qh3K1jRPTsbo+
 SiRWyS13/SVb9dtzfjT2fdlQLf1kdb5uhaSlaUaF+nR2RriGgAzI7PhEUg2YqW3EDllaYHNERWYO+
 UPOQZRwSPX+f0e4kxdv9meqo;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jiaoX-0001K4-UM; Tue, 09 Jun 2020 09:45:02 +0000
Subject: Re: Avoiding further (LDAP) stack proliferation in Samba
To: Stefan Metzmacher <metze@samba.org>, Andrew Bartlett
 <abartlet@samba.org>, Christof Schmitt <cs@samba.org>,
 Jeremy Allison <jra@samba.org>
References: <7f08ecb52a4a94d95e39af436e94ab852cf0da55.camel@samba.org>
 <20200521012158.GB10353@jeremy-acer>
 <4ce022a6c65422e40e1a583f95cefbbc7585393c.camel@samba.org>
 <20200521021959.GB12847@jeremy-acer> <20200521214312.GA12586@samba.org>
 <854ac3b5d75279a13ebf3c5a6e9f4fd5b9eb8943.camel@samba.org>
 <437a7ad7-5158-9124-9ba3-939a3bfcee53@samba.org>
Message-ID: <37112466-d094-2d37-01e5-101ea7b9c1ce@samba.org>
Date: Tue, 9 Jun 2020 11:45:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <437a7ad7-5158-9124-9ba3-939a3bfcee53@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="XBqqD5SLiwji6M0zH7XSV0Zjn72IeKBXx"
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
Cc: swen@linux.ibm.com,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XBqqD5SLiwji6M0zH7XSV0Zjn72IeKBXx
Content-Type: multipart/mixed; boundary="KDDuUeQuqKj9Zl0dobz0euDsbo1kKOtjU"

--KDDuUeQuqKj9Zl0dobz0euDsbo1kKOtjU
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 5/22/20 um 3:02 PM schrieb Stefan Metzmacher via samba-technical:
> As you know I like the idea of having things implemented just once!
> But as found out in the past this is a lot of work and
> replacing everything at once is often not possible.
> We learnt that we sometimes have to do small steps with intermediate
> states, which we sometimes not like, but at the same time require
> in order to make progress at all.
>=20
> There're a lot of things I'd like to see:
> 1. The ldb api should not be used for pure LDAP users,
>    it's bad enough that the strange async model exists at all!
>    We should hope that it's only used for LDAP for command line
>    tools in a sync fashion.
> 2. source3/lib/tldap_gensec_bind.c should use gensec_update_send/recv
> 3. tldap makes use of the "client ldap sasl wrapping" and other
>    options, which are use by source4/libcli/ldap/ and
>    source3/libads/
> 4. We can add some helpers to get/pass 'struct ldb_message' from/to
>    tldap c.
> 5. users of source4/libcli/ldap/ should move to the tldap api
>    - lib/ldb-samba/ldb_ildap.c can become lib/ldb-samba/ldb_tldap.c
> 6. libads should go away it, at least it's low level internals
>    maybe it can be build on top of tldap as a first step in
>    order to avoid a rewrite of all non-winbind users.
> 7. winbindd should avoid libads and only use tldap.
>=20
> But the goal of
> https://gitlab.com/samba-team/samba/-/merge_requests/1351
> is moving along with 7.
>=20
> And I'm not seeing why we would require 4, 5, 6 before doing 7.
> They would be nice to have, but they tasks for another day.

this sounds reasonable.

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--KDDuUeQuqKj9Zl0dobz0euDsbo1kKOtjU--

--XBqqD5SLiwji6M0zH7XSV0Zjn72IeKBXx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAl7fWhwACgkQqh6bcSY5
nkZjQxAAk2zpL24rjdZAJ7N/ASNL0W9QzJ8Sec5UATsz89Ihgd6ENtmySbNbpxzl
oINja+H7pGlKV1nPlgEk20sCx+fffqPOXsIB8R6DhqR6gd6bKyeEQMxyDnGzTdaZ
QY7hRyVJcCV7jFEGohcZh5XuMgPL/WI8fwCTwBtKurr9O4eTqjApHJa7dQKa0A3W
w6PHoVoCL3fON6PAg6txNn5DI2H1B06EBy6ls4gI336zgbPM6BWtlSahy4jd2kfX
uP1lwU0uk6FEG/rN3greUx9E/MunJgDZmKkzWUY3U4HeLvDkQTT5+s/HjlU3TCGH
aU2Ef0CI9gdQyIlCm3RJcgquQDY5yYfv6fkRTRVRNfl9tadSj8cc1YiFHH7JTTRD
JP5Bi69Pcs/BvjyG1EzamolgvRS016YM2p6RqX8OLdlwB0POSXY6pQMJMB6KEiUO
IJhWmMNMPxZ6wzAowgsOVXZrVk46vECUhbqgrH/3Rqk9585SSmeVLezMV+pxZrf6
XcnCDH14Oyoy6yTTSsNn+S5SN6NrXT/bwltF1t8u/Q7wxFW2LgM6MPWX67XFhKWc
UE7LUrGritEHP3SwaXHW1X3PTLOHZHJeopv8VPZz5JAEjA8qxEiY19X8N6aUrg/V
UnHZO+ZQ+kF/HIXqprfMoHbEAzdTGemQM+2iiu3joS6eD1fRiAc=
=weUo
-----END PGP SIGNATURE-----

--XBqqD5SLiwji6M0zH7XSV0Zjn72IeKBXx--

