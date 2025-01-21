Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1762FA17F59
	for <lists+samba-technical@lfdr.de>; Tue, 21 Jan 2025 15:03:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=qHTT2OxnhY6ECLiI0cGHqPAbgdfsvZnh6i+HRvUpI9w=; b=phbCLK488IRIVGWwm5OnuHNkl1
	LXUkSQyANKObFga9azGL+oDEo1bhzEJp+xmSlEeV/mQfcTP25nisLuJWG+nU7RCxDGDDwspXIfIsq
	xPMvlr/n//ogz2nr16xvHGU4O9MXlR+kj+eaN6uIMTIEjRZViSGmsqZ/16y6hKKK6wEJLKw54WMmm
	u4lR+WB3PhAQ/FrH7XEb+UXXJpSaznEX4qijU3R6BtQYtxQWicT1LYZJYDp0Np9StH5WrlQ89JVG9
	2s3xY+ToD2eEAAqrQCidBFv/qtpiG2rabJVTxye0T4KnVYCEPg7Hqq7+gmDUM4XepmdF7WGchkeqO
	CmiO0Wxw==;
Received: from ip6-localhost ([::1]:31754 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1taEqF-008xml-8Z; Tue, 21 Jan 2025 14:02:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46790) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1taEpW-008xgb-79; Tue, 21 Jan 2025 14:02:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=qHTT2OxnhY6ECLiI0cGHqPAbgdfsvZnh6i+HRvUpI9w=; b=ddf1mGriq4/I/CYDSCb7JHva0v
 TE/aLcEg/LZNEuael5DULZQgl2OuzpnsYMPLYz9jigW5cX42uYi1DV/EFx1rpnupyP9BXwzSuo4eu
 dzIuZsZs0eOq/G/I81ICfKlCsIFmxumKGTX6NwZiUyN1Sk5+oMveowsot6HDg+nUIHxrRZvA0RKZB
 BGlJ2F1NP9Wir3zf2RdX/ZyL1/B59/NAU8tKShRRP/XQWB4I/FfwS+7MBNL+P6bJDA0lZf7dQW7eX
 nleRx0RxQGLVH4HQM6MydA+F0RgKxfPdLqwTSMJTmHgD+kIx5sOfiOyQ8v9PPo3hwfcG8K+5haLZu
 jBky6HRr1WsBk47qKwS4SjFxVjtvevQngeTtBo2cuGjhwoU3Uqb9us3DBvdDUVkXSi/+ZtgAb8Yxh
 xQWGKjOKxeNCwN76Myif+u1nmwtlYLANF8cJFowo0HADYTrGI0gOT3putLqLNYJOy71yq3RVy6Khg
 GMRyat8B0XS09aczjZst+u+F;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1taEpU-001GAv-2c; Tue, 21 Jan 2025 14:02:09 +0000
Message-ID: <11044846-f81b-43b6-975d-c8b2184fc254@samba.org>
Date: Tue, 21 Jan 2025 15:02:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.20.7 Available for Download
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

This is the latest stable release of the Samba 4.20 release series.


Changes since 4.20.6
--------------------

o  Vinit Agnihotri <vagnihot@redhat.com>
    * BUG 15780: Increasing slowness of sharesec performance with high 
number of
      registry shares.

o  Ralph Boehme <slow@samba.org>
    * BUG 15697: Compound rename from Mac clients can fail with
      NT_STATUS_INTERNAL_ERROR if the file has a lease.
    * BUG 15754: Panic in close_directory.

o  Guenther Deschner <gd@samba.org>
    * BUG 15780: Increasing slowness of sharesec performance with high 
number of
      registry shares.

o  Pavel Filipenský <pfilipensky@samba.org>
    * BUG 15724: vfs crossrename seems not work correctly.

o  Volker Lendecke <vl@samba.org>
    * BUG 15771: Memory leak wbcCtxLookupSid. samba-4.21.2.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15765: Fix heap-user-after-free with association groups.
    * BUG 15769: The values from hresult_errstr_const and hresult_errstr are
      reversed in 4.20 and 4.21.
    * BUG 15778: Kerberos referral tickets are generated for principals 
in our
      domain if we have a trust to a top level domain.

o  Martin Schwenke <mschwenke@ddn.com>
    * BUG 15320: Update CTDB to track all TCP connections to public IP 
addresses.
    * BUG 15755: Avoid event failure race when disabling an event script.

o  Jones Syue <jonessyue@qnap.com>
    * BUG 15724: vfs crossrename seems not work correctly.


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

         https://www.samba.org/samba/history/samba-4.20.7.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


