Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B5D1D2329
	for <lists+samba-technical@lfdr.de>; Thu, 14 May 2020 01:37:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=qSgZfpG2+i3gIMdsXIpgqED+DgmOLarpaYU9Lpx5WRw=; b=4/tHndJ4QtBlDpge4B4Fbzruau
	+GleUorZ7X4CzhYPyUs0SJVagxQiovvTXXDSZqycQtDTJ6bxk+/drSvaHD9yIQH4uS0i+vSOXLM2y
	JlFIqgLppc4Fn88os6UOhtEKVGbUfKmBXrJAsRTTtHh9Q6t8Ep4vYPOTrRstzSrCSzPq9zQKVW09K
	5ExhJldlw0I6kqVz/x7v00rSov69PEy5GDtbb4Xl+UfNgTgnpgDC/l0+q9QRPDmaGUhM7FDzbmffb
	lbZRuQQ7xFYfdgwoNd6dfnwhobxSeyTxsPkDVlmsFLipHvs6ff2ibIIK05EeXqMPkepuQhI9l0vT7
	tARQdYsA==;
Received: from localhost ([::1]:54928 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jZ0vC-004GwE-Ur; Wed, 13 May 2020 23:36:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16810) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jZ0v9-004Gw7-32
 for samba-technical@lists.samba.org; Wed, 13 May 2020 23:36:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=qSgZfpG2+i3gIMdsXIpgqED+DgmOLarpaYU9Lpx5WRw=; b=DxoRrgjRDN8uqRfOMeQU1K5zJZ
 JyGPxliUABICbZdczaG5+ORGUnrW6YLdq3rcwQe6m4QFtvHZQOBZ6Sv0O4lpj4tq9+MQ+821UWgnr
 hI3GK78S8pZ8xg3MsSFGOY9QwtNSOEkgE3tDsbT9qDr1fRjY0sJp9+zOl01r5xQesO3x3N7ZQUIzJ
 2n6D+zm5s2XNT/coJVOQ8pwJVMdnTsmEAx/joJvAKxPdPIMbG0NWG9jdvO1IxyG1kDF+pMeZ290Zj
 AqJSwdEjDAssap4g9FloWm0+TYE6azlRCAGMnFxElr3m5LD2z7Z8nTuu2B0sV9ebgsKMel9UjqTT+
 HrBjybpc3GgajfWQ3yzlP/LhIPEav/V+UaxNZ301e+8Zw7qNf1W9RNxNnPPfiQXSd//Dk7uPGmExi
 7Uq4CpjfLqBt9Hij1e/acmEHmOhYNTrT+swzF++be5qfag2MdKqH3u4CMKml2WjRovpp6BzB9U/lL
 flmROUXG5vbuSrUIlrxdoISQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jZ0v7-00058g-TC; Wed, 13 May 2020 23:36:13 +0000
Date: Thu, 14 May 2020 01:36:12 +0200
To: Jeremy Allison <jra@samba.org>
Subject: Re: Behaviour mismatch between "store dos attributes" and "map
 archive" from man smb.conf(5)
Message-ID: <20200513233612.GB7185@samba.org>
References: <e0d86c0fb92046e0f201cc14a112701ca891196a.camel@cryptolab.net>
 <20200513184233.GB9585@jeremy-acer>
 <20200513221431.GA7185@samba.org>
 <20200513225131.GG9585@jeremy-acer>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="kORqDWCi7qDJ0mEj"
Content-Disposition: inline
In-Reply-To: <20200513225131.GG9585@jeremy-acer>
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


--kORqDWCi7qDJ0mEj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020-05-13 at 15:51 -0700, Jeremy Allison wrote:
> On Thu, May 14, 2020 at 12:14:31AM +0200, Michael Adam wrote:
> >=20
> > "obey pam restrictions" was certainly set to the default, i.e.  "no".
> > We used a mostly default config.
> >=20
> > The interesting bit is that smb2.read passes with "store dos
> > attributes" and the "map foobar" options set to default, and
> > we see the file get execute perms. But if we explicitly set
> > "map archive" to "no" (which according to the man page should
> > be the effect with "store dos attributes =3D yes"), then the test
>=20
> Turns out the man page is incorrect. See the analysis below.

Thanks for the analysis!

