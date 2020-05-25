Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3194B1E09CF
	for <lists+samba-technical@lfdr.de>; Mon, 25 May 2020 11:15:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=vupYRGZLwmkQh8h9I2UBphzbIQnkhGYFk5EFPKk7Oi4=; b=ggL5YXMLAxPyvg8NFIRQ2Zfl5x
	TyTPv5TwnVNoq+hyKqRi1wCn++NNHCbBaRpCvS1EMAuYrTNQOaZ64KJPmDQi0PVrg+QgNPjMIPp4J
	EMpH8yxxVtH6azn858MGJHEZwRrVW34PAvhWngQdMhYKMKLbpqbw+e5YrUvBObVIFnZUQhQNxr978
	4fBPbgOE4ZE9axImSxsKXAGAjSD6R20GEMKNJEPP3EVQiL28WIZgQW1FYUEDSqIDq+y6rP+2GMj3m
	ewm9jGl2VBdgyGwlupM4zwbcd9vh7MAnMdvJtXVV69rLGrLPr0nCGfEs2CNM9TMPM9PrJcNYn/AGp
	muPQxEdQ==;
Received: from localhost ([::1]:58202 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jd9C3-005i1B-63; Mon, 25 May 2020 09:14:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38046) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jd9Br-005i0V-GZ; Mon, 25 May 2020 09:14:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=vupYRGZLwmkQh8h9I2UBphzbIQnkhGYFk5EFPKk7Oi4=; b=amsQFkjCKGRNY3di0Xv8C7p1UC
 YugyuzfvE+u1hUmAtyRm/9ooK9ZYqkucTAS5BbhWSVYekYwimwW6/T36O3NUxADazVjTZZvYkBFjv
 rztQ5qVPgrtVTQMycceAW7DAhDzb0/STG087iMG78um9xMxsWVvqV0foQPTKEShPaPY5nC2hhFsFw
 LCMbWjKi9QnetLc2sceJfiXmZFVBq7nxF+kAJ0OALfovFhaT+7ulCNLPGyv/aji46au2MTZxy3ee/
 dZCk9Q05hsl51ZmCFyJWGZidkvy/9SWbLW2V1qU0GfPUI7+8ZSGugEtUBBHYTHkYgyq16MlM/Yz8n
 FWMb9mxtHN2eHq3MtHPPXdho9ADmbxKR4QcbJzrWX42Xbrhks0J+keCf7a4sIQcU7eRp9gT6guPlM
 NAnYkoAZZ+dp8REKDHhIRKJLrcd2UQMO/9RBlbHomNjoWWpRO23z7B26wYH3sNtiMNYr/PgCMP9uc
 p4D6E7EHkETICKYyDkuMtad2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jd9Bn-0006fR-TK; Mon, 25 May 2020 09:14:31 +0000
Date: Mon, 25 May 2020 11:14:29 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.10.16 Available for Download
Message-ID: <20200525091428.GA11978@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: kseeger@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------

This is an additional bugfix release of the Samba 4.10 release series to ad=
dress
the following issues:


Changes since 4.10.15
---------------------

o  Jeremy Allison <jra@samba.org>
   * s3: lib: Paranoia around use of snprintf copying into a fixed-size buf=
fer
     from a getenv() pointer.

o  Amit Kumar <amitkuma@redhat.com>
   * BUG 14345: lib:util: Fix smbclient -l basename dir.

o  Volker Lendecke <vl@samba.org>
   * BUG 14366: Malicous SMB1 server can crash libsmbclient.

o  Andreas Schneider <asn@samba.org>
   * BUG 14336: s3:libads: Fix ads_get_upn().
   * BUG 14358: docs-xml: Fix usernames in pam_winbind manpages.
   * BUG 14370: Client tools are not able to read gencache anymore since 4.=
10.


#######################################
Reporting bugs & Development Discussion
#######################################

Please discuss this release on the samba-technical mailing list or by
joining the #samba-technical IRC channel on irc.freenode.net.

If you do report problems then please try to send high quality
feedback. If you don't provide vital information to help us track down
the problem then you will probably be ignored.  All bug reports should
be filed under the "Samba 4.1 and newer" product in the project's Bugzilla
database (https://bugzilla.samba.org/).


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D=3D Our Code, Our Bugs, Our Responsibility.
=3D=3D The Samba Team
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Download Details
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The uncompressed tarballs and patch files have been signed
using GnuPG (ID 6F33915B6568B7EA).  The source code can be downloaded
=66rom:

        https://download.samba.org/pub/samba/stable/

The release notes are available online at:

        https://www.samba.org/samba/history/samba-4.10.16.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXsuMcQAKCRAoaL1+KxeT
UcMXAKCssxucM8BZnPwwmOzA2yxM8i9EVwCgz1LyeX+D0PBAsOdy33zDaMkQr/o=
=xVyF
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--

