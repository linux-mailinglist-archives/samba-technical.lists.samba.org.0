Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 058141D95BA
	for <lists+samba-technical@lfdr.de>; Tue, 19 May 2020 13:57:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=C+lRnwUM2LzshUUeruO2MwknnQr0gIVj5T9WnbGjkJw=; b=PRVGB1Rf62Ix5AVO6OFlWQpaLc
	RQ/S3UTIY4vnc/AL9sc1R1gLqw3VQYYWO8CGpjllKFaQ1VBwP/REU1yaaBUR/Q6jSZeumEcaoANrr
	8diGGYtUkqc5vE111eJCTuR9je39ewYcnx8SS66fowPZTF0gmri2Wu6XbXsKdXwXbWOrvjDLvaDSE
	jer0nqK7UQQUoJHcsJh+yMUXHggmvyf8ScLKm8Hpw3YOEtagYasr2muXZZPuqL/kRxzrkaLO38gg3
	yi22sRq5tic6iG8uM7bCjf9GwjCRlo0IeuzE0pSF5hM4CWOhJHCl2WNsUg6lABScpZLnd1DsD+Zlh
	TDJNeT2w==;
Received: from localhost ([::1]:19280 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jb0sJ-0055Aj-3D; Tue, 19 May 2020 11:57:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21322) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jb0sD-0055Ac-UN
 for samba-technical@lists.samba.org; Tue, 19 May 2020 11:57:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=C+lRnwUM2LzshUUeruO2MwknnQr0gIVj5T9WnbGjkJw=; b=wNbtYKXEaCYjJQby6IzRsPZ97Z
 NGqROy1v77bwsjQ0M4+p6td/3s6mDI9++2WSlB7H7SkPZugP084eAonLKS4n9cC2ebbzbcIH/KYZG
 51MQ61YkaAZrzPi4b43fhub46apCp7BcecGRAduabid9R4uJitGbo0YG9fYz6skSv2hsjb4gWQsXI
 WvZxHjXYbJD4lWvaHt92umxGQCpSU4bELyP7U+JoCasOHMjqnEETMviBdIQx8I64WKKI6+ZxYenKX
 ErEO7AvFig+Pnuz2wkgl2dXezXQyI5AzVUbZPC38UtYVtbTteDM144HKflm8yjWdOXfgmHN3+MwgM
 kG0lqOwYST8yWiJY8ng1yC8pU5ZKM8yOtyCHyrPdNcfh20qjzwxKTDfGq/8+MFChLnbx2f2Yq4It2
 fYEeb/802ZT3WATJjPKwxHTIStueR1IMzF05/ugm7mNwabSwFo6i0/n7q8TnY/mQ731VfFOvGj2al
 NloRaet7cSPpoRPoISLxnTyx;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jb0sD-0005I4-1E; Tue, 19 May 2020 11:57:29 +0000
Date: Tue, 19 May 2020 13:57:27 +0200
To: Jeremy Allison <jra@samba.org>
Subject: Re: Behaviour mismatch between "store dos attributes" and "map
 archive" from man smb.conf(5)
Message-ID: <20200519115727.GA613584@samba.org>
References: <20200513221431.GA7185@samba.org>
 <20200513225131.GG9585@jeremy-acer>
 <20200513233612.GB7185@samba.org>
 <20200514005508.GA21149@jeremy-acer>
 <20200514075904.GA150211@samba.org>
 <20200514174533.GC13942@jeremy-acer>
 <20200514232614.GA483587@samba.org>
 <20200515004712.GA30423@jeremy-acer>
 <0ea0253023c276aedf3b2eb162a9907cdcf08092.camel@cryptolab.net>
 <20200518185903.GB30317@jeremy-acer>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline
