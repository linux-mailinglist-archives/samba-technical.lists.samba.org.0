Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D11A05B0CEA
	for <lists+samba-technical@lfdr.de>; Wed,  7 Sep 2022 21:11:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=1jcuNtInP4G3ROLNJEQTVW8Xk4Oth5Ngu7+6+hd/31A=; b=4UHf1wG4RBZ+0ysxTnVmq31TIZ
	Uf6O9WET2GepBP1it74GwsOREDnirGV1yH+uj3HvBNxUJxRF7tkG6Rzx5ksCBTxGzlb3IKvIHwvs6
	tV+jkhNW+tDf6/x7C8/SktYyk81LP1JH8BXq/RsvQm/d8vC3V+HmSv1FC2KB/MsmRJw0Wxn3vW+Zu
	K1NTaMya9AspVxVUw41Yb7W4/wsUJf49TGfsjAzfGC0wgkSMjqah38m92Fr6tMDiHemv0xYxY9SWe
	+qSoI8ab0gpMT1avkLBZgNOvtbpPtgdtC+nmlzMuYeMML+2FrxOwoTAlr3XerEfVL7j+ZZcsqrxd0
	QJGMZ24w==;
Received: from ip6-localhost ([::1]:43120 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oW0SD-006DMT-LI; Wed, 07 Sep 2022 19:11:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23224) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oW0S1-006DLT-2d; Wed, 07 Sep 2022 19:11:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=1jcuNtInP4G3ROLNJEQTVW8Xk4Oth5Ngu7+6+hd/31A=; b=Kwc6FeYT0SMGG+gwnDGiVeAKbC
 V7nE4//tYMwkgrZ54pXRruUSLC6wzVE8Rhxr+nWXNn12N7u9r3cKwjWHqsIK1ccp0eOv+71KPZIEG
 MZrvsz4ZeIytQP+k3sORy5T+F4GsJIJAlFTacW9RUXnTf91Qg6vVUH+r0WwoO4ETc4cvw9QWl+msm
 YCNZjmMiCjnw+OHHE5V//2Pl9nUxLWPR/rp5rLp66UPwisrUVepnq07iSPYzKXJWyhTdRqqo1YK1C
 p6/JccUXDc4yTVwH/EXPd3Z8vcqduJZX8TPk4BW7/+HQNK2kRn5aZ/p0VkrrQ5mfyfKY8erGBZKE8
 9/o89BG3HUAruXYkPfUqM7JWMZ/5EUDpc89nVJaUCW7Lk3k7mG3GvA7kPq35eC1f+jQt3uf4dW2aL
 GXhjYFHgrfOkzZepzECQEPMQmX5EuKbrCAci2l37RSTwVf3IHvmSqAZpWEi2mUirtTX4DqMuZ2zTQ
 bn9rKNkA/ZED1ZdOm28V0W5+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oW0S0-003XHN-C3; Wed, 07 Sep 2022 19:11:04 +0000
Message-ID: <2685a9a9-e560-0821-0086-7c4285e65e24@samba.org>
Date: Wed, 7 Sep 2022 21:11:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.16.5 Available for Download
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

This is the latest stable release of the Samba 4.16 release series.


Changes since 4.16.4
--------------------

o  Jeremy Allison <jra@samba.org>
    * BUG 15128: Possible use after free of connection_struct when iterating
      smbd_server_connection->connections.

o  Ralph Boehme <slow@samba.org>
    * BUG 15086: Spotlight RPC service returns wrong response when 
Spotlight is
      disabled on a share.
    * BUG 15126: acl_xattr VFS module may unintentionally use filesystem
      permissions instead of ACL from xattr.
    * BUG 15153: Missing SMB2-GETINFO access checks from MS-SMB2 3.3.5.20.1.
    * BUG 15161: assert failed: !is_named_stream(smb_fname)") at
      ../../lib/util/fault.c:197.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15148: Missing READ_LEASE break could cause data corruption.

o  Andreas Schneider <asn@samba.org>
    * BUG 15124: rpcclient can crash using setuserinfo(2).
    * BUG 15132: Samba fails to build with glibc 2.36 caused by including
      <sys/mount.h> in libreplace.

o  Joseph Sutton <josephsutton@catalyst.net.nz>
    * BUG 15152: SMB1 negotiation can fail to handle connection errors.

o  Michael Tokarev <mjt@tls.msk.ru>
    * BUG 15078: samba-tool domain join segfault when joining a samba ad 
domain.


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

         https://www.samba.org/samba/history/samba-4.16.5.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


