Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 05905BE4074
	for <lists+samba-technical@lfdr.de>; Thu, 16 Oct 2025 16:54:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=EYNXBP5EqGR0gyBed4L9EWn29uPdymy+p2prV2nwEc8=; b=vfVfgsqPF03LdJmXSBcsKJedtc
	MJktBJkc+C6/YkjlK6P8HP+icjbGdFBJjyITY5Icb0N/aLgjrcbZ5YWr+DdJReHVfYwwRs+9OQiLI
	JFNCaBjORTE5QN8S1M8IwxXO0VKgle9hKhcQuYvsXvdmcn0YjpSVCz/iXNfkLuEaQ4O3RQ8g9B2Gu
	Em9iUcSFF8XVhSx8zuM0HulK8R4ldHUR2vEXD8Dp9WIhOKfvp/dDwaQxGtsJezyCX1E2GLa7gOF30
	vUae1cQIP2EruP/0iws+m0HdxLzdwOurvnqZ1ESyU9cF5/vbo8P0icTCFTUYV73kf0XAMnESmAl4s
	esoVLu+g==;
Received: from ip6-localhost ([::1]:64400 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v9PNE-007yZd-3T; Thu, 16 Oct 2025 14:54:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28520) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v9PN5-007yYs-Kf; Thu, 16 Oct 2025 14:54:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=EYNXBP5EqGR0gyBed4L9EWn29uPdymy+p2prV2nwEc8=; b=gFRo4YPCzBsR85wOwmUsrD8iaH
 Pwd4sKNbndub14GUfCp9MHY8OLiuwRZfGeXWkvumozXp+zKi0r01kTdyPF0gVTvs9hfnhds0B+Cz1
 Njw9K/Bp/zDykkX3vetSwBFV/yjoFeKF1imGNQluA+FQeCdPJtnGw5SnS73whJNHBLxMloYOChptZ
 zNAj9KW5XvEIC1s/k0LTly6dfI9U6Yn23bhXwexky3H9yVjJ3O/O93r24MNuqt6ihd8NydReO9S/j
 krLCZd1FUcRMgLSy+ruVQcMK7PMCv3gW2hoLwIXSf1lMTy5oZvMjwcUKKqP0hbhm7BmZilE5YzemN
 qEgs9q8WoUe+STYTlHjRYhSHwcnjgQWaESnEHEPm2ftyTpv0WewIum0yVwlKRPLyInmM4p4h8Qvxr
 oagDU55Gk39Gmm9/d1xVMLnhb4PVQkhVUW2PScZQ1lvndebA6hoM7FnCz50+TrmnfNQl7WlS2YFo2
 +YjCfOIPR0K08XoHXo0PIh3w;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v9PN5-009ZoM-0V; Thu, 16 Oct 2025 14:54:27 +0000
Message-ID: <ec9f55a4-f44a-4c26-800d-43d13d746092@samba.org>
Date: Thu, 16 Oct 2025 16:54:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.22.6 Available for Download
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

This is the latest stable release of the Samba 4.22 release series.


Changes since 4.22.5
--------------------

o  Ralph Boehme <slow@samba.org>
    * BUG 15843: macOS Finder client DFS broken on 4.22.0.
    * BUG 15926: Samba 4.22 breaks Time Machine
    * BUG 15927: Spotlight search restriction for shares incomplete and 
default
      search searches in too many attributes
    * BUG 15931: rpcd_mdssvc may crash because name mangling is not 
initialized
    * BUG 15933: Only increment lease epoch if a lease was granted

o  Pavel Filipenský <pfilipensky@samba.org>
    * BUG 15905: samba-4.21 fails to join AD when multiple DCs are returned

o  MikeLiu <mikeliu@qnap.com>
    * BUG 15900: 'net ads group' failed to list domain groups.

o  Anoop C S <anoopcs@samba.org>
    * BUG 15919: vfs_ceph_new should not use 
ceph_ll_nonblocking_readv_writev for
      fsync_send.

o  Shachar Sharon <ssharon@redhat.com>
    * BUG 15919: vfs_ceph_new should not use 
ceph_ll_nonblocking_readv_writev for
      fsync_send.

o  Andreas Schneider <asn@samba.org>
    * BUG 15905: samba-4.21 fails to join AD when multiple DCs are returned

o  Martin Schwenke <mschwenke@ddn.com>
    * BUG 15921: CTDB_SOCKET can be used even when CTDB_TEST_MODE is not 
set.

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

         https://www.samba.org/samba/history/samba-4.22.6.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


