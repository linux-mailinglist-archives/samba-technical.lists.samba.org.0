Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DE051A628D
	for <lists+samba-technical@lfdr.de>; Tue,  3 Sep 2019 09:32:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=Ask0AS5EQ8yahtWvscBl8pPySa9WxrapDu4b4UiuVm0=; b=0WjKFPlfC7kuf1v/hddmJIW7zG
	fnSbD4UcaAQEU+nYRnvpQkz2DA3tPai6NRelkHbaSGk7XBV57gWof1OLzGjjbITXaEVDkyIM9AGDU
	kue21qVzqprbuXVrtGiCcQA49ro6OJ5LK0tYrBch6pw2p2Cl5F2yQbA0FqrXiyCIYdwSa7vEK4fcU
	mVMLuNO+vbf8+1yhQuljue4fPKC+QV9DYOECL5UVh2jpDeUsfTDoDHSK+BtEvZUnFXfKhMgJiwEqh
	SJ/IIbtPtIiSOq9kTnATPDytue+7IJo2U5JQ33e6U3obGm9hP5HrBqMQxOx94JbsrMFAWgUfHAz4G
	nN7NnGWg==;
Received: from localhost ([::1]:53868 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i53Hn-0036Wv-Ur; Tue, 03 Sep 2019 07:31:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64730) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i53HS-0036WE-BY; Tue, 03 Sep 2019 07:31:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:To:From:Date:CC;
 bh=Ask0AS5EQ8yahtWvscBl8pPySa9WxrapDu4b4UiuVm0=; b=g9RZwR7F1mdp2OgRgRFefHRAqy
 Y5OicEqWBOSiY+vBRlfCg7FUGgZJ5KwP0yDTX1fDRcUHVrSqi/p+3Vqh8OZ71Yr6vx9E7+19chcwM
 ZV/nogMvL1hpx+VmDTYYzVCytBCvW6NJh/8kDI4wo0bUir3VO8dTrYvQ5X3A3kLpMktw=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1i53HQ-0006AW-28; Tue, 03 Sep 2019 07:31:09 +0000
Date: Tue, 3 Sep 2019 09:31:06 +0200
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.10.8 and 4.9.13 Security Releases Available
Message-ID: <20190903073103.GA5881@carrie2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
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
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------

These are a security releases in order to address the following defect:

o  CVE-2019-10197: Combination of parameters and permissions can allow user=
       =20
                   to escape from the share path definition.

=3D=3D=3D=3D=3D=3D=3D
Details
=3D=3D=3D=3D=3D=3D=3D

o  CVE-2019-10197:
   Under certain parameter configurations, when an SMB client accesses a ne=
twork
   share and the user does not have permission to access the share root
   directory, it is possible for the user to escape from the share to see t=
he
   complete '/' filesystem. Unix permission checks in the kernel are still
   enforced.


Changes:
--------

o  Jeremy Allison <jra@samba.org>
   * BUG 14035: CVE-2019-10197: Permissions check deny can allow user to es=
cape
     from the share.

o  Stefan Metzmacher <metze@samba.org>
   * BUG 14035: CVE-2019-10197: Permissions check deny can allow user to es=
cape
     from the share.


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

        https://www.samba.org/samba/history/samba-4.10.8.html
        https://www.samba.org/samba/history/samba-4.9.13.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCXW4WrwAKCRAoaL1+KxeT
UWTXAJsF92e8tAAkxWzWiZP2mptr6QHEYQCdGcqz6SjVBUtS+Fu895xmlj2t3l8=
=EGXp
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--

