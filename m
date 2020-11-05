Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E81E2A7B88
	for <lists+samba-technical@lfdr.de>; Thu,  5 Nov 2020 11:21:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=s4lNrrQoGM02sSxedTGanN4C0fI+w3FxArbEjLf4kh0=; b=m0R03hCFZ1Oo3glxDDXmFQN/J5
	sqB3FjvwvKwkOIfI5wYdAyzWIklEruAdPn45bUYm+b8Y4vQ+jwNqz3/jIAgcgS8ukVQAaySZ6RV04
	t9sIrxcTKZ3BGyFRImgaMGSUYpKKnW4MFkHEdWFDT3MrDVbObGdxuj8vK4if+h3wjKhFz5DUCctlB
	mw3M2XiKgbvdC3az19oPk0FcUmvv0Spcf+oPbvTR2/7ccJ4JhnvDBKIFbACVoYTIkuB95lLPqizS9
	dKMq7Z6tinOQFkBco9PrJzKxbjpvKmKEsyZwss6vA4LIg5McX27x7MWHmxc8agJes10Md6V13MDTt
	MLRCeeiA==;
Received: from ip6-localhost ([::1]:55534 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kacOC-0000nX-E0; Thu, 05 Nov 2020 10:21:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44352) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kacNz-0000lF-Je; Thu, 05 Nov 2020 10:20:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=s4lNrrQoGM02sSxedTGanN4C0fI+w3FxArbEjLf4kh0=; b=DFGfqHGYaR44vPdn/8BseRc/ir
 XYeI6TK+7h8zwrpyXkfnAJQjL5vmpIOwbeh37Zq6Lnakf5lcOJMOzU084a3IWe4pHY1AUPyegr9up
 xcNj8n9ltpycv8M1HmFELyJVzdop6Qwz1SUy8BVaT8QFw7HyAv9ye8LlZrGYbnMCoYN06BZc0N62D
 IVdD6brWIbfe2IHejz3AkWJ3Of0Ogwe1vYRXilE/G41plapJuwLM7twAOrubwDFPmfd0XDvifNXlL
 v2J+mK2dltQsSfikvo6HkvyWMPjnARFdkHDJw83Ovh438Q1/GpPox0Uz97vVd/d3Oa+1NprPHt6br
 5EwlWVhZBoxDtn/2kJbTk2wNKUYvOQwQ4gA3BLvTrddxEGJsVO5l4mFARFzKiXKPriKia1VYOeFaR
 GtbGhqAt2k9rDHyw2LGxwlg0Md2iCFTNJxbVktGpQ3OxypBCyjAoXZVzTC/L5mmggGWUsyfcEDgjr
 4zX7xt5xR6mV+Jp2jWp3bsQX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1kacNz-0001iY-84; Thu, 05 Nov 2020 10:20:55 +0000
Date: Thu, 5 Nov 2020 11:20:53 +0100
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.11.16 Available for Download
Message-ID: <20201105102050.GA15636@carrie2.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
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


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Release Announcements
---------------------

This is an extraordinary release of the Samba 4.11 release series to addres=
s the
following issues:

  o BUG 14537: ctdb-common: Avoid aliasing errors during code optimization.
  o BUG 14486: vfs_glusterfs: Avoid data corruption with the write-behind
               translator.


=3D=3D=3D=3D=3D=3D=3D
Details
=3D=3D=3D=3D=3D=3D=3D

The GlusterFS write-behind performance translator, when used with Samba, co=
uld
be a source of data corruption. The translator, while processing a write ca=
ll,
immediately returns success but continues writing the data to the server in=
 the
background. This can cause data corruption when two clients relying on Samb=
a to
provide data consistency are operating on the same file.

The write-behind translator is enabled by default on GlusterFS.
The vfs_glusterfs plugin will check for the presence of the translator and
refuse to connect if detected. Please disable the write-behind translator f=
or
the GlusterFS volume to allow the plugin to connect to the volume.


Changes since 4.11.15
---------------------

o  Jeremy Allison <jra@samba.org>
   * BUG 14486: s3: modules: vfs_glusterfs: Fix leak of char
     **lines onto mem_ctx on return.

o  G=C3=BCnther Deschner <gd@samba.org>
   * BUG 14486: s3-vfs_glusterfs: Refuse connection when write-behind xlato=
r is
     present.

o  Amitay Isaacs <amitay@gmail.com>
   * BUG 14537: ctdb-common: Avoid aliasing errors during code optimization.

o  Sachin Prabhu <sprabhu@redhat.com>
   * BUG 14486: docs-xml/manpages: Add warning about write-behind translato=
r for
     vfs_glusterfs.


#######################################
Reporting bugs & Development Discussion
#######################################

Please discuss this release on the samba-technical mailing list or by
joining the #samba-technical IRC channel on irc.freenode.net.

If you do report problems then please try to send high quality
feedback. If you don't provide vital information to help us track down
the problem then you will probably be ignored.  All bug reports should
be filed under the Samba 4.1 and newer product in the project's Bugzilla
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

        https://www.samba.org/samba/history/samba-4.11.16.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlQWgAwvkyRy78FZYoaL1+KxeTUQUCX6PR/wAKCRAoaL1+KxeT
UZGKAJoCidSU99AJuxvCn33q2Mimyu2oKQCgiR9za2721xe0XtGvLilrVHrDV6I=
=+a5r
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--

