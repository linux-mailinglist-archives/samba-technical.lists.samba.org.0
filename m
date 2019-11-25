Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DC910108B80
	for <lists+samba-technical@lfdr.de>; Mon, 25 Nov 2019 11:18:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=yqEvMxYKnCuih+cfeF6R4OAhJlerVDjEEW0hXN4hNro=; b=58B7u3zmwUaraSx65dX2xPAx8d
	RO6vME3aP3ZPHotczSlEEDvXieI9QJhdCzPJ1NCNRb/ETZpAPW8c7ayAp+/tX+uR6+dw+ofVLiX0u
	6SUhjSmv+lHx0D2Vh+JMPWyNfEDkVR4H8A6aW856y5NBdDyCVkWGoVPUk7cQxGHWbyyuj4LQc5ILZ
	Lx0RQM0wDnU3MiVn8h1KR7yF5fqPxiyfi7FztBHenbMrWrDNNxjG2Y+9IVVP0ax2/T0z38YCC37Et
	7NMsWL/L/nSSkTysgCbC6ysOKC4hVMVHvFGCw7dDURVEC8shlcqy6KnMJyPuPB6icunMqqxNPMaXE
	x4vS5+CQ==;
Received: from localhost ([::1]:50558 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iZBRp-002JsN-NK; Mon, 25 Nov 2019 10:18:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54460) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iZBRm-002JsF-76
 for samba-technical@lists.samba.org; Mon, 25 Nov 2019 10:18:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=yqEvMxYKnCuih+cfeF6R4OAhJlerVDjEEW0hXN4hNro=; b=YEbHqfkfF3PPxjQIX9mdUapoOZ
 lqWczUgwGEAJ6Vg2EYBqeNlW7TBWu/3RmKh/cURAvjg3Hfov8xZ/04ywYIyBrXs3T7UU1KYUhOJfN
 0w+tuMAR1JWcqFxELnNNgNHdumxsAk/lI9H97rYeC8CSUCvAc0YsVejpQnwurxB14Cx/Ej6pxGOTo
 1bHqAp/jZi5erWS/P+Cj4k5z22p3mtXVmbMNVAXqDM3ONAZYDxgxZ3fbTMDQvyu1M7/RixG3MPzv7
 ZzP60QWN/tpoIrf0Kfy3gs/pOGK5sH7gn177B/Eg0QnR2p/B5UVK49Ehthpvja4Q0k0WQwbBJ2kHX
 jPuRbZZyXNEbEfoiPEN97D2Wt7LVh5TJxELP+ERGcmBz6sglqdIaeFHw5z2GZnAlkCNi5f00AWguS
 Ck4DDCJuw/vYdxefYYKMsAskRSDyKic9Ukl2dKF7f47TTP+qhFVkvwPuTdF1uN54hhpD5M7FEidCX
 ECoOS7gchpqnc3oVwyfphWkO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iZBRk-0002Bt-GA; Mon, 25 Nov 2019 10:18:20 +0000
To: Andrew Bartlett <abartlet@samba.org>, Karolin Seeger <kseeger@samba.org>, 
 samba-technical <samba-technical@lists.samba.org>
References: <b809fe9d-b399-c13a-bdc5-0680d140ca6e@samba.org>
 <67329ddb56bab6d6091afa089ccbcb95bcdd66ea.camel@samba.org>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Subject: Re: [Release Planning 4.9] Another 4.9 bug fix release
Message-ID: <402d1722-4c92-b7ba-5590-2913a69bec2b@samba.org>
Date: Mon, 25 Nov 2019 11:18:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <67329ddb56bab6d6091afa089ccbcb95bcdd66ea.camel@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="qj7og2SzOsgG5v7lrDfrSHHa7468g8n6H"
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
--qj7og2SzOsgG5v7lrDfrSHHa7468g8n6H
Content-Type: multipart/mixed; boundary="MBKLWN7tCR9QJciOqrFpgeHjLvVNeo1d8";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Andrew Bartlett <abartlet@samba.org>, Karolin Seeger <kseeger@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <402d1722-4c92-b7ba-5590-2913a69bec2b@samba.org>
Subject: Re: [Release Planning 4.9] Another 4.9 bug fix release
References: <b809fe9d-b399-c13a-bdc5-0680d140ca6e@samba.org>
 <67329ddb56bab6d6091afa089ccbcb95bcdd66ea.camel@samba.org>
In-Reply-To: <67329ddb56bab6d6091afa089ccbcb95bcdd66ea.camel@samba.org>

--MBKLWN7tCR9QJciOqrFpgeHjLvVNeo1d8
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 22.11.19 um 20:08 schrieb Andrew Bartlett via samba-technical:
> On Wed, 2019-11-20 at 12:16 +0100, Karolin Seeger via samba-technical
> wrote:
>> Hi,
>>
>> due to
>>
>> Bug 14175 - Incoming queue can be orphaned causing communication
>> breakdown
>>
>> there will be an additional 4.9 bug fix release asap.
>>
>> Are there any other important issues that should be addressed?
>=20
> I'm swamped, but this looks important and Denis suggests it would be an=

> easy fix (just more hard links):
>=20
> LMDB domaindns/forestdns partition corruption with bind9_dlz
>=20
> https://bugzilla.samba.org/show_bug.cgi?id=3D14199
>=20
> I certainly won't be offended if someone else fixes and backports it.=20

As this is not a regression, I wouldn't delay the last 4.9 release for
this problem. 4.9 is already OEL and we only do one additional release
because there was a regression in the last release.
If someone comes up with a fix it will be fixed in all
supported releases, as always.

metze


--MBKLWN7tCR9QJciOqrFpgeHjLvVNeo1d8--

--qj7og2SzOsgG5v7lrDfrSHHa7468g8n6H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl3bqmcACgkQDbX1YShp
vVYqOg//b3of154V9CEkrK2g9QRwURc/HMSLHGs3qNDD1aM1H3ZXrcvbCou+LoUJ
ZppXIMqooYAtp+u+itpfASHtEj11YiscxVXy63aEUxD3zoq73YIRXw08OndEllap
yfeY2QE8n3NQ5AYiJxTM22BNSIAZ5Jodqosv54MBbdwX7qFMybcP3yAVtde1XQ4T
F6NfzUoBqUY8QDmHmwbebhqQLXQc7/UZLWKOa/rlXGHKD8nxA4Nqurj7wJSVgmap
CeHyfvo+GHEeSKw4Z6y+v71Z4EVqKj+95lp6MbvWwmLCweyMnoiX5ZDh8twhmljg
r49QYfOgwXTTgkraikShDTpoCQQ0X4ojhxWg0oJp9upVjAk24OpYfQfuGCBS8oP7
hgE6evh9il2seUvEAlZ2fzZTj7JzEGPOSGqAmVWFTAnUiLnwHpaD0fowRIVKde7/
5K4wp6WpSa5EzSkLqLQ+HNqymxiKpSV6M1QFOvwjsIwfE8GDYju7TMnl5HabciRv
iMWp/UQ85yT2OITOGdOOcWyYiPJDybg8TfeCooW8ncUcX38CL50uB3uluzJRFTfc
eeID6KcV8KpfjPZLor9eskFgO3wAW5Y1fairuwTUGQEFidHVr7TJio7C6GMDUCLT
98DiFcl0CPDx3UkJv1OlxOtRegWWKBG4V7H7fnHDSXcsXje5YgM=
=AnHk
-----END PGP SIGNATURE-----

--qj7og2SzOsgG5v7lrDfrSHHa7468g8n6H--

