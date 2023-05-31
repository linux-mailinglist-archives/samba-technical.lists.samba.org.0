Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F2797718735
	for <lists+samba-technical@lfdr.de>; Wed, 31 May 2023 18:20:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=63bVC/5b4LIHj/ant6EyZMjNXFafoX5HsrWegjgV0ZA=; b=TQRG6fGlnPfEWwemyra8/t1AS6
	ADxFT1ZBvGDumQFBsHg3eRwIZ7mK492KA44qauiKDvWY0caKnOCX73x/7sCCsFdfZqUB6INbLRxrl
	eAL0FRl2N7rO1R6UKe8DihUDxrMRaW26YGq8keqXj8wKnrn5Vp0WFpcGbSVFoid6RaA8hLOzTCZJb
	1EIaz44kJUrQ/Y133MkHmzNRDfFVxGDkn0OOQFvLEGhrOwfDuOZsqMCB/T+bmQEGd2stCHEMMeDHc
	FRCPpfreQGiDahyuU/OxUho4mYDC+qrn4ZqA0XzIueMfbshmwmFoc+enNPL7kTKL8W2vdJIYmZaEs
	dJKbg47A==;
Received: from ip6-localhost ([::1]:63668 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q4OXt-00DefM-O2; Wed, 31 May 2023 16:19:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12958) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q4OXj-00Dedu-3a; Wed, 31 May 2023 16:19:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=63bVC/5b4LIHj/ant6EyZMjNXFafoX5HsrWegjgV0ZA=; b=eCidv2vDJIj7HOCVXTJbV6/hof
 3qNN/wysgtVg35/u+Wx4UFnVva1Up0rDW41QC9rWQv2jJtTNQwZ2lf3nBGz91m1Fk2VTM7ftwjkhC
 77fTS1lXT6PkQ5amF9TpOs2AVbVWk0geIJT2N14P1BMue8MYymniifbQX7fvcs+Y3dMJecdyz/nl5
 9nYEoL2G9vzxscYZ69ICvHT33Im0DjUiKK/TyuN6OfZfLSLwkEqnHBZQkjglSNf4k2YIQAMZsZv6r
 qocIwxYE3xypfCi5Pd307FlCxQsHDwup9sFhY9m/2D2GDQRRqZcAsN3orVtb8FA9kSvRBkVd0LBcL
 TBQfcb/hu3gKVDBDdBcKzEek+zXBhy+LEhW3aI6m6RFAx53u2qiVNwKpO7fRA90MM25q7DsAVV9gm
 u91/3KmLi3cDE183xkWD9y7KEUWEPUMO2TAeJOiilQC7NKR6C4f1LbMVIw23+Ukt1pL+EITeeLWK4
 I7SCxilTaIYicLR542SLtkAe;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1q4OXi-000tBG-2g; Wed, 31 May 2023 16:19:22 +0000
Message-ID: <736a70c2-d006-a57e-3f78-cafa2bd98276@samba.org>
Date: Wed, 31 May 2023 18:19:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.18.3 Available for Download
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Release Announcements
---------------------

This is the latest stable release of the Samba 4.18 release series.


Changes since 4.18.2
--------------------

o  Ralph Boehme <slow@samba.org>
    * BUG 15375: Symlinks to files can have random DOS mode information in a
      directory listing.
    * BUG 15378: vfs_fruit might cause a failing open for delete.

o  Volker Lendecke <vl@samba.org>
    * BUG 15361: winbind recurses into itself via rpcd_lsad.
    * BUG 15366: wbinfo -u fails on ad dc with >1000 users.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15338: DS ACEs might be inherited to unrelated object classes.
    * BUG 15362: a lot of messages: get_static_share_mode_data:
      get_static_share_mode_data_fn failed: NT_STATUS_NOT_FOUND.
    * BUG 15374: aes256 smb3 encryption algorithms are not allowed in
      smb3_sid_parse().

o  Andreas Schneider <asn@samba.org>
    * BUG 15360: Setting veto files = /.*/ break listing directories.

o  Joseph Sutton <josephsutton@catalyst.net.nz>
    * BUG 15363: "samba-tool domain provision" does not run interactive 
mode if
      no arguments are given.

o  Nathaniel W. Turner <nturner@exagrid.com>
    * BUG 15325: dsgetdcname: assumes local system uses IPv4.


#######################################
Reporting bugs & Development Discussion
#######################################

Please discuss this release on the samba-technical mailing list or by
joining the #samba-technical:matrix.org matrix room, or
#samba-technical IRC channel on irc.libera.chat.

If you do report problems then please try to send high quality
feedback. If you don't provide vital information to help us track down
the problem then you will probably be ignored.  All bug reports should
be filed under the Samba 4.1 and newer product in the project's Bugzilla
database (https://bugzilla.samba.org/).


======================================================================
== Our Code, Our Bugs, Our Responsibility.
== The Samba Team
======================================================================



================
Download Details
================

The uncompressed tarballs and patch files have been signed
using GnuPG (ID AA99442FB680B620).  The source code can be downloaded
from:

         https://download.samba.org/pub/samba/stable/

The release notes are available online at:

         https://www.samba.org/samba/history/samba-4.18.3.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