> > fails at source4/torture/smb2/read.c:270, expecting execute perms.
> >=20
> > Now the test is run in samba selftest only against a share with
> > the "acl_xattr" vfs module enabled. That obviously passes. with
> > any "map foobar" setting.
> >=20
> > So the question is:
> >=20
> > - Does store "dos attributes" not completely disable "map
> >   archive" as claimed in the manpage?
> >=20
> > - Or is the disabling of "map archive" doing too much in not
> >   setting the execute bit when it should? After all the call
> >   to torture_smb2_testfile() in source4/torture/smb2/read.c:245
> >   should create the file with SEC_RIGHTS_FILE_ALL, which should
> >   include execute perms. So is the execute somehow masked away?
> >   (We played with setting masks to allow all bits too, that did
> >   not change anything.)
> >=20
> > We wanted to raise it here before digging deeper since it is
> > quite possible that we are missing something that is more obvious
> > to some. :-)
>=20
> Unmodified defaults are:
>=20
> Default: map archive =3D yes
> Default: store dos attributes =3D yes
> Default: create mask =3D 0744
> Default: force create mode =3D 0000
>=20
> When creating a new file via SMB2 we set the required mode bits
> via:
>=20
> 	unx_mode =3D unix_mode(conn,
> 				new_dos_attributes | FILE_ATTRIBUTE_ARCHIVE,
> 				smb_fname,
> 				parent_dir);

Right, and this is done unconditionally in open_file_ntcreate(),
I mean without checking lp_store_dos_attributes() first. So the
manpage is clearly wrong. store-dos-attributes disables none of
the map options. We only see the effect for map archive since
the other three default to "no" anyway...

> Note that FILE_ATTRIBUTE_ARCHIVE is added in by default for a create.
>=20
> unix_mode() has:
>=20
> 	mode_t result =3D (S_IRUSR | S_IRGRP | S_IROTH | S_IWUSR | S_IWGRP | S_I=
WOTH);
>=20
> For a file (not directory) it then goes through:
>=20
> ------>         if (lp_map_archive(SNUM(conn)) && IS_DOS_ARCHIVE(dosmode))
> ------>                 result |=3D S_IXUSR;
>=20
> Is the above a bug ? According to the man page yes. Not sure we
> can change this now though...
>=20
>                 if (lp_map_system(SNUM(conn)) && IS_DOS_SYSTEM(dosmode))
>                         result |=3D S_IXGRP;
>=20
>                 if (lp_map_hidden(SNUM(conn)) && IS_DOS_HIDDEN(dosmode))
>                         result |=3D S_IXOTH; =20
>=20
>                 if (dir_mode) {
>                         /* Inherit 666 component of parent directory mode=
 */
>                         result |=3D dir_mode & (S_IRUSR | S_IRGRP | S_IRO=
TH | S_IWUSR | S_IWGRP | S_IWOTH);
>                 } else {
>                         /* Apply mode mask */
>                         result &=3D lp_create_mask(SNUM(conn));
>                         /* Add in force bits */
>                         result |=3D lp_force_create_mode(SNUM(conn));
> 		}
>=20
> So unmodified you'll end up with:
>=20
> 	S_IRUSR | S_IRGRP | S_IROTH | S_IWUSR | S_IXUSR =3D 0744
>=20
> So "store dos attributes" doesn't by default remove the mappings.
>=20
> If you explicitly set "map arhive =3D no" then the:
>=20
>                 if (lp_map_archive(SNUM(conn)) && IS_DOS_ARCHIVE(dosmode))
>                         result |=3D S_IXUSR;
>=20
> is false, so you'll end up with:
>=20
> 	S_IRUSR | S_IRGRP | S_IROTH | S_IWUSR =3D 644


What I am wondering is this:
If the file is created with SEC_RIGHTS_FILE_ALL, shouldn't it
get execute permissions, even if "map archive =3D no"?
After all, "map archive =3D no" does not prevent execute from
being set, it just doesn't set it because of archive...

And this should be true without vfs_acl_xattr, but afaict also
with the module, when system_acls are not ignored (i.e. when the
acls are still mapped to posix acls).

So I am missing the piece where the actual desired permissions
=66rom the create call are factored into the resulting unix
permissoins.

> Loading vfs_acl_xattr changes defaults by the following:
>=20
> [...]
>=20
> So as you can see, what you're seeing is what the code
> actually does,

Sure. No doubg about that! :-)

> if it's not exactly what the man pages state :-(.
>=20
> The "expected" behavior is up for debate, as the interactions
> between all these parameters as "store dos attributes" was
> added was not "designed" so much as adapted to cause the
> least surprises for existing users.

Well, at least the manpage describes some original intentions
as it seems. The current behavior is at least surprising when
the man page text is taken into account.

> Hope this helps,

Of course, thanks!

Two questions remain:

- Should we implement the behavior stated in the manpage?
  (I think yes!)

- Why is the x-bit not set when SEC_FILE_ALL is requested in create?

Cheers - Michael

--kORqDWCi7qDJ0mEj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQQ4hxRJ4GXWNWIKYh7JT0k4GE+QNAUCXryEagAKCRDJT0k4GE+Q
NEG7AKCHox/s4bsrWDPf50E2/YqE5rV+vgCfUxQUTi1H2VAm+bS8avNcTqKG4Ec=
=dUto
-----END PGP SIGNATURE-----

--kORqDWCi7qDJ0mEj--

