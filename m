Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 703FB400333
	for <lists+samba-technical@lfdr.de>; Fri,  3 Sep 2021 18:23:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ED898tVeUulJ7pyvUc+E5HPfSVZDCZUWNXPBpRg9GII=; b=Ngm34LmZT0YDVP25uBgitmdZhd
	n/f74xGcFQ6x5HUuEdgwH6kcvutOB6Jg3HS5QlcOfNPx6GBOd2Ym0LldoSLoxSwtPHE6QiDwtsRK3
	KUEkQ/UE7Pp4ql7o+A3AElpGurJMNtCiKismaZi1jR5ENGheC3BcDRkX0S77hDEh9wlkYLZrXz0az
	+qVg4dxhOsBRnICs879q6hu43ekEpOfDKRM6EDICCLbpWKgrHQr3f730oyRvgtF6olWMfTRKL5wIS
	WNb0dVOJ5kl6GGAvqqrfWzvENqs2Nby5kJe2OqNW1F9pjxxdYxB/vWCzw3x3VfaBuNkTlaE3ktQHS
	QLIXgD0Q==;
Received: from ip6-localhost ([::1]:55568 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mMBxe-00DCvM-W9; Fri, 03 Sep 2021 16:22:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29944) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mMBxZ-00DCvD-0V
 for samba-technical@lists.samba.org; Fri, 03 Sep 2021 16:22:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:Cc:From:To;
 bh=ED898tVeUulJ7pyvUc+E5HPfSVZDCZUWNXPBpRg9GII=; b=TUFsU3fkOmnd51D/YAxr/ZSbOH
 JvPmRXkxyBJ+eKrUsX4i1K80U2XSk5i9naKV8YP4+25Ncm3WPHfbjO4GHujFX0Xjg3+fVZeHCymFR
 PLvxi64/iye2XfQyHNevfcXaas3ix+Q25FBmGv+KHdSoDPNt1kgE0fJHAW7/FKZwsGiyQqhQXjEfH
 gepvjvTLL0SqTpYMh2y3D91/e2suntQyUytKPIi+AqpR9vID1khCWwgK5049WhF3eEu+ziGKE3Xy1
 mVOQBWjR7fpIvkQuwKUjChK1GhZHEslvAC4UWUaQ/YE+V8m6pgdegrGvEcSO08j4k4ighO/63OSNl
 emx7a+VbWlbNY+gG2MLVkbcJDT7qE6oO0vyAybNPvlFMhva7NFjS5VHmIbqGnwINFLFqqy9JqYzh2
 TlQ8LEqb2P3DrDeRF09MpIZrjU53ai7miCrMxm+J0R8g3XKcCJ/LSNIyYrB60sxzGQZo6Zo2V1kCH
 rjdMkpcLNidTRyz70tVtzIRU;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mMBxW-004U8o-NK; Fri, 03 Sep 2021 16:22:30 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: HEADS UP: The Joys of Logging, or subtle behaviour change of logging
 in the daemons in 4.15
Message-ID: <f4ce9085-24be-55fe-e71c-ac7c67b845e4@samba.org>
Date: Fri, 3 Sep 2021 18:22:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="oQsLfgWFIkUuxfjZDpl1GiDmNE0KI8Bwp"
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
Cc: Jule Anger <ja@sernet.de>, Andrew Bartlett <abartlet@samba.org>,
 Stefan Metzmacher <metze@samba.org>, Karolin Seeger <ks@sernet.de>,
 =?UTF-8?Q?Bj=c3=b6rn_Jacke?= <bjacke@samba.org>,
 Volker Lendecke <vl@samba.org>, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oQsLfgWFIkUuxfjZDpl1GiDmNE0KI8Bwp
Content-Type: multipart/mixed; boundary="p10MP8XP4QDNie8XQVEN9c3OW29jBfKfQ";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: samba-technical <samba-technical@lists.samba.org>
Cc: Jeremy Allison <jra@samba.org>, Stefan Metzmacher <metze@samba.org>,
 Volker Lendecke <vl@samba.org>, Andrew Bartlett <abartlet@samba.org>,
 Karolin Seeger <ks@sernet.de>, Jule Anger <ja@sernet.de>,
 =?UTF-8?Q?Bj=c3=b6rn_Jacke?= <bjacke@samba.org>
