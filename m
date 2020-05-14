Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C8B1D2946
	for <lists+samba-technical@lfdr.de>; Thu, 14 May 2020 10:00:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=vIf7QOL5Qwj31OXAZVZ2xtPNF5W4YxkHeMU+yYLBf/U=; b=TE8VY2LjaUAlHW84g7nttF9xox
	EaXfdVWiJpmE5Ur/FLxcdlo4UBKSNZQ6ahvchUym0RfuNDwDWsYY1o6iBH+wP5WWlcTvj8pgb0wTx
	4Oga3MOiN7uUw26MHuGo83grTISrqpODNy5JNd4IKlRMt8LBeox7h98FyS1pDOp1pryahjZ2L5J3t
	QO501Kg1BSoGYHxcseB65glSY1YUKiTfofBorNd9swoAs3uMcf8y2F2XNsVLMVbyEKLau5xIicPOx
	Ln0+OmLJEBPBXAYGDuTo+bnS3yCXnJpvoStSvP/uo51pznG0zxO2gD5vGsYCtDzOgKUyeamsP8b1S
	HYwLKVEA==;
Received: from localhost ([::1]:57986 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jZ8lu-004IK8-5z; Thu, 14 May 2020 07:59:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58794) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jZ8lm-004IK1-6i
 for samba-technical@lists.samba.org; Thu, 14 May 2020 07:59:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=vIf7QOL5Qwj31OXAZVZ2xtPNF5W4YxkHeMU+yYLBf/U=; b=Ue3bkp65sHU907utxplShUmNRF
 oL0ahwL6dq6gZHsiDIpDgpUbSwe9fWMC6Q06eWEjM2Q42DhvuEG9nbIVg0qrPjYt9ixVeS6SenW1e
 Xty4bSDnd4gv+4s4sShDsNwN1yslybD4pR11rxza7ZK9eJlkKg+/unp6WCOdGidxUahhUumaWbE9c
 EUQzmKhHn4m70see7yQS9qERPLv0B5Y7WuC2J+wEqcn+uR4IH5B464NFR8hjBKgq6OPaCLP8IuSSU
 6TBJp/ZIPP25E7IrdTaNjULSzlxmR63nEXa4EZBRsPo5MfVZOjQ+kD2xazpSOxihhfnTDzUf25WaA
 xehSQ8BJYU7c9VFcfGOjPRwn33oPu+dggOrnkVHHs+csv+hXh6Ar1czqVrp2rrtlDc1ONyXqrodJR
 252ZhetKWS4489jA4Jdw/Kl6TCnjMrl7RZAZrGIeiKV1hf+cPhspo3HTJ0RHgE2pITpj8xiExLxic
 aoL7TQdv2UH8G5fkCv7/9Dce;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jZ8ll-00011d-H0; Thu, 14 May 2020 07:59:05 +0000
Date: Thu, 14 May 2020 09:59:04 +0200
To: Jeremy Allison <jra@samba.org>
Subject: Re: Behaviour mismatch between "store dos attributes" and "map
 archive" from man smb.conf(5)
Message-ID: <20200514075904.GA150211@samba.org>
References: <e0d86c0fb92046e0f201cc14a112701ca891196a.camel@cryptolab.net>
 <20200513184233.GB9585@jeremy-acer>
 <20200513221431.GA7185@samba.org>
 <20200513225131.GG9585@jeremy-acer>
 <20200513233612.GB7185@samba.org>
 <20200514005508.GA21149@jeremy-acer>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Content-Disposition: inline
In-Reply-To: <20200514005508.GA21149@jeremy-acer>
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


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020-05-13 at 17:55 -0700, Jeremy Allison wrote:
> On Thu, May 14, 2020 at 01:36:12AM +0200, Michael Adam wrote:
> >=20
> > Right, and this is done unconditionally in open_file_ntcreate(),
> > I mean without checking lp_store_dos_attributes() first. So the
> > manpage is clearly wrong. store-dos-attributes disables none of
> > the map options. We only see the effect for map archive since
> > the other three default to "no" anyway...
>=20
> Yep.
>=20
> > What I am wondering is this:
> > If the file is created with SEC_RIGHTS_FILE_ALL, shouldn't it
> > get execute permissions, even if "map archive =3D no"?
> > After all, "map archive =3D no" does not prevent execute from
> > being set, it just doesn't set it because of archive...
>=20
> No. SEC_RIGHTS_FILE_ALL is only to do with the access permissions
> on the handle, not the permissions on the file.

Hmm, ok, I wasn't fully aware of that.

To understand, I traced it through. The desired_access is handed
through from torture_smb2_testfile to access_mask in
open_file_ntcreate, where it is treated separately, and there,
unx_mod and access_mask are handed to open_file separately, and
not mixed up.

