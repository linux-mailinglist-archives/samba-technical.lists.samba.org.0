Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB6E7CAB71
	for <lists+samba-technical@lfdr.de>; Mon, 16 Oct 2023 16:27:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=nWYz4Qhu7dayXSpGdBQvRxYFQSUD1NrN/tZ2SkHHDQk=; b=fZbtlySD1KoB5rRkfKeOXMFoCG
	8ARE7kTbrp6c4FslknelxySORFUL7dTTFwu/nMNar2dOT8W6OV4fYqkCZk7ZMsPyvgC/bLp8RTjri
	g1HqMIfU642qHueZO7mxLtR3RugVheFLkkuBu3yDGzAthWfGr3HIdpVWNhRHB8dmvb/9w6uJPGoE5
	oDwYnurAz5Jzog26xVdajdQDgvLLgsk9bYvJXU0g7l4ojto9iD8geOrGN/9cxbMaVJyWLwbvZIQuw
	F9ii7fbTf2a0Q4mYvQMO6sYVKy8M3d6lCoeH8NOOwDAcwjCRSYrATTN99LoTp7TXIAZIzZjbZadXA
	OBF9GXug==;
Received: from ip6-localhost ([::1]:34300 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qsOYs-000e82-Mr; Mon, 16 Oct 2023 14:27:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58898) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qsOYj-000e70-46; Mon, 16 Oct 2023 14:27:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=nWYz4Qhu7dayXSpGdBQvRxYFQSUD1NrN/tZ2SkHHDQk=; b=YAme0b2UFMbUZ9+V3jraJGxPJk
 Ya2zPdG68SLtXs536yHytQTBHNvWhLaejLMPWn9QvlMoNkBBismZcxLLuG8aplLxR4FWn8APWdqP3
 yvSukKnGA98052D/ylBNbnHkeEzSmY/bFn0wWc41KY+d6W7pnbZ7vXBg3pQTeQXZYKEZiaAQCC5L7
 vdLaRRwV/7xjRZ1lg25M6W/BC1bXe+AJ4aWjF84xdjOFw05U4RCceE+Hibebsgm22wK2my+pHQ9xF
 xRA8AUtzgVH56bX8oLHE5UrJwjrvuBnGZmHd1y9ya7kGAL7s/bzid+eto/KNCcmY4cGCAnf8TMwvO
 4sUnvQ/1/fASps7Il8IMrWT3J5y74qKE7X/OLtUHjtlFSJwDb0V5roiyz0QHFkdpNEguH2UocA35s
 aNvzeebxi0LHiy4kxlcPN1wvcEeVx89DRViLhGMhOE/+1oNrsbvknZfuW5iW3dfX45vhNPx2an37d
 iVIKBKhrXNC7Vrz/XjzAvMeB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qsOYi-000thf-21; Mon, 16 Oct 2023 14:27:04 +0000
Message-ID: <c2f6e93f-d85b-4463-8b14-54b341bf5730@samba.org>
Date: Mon, 16 Oct 2023 16:27:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.19.2 Available for Download
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


Changes since 4.19.1
--------------------

o  Jeremy Allison <jra@samba.org>
    * BUG 15423: Use-after-free in aio_del_req_from_fsp during smbd shutdown
      after failed IPC FSCTL_PIPE_TRANSCEIVE.
    * BUG 15426: clidfs.c do_connect() missing a "return" after a 
cli_shutdown()
      call.

o  Ralph Boehme <slow@samba.org>
    * BUG 15463: macOS mdfind returns only 50 results.

o  Volker Lendecke <vl@samba.org>
    * BUG 15481: GETREALFILENAME_CACHE can modify incoming new filename with
      previous cache entry value.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15464: libnss_winbind causes memory corruption since samba-4.18,
      impacts sendmail, zabbix, potentially more.

o  Martin Schwenke <mschwenke@ddn.com>
    * BUG 15479: ctdbd: setproctitle not initialized messages flooding logs.

o  Joseph Sutton <josephsutton@catalyst.net.nz>
    * BUG 15491: CVE-2023-5568 Heap buffer overflow with freshness 
tokens in the
      Heimdal KDC in Samba 4.19
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

         https://www.samba.org/samba/history/samba-4.19.2.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

