Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3515A5EE0BC
	for <lists+samba-technical@lfdr.de>; Wed, 28 Sep 2022 17:42:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=ZBJ8YoB4yLYWelatN8Omu4bneq9UCWYO+t6MRELC3D8=; b=RcdS9Xk2pMfRDau5b6eojKDJQq
	Z5jUEVZWRT2mBqZoke2mYdk/ZTYRy1emFuOdELXNf7PIqkRA4m1uUo9xtlye3+4YVVy3yoFs6kGYU
	cHc6I3+BserdZs4JrjoU6UMbfVughGtX802ca4CFMMcXKBcWGd/opveLS4yl2vuaelyJ4SSHLq6Vu
	RxA3A7qx/wrwEOvlNYpJiizvnSDzPXH7uVzDuMtXzvtZEuwFojpQrhF4t3fwhbppZ2w7fnTe5+obG
	N4HSAmarA6E0OuCsMcaD0kEXA6QVNsvnaDubAU3kHrU1bzMneztqMciKHdfbzLo5aPAo3zgaLnnxe
	hZlwbUDw==;
Received: from ip6-localhost ([::1]:18438 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1odZCF-004cMI-PS; Wed, 28 Sep 2022 15:42:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64734) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1odZC3-004cLL-9j; Wed, 28 Sep 2022 15:41:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=ZBJ8YoB4yLYWelatN8Omu4bneq9UCWYO+t6MRELC3D8=; b=PgLVQ9vLPjnAeXH5UhPF66qrUd
 nH/R4noLZzYdfK6GQ/UV+SuUC2+aUXUM0fP9T7+C40iE6IJthSuurIcTlABujZeWoKu6EjlVlQhv6
 QBA5nyL4wvbW3SC7DuEFxdqHows6Bjk6XbGJzj6LYVyBjSRHPqLFXfgKloADTuTLAeTFMqUE75Ut5
 +Cb2mATmw+ohGTvUQ5PssU6RVm5qzAmancOij99H5xNelGf4jlLBsGo/Sa9u/GLyMh3uWOFpROozj
 DvsuHztqGtQaG1i3IRapTHoRny08DOaQpc7115Fnl2Tcvcb3zMsjwnnhi2aFF1emY80oloaNY0Pw4
 QLE+yy2oTM4L9IJQGarfGBh9tqUXALmefPI7cix/M/5wVQm26dKJDYO81VEfFffXpCO3gwAoKX6Ct
 BZ2dr8f/53tehyvk7UW1hskmQgSroUNKCsaAbf1t7Ya57ecTELzUefmHFE00hHQmWr4elgr9BiRw3
 ko66muwBA8zGSvrZP/FJBNmf;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1odZC3-002FLz-2p; Wed, 28 Sep 2022 15:41:51 +0000
Message-ID: <419afc66-7b72-82e8-65bb-937d62275260@samba.org>
Date: Wed, 28 Sep 2022 17:41:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.15.10 Available for Download
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

This is the latest stable release of the Samba 4.15 release series.


Changes since 4.15.9
--------------------

o  Jeremy Allison <jra@samba.org>
    * BUG 15128: Possible use after free of connection_struct when iterating
      smbd_server_connection->connections.
    * BUG 15174: smbXsrv_connection_shutdown_send result leaked.

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

         https://www.samba.org/samba/history/samba-4.15.10.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


