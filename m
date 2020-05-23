Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6C81DF71C
	for <lists+samba-technical@lfdr.de>; Sat, 23 May 2020 14:10:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=iQalqnALn7IsDd8eIz42ir28T535BC2hb5lJ6jDCuZQ=; b=cAbjDkosTzUV+ewB1ZFvx57xsw
	YDVFK7nFB6yXkVW4J3nj8G5JFPASNS5a4ND45d06ZdGih1hFwjZgrhA14fLDJ/ZslX49/1ibcWCNo
	iSbzKTsBykJHKfbCq29Lr6SVZNSUzyfdsb5ah4c/SwJhsbnjGH9iC6uYj3bphaLnVFMuaZBNtTAMB
	OVNzB2Y6LSze2ZlZewp0TYmvl+pjaISJBdY6Pe6gpm7f4kPIh37+pPDr/PH6LbLOF0b76EBq5cpJm
	WCBhJZMyQ1Q+HaLkLTqUl1Zpum783bu1g+EgfS6tzCl+s/Q48gREK3JJ0ZlgcQ0IPSELB235HZ6bT
	c+Wavi5Q==;
Received: from localhost ([::1]:18290 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jcSzC-005aQE-59; Sat, 23 May 2020 12:10:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11274) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jcSz0-005aQ7-HM
 for samba-technical@lists.samba.org; Sat, 23 May 2020 12:10:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=iQalqnALn7IsDd8eIz42ir28T535BC2hb5lJ6jDCuZQ=; b=g+PHml01n+s3JuDC4ojqyIC3WO
 rEDTLI/M0dX3KVQtZNYSzDH3A6yuyMyov5EKtqP/ZRZE7Hsg2XhYTyEBV/grWEF1tzz0XZ4/vRZiS
 FOCp8fwXIdjc9/ZCdojomApQGOzpc0H3YU2TCcR0+pRYbtPlXRw06ZSbLBwADT673Ozz10VOBPhV3
 av048oC1QCTI1hCslnYFWYEId3i2HWJ7hVKvkwYn9i82b5U39Xjr6P9brqs3rObPZfS63di7/j01M
 MoJswCDTW1RCl7Xh+d+ZivrZjoEvkBcI9xaeMFbWgv+D21OenfIkYtBrTPFy1AeLyngWLspK0+O06
 HlmQJZHW2LU2vorS1gN4mCrKH9wm9X8ZGaYCqpNKWGEOQRcqLbV+fwZtbpKqvbZ267cyezqMpDzvb
 EvrcuL/HAd0Um0JaVB9HwjVFXyWO3nhxsor5x0TwxUoA4wSE20DyDdd30PcGY379003xBy8qgpbON
 iIFl3Dxh/gG1Z68J7XD5c/B4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jcSyz-0007qV-NR; Sat, 23 May 2020 12:10:29 +0000
Subject: Re: BUG 14352: follow up on that bug. Still issues.
To: Rouven WEILER <Rouven_Weiler@gmx.net>
References: <0A3C18BE-42EE-4394-B2B4-CD183F0431A3@gmx.net>
 <2f3f9bfa-ab22-4ab8-6205-11f967a98c0b@samba.org>
 <1DC20ABA-03D5-42A5-ABE1-944A5ACBFE0E@gmx.net>
Message-ID: <4ba5717e-312d-c118-1ee7-caaf568d3c72@samba.org>
Date: Sat, 23 May 2020 14:10:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1DC20ABA-03D5-42A5-ABE1-944A5ACBFE0E@gmx.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="YdgYBHevsNGCTs4rAWevp2pHWkRLsjBig"
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
Cc: Anoop C S <anoopcs@cryptolab.net>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--YdgYBHevsNGCTs4rAWevp2pHWkRLsjBig
Content-Type: multipart/mixed; boundary="msUQ84ZGL7YVM1EfYPzEGJifM7aGR0fs7"

--msUQ84ZGL7YVM1EfYPzEGJifM7aGR0fs7
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 5/23/20 um 2:06 PM schrieb Rouven WEILER:
> Okay thanks.
> Bug is filed (Bug=C2=A014392 <https://bugzilla.samba.org/show_bug.cgi?i=
d=3D14392>).

Thanks!

> And yes: fruit:locking=3Dnetatalk is on.
> And another yes: removing it solvved the issue. (Wow)
>=20
> Is there anything bad using this option (outdated or so=E2=80=A6)?

man vfs_fruit

> BTW: The is another small bug in the code propagating mac os support vi=
a
> mdns correctly.
> It is related to the port for the services announced by the avahi daemo=
n
> which must not be =E2=80=9E0=E2=80=9C, but =E2=80=9E9=E2=80=9C.
> =E2=80=9E0=E2=80=9C is not defined as an ip port and =E2=80=9E9=E2=80=9C=
 is network dev null which would
> be perfectly okay for the purposes needed.

hm. The reference would be what a macOS TM server sends there. Iirc
somewhen someone (maybe me? :) ) checked this and the Samba code
*should* be doing what macOS does. But otoh maybe not. :)

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--msUQ84ZGL7YVM1EfYPzEGJifM7aGR0fs7--

--YdgYBHevsNGCTs4rAWevp2pHWkRLsjBig
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAl7JErQACgkQqh6bcSY5
nkZzDg/+LjizZceFjWE0SXm+pDUuRH7lqLH+ciRtYYJ8ukI/oDCQovMUyQH/Ai7E
wGJ7BgxvkFKq+/JJdZVih6EBgg1NlL2WoK8Pb57x5ykOAjAtAQRoBm3XiIkqjyhh
3X13ujOtKKdaDWS02cRIwK6vkHPrf+ocZwjyi3/rw1n8pBQO0qEiXbQW4rd2luVZ
LA/Ta3i6/lJeNPiOK+xttnajGeEvpL2jBrxr17TOAPL406LOjQEtxb+UMsaV+sVK
t3mdeUYyppGOhO3AFuVuvPwjS9BD6StLCPLKlZjYHnzoW1WPmmIVlzy6xWxfal2a
p629zEQYM3j4IF+SDSzG8Jcm2tvpf8bny/m/JA/5doAuUskemvDkkj715VDPMKzO
ULaRz9KRWOZOkhPtG6xq3T+gGWpUYTLXB2ITUXsi1o+bZAlQTOUIEckFA860AozG
Ai9sRxJU0WThk5xQqbtOX7QRt0u4GOmelItAV0FcPY0AZWuj2BQggKK41A3xLOT2
uU8w/2uR+hpWq9JTrqAL+XqA5FJIOr8W9i/D7IY9bVjFA1o+9jNjXRjHOaWoIOLM
AhFLcFvhhylu/Z9RmpxQGpOpti276JubbsIwugy3d42yWIjUWVAuQ6CmCupH76pj
JSWB4CxpvDodx7ONtc+Rwg4Ubd7Tmoay2zwUTaxMwXkkcJYoMKM=
=iYEA
-----END PGP SIGNATURE-----

--YdgYBHevsNGCTs4rAWevp2pHWkRLsjBig--

