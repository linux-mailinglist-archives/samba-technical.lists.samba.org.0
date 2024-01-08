Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C18088271C9
	for <lists+samba-technical@lfdr.de>; Mon,  8 Jan 2024 15:49:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=S4mYueQBOV01sO/5EmlaRjcOtbwdMVsh+gRhLO9l+dU=; b=OxYZuJIC1gI2SK6LDumNZsMvXe
	HOPhgaw7a7g0GPsno9fuOEnuygILVJE+XwMlou4hBiXzr7XBRjlGiPw2nzdl6KG702eU17WjHff2H
	NM2GV1whJ+pqk5L16qdlJmhDu8NhM61KW2FMfG/ZSCYOKTeFtFjMA/HUJnB1+hCDKsITA+0Og+kOD
	zm0OCWiTj/SyC8oD1P1DfvB3qrn/XtOmEM5m5mDs89KQp/XKUpD9O/TO5xTQH0I85jpd3gwxoVlrX
	52FrGWxVXZcDuTqAexMJWkfU4qhaXoahy7bxhg6OmnmpTKyKVIKtpj5nnZSGiHrz4SCq93m2SuAyk
	wkcPPQZg==;
Received: from ip6-localhost ([::1]:32298 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rMqvZ-002me1-Ga; Mon, 08 Jan 2024 14:48:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43408) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rMqvO-002mdL-OM; Mon, 08 Jan 2024 14:48:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=S4mYueQBOV01sO/5EmlaRjcOtbwdMVsh+gRhLO9l+dU=; b=Za6pF9l1hH/Va5Q2pQ94yg2xmL
 XIAtp6moHLBcSFN8NJzPPsFZts7ijz1IKBdxlwLgMRMEk9oxP1BjWUvLIV7Wd4Bdb6TwNxbY2KRCT
 sJsaapPsdiZxKKAU9xPECBvTIhUnA+pPQC8X7FNAyC2Qzbr54QdpT75/dIOgf3NJmsMjz8GZlYRS+
 YLAl4QsatoLQiOzqMl2a581ojztKCJqNQmwydKYS8CJbCoX+82Q7buZpS3ySZJ71c24j5Z9jE09pE
 oQPYUiqS9Q9yUR8rkJc4be95SMRtt7mxbfbdvMG2Zc7MJbUYMbBwJWrUwatweD0ARvXRy9Z74BWOc
 jwvl46SNBuABbpaPzUTmlioIak4wuMvoOxLXSHGywuctwevuU6x1cjMvJbj5xjS4e18Ds4wXF6wSu
 k2Wh/vWkAb3JuDDsb+EISXUsPtoBRdwueYg0qEN7ncvNO90m3ha97ndQCxYGDvr/ihk+uurv/04VP
 QLTI9+5ccIhUf1U8/oawBt8f;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rMqvO-0070n3-11; Mon, 08 Jan 2024 14:48:22 +0000
Message-ID: <483c4cf3-237d-4361-98ae-436d0f25d436@samba.org>
Date: Mon, 8 Jan 2024 15:48:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.19.4 Available for Download
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

This is the latest stable release of the Samba 4.19 release series.


Changes since 4.19.3
--------------------

o  Samuel Cabrero <scabrero@samba.org>
    * BUG 13577: net changesecretpw cannot set the machine account 
password if
      secrets.tdb is empty.

o  Björn Jacke <bjacke@samba.org>
    * BUG 15540: For generating doc, take, if defined, env 
XML_CATALOG_FILES.
    * BUG 15541: Trivial C typo in nsswitch/winbind_nss_netbsd.c.
    * BUG 15542: vfs_linux_xfs is incorrectly named.

o  Björn Jacke <bj@sernet.de>
    * BUG 15377: systemd stumbled over copyright-message at smbd startup.

o  Volker Lendecke <vl@samba.org>
    * BUG 15505: Following intermediate abolute share-local symlinks is 
broken.
    * BUG 15523: ctdb RELEASE_IP causes a crash in release_ip if a 
connection to
      a non-public address disconnects first.
    * BUG 15544: shadow_copy2 broken when current fileset's directories are
      removed.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15377: systemd stumbled over copyright-message at smbd startup.
    * BUG 15523: ctdb RELEASE_IP causes a crash in release_ip if a 
connection to
      a non-public address disconnects first.
    * BUG 15534: smbd does not detect ctdb public ipv6 addresses for 
multichannel
      exclusion.

o  Andreas Schneider <asn@samba.org>
    * BUG 15469: 'force user = localunixuser' doesn't work if 'allow trusted
      domains = no' is set.
    * BUG 15525: smbget debug logging doesn't work.
    * BUG 15532: smget: username in the smburl and interactive password 
entry
      doesn't work.
    * BUG 15538: smbget auth function doesn't set values for password prompt
      correctly.

o  Martin Schwenke <mschwenke@ddn.com>
    * BUG 15523: ctdb RELEASE_IP causes a crash in release_ip if a 
connection to
      a non-public address disconnects first.

o  Shachar Sharon <ssharon@redhat.com>
    * BUG 15440: Unable to copy and write files from clients to Ceph 
cluster via
      SMB Linux gateway with Ceph VFS module.

o  Jones Syue <jonessyue@qnap.com>
    * BUG 15547: Multichannel refresh network information.


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

         https://www.samba.org/samba/history/samba-4.19.4.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

