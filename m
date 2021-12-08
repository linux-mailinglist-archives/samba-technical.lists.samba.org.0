Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0699F46D632
	for <lists+samba-technical@lfdr.de>; Wed,  8 Dec 2021 15:55:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=Cq2GLUJYOkhbWoPBkIZi0lJjN/B0SSRGFfsY7SCdHVA=; b=AY/uVy8oKXZfopBpBzuWLWFOrH
	7TBTHQIrHgD2cMvwHxCr9VYaxo4lnbVybB/J6hF8qroTKadwMwr8X7Pilcjjvd++Hyr2jzg2ghLCZ
	tsASH6bxUOJUbByRMJSUq8poZmASYQqNqwmJHdebp2+2Zsfvyi5ZrYpj9Fq53ryKMNUgGK+ZewGHz
	QBQ1tP8JxlNVEXB6bbgPkJ5B4Tft85ZsqtRZ/kySE8bw3+qT/swbQvr9appuEK7gdpq1qk0fyTlrt
	mraJYaUYdC5+XZvZ0u3WzwJrxSqYrfk2IUL4vwsmxq/U13CbdQ0ZjgXMqdowVNh5Hwb0TbHkahLTC
	GzonA4zQ==;
Received: from ip6-localhost ([::1]:21882 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1muyKz-004EKf-2k; Wed, 08 Dec 2021 14:54:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54338) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1muyKr-004EKM-Fj; Wed, 08 Dec 2021 14:54:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=Cq2GLUJYOkhbWoPBkIZi0lJjN/B0SSRGFfsY7SCdHVA=; b=l2suvMVWCVFMGDcbUqc2YcciTe
 g0NBU0G0twMCR42296QW2x9hrCKnd8f/LyultJbZR0/128jhfLfI29ALByqbg7q6E4I9RAPk7FgDt
 O6Jv8N8nVPVO/4Ecf+y4WRuWv9BFlaJFVbJ+CLrVQAKgBDFWPK7dAlxo3JgeBxCMiugbRdfkLiFHC
 OHS8261uM3B07rLGYfHFDWfus4ViDzx4hQ+LjCwVX6jDobnglM7FxQccoEN/YGnCD4It34sQPJwWj
 vpAVYr9sLgCtQRSgwNneRO6M/WAJ2rU/g7KfQKYra014Tw10SOYJsKzuLAEALKkWNwuaW6WbkfZlX
 FZ8zLMKoMhMp55UEQQA0CEr7/AjbnKkUW9cm3TOv8whkRkx7TtRd5NAigP4j6iiDew4r5DE33qCk6
 Ao2bhaHCsSnL8IbBmaHhjjTmZD5CIBYs49EsMujajhKYtEBpv1uh5GKgeOEMau9xSDOhyMY4Jbg1o
 uwI4XtZ+prjG8tll3el9tU0q;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1muyKq-001o3g-T3; Wed, 08 Dec 2021 14:54:20 +0000
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.15.3 Available for Download
Message-ID: <b72fcd09-bf65-b76a-6b7f-79b1a529e906@samba.org>
Date: Wed, 8 Dec 2021 15:54:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
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

Important Notes
===============

There have been a few regressions in the security release 4.15.2:

o CVE-2020-25717: A user on the domain can become root on domain members.
https://www.samba.org/samba/security/CVE-2020-25717.html
                   PLEASE [RE-]READ!
                   The instructions have been updated and some workarounds
                   initially adviced for 4.15.2 are no longer required and
                   should be reverted in most cases.

o BUG-14902: User with multiple spaces (eg Fred<space><space>Nurk) become
              un-deletable. While this release should fix this bug, it is
              adviced to have a look at the bug report for more detailed
              information, see 
https://bugzilla.samba.org/show_bug.cgi?id=14902.

Changes since 4.15.2
--------------------

o  Jeremy Allison <jra@samba.org>
    * BUG 14878: Recursive directory delete with veto files is broken in 
4.15.0.
    * BUG 14879: A directory containing dangling symlinks cannot be 
deleted by
      SMB2 alone when they are the only entry in the directory.
    * BUG 14892: SIGSEGV in rmdir_internals/synthetic_pathref - dirfsp 
is used
      uninitialized in rmdir_internals().

o  Andrew Bartlett <abartlet@samba.org>
    * BUG 14694: MaxQueryDuration not honoured in Samba AD DC LDAP.
    * BUG 14901: The CVE-2020-25717 username map [script] advice has 
undesired
      side effects for the local nt token.
    * BUG 14902: User with multiple spaces (eg Fred<space><space>Nurk) 
become
      un-deletable.

o  Ralph Boehme <slow@samba.org>
    * BUG 14127: Avoid storing NTTIME_THAW (-2) as value on disk.
    * BUG 14882: smbXsrv_client_global record validation leads to crash if
      existing record points at non-existing process.
    * BUG 14890: Crash in vfs_fruit asking for fsp_get_io_fd() for an 
XATTR call.
    * BUG 14897: Samba process doesn't log to logfile.
    * BUG 14907: set_ea_dos_attribute() fallback calling
      get_file_handle_for_metadata() triggers locking.tdb assert.
    * BUG 14922: Kerberos authentication on standalone server in MIT realm
      broken.
    * BUG 14923: Segmentation fault when joining the domain.

o  Alexander Bokovoy <ab@samba.org>
    * BUG 14903: Support for ROLE_IPA_DC is incomplete.

o  Günther Deschner <gd@samba.org>
    * BUG 14767: rpcclient cannot connect to ncacn_ip_tcp services anymore
    * BUG 14893: winexe crashes since 4.15.0 after popt parsing.

o  Volker Lendecke <vl@samba.org>
    * BUG 14908: net ads status -P broken in a clustered environment.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 14788: Memory leak if ioctl(FSCTL_VALIDATE_NEGOTIATE_INFO) 
fails before
      smbd_smb2_ioctl_send.
    * BUG 14882: smbXsrv_client_global record validation leads to crash if
      existing record points at non-existing process.
    * BUG 14899: winbindd doesn't start when "allow trusted domains" is off.
    * BUG 14901: The CVE-2020-25717 username map [script] advice has 
undesired
      side effects for the local nt token.

o  Andreas Schneider <asn@samba.org>
    * BUG 14767: rpcclient cannot connect to ncacn_ip_tcp services anymore.
    * BUG 14883: smbclient login without password using '-N' fails with
      NT_STATUS_INVALID_PARAMETER on Samba AD DC.
    * BUG 14912: A schannel client incorrectly detects a downgrade 
connecting to
      an AES only server.
    * BUG 14921: Possible null pointer dereference in winbind.

o  Andreas Schneider <asn@cryptomilk.org>
    * BUG 14846: Fix -k legacy option for client tools like smbclient, 
rpcclient,
      net, etc.

o  Martin Schwenke <martin@meltin.net>
    * BUG 14872: Add Debian 11 CI bootstrap support.

o  Joseph Sutton <josephsutton@catalyst.net.nz>
    * BUG 14694: MaxQueryDuration not honoured in Samba AD DC LDAP.
    * BUG 14901: The CVE-2020-25717 username map [script] advice has 
undesired
      side effects for the local nt token.

o  Andrew Walker <awalker@ixsystems.com>
    * BUG 14888: Crash in recycle_unlink_internal().


#######################################
Reporting bugs & Development Discussion
#######################################

Please discuss this release on the samba-technical mailing list or by
joining the #samba-technical IRC channel on irc.freenode.net.

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

         https://www.samba.org/samba/history/samba-4.15.3.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

