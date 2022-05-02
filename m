Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D811516DC4
	for <lists+samba-technical@lfdr.de>; Mon,  2 May 2022 11:56:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=u/oyMATOTojfnrm8VdyOE1NZc5aYBPVgGjQ+focxSt8=; b=TWiCGktUuBQB0bbKGjxyzx5Sod
	LA5WBIjSBFtRL5vffDok7r1ePhVmAH7M4Q6fH7tDo6t4NVacnHLtslQRhU1k9ccENNmvdLjkUypnn
	qkXOZQfR5eDdzVtkI+0wH93Cl36q8Wk46Y1lyldwXH1kxlqKjX0IELeCsMETw6rNz2f0nJqJrWcpD
	WVMa/4+vatJn4hxbzcBohOqr/q+eY7ClHeMA+L28R3orFWMgy+757n95BTxiEgkHkBs3LYESHU0Ir
	F9bVRwTwGSzGpIo/YkJBbXXvhApTNPmb63UKMkoBJjG1Xg09mGbBwP4+AyhnkBQi1FWNffKqdGt1k
	wDT+YRgw==;
Received: from ip6-localhost ([::1]:25160 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nlSnE-005W60-IJ; Mon, 02 May 2022 09:56:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50264) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nlSn3-005W4u-34; Mon, 02 May 2022 09:56:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=u/oyMATOTojfnrm8VdyOE1NZc5aYBPVgGjQ+focxSt8=; b=oYMCaeV83objrH+fzSg9taKUn3
 J7jbD2/tK6UM15sXCcVCaEPWg7BrrmzFNlRy7RZ/bJJVtpfkB4bPAsVG4QrV/l/C6zl43AkKToCYc
 dAQEtud8J6tcqYON6C0LgiYId2JskKxs9R4u26a0rrDORBXEJkknkGRVdpvrBuW3cZX+kv2v9Ag/a
 cmdYVMjxy2g95fzwkUfgMR7ouzHyBR0ql1Vr6BOwwciGXYbM/j2vN+subJym5+leAUr0QSOCnC4gq
 rD3fZFLEzNseAgN+nGzg3V2PfApCrPCBZb2IdKTS+UxXy8Bsq+EU1b6c6whIWCoh2o8GL96tN9w0i
 EB5w3qyQ9cWF0Dm6Fztx3Vx15fqjoZagCkEB2sKD3wuAC+VFqyfKnzvgsO8bssK8BDqfxYrlNcNJ1
 di+aOEq5wibfRdQpcJCJIa9+9jCA/h3owoavLWSEVXZRI3XJ7tOOOBhUCQ+sOUyFKQaMpgsAOPTRe
 7gYTvLg0OOJkkZcD3l+1VlsZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nlSn2-003b9z-Aq; Mon, 02 May 2022 09:56:24 +0000
Message-ID: <2679c8d8-7d10-97f5-e6f6-614b6cbb5a24@samba.org>
Date: Mon, 2 May 2022 11:56:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.16.1 Available for Download
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

This is the latest stable release of the Samba 4.16 release series.


Changes since 4.16.0
--------------------

o  Jeremy Allison <jra@samba.org>
    * BUG 14831: Share and server swapped in smbget password prompt.
    * BUG 15022: Durable handles won't reconnect if the leased file is 
written
      to.
    * BUG 15023: rmdir silently fails if directory contains unreadable 
files and
      hide unreadable is yes.
    * BUG 15038: SMB2_CLOSE_FLAGS_FULL_INFORMATION fails to return 
information on
      renamed file handle.

o  Andrew Bartlett <abartlet@samba.org>
    * BUG 8731: Need to describe --builtin-libraries= better (compare with
     --bundled-libraries).

o  Ralph Boehme <slow@samba.org>
    * BUG 14957: vfs_shadow_copy2 breaks "smbd async dosmode" sync fallback.
    * BUG 15035: shadow_copy2 fails listing snapshotted dirs with
      shadow:fixinodes.

o  Samuel Cabrero <scabrero@samba.org>
    * BUG 15046: PAM Kerberos authentication incorrectly fails with a 
clock skew
      error.

o  Pavel Filipenský <pfilipen@redhat.com>
    * BUG 15041: Username map - samba erroneously applies unix group 
memberships
      to user account entries.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 14951: KVNO off by 100000.

o  Christof Schmitt <cs@samba.org>
    * BUG 15027: Uninitialized litemask in variable in vfs_gpfs module.
    * BUG 15055: vfs_gpfs recalls=no option prevents listing files.

o  Andreas Schneider <asn@cryptomilk.org>
    * BUG 15054: smbd doesn't handle UPNs for looking up names.


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

         https://www.samba.org/samba/history/samba-4.16.1.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

