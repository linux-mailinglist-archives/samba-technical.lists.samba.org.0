Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DC421DE37
	for <lists+samba-technical@lfdr.de>; Mon, 13 Jul 2020 19:07:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=APJaVNYUk0jeN3cCdfV98ap4YbvNzfOTAVMMA/TITNo=; b=SRyAYe9B5ZxxHydwmaylZUPs0+
	HWmltofutBoj+rZcL6MN3ioeLOMDwrAdjlgsF2dG44Alw+vcTaIM9+tS77notTxRzypTUm9tJxmkw
	RNEFeAo+PAdxMj+6jZjucxJFjqQgxH8CYk0gc5cyCNYcw6Y7FYMi2V9sfBZYkf28cJ/h6lhbc+hUO
	1ReCGMylxOS0fH0ckn522RPngAQaxtCHFAetFiz7K6MY7LcnTVOmCZfbkrr1Wk/wk1wLGfFEVoVDz
	7zXMq86+KRv/280+wiewFaYiTD6swc71vEOG4AQRk1leCYXjxkF2p7JPLekYieIABzp2KaT9hhzI2
	Gf5R/dUw==;
Received: from localhost ([::1]:42220 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jv1ut-007B8s-E0; Mon, 13 Jul 2020 17:06:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58002) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jv1un-007B8l-NH
 for samba-technical@lists.samba.org; Mon, 13 Jul 2020 17:06:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=APJaVNYUk0jeN3cCdfV98ap4YbvNzfOTAVMMA/TITNo=; b=2nLp0UuqfEbugHdWdWeOUYx4c2
 5DO+ZzBVp8ZHG595oTBfR5dNDVHudD/fCmlNC5TWdzwAAs3e/2KnxtbI6ph7higcOFABNiX55azEv
 HYUVmC4nalofOrH9/BMaOgoOfudR1e5ALuAQMWUYkncNGZfs9BDsD0sJNWJYGYiZ6tz7nV1wGbh2q
 ElbadTeChUD1Hb8xsvmy7jXNX2r4ZPsLB8FojN1jCK9I2Hnrh9N7pE1EzSFcc1QuXNs/fNxCO81Y9
 21xCGSX9MYIz18uP2C4d5vwOpHQWNX5fquDbVkaE/oMbklqeNe3VyPls8BS36xFn1x8/SsbDEWVLG
 zSzQ8ipFuJdUwHg9Y0NfCzi88q6tOQnaHBlUL+5NHZMNRaUbfddg3I90Nilu/xpEvnXjZs5pe5kCu
 FOSNUQiLI80CCb1T0arih6Im7Giz4tptVk8JKqtHbgFzcyqKl7GIabu6fx01R0+6NZoY+oOjKfnjA
 j+qfvl8MkHDEoO8pSdRXseRJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jv1um-0002c6-BM; Mon, 13 Jul 2020 17:06:52 +0000
Subject: Re: PATCH: make disabling of vfs_snapper consistent with our
 configure/build system
To: Ralph Boehme <slow@samba.org>, samba-technical@lists.samba.org
References: <20200710110737.GA1585556@sernet.de>
 <b4ea37e5-398d-c8d2-15e2-1a27f7655598@samba.org>
 <20200710114452.GB1572444@sernet.de>
 <54f90e98-9d7a-337e-defb-27fb756130fd@samba.org>
 <20200710194428.GA1596727@sernet.de>
 <63044415-9473-1572-2cd5-fa1fa5e012e1@samba.org>
Message-ID: <3b2342e4-6e0b-24c1-44c6-d11e1a4b0d80@samba.org>
Date: Mon, 13 Jul 2020 19:06:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <63044415-9473-1572-2cd5-fa1fa5e012e1@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="aIY3tqgvGcRSUY2rtm0Mz2LiPf8ecdNuk"
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
Cc: David Disseldorp <ddiss@samba.org>, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--aIY3tqgvGcRSUY2rtm0Mz2LiPf8ecdNuk
Content-Type: multipart/mixed; boundary="CYstmYIIwZ2d2vzO3Bt47fAiLNClcANpS"

--CYstmYIIwZ2d2vzO3Bt47fAiLNClcANpS
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 13.07.20 18:48, Ralph Boehme wrote:
> of, what a mess! :)
>=20
> Currently the snapper configure check is the only one of the three
> (snapper, cephfs, glusterfs) VFS module configure options that implemen=
t
> --enable-NAME=3Dyes "correctly" (as per --enable-XXX configure semantic=
s).
>=20
> The other ones (ceph, glusterfs) will just silently pass if a dependenc=
y
> is missing, effectively implementing default=3D"auto" behaviour.
>=20
> I don't think we want all of those modules to fail with a
> default=3D"true", that would result in too much configure churn while
> user's configure runs fail one after the other, forcing them to add
> --disable-XXX to the configure invocation.
>=20
> I guess we should just default to "auto" for all three modules.

I agree, that should be the default. This will enable users to build
Samba easily with all available options that are possible on their
platform. Package maintainers (same like autobuild) are advised to
explicitly use the --enable-foo options to make sure that the desired
feature really enabled.


> Here's a MR that implements this:
>=20
> https://gitlab.com/samba-team/samba/-/merge_requests/1461
>=20
> If we decide that we really want all three modules to use and enforce a=

> default value of "true", this can be achieved by merely switching the
> defaults in the above MR.

this looks good, thanks you!


Bj=F6rn


--CYstmYIIwZ2d2vzO3Bt47fAiLNClcANpS--

--aIY3tqgvGcRSUY2rtm0Mz2LiPf8ecdNuk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQRTh3WYB8ykhrzLAI8xQwafzsNCPwUCXwyUqgAKCRAxQwafzsNC
P1ukAPsGb33HBDSB1qt8q2yGkTRyVu6Gv0AilB/z87L9eI7HcwD9EYkhVJ4GLJOM
6e7MTjiga7UwULVQDFL921w1MTDCDAg=
=d4Bs
-----END PGP SIGNATURE-----

--aIY3tqgvGcRSUY2rtm0Mz2LiPf8ecdNuk--

