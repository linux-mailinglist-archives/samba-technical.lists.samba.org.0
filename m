Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 74892489B9B
	for <lists+samba-technical@lfdr.de>; Mon, 10 Jan 2022 15:52:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=/zbnGXx0CejWLC4Mu0n8YLEAKlnqwI0Rmwu85VsFs3g=; b=f1hFar2vPdmQupXOQU9yI0nqFg
	9zv1ajNbtG19Id4KB1G2Lzf0HbvYgaVaVsSLgqKnxFQh/YksUlt3eeM0/vBPK9C6rG1Nz7OsKy/c7
	/mHqceHYblKp0MLkehfsUygKEuIU0nm/eRjRbHbpYacLEW4AaExEImv4MW20GRRLp/577TXPpMse3
	AzRv81UyKxaQjnAgMPoMk8p6iUFCPUZEVTVXtIW5sjTtieAbUYbdHa48gf2gdv8kyCkwYJZ+rFYSm
	SLWJTgztjXaCLDoTSd9bSr6NwoVfbSbHIiHP+snBDelcoyXpsOIOFJ7tcCxZpQ8YhpwN3bDNF2Sk2
	JgUwUDdQ==;
Received: from ip6-localhost ([::1]:30732 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1n6w2B-006OMu-UM; Mon, 10 Jan 2022 14:52:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54828) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1n6w26-006OLB-54; Mon, 10 Jan 2022 14:52:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:To:From:CC;
 bh=GwIU65WOaAUsEfFrYlV3H4WdUNp+UxR2EVlXzLtKlqc=; b=pDUhSEdqliOK0yFlcWEbGpQZ7B
 niHwzJMifoPLnPX+E1dr3DHdiaeXHWZv3mGaIABk/hf1CsrHHg5gPBhIuZfUCt/LUfrWPROpzTapU
 lMcvwqXI5AhmeLuI4kzZYL7T90vwL+KC1cdZvIKdDyZbaz25vZnrukunoKDhqOWxDRZk2rpkxw9/1
 gpMvDGFZ0FEN9qSGqmoh2ZFFAh1YuD0nv2rNTMVxkY/UVZ+fZjDKgKC7Dj2PfHL1Ehz0igV16V9w+
 NfXkssW3t4eHakN9O2TmTuhGekDO6zIRowT5ozC9OljmO5WOVnNsQGqt+ICSvpcIsij00XQrLOXnT
 /DBcdUPt2CtZ7B/7oxdqeaRJzXB394N/ky8ueniNq4e907v4NiEL9xbWixbydFCEWc3AUdBMk6TBS
 cNMiRvsG1+ePRHzYrRMc/k5Lx8LSQ9vdAUJB75n80/SQCS+m3IF67ULtR1lGrgNcxcJh1H7XFYZDs
 wIS44beGs61FTe0OQI6coqjV;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1n6w25-006akX-Is; Mon, 10 Jan 2022 14:52:25 +0000
Subject: [Announce] Samba meta-data symlink vulnerability CVE-2021-20316
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Message-ID: <08ced94a-d62a-e23e-3acd-4d172ccbf128@samba.org>
Date: Mon, 10 Jan 2022 15:52:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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

Security Advisory
-----------------

All versions of the Samba file server prior to 4.15.0 are affected by 
CVE-2021-20316. There will be no patches available for older Samba 
versions before 4.15 and 4.15 itself is already secure.

  * CVE-2021-20316: Symlink race error can allow metadata read
    and modify outside of the exported share.

https://www.samba.org/samba/security/CVE-2021-20316.html

Please update affected systems as soon as possible.

=======
Details
=======

All versions of Samba prior to 4.15.0 are vulnerable to a malicious
client using an SMB1 or NFS symlink race to allow filesystem metadata
to be accessed in an area of the server file system not exported under
the share definition. Note that SMB1 has to be enabled, or the share
also available via NFS in order for this attack to succeed.

Clients that have write access to the exported part of the file system
under a share via SMB1 unix extensions or NFS can create symlinks that
can race the server by renaming an existing path and then replacing it
with a symlink. If the client wins the race it can cause the server to
read or modify file or directory metadata on the symlink target.

The authenticated user must have permissions to read or modify the
metadata of the target of the symlink in order to perform the
operation outside of the share.

Filesystem metadata includes such attributes as timestamps, extended
attributes, permissions, and ownership.

This is a difficult race to win, but theoretically possible. Note that
the proof of concept code supplied wins the race only when the server
is slowed down and put under heavy load. Exploitation of this bug has
not been seen in the wild.

==================
Patch Availability
==================

Prior to Samba 4.15.0 patches for this are not possible, due to the
prior design of the Samba VFS layer which used pathname-based calls
for most meta-data operations.

A two and a half year effort was undertaken to completely re-write the
Samba VFS layer to stop use of pathname-based calls in all cases
involving reading and writing of metadata returned to the client.
This work has finally been completed in Samba 4.15.0.

Pathname-based VFS calls are still used as an initial optimization to
determine if a client requested path exists, but when data is returned
to the client or written onto the underlying filesystem then the
target component is first opened as a file handle, going through
rigourous checking to ensure it is contained within the share
path. All meta-data is then refreshed from or written to the open
handle, not via pathname-based VFS calls.

As all operations are now done on an open handle we believe that any
further symlink race conditions have been completely eliminated in
Samba 4.15.0 and all future versions of Samba.

#######################################
Reporting bugs & Development Discussion
#######################################

Please discuss this release on the samba-technical mailing list or by
joining the #samba-technical IRC channel on irc.libera.chat or the
#samba-technical:matrix.org matrix channel.

If you do report problems then please try to send high quality
feedback. If you don't provide vital information to help us track down
the problem then you will probably be ignored.  All bug reports should
be filed under the Samba 4.1 and newer product in the project's Bugzilla
database (https://bugzilla.samba.org/).


Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team
