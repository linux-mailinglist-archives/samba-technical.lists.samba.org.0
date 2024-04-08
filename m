Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 382F889B8B1
	for <lists+samba-technical@lfdr.de>; Mon,  8 Apr 2024 09:42:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=g/18y2YJWWV6ktyhDuG4XfTECZ4Js+a075J0ycuyDbc=; b=zF0IShJzXHmi3tIBFv3qjFWIQj
	ddXtgYqRUAPcwWE+NB5c3y+2kAj+Wk6zYq8+XgBZf5qO6Z4GzFngmumnR7XrqVVE/DYjwbWX+zd0E
	3p492F66R6cFdAZFpLKK318Un99engf/F0M6dMzlRq6xNHFJqQ86XD5yU6u0u+YOqFO60o3IFYteg
	Z0oaBFj73AFW8myZPhJDY+NBAENfl6THnCG/PaldfTHIKcrC4eDXF7iUZa43cTnMUpFKGyA2Xjg6d
	/70c+Gb+JosN81JwxRX41u6GEBUr7vk4yOoOm3S9POdGt/xO/cocqL6yE6ilmq9fop+aBD7qg+VTz
	Iyf5Z9Rg==;
Received: from ip6-localhost ([::1]:55402 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rtjdM-004HEP-Vm; Mon, 08 Apr 2024 07:41:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30084) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rtjd7-004HDa-WF; Mon, 08 Apr 2024 07:41:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=g/18y2YJWWV6ktyhDuG4XfTECZ4Js+a075J0ycuyDbc=; b=JI3jo5nMVJEsOlOgUmQu7Z/xUn
 vFaBkmBO+Rj3qSDte35gHsbNqQMz2zG+7l9PIi6OYlupnD3hx0lwTSdUaCv1GACrXTZg43Ot9u8/N
 ZGh59L9XVMXqEsNnTQi/xzTpeEM7BpQUOiL8dRZghpKadcVTruCTLUohCruG1W8QkoJ+mMxKjW5oR
 aHvkyfjBw59wWELxY/3Td4dBh7G6J8SrNiM+UTGeU0RCbrK6cZuMawv0ePwlnrtuXZ3O4taZ+BoRz
 hlJDI46BpYxVKQUXoOe0PLJKOht9zUAVxXd6KXUDGbEsD84LIjfBeOc8kzUw8ydm5NXQq8vcft+oS
 PX0I9kVaN9oNMkBsj4y/kxQX/oVTd7gVDJVtqwvVt7kjrqz82Kfu0gkTV6XTPvkuQMerE706++zg5
 ylBfSPK+D4S7fEk4ptS2Gb2uXK+yE87Zp820hZ9aXvL1RuxYhPmdcqQpULhb+4IzNoIcpj+7ylb3R
 3CAB+tBTJlgjR1szLjY2mG1p;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rtjd3-005JCj-2E; Mon, 08 Apr 2024 07:41:21 +0000
Message-ID: <056bb06d-743e-4ab0-919f-62b3b87944e8@samba.org>
Date: Mon, 8 Apr 2024 09:41:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.19.6 Available for Download
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


Changes since 4.19.5
--------------------

o  Ralph Boehme <slow@samba.org>
    * BUG 15527: fd_handle_destructor() panics within an 
smbd_smb2_close() if
      vfs_stat_fsp() fails in fd_close().

o  Guenther Deschner <gd@samba.org>
    * BUG 15588: samba-gpupdate: Correctly implement site support.

o  Noel Power <noel.power@suse.com>
    * BUG 15527: fd_handle_destructor() panics within an 
smbd_smb2_close() if
      vfs_stat_fsp() fails in fd_close().

o  Andreas Schneider <asn@samba.org>
    * BUG 15588: samba-gpupdate: Correctly implement site support.
    * BUG 15599: libgpo: Segfault in python bindings.

o  Martin Schwenke <mschwenke@ddn.com>
    * BUG 15580: Packet marshalling push support missing for
      CTDB_CONTROL_TCP_CLIENT_DISCONNECTED and
      CTDB_CONTROL_TCP_CLIENT_PASSED.


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

         https://www.samba.org/samba/history/samba-4.19.6.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

