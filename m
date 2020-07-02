Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6ED212D37
	for <lists+samba-technical@lfdr.de>; Thu,  2 Jul 2020 21:40:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=NhbolyHeDS3jsqcEcxsCIJYE5U4TAldIfwj4gtTAIu4=; b=U+0VF+FIp8XnO1cny29QMTFEap
	5zu2z3kRMVA8/FRkb2BE8ULesNZiHTob3oDifI0yXBv1svxQs16tDbdHouRzHF5IYGFGd/KFD5gEP
	j/QFwxMe+fYX55CU0w7RTlLKE8Xj0PebRWwWT/T1nfYgEfdXfw1GIuYiO8qv3e9jxljRlRtVBKPAa
	MbIrGk2ikat8SCR/1S8Y+yCmIEbdRvpptMGY+r6NcCLtZv3mgX0XGU0GzyiWDB5MIqcwqAq3f65XB
	hv6nDXqEADNC/x9wBsSZJKfFbgFgof+kqLOoXnCjwRNBkmjx4xQkflOaEELfr0v7KDRS5/2vX5nWz
	OZYIeayA==;
Received: from localhost ([::1]:31832 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jr54A-005APb-D9; Thu, 02 Jul 2020 19:40:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60886) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jr543-005APU-ED
 for samba-technical@lists.samba.org; Thu, 02 Jul 2020 19:40:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=NhbolyHeDS3jsqcEcxsCIJYE5U4TAldIfwj4gtTAIu4=; b=aJETnR5RW1PZghAflzs2K2hTTX
 daI0c00C3RKTXJBiyn4XrkB5KUoZsGVZZ8QQLFz5s5xT0xd1XBZvq54FoB6F3arnE/4BTUPx6Dmmb
 CU3ikKcCGItebmIqv7JUHpDsTG1lbExym73ddBYeftBcSAwIpEujUHZCQJRB+JBRKTUC0VMKkiG8l
 DYe470W6KeD1//CAQToCYoCw9zYz6lEUK+2FK3JaQwW528je48mEGzF6Y447BeNuzQGIvnaExy6k2
 E6RL2WEeVJoBtYsN9Qj8raicUl0CJ9mJSPmUckHrnbiwXcUQf8odh9On6+Ksv4QWCJ55y5FNYsLgW
 obo+dFfYZ+U17VtwfbeorvSIjYOaVZ1PJCeXzqDIJNiuq72rHtqUde7l74w6/wpaJnEBtPEtsfqNz
 3AasLUBP2nuSDoJFTYqJUMiCrHGL2kGw/uMROf5Q26srf93ccwQLfNripE4g4zkark+L7g+vDckar
 ezNHfZ7uGLWmJL3Hr92HYJpX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jr542-0002HU-7h; Thu, 02 Jul 2020 19:40:06 +0000
Subject: Re: libwbclient (LGPLv3) linking to samba-util (GPLv3) in Samba 4.12
To: Andrew Bartlett <abartlet@samba.org>, Swen Schillig <swen@linux.ibm.com>
References: <4160624d8abe5a0d8d7a31573068746b3e19e439.camel@samba.org>
Message-ID: <053bd96d-6633-26f4-ddb3-7f447e42c17d@samba.org>
Date: Thu, 2 Jul 2020 21:40:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <4160624d8abe5a0d8d7a31573068746b3e19e439.camel@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JUIvAHBof3Xg8dZZ2nuFzNYJGoyNp81cb"
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JUIvAHBof3Xg8dZZ2nuFzNYJGoyNp81cb
Content-Type: multipart/mixed; boundary="noVk69AtxstQY9ZbSMSday5yqsdDmZSRM"

--noVk69AtxstQY9ZbSMSday5yqsdDmZSRM
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 7/2/20 um 9:30 PM schrieb Andrew Bartlett:
> G'Day Folks,
>=20
> I just noticed this because debian failed to build due to an extra
> symbol added to our internal samba-util library.
>=20
> samba-util is a 'big ball of mud' library of Samba stuff, licensed
> GPLv3 and very, very helpful for stuff in Samba.  Work is slowly
> happening to try and pry it apart into a directed graph of smaller
> libraries, but for now that is how it works.
>=20
> Either way, it is GPLv3 and is therefore not permitted to be a
> dependency of libwbclient, which is our tiny winbind client lib for
> linking into OTHER PARTS of a running system, eg nss, pam and
> potentially other tools.  It is LGPLv3, and important distinction.
>=20
> I don't know why our ABI stuff didn't pick it up, but I know some on
> the team have ideas about how to reinforce that.
>=20
> We need to disconnect these two parts, then try and undo the damage in
> the distributions due to the extra symbols.=20

drat! Sorry for this mess, if noone else gets to it before, I'll take a
look tomorrow.

Cheers!
-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--noVk69AtxstQY9ZbSMSday5yqsdDmZSRM--

--JUIvAHBof3Xg8dZZ2nuFzNYJGoyNp81cb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAl7+OBUACgkQqh6bcSY5
nkZRlRAAiY+acXoaxT0Ei6owilCcqu0ZIQXkp5GZZqPelPjmjkur8HVYqK+Mt1ag
2MITqr+TyReTdeVaK7dLBw6E9aK0vGQXY9o1LshIcj+bfbKtbTt7BDsvDug5fF52
uAw1+PKi+SumSbD1ZvqKvIKnR9TDN6mjCmxyldWycgRjrzBWezHbI6bn1ZPNeHYd
KblpyC21n3V0QhePPdNaItOkSUxfc0fVZ6JqIFTyJKr1lorsvf+ZTndMBcDdBBVd
S06hvpnmKz9D5Z3BTHoMpTWZn7wylFBnTuJ9F1K2cMHpZHTILJYqeeO9WeIXd1x/
DZlT/h0xqGrVTM5RoeeAtUhUQto4FlbEqIN1/g7RQ4z0dPBg8GxnjMPqKhQ6Lhy7
BRYWm1R20CuoEu/NboBXd4XCJi+B5ajNEfnf5r1IEikebhmTiP1puRlFs8D/YAK3
SetA2azYGRsDTbC2IyN574lz5baEhgi/B/c4J7oZxc+fCIgBxOezLQE8IwjE8aB7
RskmKVut8aRkFDLdlAv03ZXiJc7unAyJWAB2uqfmTnhcAv9FMEWjg/25A8JKz4nV
9w7eSbwoV7MEMP5bPG6B5M3R3w3gaMhcjfs3Q5zTJEzgzsIbvFs5L9URPmVtyQWX
hIOofuBguPxrrPlYmRhwzdpUUTnuWJcU33OVsLMX/p4JgalaTOo=
=/ebD
-----END PGP SIGNATURE-----

--JUIvAHBof3Xg8dZZ2nuFzNYJGoyNp81cb--

