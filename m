Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D675A17F785
	for <lists+samba-technical@lfdr.de>; Tue, 10 Mar 2020 13:36:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=bYYSIT4YkW61Ru4H4J3sI+w/mA4b9jQPnVhWRztKcr0=; b=Zr10nCwgov4g54LMN26/Ir6UR7
	xTCgbyLHAXCzbDm+DU0AK4XninvRsE8vLM6M9ip0v6ZhReQPh4EEG/KHFrm7NUciNFR7nL57RJV0U
	RgEVO8WdsPEu8D2a1iPNIAplWbeZSOjydz8NY4U6KAa0Gr0cLsrZm9n6VLAkSrxjzGDXhHekBlSKZ
	WvXeAoInMKRmq/dqC3AOgTJwLmeK5N37d+wl+Lcdz/1aDPWodDpBL1YP58WBY49im5BOwhJts+wOw
	5sacwD2yBE+jJNfiMY09p9bo1ZwzvNj+RwiIC0OF/l4MXieyy0m5Rw9eG03QfPnBk9q3IMFbSPH8B
	dUwzeJTA==;
Received: from ip6-localhost ([::1]:47110 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jBe6n-00FkjJ-Tf; Tue, 10 Mar 2020 12:35:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22912) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jBe6i-00FkjC-LF
 for samba-technical@lists.samba.org; Tue, 10 Mar 2020 12:35:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=bYYSIT4YkW61Ru4H4J3sI+w/mA4b9jQPnVhWRztKcr0=; b=BLZ3yPiDvIOqeayKVmM7eTwJ//
 2E1eJ1fyBELfJIs1q9ckgojSAXKYUjRaBEs27Z4DKjKzkw/hy0SBvdY4oeZKAOZ3AJMerNb/A8zxL
 NpoxDUQV7Buy0UNS/ZBW2uw08F5gX5ni4EQWWDvIzHhyFrHe4pTj4Yir6T6uqnGlJ3SjMgeIcDRhs
 2ZoD/5+2zN0iTKILzN9OC7dsZVUpuhNfdwZ9Uc1yn/XMKApDFEyW6tX5RILZR/wzWaPf5FKkgdyrg
 r+V6Q+BtvYy30TK7JuzWFVye2p15cY2BgUDMiAf1s4vwQQHMnPX6/exanYwwwnYm/avRcu7U1KUk7
 gwzI5Y0RXRaZ8j2eUH6L1vsm1U5SkhQ804HWAwm23J5Jhw6xquJi41VivoB2YMQv9NboxyaSqfR/q
 rJjYiB5tqAP0R01euj2yRt+cHccEeMzhIKTc+ZYxNZua4OZp+1lmLmoeOVBEC2hFz+yoqFWQ/zyLt
 +gxilN1U1THll7i43rvXW0b1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jBe6i-0008FV-7S; Tue, 10 Mar 2020 12:35:36 +0000
Subject: Re: [Announce] Samba 4.11.7 Available for Download
To: "L.P.H. van Belle" <belle@bazuin.nl>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
References: <20200310102157.GA27623@carrie2>
 <vmime.5e677069.403d.5e6bdcdf7b71b479@ms249-lin-003.rotterdam.bazuin.nl>
Message-ID: <0a8e9035-62b6-776c-6547-8ca70919b4d7@samba.org>
Date: Tue, 10 Mar 2020 13:35:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <vmime.5e677069.403d.5e6bdcdf7b71b479@ms249-lin-003.rotterdam.bazuin.nl>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="clG9EutDdIsgMQ0kiR45PUakZkOkd8ld9"
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
--clG9EutDdIsgMQ0kiR45PUakZkOkd8ld9
Content-Type: multipart/mixed; boundary="56qyYrfpgpY88VXHG3pnx7MmkODT1nbYx";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: "L.P.H. van Belle" <belle@bazuin.nl>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Message-ID: <0a8e9035-62b6-776c-6547-8ca70919b4d7@samba.org>
Subject: Re: [Announce] Samba 4.11.7 Available for Download
References: <20200310102157.GA27623@carrie2>
 <vmime.5e677069.403d.5e6bdcdf7b71b479@ms249-lin-003.rotterdam.bazuin.nl>
In-Reply-To: <vmime.5e677069.403d.5e6bdcdf7b71b479@ms249-lin-003.rotterdam.bazuin.nl>

--56qyYrfpgpY88VXHG3pnx7MmkODT1nbYx
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 10.03.20 um 11:48 schrieb L.P.H. van Belle via samba-technical:
>=20
> Where is LDB 2.09?=20
> I dont see it here.=20
> https://download.samba.org/pub/ldb/?C=3DM;O=3DD=20

Should be there now...

metze


--56qyYrfpgpY88VXHG3pnx7MmkODT1nbYx--

--clG9EutDdIsgMQ0kiR45PUakZkOkd8ld9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl5niZQACgkQDbX1YShp
vVY7OhAAvM27Sw8SXPbW9gV9ljlJWupcpDN9BRRJ+J3kDll2T3Or59RJJjyAzq12
AXec9Yg30NnYiAaYQgmMU747f6IBp/grwVjfRUNcK0uAnIXKlj3Nl7Kl01uqnGj4
fDLy2fCVWCLyD35nl6rnDyefqw1p23JzUu6j7c00mvFThds3yZIdadU9gpVrC13y
d0D4Z5PNhwWagy+vf691sqRBlyVhhiy/qIZL/9NZtc5pN07ZBn/bsafFadXbGRcG
FqtEUfyElo/ikoxyIDH70CpO64kJL/T3Q8Ul7XBWIanpiajwDe5EQHRzngeIfa0j
VY4oZra206JHZr60/O4yCwNWzC5vQt9g9IwDRSR0mjtVmW+WfrXkrnZx1gfNDgEc
XZmPymqNxli6RKACQPJSxZvRlENxaD+e0bcKg2xyxApSraTq1uo8NdDw7QsAwSMc
YQvdvQS8ulaTIvnsfIY8X7jiOgf6PB1cqGJa3Za9zPV7O5bdIelQiwGymAH/4NvB
0ftjTNdl0MreW0N4+D0BGJj16gWpILOqgHkokm27gU4Dh6cYsl+PBDwQZFKk33Fr
3d9Stv7WYA3kCaqni3d571k2TofT4+OhPJmnut4MNHYLWapg1HgV62U4XSXMCxy+
heHEo/Yah23wIOReHM8Aw8Mq6B8weQt5C5LCayPpZn1RxhAufY4=
=EGQ/
-----END PGP SIGNATURE-----

--clG9EutDdIsgMQ0kiR45PUakZkOkd8ld9--

