Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 598AC95D27
	for <lists+samba-technical@lfdr.de>; Tue, 20 Aug 2019 13:23:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=loZtC+RYWbLQiVBxKe8AWXywJtEACOiN8rroe9PWx80=; b=G1V22bi74CM9wwI2yVql3rUPQD
	2sKTTMxoU4jrwoIkJ81jeEZiR09YYS2nOm8NwUssRA7KLiDomwnoTM4BFynHfB3yPIcbSffrkEPSF
	xMDYpQjKkrlhuiEHlMr1t0cquixHu2QUt6lI9slaVnFDFVfsADj+JBxwBB3M6DSk75c+aX+Dbl440
	tJmr9zfH8SE5OREjaNOPGQGeNREYJtmVYqokyFqf9s356plkJoCSkjq38y00aDvTQHyxRDv147nXX
	bbIPvdwRrfWc5fOc/FBzeC3ioLW7o+0/yLGub1YEykrer5Q2RuoPcszrDHgIDHKRNZQTv6zTDESqa
	KEdhqfOA==;
Received: from localhost ([::1]:60364 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i02ER-007ELc-0H; Tue, 20 Aug 2019 11:23:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53476) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i02EM-007ELV-63
 for samba-technical@lists.samba.org; Tue, 20 Aug 2019 11:23:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=loZtC+RYWbLQiVBxKe8AWXywJtEACOiN8rroe9PWx80=; b=AUV07n5lSApmAYVWIcgzNA3Hok
 lgbKap7nP204eVw1eMFuP8mnGS6owZW37ZCajHVxNkVLIAgaZ2Xq6uF1i/R2Wfax5F2BfgBHyXMwm
 klaJiugGQcPfgmunyGDV8LOTPW6R3l+iWGRr1UCOs3fEoVw6Hl1BLReDMzMiI3Vzj8pA=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1i02EK-0005rB-7p; Tue, 20 Aug 2019 11:23:12 +0000
To: Nico Kadel-Garcia <nkadel@gmail.com>, Karolin Seeger <kseeger@samba.org>
References: <81b761b3-676b-b3f1-1fc8-589f744b2c2b@samba.org>
 <5f29fb14-11b6-3f86-3804-6ea7020b4573@samba.org>
 <CAOCN9rziEX8YKiYA+GCdzcKjzvomW2Dt9y=RGO5_UD+xt8DBhQ@mail.gmail.com>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Subject: Re: [Release Planning 4.11] Delaying 4.11.0rc2
Message-ID: <cdb9c9d0-e4cb-9739-de22-1bdc93ee9187@samba.org>
Date: Tue, 20 Aug 2019 13:23:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAOCN9rziEX8YKiYA+GCdzcKjzvomW2Dt9y=RGO5_UD+xt8DBhQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="X9bSkRdn4TfVQGlZ9MfPWzoK4xE6FXi6z"
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--X9bSkRdn4TfVQGlZ9MfPWzoK4xE6FXi6z
Content-Type: multipart/mixed; boundary="MwEOaTcDcKbWsmSXEr1FVyqnT4TAsAkE0";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Nico Kadel-Garcia <nkadel@gmail.com>, Karolin Seeger <kseeger@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Message-ID: <cdb9c9d0-e4cb-9739-de22-1bdc93ee9187@samba.org>
Subject: Re: [Release Planning 4.11] Delaying 4.11.0rc2
References: <81b761b3-676b-b3f1-1fc8-589f744b2c2b@samba.org>
 <5f29fb14-11b6-3f86-3804-6ea7020b4573@samba.org>
 <CAOCN9rziEX8YKiYA+GCdzcKjzvomW2Dt9y=RGO5_UD+xt8DBhQ@mail.gmail.com>
In-Reply-To: <CAOCN9rziEX8YKiYA+GCdzcKjzvomW2Dt9y=RGO5_UD+xt8DBhQ@mail.gmail.com>

--MwEOaTcDcKbWsmSXEr1FVyqnT4TAsAkE0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Nico,

>> Am 06.08.19 um 12:55 schrieb Karolin Seeger via samba-technical:
>>> Samba 4.11.0rc2 will be delayed, because library releases are needed =
first.
>>
>> as the proper fix is not available yet and I have no idea when it will=

>> be available, I would like to propose to ship RC2 tomorrow (after the
>> ldb release) without addressing this issues at this point.
>>
>> Any objections?
>>
>> Cheers,
>> Karolin
>>
>> --
>> Karolin Seeger                  https://samba.org/~kseeger/
>> Release Manager Samba Team      https://samba.org
>> Team Lead Samba SerNet          https://sernet.de
>=20
> Only that Samba 4.11.0rc1 depended on tdb >=3D 1.4.1, and I've not seen=

> that published or a tdb-1.4.1rc1. It's slowed me down from testing the
> new samba 4.11 candidates.

I'll do all required libraries for 4.11.0rc2, but just the same way
we did for 4.10.*.

Every additional change, like
https://gitlab.com/samba-team/samba/merge_requests/374
is too complex to fix without further delaying Samba releases.

metze


--MwEOaTcDcKbWsmSXEr1FVyqnT4TAsAkE0--

--X9bSkRdn4TfVQGlZ9MfPWzoK4xE6FXi6z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl1b2BwACgkQDbX1YShp
vVbmshAApvQWRoZCoMhhJ4Vi7Dq27mDyzMp+Z0AELtK3Sl02doRhPP9C8vJIQ1Lk
pq0yurGVUOf3hPzB+Mj0B+E2l6j1s2lqW9ec8zWlDe4k4rB80jm/tQm0sINrUcuL
gtFxp0y4QE3Fx3le7zMVwfmfOX3MqOW0vHdpAjt6TO7kQ17rX5bhVkMCg+6q7RmQ
EPKYzTlMA0e2O+lAe5E+GyYeN2ex8NqYmDy+gSn/ddoTuUppNlrg80GDVRpTcLbU
HpMjiq25VPQXeUl+78evlLQeBVkgUpr+q5gNJlv4+RPwuONgBnNhW1k6mHtURr+z
TT7hVv/zrhXmnfEd0/jyo1UdyWcpogvKf5teEPm2fnqv6ge2OkhkH2hz6U77i4cG
NJdI5OQZEpWE5V+Hn50viviGnkdusAXYImeq4DfYU54tyvJMWu0oVFCCpBwZIpdi
mK0opdu35ynEnaCoj4/kou5VMZ+oJbZckA1WpuTmnj/W0Hmzlnz/4JTJbLmv18m9
F392QvHvHekFrh/ICXckt2V5zfXMa2+/kBasYh1Vqw8sE4E9sVq9lpDpTqohxNg6
feLr78aLWiMi/sAWyp7fR4OBmOZwi79hL0zbuU8f5IfhE/U24UkVM3zWGhUXqQLH
dVE1WfEGwa9X1MBgEzERWUwMUhXceExKGN2b9BXZPGv2Sfj/gvo=
=3Wnv
-----END PGP SIGNATURE-----

--X9bSkRdn4TfVQGlZ9MfPWzoK4xE6FXi6z--

