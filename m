Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ED44B7AFE4B
	for <lists+samba-technical@lfdr.de>; Wed, 27 Sep 2023 10:26:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=DWCfxLMc3ws8QfPYk24R50W0GPpE+NRxz2HYSIcx3Gw=; b=X3mWhVJ2WoufDqYtf6ghRArJRD
	m0nYT8sm7nqCqlWUbuTAFPIegAZL9Xnsd26a85N30nZmWHhH4HFe2iB6kzNQyZ27uxsRZuSdxK2fI
	OixnzDchDRyPVe038g9fd0OQJrk1Xb4vKtNJWpZKtlm+cS5WPlWQdkrHdDEBZ1n+Dil02A2TtIKiX
	5PAxV0KWid8KSDupoxXT0lAlHNYhYPO8uc+TnVw+F40q5fgApVblKWCX2fK+3D/7DOMDONw9D1DVX
	xcVRKV1naihGVO51L3IpO0vww8yYiUxCX91smr2/wrdiYcjipKJ0oQt6ZWYFqq//bvb+gWQBljH/I
	fzFmbIzw==;
Received: from ip6-localhost ([::1]:47742 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qlPrx-006Ybl-2Q; Wed, 27 Sep 2023 08:26:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19820) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qlPrf-006Yan-B5; Wed, 27 Sep 2023 08:25:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=DWCfxLMc3ws8QfPYk24R50W0GPpE+NRxz2HYSIcx3Gw=; b=QN3ADHiT8s1QSO/4eVVLUzIC1K
 bSahoK9RHlHFGx/T6RWz5tl/biiJfwTsYAtOYxWCDWYyjpph4I3oz046ncBS59T72360uJjnDe0Ei
 Cvfly38SvYKPtzgsav22vduCXzW/gKOVCl5mdKCQTBU2X1SHxOvNIp4kuuTaBSjgVil5fF8sARJx1
 UXHocNMa34WGfov3u4c0Z4/NokhOzC7/St7Dw2FXQvZ+RbmINPb6aoju/PyyvjLmQtHrjUVtVcxsr
 PcIaVlRHrqzqaeVAksfV5PfJ7YLA4Q57fNpYnlaQz2FVqNRqrJx4NWat2GVWITrHDEooXWdkzcA4F
 WG2nLAxqea2b61MdHLIJdjgcEz9cUnEpTXySqvMlP4JIZyPhHztFCVFJN1hBPZn4fOF9WTYLxNFTa
 2YTEA5AhIWeOxkKOUXPpov9R2xKHGyKPH1yK1GJhAUS5Sj0AVAhmoQPW1y82e/WEq9zXy+1GVAdzB
 eQtfiXSV8EYSJhXyhR+GK4/x;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qlPre-00FbE4-38; Wed, 27 Sep 2023 08:25:47 +0000
Message-ID: <26cbd0ea-b30e-1602-579d-e3e59d3a7474@samba.org>
Date: Wed, 27 Sep 2023 10:25:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.18.7 Available for Download
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


Changes since 4.18.6
--------------------

o  Jeremy Allison <jra@samba.org>
    * BUG 15419: Weird filename can cause assert to fail in
      openat_pathref_fsp_nosymlink().
    * BUG 15423: use-after-free in aio_del_req_from_fsp during smbd shutdown
      after failed IPC FSCTL_PIPE_TRANSCEIVE.
    * BUG 15432: TREE_CONNECT without SETUP causes smbd to use uninitialized
      pointer.

o  Andrew Bartlett <abartlet@samba.org>
    * BUG 15401: Avoid infinite loop in initial user sync with Azure AD 
Connect.
    * BUG 15407: Samba replication logs show (null) DN.

o  Ralph Boehme <slow@samba.org>
    * BUG 15463: macOS mdfind returns only 50 results.

o  Remi Collet <rcollet@redhat.com>
    * BUG 14808: smbc_getxattr() return value is incorrect.

o  Volker Lendecke <vl@samba.org>
    * BUG 15481: GETREALFILENAME_CACHE can modify incoming new filename with
      previous cache entry value.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15464: libnss_winbind causes memory corruption since samba-4.18,
      impacts sendmail, zabbix, potentially more.

o  MikeLiu <mikeliu@qnap.com>
    * BUG 15453: File doesn't show when user doesn't have permission if
      aio_pthread is loaded.

o  Martin Schwenke <mschwenke@ddn.com>
    * BUG 15451: ctdb_killtcp fails to work with --enable-pcap and libpcap ≥
      1.9.1.

o  Joseph Sutton <josephsutton@catalyst.net.nz>
    * BUG 15476: The KDC in 4.18 (and older) is not able to accept 
tickets with
      empty claims pac blobs (from Samba 4.19 or Windows).
    * BUG 15477: The heimdal KDC doesn't detect s4u2self correctly when 
fast is
      in use.


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

         https://www.samba.org/samba/history/samba-4.18.7.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