And the initial unix mode that is set does not seem to contain
the X bit unless the "map archive" is set.

But the question is still, why does the smb2.read test pass
and not fail at source4/torture/smb2/read.c:270 if I configure
"map archive =3D no" in selftest/target/Samba3.pm:2210 ?
In this case (i.e. acl_xattr enabled and "map archive =3D no"),
the file st/nt4_dc/share/smb2_readtest.dat gets +x bits set.

If I add "acl_xattr:ignore system acls =3D true", then the file
does NOT get the +x bits, but the test still passes.

If I disable the acl_xattr module though, and keep "map archive =3D
no", then the file gets no +x bits, and the check fails.

So apparently, while you say that this access mode is for the
access mode on the fd, not on the disk-file, when opening an
*existing* file, the executable permission of the disk-file is
still consulted, in form of the ACL, for determining
whether the desired access can be granted to the FD. This seems
somewhat asymmetric. But maybe I am not understanding correctly...


> > And this should be true without vfs_acl_xattr, but afaict also
> > with the module, when system_acls are not ignored (i.e. when the
> > acls are still mapped to posix acls).
> >=20
> > So I am missing the piece where the actual desired permissions
> > from the create call are factored into the resulting unix
> > permissoins.
>=20
> It's just passed down directly from the mode bits that
> are created in open_file_ntcreate().
>=20
> 	open_file_ntcreate()
> 		mode_t unx_mode =3D unix_mode(conn, new_dos_attributes | FILE_ATTRIBUTE=
_ARCHIVE,
>                                      smb_fname, parent_dir_fname);
>=20
> 		-> open_file(..., unx_mode, ...)
> 			-> fd_open_atomic(..., unx_mode, ...)
> 				-> fd_open(..., unx_mode, ...)
> 					-> non_widelink_open(..., unx_mode, ...)
> 						-> SMB_VFS_OPEN(..., unx_mode, ...)
> 							-> open(name, flags, unx_mode)
>=20
>=20
> > Well, at least the manpage describes some original intentions
> > as it seems. The current behavior is at least surprising when
> > the man page text is taken into account.
>=20
> Yep. The man page is wrong here.
>=20
> > Of course, thanks!
> >=20
> > Two questions remain:
> >=20
> > - Should we implement the behavior stated in the manpage?
> >   (I think yes!)
>=20
> Hmmmm. Maybe. Be careful of changing things here,
> it may not be what users expect.
>=20
> > - Why is the x-bit not set when SEC_FILE_ALL is requested in create?
>=20
> 'cos SEC_FILE_ALL is bugger all to do with on-disk
> file permissions. That's a handle access mode (think
> fd, not file). You have to set a security descriptor for that.

That statement does not seem to be 100% true:
As mentioned above, when opening an existing file,
it seems that the disk file permissions (via acl) are consulted to
determine whether the desired fd-access can be granted.
So in order to grant SEC_FILE_EXECUTE upon later open,
we seem to have to have set execute perms on the file at creation.

=46rom the observed phenomena, something seems to be
off here. Or just working by coincidence?

If acl_xattr is used, we get the file +x perms on disk at creation.
(via acl, also on unix mode if we don't ignore system acls).
If acl_xattr is not used and map archive =3D no, then +x perms are NOT set.

I did some more tests with the torture code.
If we create a file with
SEC_FILE_READ_ATTRIBUTE | SEC_FILE_READ_DATA
then the execute perms are still set when using acl_xattr.
So this confirms that the setting on disk is not related
to the desired access mode at creation.

But the acl_xattr module behaves very differently from
the pur unix permissions / posix acls mode in that it
seems to set execute permissions more often?


> Remember there's no atomic open_with_posix_acl() call
> in POSIX. So you get what is inherited from the parent
> directory (if it's set up that way). Samba then overlays
> (non-atomically, as there's no other way in POSIX) and
> security descriptor set on the file after it's created.

There is no parent directory acl here afaict.
And even with ignonre_system_acls it works.
(It just doesn't show up on the posix perms then.)


So to sum up:

- When creating a new file, the desired access mode parameter
  does not influence the on-disk permissions/acls that are set on the
  file.

- When opening an existing file, the on-disk perms are consulted
  to detect if access can be granted.

Sorry for the long mail.
Going through this highly convoluted and uncommented code is quite
a journey.. ;-)

Cheers - Michael

> Jeremy.

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQQ4hxRJ4GXWNWIKYh7JT0k4GE+QNAUCXrz6RgAKCRDJT0k4GE+Q
NJAxAJ4nfkXviPU+/LIvaZkYHOfUuy6iXwCfYW1gzRICtw6H5qH98xZMVPBN3gI=
=UxyT
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--

