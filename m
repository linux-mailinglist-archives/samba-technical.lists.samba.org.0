Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A86E1D41A9
	for <lists+samba-technical@lfdr.de>; Fri, 15 May 2020 01:27:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=eqsDdy428gz39ms3t+MFpXVQp9uYB+bjxs92HXmjiUA=; b=h9Hiup0KQH6t0Qb6bqHqv+WWF5
	6XBBaK8foP3KnW6YMjiN5lRaRRD/H4NuISkQ4kkwDK83UiNUfb3wmV2bzEpv8NGvoP/DDXiC5rVGD
	Vcl/NUxuHadMoYPVkxgjALgqZMSx+WulwgxTnu63O1g2eLuFqGVAYXTcZIootAsr2SDv4AFkf+oI/
	KaaE5gx4zU4AuFCq6uyZJ9B7vcHwbCZDvv5i783Ng217ACvsNqzL8RD7hv2hvGKvP+oSUDOLcgDgl
	Bfkb52KmUbKQp0w+uuDIz9EtxEFPnogJmGhgYUizq+Pt4EXC/aPoIzXS0/q6LtUtM8I6jyhe7t6PR
	MMlTgw4g==;
Received: from localhost ([::1]:45348 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jZNFF-004ORL-U3; Thu, 14 May 2020 23:26:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41766) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jZNF8-004ORE-M6
 for samba-technical@lists.samba.org; Thu, 14 May 2020 23:26:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=eqsDdy428gz39ms3t+MFpXVQp9uYB+bjxs92HXmjiUA=; b=TqTjRVC3RG14QcXEX/EZvcBvPe
 lnbMkiRJMTT7X4rgKl+rDT6jCakJ8rxXQ/fOqjHIJHul9356JyaNUa+hJwV1A8HeBUnTYiZ1D8y/Y
 UOFQuQxe/YPk45xcB8yDCdoVlx/YB2I7hPVReAFNwkQkPQMPF+ATxASlyYfmsIr8HPprVoJ7E5In6
 3lEgEDrAhSg0RSpcXc8zmEiTTKjmhZhkVW/zh+XVv2HDFlxu5rMGVbvVom+IifOvGBgt9WN7IYVnO
 WVBxhhfrTO1rZwJe3M7m3HAytg6Vo6HBNA1aupHTwaeVL3hiinRB74TR8U7+LxvugJxi01k8o19s8
 KbgmihMxoymFASRCoSij1qvb1iQlpc+8kIoxYXDRImygv3U2DRXzjUYQz7C18akdlZPhhgfS2ORX7
 VKgiNsXDX3lW0qkK4xuANO0UcAymRyTaAPDbIANj8ClCEBONS56Wkydh2XkDoCRzaF3ozglaLtwd7
 laNRp/JARVumuM6Guzd+c+fY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jZNF7-0007ua-9Q; Thu, 14 May 2020 23:26:21 +0000
Date: Fri, 15 May 2020 01:26:14 +0200
To: Jeremy Allison <jra@samba.org>
Subject: Re: Behaviour mismatch between "store dos attributes" and "map
 archive" from man smb.conf(5)
Message-ID: <20200514232614.GA483587@samba.org>
References: <e0d86c0fb92046e0f201cc14a112701ca891196a.camel@cryptolab.net>
 <20200513184233.GB9585@jeremy-acer>
 <20200513221431.GA7185@samba.org>
 <20200513225131.GG9585@jeremy-acer>
 <20200513233612.GB7185@samba.org>
 <20200514005508.GA21149@jeremy-acer>
 <20200514075904.GA150211@samba.org>
 <20200514174533.GC13942@jeremy-acer>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline
In-Reply-To: <20200514174533.GC13942@jeremy-acer>
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


--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020-05-14 at 10:45 -0700, Jeremy Allison via samba-technical wrote:
> On Thu, May 14, 2020 at 09:59:04AM +0200, Michael Adam wrote:
> >=20
> > To understand, I traced it through. The desired_access is handed
> > through from torture_smb2_testfile to access_mask in
> > open_file_ntcreate, where it is treated separately, and there,
> > unx_mod and access_mask are handed to open_file separately, and
> > not mixed up.
> >=20
> > And the initial unix mode that is set does not seem to contain
> > the X bit unless the "map archive" is set.
>=20
> Yep, that's the difference in behavior from the man page.

Hmm. That's not really what I meant. I am just trying to
understand the logic of the setting of this initial mode in
general.

> See my explaination and (completely untested) patch :-).
>=20
> > But the question is still, why does the smb2.read test pass
> > and not fail at source4/torture/smb2/read.c:270 if I configure
> > "map archive =3D no" in selftest/target/Samba3.pm:2210 ?
> > In this case (i.e. acl_xattr enabled and "map archive =3D no"),
> > the file st/nt4_dc/share/smb2_readtest.dat gets +x bits set.
>=20
> It's probably the "inherit acls" parameter that the acl_xattr
> module sets by default.

If I disable acl_xattr but set "inherit acls =3D yes", this still
fails the same way. Only acl_xattr sets the execute perms.
So at least it is not "inherit acls" alone.

> If you single step it I think you'll
> find that after the initial open(name, O_CREAT, 0644) call
> the file on disk has 0644 mode, then the code called in
> source3/smbd/open.c:inherit_new_acl() modifies it to
> add in the X bit, or whatever depending on the synthesized
> NT ACL on the parent directory.
>=20
> > If I add "acl_xattr:ignore system acls =3D true", then the file
> > does NOT get the +x bits, but the test still passes.
> >=20
> > If I disable the acl_xattr module though, and keep "map archive =3D
> > no", then the file gets no +x bits, and the check fails.
>=20
> This is probably a test written to confirm we don't change pre-existing
> behavior. So if you want different behavior then fix the
> behavior,

At this point I'm mostly trying to understand.
I still have the impression that the behavior is somewhat
inconsistent and random.
And it seems to me that the test was not written to pass against
exactly the configuration of the tmp share in the test env, with
the awareness that it fails against other standard configurations.
I can't help the impression that this is somewhat accidential.

> mark the test as knownfail, then fix the test to
> match the new behavior and unmark the knownfail.

> > So apparently, while you say that this access mode is for the
> > access mode on the fd, not on the disk-file, when opening an
> > *existing* file, the executable permission of the disk-file is
> > still consulted, in form of the ACL, for determining
> > whether the desired access can be granted to the FD. This seems
> > somewhat asymmetric. But maybe I am not understanding correctly...
>=20
> See above. Access mode is on the handle, it's nothing
> to do with the ACL on the file.

That is apparently only true for creating new files.  For opening
existing files however, the desired access mode seems to have a
lot to with the ACL on the file. So this is strangely asymmetric:

(1) We create a file requesting SEC_FILE_EXECUTE.
    The file gets created without any execut perms.
    (without acl_xattr and with map archive =3D no)
    The create call succees.

(2) Later open of the existing file also requesting
    SEC_FILE_EXECUTE fails.

If I do acl_xattr or map archive =3D yes though, then #1 also
creates execute bits on the file. And #2 succeeds.

I'll dig some more.

Cheers - Michael

--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQQ4hxRJ4GXWNWIKYh7JT0k4GE+QNAUCXr3TkwAKCRDJT0k4GE+Q
NPAmAKCCD+yxjxcXxtTlJ7RXcA6XpNNgfwCgjo954yBA5tN+N+gaIK4m8tMVolE=
=6HNo
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--

