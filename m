Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EC518C4DD88
	for <lists+samba-technical@lfdr.de>; Tue, 11 Nov 2025 13:48:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=TsStE0UxM470U2BOGVNAe8qzXF2OndLZqM63rpZD7kc=; b=OlaA0QeBtBnHsr62hH+2GWCLIp
	wxeIgrWk/2btjyrgAcAvinpNsAjKJ4m6Oquz12mAoMNwwIyMf90dfAia0dgRqTOp86s9L5TCxmUUJ
	AiGPYnTDgR/lIoew8lCUpvacIqU2eF9GMY0ZtwyIoJIiHr0qEMIJ2ZsN9WKK9LqdQqA3Hs2ZefFgc
	HXPsMvZU6LCUJWzfWS4jzMRlaPaVyHaFi0nR8PERIkhUnDISA3L7RdqQmSkhbJtnzB1CGxdfQl77/
	7HIF3mkL8wAhdkpZyPEfOttg+Iz+CWhI/JHhP+lHcCt9ZTF244oXuzWGi+ZFwlzo9Xv7pRKteMNbg
	OZFojXhA==;
Received: from ip6-localhost ([::1]:25240 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vInnA-00Bzgc-Pa; Tue, 11 Nov 2025 12:48:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46480) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vInn1-00Bzfu-II; Tue, 11 Nov 2025 12:48:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=TsStE0UxM470U2BOGVNAe8qzXF2OndLZqM63rpZD7kc=; b=YulDgM+fzfU6Vh38xoJxbPSDH1
 h8R+Gpy545PeOFU9YuBXYHX7YYrnBtQaU9yHx/CuWV3nEFLhaIUVc6Jky3szEYRWJX9r/yeLaxNcB
 Cnw4Gc0mWlt/2y55GM8XG16MYxFuYsBCubJaNq31U8y9LhEANs7Lg5sEhtrLpQfjsYyAzNl06V663
 Q6E0AdcPSTO3TFB+nwaqg+kr94VMOx5uAKEQwBwzEIbS/KHlrjXnHNDrC5xGlzO+GIzQDuIYQ8Mrn
 ZG7FLecFi+fdmJ5v8PtM0hqn5Rq3HzrWxeyNpKcT+4bQ79INugXQqRN7soGWnscWZzcooA0IQzkeD
 r0DoPF6tKm+GNZWv0TDRpNiNxXmDzg71JkT5r5RU11A9UFgKG987zCMyPlRYVhFgOtT0kDQnR/5jB
 /9A6jS/u5Cm5cpKPY68jJx3XsfW/6sMLcyPuIbf+qrWmyjuBecI/k9vRrhfETvDaQMA+BzleboBmA
 MCcuj+t57TUzq0PFbvvV8L6Y;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vInn0-00DbmM-2n; Tue, 11 Nov 2025 12:48:03 +0000
Message-ID: <3137ed6a-ee9a-4bf1-bba8-7d6882078f9a@samba.org>
Date: Tue, 11 Nov 2025 13:48:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.21.10 Available for Download
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

This is the latest stable release of the Samba 4.21 release series.


Changes since 4.21.9
--------------------

o  Bailey Allison <ballison@45drives.com>
    * BUG 15935: Crash in ctdbd on failed updateip.

o  Pavel Filipenský <pfilipensky@samba.org>
    * BUG 15905: samba-4.21 fails to join AD when multiple DCs are returned.

o  Anoop C S <anoopcs@samba.org>
    * BUG 15919: vfs_ceph_new should not use 
ceph_ll_nonblocking_readv_writev
      for fsync_send.

o  Andreas Schneider <asn@samba.org>
    * BUG 15905: samba-4.21 fails to join AD when multiple DCs are returned.

o  Shachar Sharon <ssharon@redhat.com>
    * BUG 15919: vfs_ceph_new should not use 
ceph_ll_nonblocking_readv_writev
      for fsync_send.

o  Martin Schwenke <mschwenke@ddn.com>
    * BUG 15921: CTDB_SOCKET can be used even when CTDB_TEST_MODE is not 
set.
    * BUG 15935: Crash in ctdbd on failed updateip.


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

         https://www.samba.org/samba/history/samba-4.21.10.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

