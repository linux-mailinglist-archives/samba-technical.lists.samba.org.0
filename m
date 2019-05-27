Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CC12AEC7
	for <lists+samba-technical@lfdr.de>; Mon, 27 May 2019 08:36:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=mFJ8MZzzScrHAntdoq9VHrN483YO5dXNlu71FJxIDpo=; b=JAyC99oP5NxyslRx0OTdHqKt3B
	LN+GrjS93NPD5pfUWA0A3OewD1P5b06wHrfqWJkE4v1bYnYynWrIW0ZdrLlWYVqerFbHmmrfaaAHo
	NH0SZxwiokLgJPTP5IPeqNzL4Eh61eh62AOrJzAgi6cfpPNpkjhISHqYG2eTUQsmt/5RbdZ3/ic1p
	BYFF1lBxAWxf5Q9tApmFKVSnovxw31pqT7JiB+6lKEcu4LaIK7Jxlrqu8bxn0vm2tVWu9hVdfCLsn
	qQO/TEDCV+GEQdgRB5IJ1lfZ9X/ss9fQ6f5bK8sInJav4Nx0U7IbflZ9aseA3XnBEXXdixXgauvbP
	M7dJq6Ew==;
Received: from localhost ([::1]:26972 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hV9Eg-0025Ms-Vq; Mon, 27 May 2019 06:35:55 +0000
Received: from [2a01:4f8:192:486::147:1] (port=32198 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hV9EV-0025Ml-6o
 for samba-technical@lists.samba.org; Mon, 27 May 2019 06:35:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=mFJ8MZzzScrHAntdoq9VHrN483YO5dXNlu71FJxIDpo=; b=JU4sWHVSN3kOf15g6dRN2Y1FO3
 TrlMfsxnpCgoSFUqv6mbGXb8mL46N1K3UH/QDBGN26xPfFGzGvVfI3f6FVuI7fYxYMVCVp+cnuLo1
 OsI1EKK4gcC1fTDIpqx++eHYZ4aK013R/mzEu39H6giP64BmypCzlKjDb0ymLy87BqUw=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hV9EF-0003Rr-Up; Mon, 27 May 2019 06:35:28 +0000
To: Andreas Schneider <asn@samba.org>, Steve French <smfrench@gmail.com>
References: <CAH2r5mvmJVe0i+aAidvpnmHPdxX=V6RJ0dYdQZfBY+K7zq2o5w@mail.gmail.com>
 <2585169.WRIv5fHKiD@krikkit>
 <CAH2r5mtRNey4Fx5-ZsrCu4Omgn-bVrmq0zKkprZ4=mrRSb6BOA@mail.gmail.com>
 <11826585.dasZr9x98r@krikkit>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Subject: Re: Kerberos and Samba client tools
Message-ID: <d15e25db-5bf8-150c-7a61-04ea1d2af1ad@samba.org>
Date: Mon, 27 May 2019 08:35:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <11826585.dasZr9x98r@krikkit>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="UYbigwVtDeLji541R8RoItvRLY1rxAo5A"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
--UYbigwVtDeLji541R8RoItvRLY1rxAo5A
Content-Type: multipart/mixed; boundary="1I40elKGKbmkDE0TwKSrkb7vJfytZc6Eo";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Andreas Schneider <asn@samba.org>, Steve French <smfrench@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Message-ID: <d15e25db-5bf8-150c-7a61-04ea1d2af1ad@samba.org>
Subject: Re: Kerberos and Samba client tools
References: <CAH2r5mvmJVe0i+aAidvpnmHPdxX=V6RJ0dYdQZfBY+K7zq2o5w@mail.gmail.com>
 <2585169.WRIv5fHKiD@krikkit>
 <CAH2r5mtRNey4Fx5-ZsrCu4Omgn-bVrmq0zKkprZ4=mrRSb6BOA@mail.gmail.com>
 <11826585.dasZr9x98r@krikkit>
In-Reply-To: <11826585.dasZr9x98r@krikkit>

--1I40elKGKbmkDE0TwKSrkb7vJfytZc6Eo
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 26.05.19 um 20:26 schrieb Andreas Schneider via samba-technical:
> On Friday, 24 May 2019 19:30:33 CEST Steve French wrote:
>> A related question (to your "--user-kerberos=3Dyes" (or auto) is "whic=
h
>> ticket will it use" and "can you get a ticket on the fly by specifying=

>> this with userid and password" and can you override which users ticket=

>> will be used in SMB3 session setup?
>=20
> --use-kerberos=3Dauto
>=20
>   Check for a credential cache and try to authenticate. If it fails ask=
 for a
>   password for the user who executed the client tool.
>=20
>   -U check for a ticket of that user, if not available ask for a passwo=
rd
>=20
> --use-kerberos=3Dyes
>=20
>   Use the credential cache
>=20
>   -U use the credential cache and check for a ticket for that user

We also need to ask for password here too if there's not ticket.

> --use-kerberos=3Dno
>=20
>   ask for a password for the user who executed the client tool
>=20
>   -U ask for a password for the given user or use the one supplied on t=
he
>      commandline
>=20
>=20
> Makes sense?

We also need the --krb5-ccache option, which should allow "none" (as
default), which means we should use just a memory ccache instead of a
ccache in the system. And "system" which will select the default ccache
from the system.

If we use a system krb5 ccache we should only use kerberos
and adjust the username, principal, ... from that ccache.

I think we should also be able to use the winbindd ccache (currently
only used for ntlmssp) for kerberos.

The key thing is that we don't silently use something unexpected.

metze


--1I40elKGKbmkDE0TwKSrkb7vJfytZc6Eo--

--UYbigwVtDeLji541R8RoItvRLY1rxAo5A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAlzrhSwACgkQDbX1YShp
vVbYew/8C1oJrYLSBo0jBGgsXqPFyriUcQ5+nFzCXhuBqSCv6n+3jEtvW/wDlbyj
IdqpPiC8T0w0d8oajzscYSJidxgWWzpICipdc2t8fiAq5eQiV85nJInyADJ6U321
KOoKZ3/DuLdE5JDy5wTfdpFxfjkT04MxelEy04YNPXJlPeMNSwb93/tMnv40gAZg
iSCaFCBSfo6TWbH6xYPgCKmhyVU9Z25qeQJmxfI+SgdUtsn43xF71YMx0WR0dh+p
IUvOvl4UaowVld3UNxvG9ZzDW27AFogKMMlle/PfcI8YIDtPCzAvYat3Mw4QcK3m
xvWWrwcrUCB+GXjLrag93vpMmqGjVDSweHiMROIyDQL08+N/GKhdmbeA7hhUTeVb
Pm/HpPWYJhkWxlBC1U7mRB6ZxXoyUMZaT+auwws9oUWQ2K87JLofqosyOb5tUcXU
x/pSXQoVOJm1J6KGv4jAeINZJo69/itROPD/D/jXp1MsM1uYC4yFEDaiR//QA7Jx
dRVdTuSYiCpG0QUFm4cQ4LZn7kttT7R6ytqsOd0eakN3ZFVOlnMc5tpIOGHnNF04
0jOkdufU8HaOcl9lKEodbUmAryO3k1bvujfS18J483avRCENTlug5WGx10iRttC5
a/mLJzEsDAJAP29H0e2lDS47PbMON6rLs6XwePQ6e1I25G+6KFI=
=cJgW
-----END PGP SIGNATURE-----

--UYbigwVtDeLji541R8RoItvRLY1rxAo5A--

