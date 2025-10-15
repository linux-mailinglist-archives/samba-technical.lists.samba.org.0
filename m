Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EBABDE8F3
	for <lists+samba-technical@lfdr.de>; Wed, 15 Oct 2025 14:57:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=mM1yW7GaV2Z6s0STaG67GPkXEFcYM3pVfWgVOFecN7g=; b=NVm3Y2HA46ZhuTRBvcLqyYVyf1
	B/wT6T65GQf9lVMrwbbzN61jjqMccvs6WTJDHlquy9uZSgrHpigKDm0zA7sfcmuXjfngV2Y+JheQl
	+LGLXrIyJkb1nMabJlqY5//I8dzzNE2vMV5qFhVXUUQBXt6NDJA9PGDSb/tVEWFheVOnRtHAeAUdg
	BDT4UrNjlFlB/Z4ZaXCZgTjs9gOOuhRAQHsau88oBY24l0zUuTzFcFqpeEXmxkQl52S8HX9jzBrVg
	hmsuO8PSPLITNiiMPjKpdCh0ZPzYFz5rv/frvBbsLK1GasN04Pv81fGnryCSX540TFfzdVE2is2CB
	+DgcKuLg==;
Received: from ip6-localhost ([::1]:25702 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v914D-007plc-Jb; Wed, 15 Oct 2025 12:57:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56554) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v9144-007pkk-VB; Wed, 15 Oct 2025 12:57:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=mM1yW7GaV2Z6s0STaG67GPkXEFcYM3pVfWgVOFecN7g=; b=2+Qc0olHH/8e/CSBM4SFe94ZiZ
 Ozk9MLd7D5npLKyuGVOOzXRQa8yFLS8lkGQRhqddiCAGliluWqPQdVLmoYioliXCPNH975n5y9+YV
 Hm9fKeRJh/WMelNjHfbzWjSLa3fhMgKAZKxGN2B0fIpZWVcRu5tzRl+p83THv4IDeIDNAZ9omMmkc
 US1EOQtCGuu4F0hxqmFDQC7CDV+aJGjgke2dlywV9ZDzgRoCLqRXuvE6jJVbhRraxzpkJuy/8Nby5
 w6ZgShbQTpldpfSbmsdJELNbhAMM9TEXv31fxltR/PVncmaUuMmM25DgWHJ1w9syT7N4cUqlhqs8D
 DHJfkUsf6jORa22XDsGLNHMNJ1kSFpgb/qrFdggmh5L5lHrPKYpc7whV+pXZ9rijif9+Dj8wN+VTf
 B+p+HUjXS9sbU6EWZPkmrHnY02j2c++FPEHGuXBfsT5CB2yq3AR4r/3JpH51cHJ2JnetgiR79P9/J
 T3lrnU6rQiJSHJIfW7C4hV9/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v9144-009LjF-1Y; Wed, 15 Oct 2025 12:57:12 +0000
Message-ID: <f27522bb-20c4-4aed-a8f4-69aece443161@samba.org>
Date: Wed, 15 Oct 2025 14:57:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE, en-US
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.23.2, 4.22.5 and 4.21.9 Security Releases are
 available for Download
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

These are security releases in order to address the following defects:

o CVE-2025-9640:  Uninitialized memory disclosure via vfs_streams_xattr.
https://www.samba.org/samba/security/CVE-2025-9640.html

o CVE-2025-10230: Command injection via WINS server hook script.
https://www.samba.org/samba/security/CVE-2025-10230.html


Changes
-------

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
    * BUG 15903: CVE-2025-10230.

o  Andrew Walker <andrew.walker@truenas.com>
    * BUG 15885: CVE-2025-9640.


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

         https://www.samba.org/samba/history/samba-4.23.2.html
         https://www.samba.org/samba/history/samba-4.22.5.html
         https://www.samba.org/samba/history/samba-4.21.9.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


