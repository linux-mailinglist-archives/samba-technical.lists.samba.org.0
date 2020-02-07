Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C098715582B
	for <lists+samba-technical@lfdr.de>; Fri,  7 Feb 2020 14:14:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=3gpw4/RcCHamuRm/vHtalR5pi0pdHqZB01ZM2kKeWZ0=; b=38lY3UdbONZxkwuEq//QGkqIVK
	1FFKCGT8IWDa0VIi0jfrsmMOvS+vqeWFv2TSsLRncTgnLoCa/EB7FrVqIOYe7vKAMl0cpP/YROqYC
	Lt+HyrNckEu4xoSAW9lXRZ8tW9iKTRz/5jRUGvxKfFEalHrOLHD4C20bAeMVpQerO7F9UtDpjqjhG
	L6+1NSQlOB91hBMAbEgzWrEUIg7P8yIbHAV9dgFnDBjg1QlBsdEEx2TrUawcWeABSTNRllvam6wOF
	8qpUCjR/tVT6CSfCSvx+MM+fbm6B+6XIWwU+HmjJ2RqxgqyBXO/uoOfeFv+Sf40kYIu4GuTWHilzg
	lqR6JV6A==;
Received: from localhost ([::1]:21428 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j03SZ-008i0T-O3; Fri, 07 Feb 2020 13:14:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12240) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j03SU-008i0M-Oz
 for samba-technical@lists.samba.org; Fri, 07 Feb 2020 13:14:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=3gpw4/RcCHamuRm/vHtalR5pi0pdHqZB01ZM2kKeWZ0=; b=v1IvjM9CFqNovIcJNCclQmoIM4
 EH03PBxp9uWYUK7icWDxeSVx+GX4/ZxMrHD7NqWs/BnDce0+zA6YK7atZJTO+sJUCbuHyMfUp063g
 9T8rE5tDPF5PvOomsl0OPJQAGzB1prU+gAlcXqk1lqI+y5id1BuRsDs1IYWFMBWdRK7O8WHUffCuc
 yKg9Z9HJ1Cv0IpqQp74ZAS137YfKlSyf3u0Jf+4VbGM0yZR2Rpb7Ui+wH/Fsioe7rRE9eRCIZPzp4
 eDwyS1eBdzD5YIaR+YjPjsBj+/Fg6HpO3wrv6pty3Zjg/3sP2gU4A7YGkqndiBlDlZ6c3+tj2PLlQ
 44JFtU7DmK4Rsqn1+DyujulKopzQ2+temWR9HDFTlmsRfSmS/p4Ls2CO/FZ7zKinpEjv8UEf0eCoC
 YnKUszxTLnfXKIy4G90vNECZ9rtZtI4KBah3CWLxCjE4xI81etLlgn2Hw6TCvho0fabuuDj06U8D8
 bq7VcCvM0iytgzeL/KZ64RGz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j03SU-0000eu-8W; Fri, 07 Feb 2020 13:14:10 +0000
To: Jeremy Allison <jra@samba.org>, samba-technical@lists.samba.org
References: <20200125002104.GA188423@jra4>
 <9de9b007-07ec-e9d2-f2ff-8c3c4eee215c@samba.org>
Subject: Re: Linux io_uring VFS backend.
Message-ID: <f8f26e1b-8cf2-7d66-2dc1-2dde874b2083@samba.org>
Date: Fri, 7 Feb 2020 14:14:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <9de9b007-07ec-e9d2-f2ff-8c3c4eee215c@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="4dQgLYBnt28N3DbGsOF9JnJr46NCVwhWE"
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
--4dQgLYBnt28N3DbGsOF9JnJr46NCVwhWE
Content-Type: multipart/mixed; boundary="InuN5k4NQIzbwtznIDXyIkczEeR0fgFZX";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Jeremy Allison <jra@samba.org>, samba-technical@lists.samba.org
Message-ID: <f8f26e1b-8cf2-7d66-2dc1-2dde874b2083@samba.org>
Subject: Re: Linux io_uring VFS backend.
References: <20200125002104.GA188423@jra4>
 <9de9b007-07ec-e9d2-f2ff-8c3c4eee215c@samba.org>