In-Reply-To: <20200518185903.GB30317@jeremy-acer>
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
From: Michael Adam via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Adam <obnox@samba.org>
Cc: Anoop C S <anoopcs@cryptolab.net>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020-05-18 at 11:59 -0700, Jeremy Allison wrote:
> On Mon, May 18, 2020 at 05:47:00PM +0530, Anoop C S wrote:
> >=20
> > Seems like we have two different mapping methods.
> >=20
> > When vfs_acl_xattr is used along with 'ignore system acls' we have
> > special kind of treatment as follows inside make_default_acl_posix():
> >=20
> > if (mode & S_IRUSR) {
> >         if (mode & S_IWUSR) {
> >                 access_mask |=3D SEC_RIGHTS_FILE_ALL;
> >         } else {
> >                 access_mask |=3D SEC_RIGHTS_FILE_READ | SEC_FILE_EXECUT=
E;
> >         }
> > }
> > if (mode & S_IWUSR) {
> >         access_mask |=3D SEC_RIGHTS_FILE_WRITE | SEC_STD_DELETE;
> > }
> >=20
> > This might be the reason why smb2.read.position is always passing with
> > vfs_acl_xattr + "ignore system acls =3D yes". =20
>=20
> Yes, "ignore system acls =3D yes" special cases a lot of stuff.

Right, but as mentioned before, even without "ignore system
acls", the x-bit will be set on the file upon creation.
So even in that case, EXECUTE access rights are granted upon
opening again and the test passes.

> > Here comes the default mapping method, invoked all the way from
> > smbd_check_access_rights() we have the following in
> > map_canon_ace_perms():
> >=20
> > if (directory_ace) {
> >         nt_mask |=3D ((perms & S_IRUSR) ? UNIX_DIRECTORY_ACCESS_R : 0 );
> >         nt_mask |=3D ((perms & S_IWUSR) ? UNIX_DIRECTORY_ACCESS_W : 0 );
> >         nt_mask |=3D ((perms & S_IXUSR) ? UNIX_DIRECTORY_ACCESS_X : 0 );
> > } else {
> >         nt_mask |=3D ((perms & S_IRUSR) ? UNIX_ACCESS_R : 0 );
> >         nt_mask |=3D ((perms & S_IWUSR) ? UNIX_ACCESS_W : 0 );
> >         nt_mask |=3D ((perms & S_IXUSR) ? UNIX_ACCESS_X : 0 );
> > }
> >=20
> > Thus an existing file created without 'x' bit will end up with a
> > access_mask without SEC_FILE_EXECUTE.
>=20
> An access_mask in the reported Windows ACL, yes.

But the main point is that is ONLY happening if the file on disk
has user +x perms! And this is different from the acl-xattr
behavior.
=20
> > Difference in behaviour is because of different mapping methods
> > resulting in different access_mask when used with and without
> > vfs_acl_xattr. Why is it so? Why shouldn't vfs_acl_xattr just deal with
> > setting "security.NTACL" with a value obtained out of a common mapping
> > method?
>=20
> It's probably so due to historical reasons.
>=20
> Can you write up a comprehensive "how I think this
> should behave" and then we can discuss, make changes ?

We will.

I think the gist of it is this (with a grain of salt),
as far as I understand it:

- There are mappings from posix acls/perms to NT-acls and visa versa.
- Access checks in smbd are done at the nt-acl level.
- The mappings happens both with and without acl_xattr
  (and without ignore-system-acls).
- The main conceptual difference between the two modes is that in
  the acl-xattr case the nt acl gets stored to disk (and becomes
  the source of truth) while in the no-acl-xattr case it stays
  in memory only (and the posix acl remains the source of truth).

The *problem* I see is that in the two cases, *different* mapping
functions are used. I think we should use the *same* mapping
function in both cases to achieve a consistent behavior.
(And FWIW, I currently think the mapping function of the
acl-xattr case should be used, as this is the one tested in
selftest.)

It is understood that this might lead to behavior changes that
are unexpected for or unwanted by some, but we could still keep
the legacy behavior behind an option for a while.

We will follow up with a lot more detail, but I think this is the
crux of it.

Cheers - Michael


>=20
> Thanks,
>=20
> Jeremy.

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQQ4hxRJ4GXWNWIKYh7JT0k4GE+QNAUCXsPJpQAKCRDJT0k4GE+Q
NOOjAJ9UAjoiiNlippXq+GCzgE4HufamdACePMnhx+Xj37g1eGTxRn3lJLtqWyI=
=cl+B
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--

