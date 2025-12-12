Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 00091CB8F3B
	for <lists+samba-technical@lfdr.de>; Fri, 12 Dec 2025 15:20:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=VL4T8ZNtBKjramXmDrr1aogIxJ8GlgJ7qMtqVEzwTdg=; b=hUp0F98VOWFDr/yMEdam5BkTZW
	BldEMgbhVO0+TuoZc9KeyU7LH+WmvE3nDKQoxC1IfLh+geLv1MkBGWLR1KdTihKNuZwvIvONvpCo3
	9+or7XLRhtAB1jtqbxBkL90LA7Z+FmTvY1TWtJuCqbWISNM4VAmvxw7Wby8kwh+T0z4iYu4uDY/wI
	+aESL2nyQm6BQ993OuY9bumqoE3PhEAcSy8r3va8+xEAMnZc8/Ulr3PuJYNmJCMV1rVTHhcJXZDFt
	WOci7qvL3IOyEkZb4jODyhfFiecNgl/1I9rD79RmrK9MW7Wb+2Vk6goVVGtaJR0zK5ByKQ+T5JwQl
	W8dZd4QA==;
Received: from ip6-localhost ([::1]:42508 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vU40E-00G5gx-6J; Fri, 12 Dec 2025 14:20:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28344) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vU404-00G5gV-CB; Fri, 12 Dec 2025 14:20:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=VL4T8ZNtBKjramXmDrr1aogIxJ8GlgJ7qMtqVEzwTdg=; b=unhXa4wZy7e0BAu3r2tJLGRpA0
 1rVOiWgu5UgP50hsYX3ys6kMRBr6b523POSpRifWwn3HENy3OUwQxE6ADgrUe+iOaDtwRWSlMShsf
 jEiifZKKRb4BEZrI/NH+U8vJ0vrZyr9cvOhc15Ng4ZkYNF0VBljrliyaVKJEHzVudh51B91IStQxW
 basTX/MOgYPO9MEPQmX7sfZTFsf4vK0zCdLT6XJnsYBiL5NSS9ZkKicRN8aBeUg+v/+mSZAdT+gmp
 6N2IkEVUo50AUVWe6cxlQaR+IEx9pvmHzjP9V15kwvKeq6YS4a1EZrsiRgd1WgQC69fcteMB3mOYR
 za6LQNsfbNBCEBNi9vWWbssEo9XMW7ouN9ZAq9zrV7EvliTzJYj3xMIdDNgSfQACiyQ9Xw+ojRzVw
 oqVwNFyV1pWe7MMjq31G5DmgVCUb+NiWtpT4IExgZS1um1oWt8PhVP6lKP+nO7t2Btg7A+0c2vqWB
 wrbMJ4tYj4Y4HC5zDXn6Htp6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vU403-000Pq4-2C; Fri, 12 Dec 2025 14:20:03 +0000
Received: from bjacke by pell.int.sernet.de with local (Exim 4.93)
 (envelope-from <bjacke@sernet.de>)
 id 1vU403-008u0Q-88; Fri, 12 Dec 2025 15:20:03 +0100
Date: Fri, 12 Dec 2025 15:20:03 +0100
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.23.4 Available for Download
Message-ID: <20251212142003.GA2120881@sernet.de>
Mail-Followup-To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-Q: Die Schriftsteller koennen nicht so schnell schreiben, wie die
 Regierungen Kriege machen; denn das Schreiben verlangt Denkarbeit. - Brecht
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
From: =?utf-8?q?Bj=C3=B6rn_JACKE_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?iso-8859-1?Q?Bj=F6rn?= JACKE <bjacke@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



Release Announcements
---------------------

This is the latest stable release of the Samba 4.23 release series.


Changes since 4.23.3
--------------------

o  Ralph Boehme <slow@samba.org>
   * BUG 15926: Samba 4.22 breaks Time Machine
   * BUG 15947: mdssvc doesn't support $time.iso dates before 1970

o  G=FCnther Deschner <gd@samba.org>
   * BUG 15963: Fix winbind cache consistency

o  Volker Lendecke <vl@samba.org>
   * BUG 15897: Assert failed: (dirfd !=3D -1) || (smb_fname->base_name[0] =
=3D=3D '/')
     in vfswrap_openat
   * BUG 15950: ctdb can crash with inconsistent cluster lock configuration

o  Anoop C S <anoopcs@samba.org>
   * BUG 15897: Assert failed: (dirfd !=3D -1) || (smb_fname->base_name[0] =
=3D=3D '/')
     in vfswrap_openat

o  Andreas Schneider <asn@samba.org>
   * BUG 15809: samba-bgqd: rework man page
   * BUG 15936: samba-bgqd can't find [printers] share
   * BUG 15955: Winbind can hang forever in gssapi if there are network iss=
ues.
   * BUG 15961: libldb requires linking libreplace on Linux


#######################################
Reporting bugs & Development Discussion
#######################################

Please discuss this release on the samba-technical mailing list or by
joining the #samba-technical:matrix.org matrix room, or
#samba-technical IRC channel on irc.libera.chat.

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
using GnuPG (ID AA99442FB680B620).  The source code can be downloaded
=66rom:

        https://download.samba.org/pub/samba/stable/

The release notes are available online at:

        https://www.samba.org/samba/history/samba-4.23.4.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