In-Reply-To: <9de9b007-07ec-e9d2-f2ff-8c3c4eee215c@samba.org>

--InuN5k4NQIzbwtznIDXyIkczEeR0fgFZX
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Jeremy,

>> Any chance we can get the io_uring VFS
>> code checked in for 4.12 ?
>>
>> Would love to see that as an option
>> for Linux users.
>>
>> I'm happy to review / test !
>=20
> Look at https://gitlab.com/samba-team/samba/merge_requests/529
> I just rebased on current master.
>=20
> The ubuntu 18.04 hwe kernel is up to 5.3 now.
> But you need the liburing library from https://git.kernel.dk/liburing
>=20
> I typically use
>  ./configure --prefix=3D$HOME/prefix/liburing
>  make
>  make install
>=20
> And for Samba
>=20
>  PKG_CONFIG_PATH=3D"$HOME/prefix/liburing/lib/pkgconfig/:${PKG_CONFIG_P=
ATH}"
>  export PKG_CONFIG_PATH
>  ./configure ...
>=20
> Note it won't currently work with a 5.4.15 kernel. The regression
> is revert in 5.5 and most likely backported to 5.4.16.
>=20
> Please test and it and play with the possible config options.
> If you can provide some numbers, which show if the options have
> any impact.
>=20
> If everything works out ok, I'm happy to push it to master and
> backport to v4-12-test.

Ok, I've done some basic testing and I'm able to speed up
a smbclient 'get largefile /dev/null' against smbd on loopback
from ~ 2.2GByte/s to 2.7GBytes/s by using the io_uring module.

I've added at least compile time tests for gitlab
and removed the WIP status of the merge request.

Please review and push to master. Once it's in master
I'm happy to backport it to v4-12-test and write a WHATSNEW entry.

metze



--InuN5k4NQIzbwtznIDXyIkczEeR0fgFZX--

--4dQgLYBnt28N3DbGsOF9JnJr46NCVwhWE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl49Yp4ACgkQDbX1YShp
vVY19g/5AWJtRpXt9si/DXtHJvja89THj22KaRe3ErUZ+U3Tftp9oRgnWzojSKys
/oo9hbO7UWWAMcw3LKyvBsJEQDlnMkmkKNC6YHzCimq3XGRPT7aAGh+MkdL+r1f9
k3h7bPMgr7+Mvbhs2JpGfK9hRV6nSKMy4YF5YQzAlRwHH4ZHFjKMZiAHZSI5Rqoj
knfNBV6HSE2tget2BAbdK+EHIaNaORxZe/XLttU4I3Fy58D64PZdFIJwCWvtzwEI
RIdMmsfJHxtH/KNsDPa2ikKsbCZcCgPTvEHnNdSFGaB5enpmsE/R2izK8lOP7TM/
ymcxqy+ynoyquwB78aix/eND0H5Ns26CV08G5haiHx+4qywW5bcq8IRCNtNXGDQ/
tOuLZAMnc6Cjr3CQoWr0T9/MCgECAuUNH5qrcnw4njVoqfzqbs64AognNKFmNEtj
D3ZopHDQqbFp3iwP+9rGRrRUbcQpCac5hj+5Dp32zjMGK73mqO2jba5Bu/n84/sH
5CtDByWu3aVScEI3CyxtjPVABa3CS7S6g8C3v9QxHLoDVwdwZGyu7lsHI/LgzsgD
0iB+Cw1B3YbviCNI01cCfupUOZ5KE+qoBfMUvAu3otlDy81tYHFm/A1UU1rmJeDn
Qp0Bd1leCRxoAESOrLN0ocvgwbtfK+L+feURq7DXwKyXZYKJNIs=
=0SU4
-----END PGP SIGNATURE-----

--4dQgLYBnt28N3DbGsOF9JnJr46NCVwhWE--

