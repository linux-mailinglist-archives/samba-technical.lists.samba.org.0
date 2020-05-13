Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B582E1D21D0
	for <lists+samba-technical@lfdr.de>; Thu, 14 May 2020 00:15:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=qCENHtp8ZaaFvV/mYXF0DQNWGhx5rWKrBDvt0wp+q8Q=; b=0Lacf9fZhrOSlFXfpoPkheRMFG
	nvU+teX8srYNKR7dhY3mguT43whafrmxVHRszIEH7DBHFqlC2D87AFkFPNMzYB8CzfrsoH1JiuP1t
	vVVS4buU7YL03C4adUQuQtj6z76RKXY0QWQqBJqpBjfVd7NlEtVrn552/yoDgKQvi3g7AOp2txj/I
	jLU4UIC3oYo1OJI6tl2dphBfj5cf1J9s8H/z9oNWX+qDDdMkZKXWF4/Qdj7wuW8OZ/EESCandxp0B
	2YPZJjlJ1L5JqkI20XfbQEP2RiyhPLvAZ5CEoStUDmVdPP3KGLGuS3P9KX3ir8r7/Sjzi/DLAFwzu
	smHiZRSg==;
Received: from localhost ([::1]:53452 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jYzeL-004GgH-Dn; Wed, 13 May 2020 22:14:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48772) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jYzeE-004Gg9-L1
 for samba-technical@lists.samba.org; Wed, 13 May 2020 22:14:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=qCENHtp8ZaaFvV/mYXF0DQNWGhx5rWKrBDvt0wp+q8Q=; b=JajI7U0x/oktBI9mqBeAK1gyAi
 4B9e7LPHQzaP6PeLOvqj2kKDkoHyZdllfwYyMqy2ALbBKIDFZkSOQGvu20zRWtk/zfplv/mdxk2Za
 oqj3GmgkWiXCnu8eW0QLr3k80R1LZuxq3njZllgwnRPMBLKj4jnzxNCJZfTj424v9SEOJIPP2zNAJ
 ZzmGWA2RAJAYMKQ1vIJL2itkFwpu3uzUlU72H7LalBbCgGD7xI1L5SebRBBrBO2MfCItvrmYjCbS9
 Yd7LTqGBXyS7pcRLF09JVvl+QhhfG2OE3Z1ZfZwCGl7LWB0J/Id5sca27e49ofAapGasR2yFhmMte
 YpeVHrQMQIgRDdvsZcRL6TVXTVrmfnrwG7tQOsSzskJBh46asaByWXNkL1gIpT4FITmtPdLCbommB
 MqgKnF9z0wNoFQc36320waTBBKssQ2NOzFIz9JB+kDZAyONE0N8+lXKEvcIvpJb2n7zGotRe5e2Pk
 dv1i/DJqR8WSSVIU/oe1GlOL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jYzeD-0004dQ-Cw; Wed, 13 May 2020 22:14:41 +0000
Date: Thu, 14 May 2020 00:14:31 +0200
To: Jeremy Allison <jra@samba.org>
Subject: Re: Behaviour mismatch between "store dos attributes" and "map
 archive" from man smb.conf(5)
Message-ID: <20200513221431.GA7185@samba.org>
References: <e0d86c0fb92046e0f201cc14a112701ca891196a.camel@cryptolab.net>
 <20200513184233.GB9585@jeremy-acer>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
Content-Disposition: inline
In-Reply-To: <20200513184233.GB9585@jeremy-acer>
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


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020-05-13 at 11:42 -0700, Jeremy Allison via samba-technical wrote:
> On Wed, May 13, 2020 at 04:42:30PM +0530, Anoop C S via samba-technical w=
rote:
> > Hi,
> >=20
> > Following is a question I have regarding the interaction between two
> > smb.conf parameters mentioned in the $subject. It can very well be a
> > misunderstanding from my side.
> >=20
> > We have both "store dos attributes" and "map archive" set to 'yes' for
> > default install. But according to its description man smb.conf(5):
> >=20
> > store dos attributes (S)
> >=20
> > . . .When this parameter is set it will override the parameters map
> > hidden, map system, map archive and map readonly and they will behave
> > as if they were set to off. . .
> >=20
> > My question is around smb2.read.access torture test where it tries to
> > open a file with different access flags including SEC_FILE_EXECUTE.
> > When run against a share with "map archive =3D no"(or implicitly assumed
> > by "store dos attributes" set) we cannot expect execute bit to be
> > present for the owner. Thanks to Ralph(and Michael, Guenther) who
> > helped me understand basic selftest architecture which adds
> > vfs_acl_xattr in [global] section for many torture tests including
> > smb2.read making it pass with `make test`.
> >=20
> > Nevertheless, leaving "store dos attributes" at its default, why would
> > smbd create file with execute bit set for the owner? I hope its not
> > because of some umask calculation done at the end outside Samba because
> > if that's the case I would expect it to be set even when "map archive"
> > is explicitly set to 'no'. There seems to be some mismatch between
> > assumed and real behaviour.
>=20
> Quick check - does your smb.conf have "obey pam restrictions =3D yes"
> set anywhere ?
>=20
> That can mess up our mask calculations. Let me know that parameter
> is set to "no" before I dig in further :-).

"obey pam restrictions" was certainly set to the default, i.e.  "no".
We used a mostly default config.

The interesting bit is that smb2.read passes with "store dos
attributes" and the "map foobar" options set to default, and
we see the file get execute perms. But if we explicitly set
"map archive" to "no" (which according to the man page should
be the effect with "store dos attributes =3D yes"), then the test
fails at source4/torture/smb2/read.c:270, expecting execute perms.

Now the test is run in samba selftest only against a share with
the "acl_xattr" vfs module enabled. That obviously passes. with
any "map foobar" setting.

So the question is:

- Does store "dos attributes" not completely disable "map
  archive" as claimed in the manpage?

- Or is the disabling of "map archive" doing too much in not
  setting the execute bit when it should? After all the call
  to torture_smb2_testfile() in source4/torture/smb2/read.c:245
  should create the file with SEC_RIGHTS_FILE_ALL, which should
  include execute perms. So is the execute somehow masked away?
  (We played with setting masks to allow all bits too, that did
  not change anything.)

We wanted to raise it here before digging deeper since it is
quite possible that we are missing something that is more obvious
to some. :-)

Cheers - Michael


--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQQ4hxRJ4GXWNWIKYh7JT0k4GE+QNAUCXrxxRQAKCRDJT0k4GE+Q
NMmEAJ48xNbeGAvD/3WA51wDw1uGiMp6+wCglpmI5CmWThGw2H7lh84qvd/lV9E=
=Lhfv
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--