Message-ID: <f4ce9085-24be-55fe-e71c-ac7c67b845e4@samba.org>
Subject: HEADS UP: The Joys of Logging, or subtle behaviour change of logging
 in the daemons in 4.15

--p10MP8XP4QDNie8XQVEN9c3OW29jBfKfQ
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Hi folks!

The release of 4.15 is scheduled for next week, but we're currently=20
struggling with a subtle change in the logging behaviour of our server=20
processes (smbd, winbindd, nmbd and samba that is).

This is a subtle side effect of the great work done by Andreas=20
consolidating the commandline option parsing of all tools and daemons.=20
It has been brought to out attention by Bj=C3=B6rn Jacke here:

https://bugzilla.samba.org/show_bug.cgi?id=3D14803


In eg smbd there are two subtle changes comparing 4.14 and 4.15.

4.14 behaviour:

1) When starting eg smbd in daemon mode, initial parsing of smb.conf by=20
lp_load_() goes to a logfile.

2) When starting in interactive mode with -1, logging goes to stdout.


4.15 behaviour:

1) Logging goes to stderr instead of a file

2) Logging goes to stderr instead of stdout

Note that 1) affects all daemon processes while 2) only affects smbd and =

nmbd.


The following MR addresses all of the above

https://gitlab.com/samba-team/samba/-/merge_requests/2150


Behaviour of 1) is restored to what we had in 4.14.


2) is addressed by opting for stderr instead of stdout, ie

- in 4.14 all daemons were logging to stdout

- in the previous 4.15rc's:

   - smbd and nmbd were logging to stderr

   - winbind and samba were logging to stdout

- with MR 2150 all daemons log to stderr when started with -i


Not that all of this really matters, in the end it's just logging. But=20
given the vast amount of tooling around logging these ways, we're=20
worried that the subtle changes in 2) may be an issue.

1) isn't really problematic, but what shall we do with 2) ? Go for=20
stderr as implemented in the MR or rollback to logging to stdout as we=20
did in 4.14?

I'd vote for stderr, what do others think ?

Please note that the 4.15 release is handing in limbo until this issue=20
is resolved one way or another. :)

Thanks!
-slow

--=20
Ralph Boehme, Samba Team                 https://samba.org/
SerNet Samba Team       https://www.sernet.de/en/team-samba
Samba Development and Support, SerNet Professional Services


--p10MP8XP4QDNie8XQVEN9c3OW29jBfKfQ--

--oQsLfgWFIkUuxfjZDpl1GiDmNE0KI8Bwp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmEyS8UFAwAAAAAACgkQqh6bcSY5nkav
DBAAjC5xZPNObojEmRSehV0YelUan0GB1lbbXHKLmQIdMtg9RbXfwb/fU5cZtBOw2/5lTUCaAv5p
vKhhhvHlgMdSQG1Z/6LW9ZDGCKjm5jkGmLabo0CCQrBhp+7fckQWG59Fm2oTuOOP06r8eC5jk6K7
j7ADducmiO5b7qGMynt4sTZq7PwutH19R1474yWimEH6h9lKVdYWv46EGDJJmiwQtLj5hIoQL71Q
li1R6+ijxDRMLwK4FFn7P9Bi9aU5ApGpN0uR1pXcFF1HwzYdrfCTbzt0yw5cyHg/J+QlqtnD0zLM
6eMZ9M/X6JSt4mRbnWzqZOZDkHSaYtFL2ynV2UtR50qCweXA474Ut+A4J0S+Wyj69Ts4WPvfVJbo
WMK5F4IURc4f96S+eLEH/S6pO0bebJOtudQXFP8l6u+DaR5pEFtIflIhpPYBqRRNtMNxdiutr8Cb
XakI3HPmPglKdKMRs181LiBwsBl8up660Gec1yzEUxlWipwpU1TBkRT4X8QeR0VEDf0FKI5dopJX
ZSI5/cC0EJr9MLkmylVf2zE7sCOHcdgnPadZfxJ11P2dkQerPRHkXEVy/Sqf7oiSIwpfPq1oWvkA
Vo3vFWIBztu7K5ngF2jFOKDD4TPFI37QmNbHfhPBKd3dd2C9sI4R6irs1G3dcYzb0FqEDONCGogU
3wQ=
=9Mds
-----END PGP SIGNATURE-----

--oQsLfgWFIkUuxfjZDpl1GiDmNE0KI8Bwp--

