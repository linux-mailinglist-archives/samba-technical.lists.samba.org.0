Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C03F46FECB5
	for <lists+samba-technical@lfdr.de>; Thu, 11 May 2023 09:24:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=TZo0D8J8dUe9lUMr1UoFKWdGeaX5Q5zw7L0PcZXGzGo=; b=W/D+Jeq6DngPiz5XwBvtHkMxL+
	SsJGlMx2ct3EOXnUwT4QUU+YB5wsyjdvmgFH2Cc/qk48iF1jGV1/hp5y6ukURMD0lZ8hXHa+31eMT
	vGwYT6AE1qZkn6+vCv5o5POODKQGfQU+7/Adi1PKIMDDJNypdTKHKG8tEQYJqe2Iy3DnBFz5A8oGZ
	R6cSvAD6P/08fx20uN7ZUh2Z9IufRGbZ8NBvggvlZY6C04vzyrzXJrCW30V7kfGy+/YARa2gUumzd
	+JCkLvtOrUbKEqjSGg/Qpyc5BFeL4TFexWZ/Yf9HB541zIUntA8EYf30b3WeplzFGSpdXVzkClbtm
	3RSVxt9w==;
Received: from ip6-localhost ([::1]:58914 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1px0es-009S4k-CN; Thu, 11 May 2023 07:24:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58106) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1px0e6-009S1q-9n; Thu, 11 May 2023 07:23:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=TZo0D8J8dUe9lUMr1UoFKWdGeaX5Q5zw7L0PcZXGzGo=; b=ciYAo8xAtF1jDGgBWfn89QmCMF
 KfTeqEk5vCkFxWW7rnqenDzZedqr0NFD6ZBstERKMNMLXWUIJsWkB2eGihJyPYT23vtCODgzXpFWX
 tyyeV/4t6GXIMMdu+lxllGsNFcg+Jd0cYOjhgZ+Z7Kmpn0800aJxvJQ6J7mO9l5qjmZROp9nJMZcR
 qmbQsp7hG74WtmjpHPb10by1Ks4kjMc+ba0Un1SVkgf9m2t4lHDSDsqw5bt++4oSoGkGob1PRuCRw
 25gp78r4u0u4NQOZkXGX+c5G559o9czRvz6RGakTSUffxhdK4S1X+DToHr9cbPiGp47sPg/D+KgrF
 8zhhbmPQE+qL8s7Om431L0DR2+ATDYinv+ssYzej34k0pNyRAv1g6i2711BBxHxGhB/BTC4ThloRH
 5B8yNp7t8jnuLSN/iTTStP2a49097x2e0DFWNQIe2oXUJqMXjR2eoXCWrbiytvR56wI0wj5t/i8mC
 UOQwZrzgMjD3bAffDqKlRLC6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1px0e5-007RN3-IV; Thu, 11 May 2023 07:23:25 +0000
Message-ID: <3d63fc26-58f4-9430-4706-54c9d67f61d0@samba.org>
Date: Thu, 11 May 2023 09:23:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.17.8 Available for Download
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

This is the latest stable release of the Samba 4.17 release series.


Changes since 4.17.7
--------------------

o  Jeremy Allison <jra@samba.org>
    * BUG 15302: log flood: smbd_calculate_access_mask_fsp: Access denied:
      message level should be lower.
    * BUG 15306: Floating point exception (FPE) via cli_pull_send at
      source3/libsmb/clireadwrite.c.

o  Andrew Bartlett <abartlet@samba.org>
    * BUG 15328: test_tstream_more_tcp_user_timeout_spin fails 
intermittently on
      Rackspace GitLab runners.
    * BUG 15329: Reduce flapping of ridalloc test.
    * BUG 15351: large_ldap test is unreliable.

o  Ralph Boehme <slow@samba.org>
    * BUG 15143: New filename parser doesn't check veto files smb.conf 
parameter.
    * BUG 15354: mdssvc may crash when initializing.

o  Volker Lendecke <vl@samba.org>
    * BUG 15313: Large directory optimization broken for non-lcomp path 
elements.
    * BUG 15357: streams_depot fails to create streams.
    * BUG 15358: shadow_copy2 and streams_depot don't play well together.
    * BUG 15366: wbinfo -u fails on ad dc with >1000 users.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15317: winbindd idmap child contacts the domain controller 
without a
      need.
    * BUG 15318: idmap_autorid may fail to map sids of trusted domains 
for the
      first time.
    * BUG 15319: idmap_hash doesn't use ID_TYPE_BOTH for reverse mappings.
    * BUG 15323: net ads search -P doesn't work against servers in other 
domains.
    * BUG 15338: DS ACEs might be inherited to unrelated object classes.
    * BUG 15353: Temporary smbXsrv_tcon_global.tdb can't be parsed.

o  Andreas Schneider <asn@samba.org>
    * BUG 15360: Setting veto files = /.*/ break listing directories.

o  Joseph Sutton <josephsutton@catalyst.net.nz>
    * BUG 14810: CVE-2020-25720 [SECURITY] Create Child permission 
should not
      allow full write to all attributes (additional changes).
    * BUG 15329: Reduce flapping of ridalloc test.

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

         https://www.samba.org/samba/history/samba-4.17.8.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

