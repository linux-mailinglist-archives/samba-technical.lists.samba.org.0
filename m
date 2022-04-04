Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A01204F1563
	for <lists+samba-technical@lfdr.de>; Mon,  4 Apr 2022 15:03:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=QfieODcVhaUhIGZwFG6dP4Y4eB5n+MQy7nf7ae5livA=; b=WpdTWMqfnFw32NTq6RdUlBVmfO
	wTvO3s+F6I85o5Yviz/JlXWm0LCUiCoU2e1pse1bNVTAg9Ai0X4HUqBFoWcInSywRKw+RpoRN+vAa
	PA8jHTRrvCNU03E08Lo+Esn1qbIINUOFOyOwq0lXfkv3y4RYh7k9PF3KVWniUPhJXojT92w/AxglI
	p6dsTll+gypSl1SXD+C/lloYtqaZHsHiE6Os81byWQ58cuZXKDumXk8v/qivuzYbFT804NDUL5WZW
	uVql8420GFiLyBQNCCKRBFawqwpNwPaAwnYM3mJdSfTjTB3/lxU00xngDIQ5mNJGQXuL8ZsAMmFed
	dVoxR+pg==;
Received: from ip6-localhost ([::1]:35438 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nbMML-009ntt-Io; Mon, 04 Apr 2022 13:03:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38120) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nbMM9-009nsx-7V; Mon, 04 Apr 2022 13:02:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=QfieODcVhaUhIGZwFG6dP4Y4eB5n+MQy7nf7ae5livA=; b=em1gRrvnXuL2JO9m+UOixjmxOi
 Hvyszb+ONS/LrcD/RSVRvufFeoRgYHwtix24C1+jwmR17NlGEEBjEdfHFMOWmhCs3ZbjvgNZD6PQa
 +aOZfSleilhomrBWqhDf9Di8rC5BPnv6aAsb7H1CYFjLLZkUzPQ0QOzauWFzgc1U3iKyrOcpqUZr2
 cLQb/USRnAq2khTI05/bw7XalwKYj23/jNpOomqjjRgXB43bjDFeR0YgCOZkl3c98YLizqm/vYaxj
 Xngt8qBhC6KpBbAgzVaID5WKS0S2bX6oWkhvuhl24saQnSztoYyZEpXbdgyzp0yInHWqmN7XYlOtw
 9rLIg8es4NobXVdcbPYqBVOcmFQZoPCBdo001zlnMWM+ZzT416e3u8P2BrO1gI1FPUCmrO+bblFD4
 jc1Fv6VumA7y0E1vjSR1nPutUmgOHrquteXOePSW6HjkYxh+3HKnAOSFstDyln1kBam8e0VDy4A4x
 RMccoU/2EhcuUpKP94U1mLDH;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nbMM8-005EgD-B3; Mon, 04 Apr 2022 13:02:52 +0000
Message-ID: <8518c242-5553-6fc2-b824-285a665b1144@samba.org>
Date: Mon, 4 Apr 2022 15:02:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.14.13 Available for Download
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

This is the last bugfix release of the Samba 4.14 release series. There 
will be
security releases only beyond this point.


Changes since 4.14.12
---------------------

o  Jeremy Allison <jra@samba.org>
    * BUG 14169: Renaming file on DFS root fails with
      NT_STATUS_OBJECT_PATH_NOT_FOUND.
    * BUG 14737: Samba does not response STATUS_INVALID_PARAMETER when 
opening 2
      objects with same lease key.
    * BUG 14938: NT error code is not set when overwriting a file during 
rename
      in libsmbclient.

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
    * BUG 14996: Fix ldap simple bind with TLS auditing.

o  Ralph Boehme <slow@samba.org>
    * BUG 14674: net ads info shows LDAP Server: 0.0.0.0 depending on 
contacted
      server.

o  Samuel Cabrero <scabrero@suse.de>
    * BUG 14979: Problem when winbind renews Kerberos.

o  Pavel Filipenský <pfilipen@redhat.com>
    * BUG 14971: virusfilter_vfs_openat: Not scanned: Directory or 
special file.

o  Elia Geretto <elia.f.geretto@gmail.com>
    * BUG 14983: NT_STATUS_ACCESS_DENIED translates into EPERM instead 
of EACCES
      in SMBC_server_internal.

o  Björn Jacke <bj@sernet.de>
    * BUG 13631: DFS fix for AIX broken.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 13879: Simple bind doesn't work against an RODC (with 
non-preloaded
      users).
    * BUG 14641: Crash of winbind on RODC.
    * BUG 14865: Uncached logon on RODC always fails once.
    * BUG 14951: KVNO off by 100000.
    * BUG 14968: smb2_signing_decrypt_pdu() may not decrypt with
      gnutls_aead_cipher_decrypt() from gnutls before 3.5.2.
    * BUG 14984: Changing the machine password against an RODC likely 
destroys
      the domain join.
    * BUG 14993: authsam_make_user_info_dc() steals memory from its struct
      ldb_message *msg argument.
    * BUG 14995: Use Heimdal 8.0 (pre) rather than an earlier snapshot.
    * BUG 15001: LDAP simple binds should honour "old password allowed 
period".
    * BUG 15003: wbinfo -a doesn't work reliable with upn names.

o  Garming Sam <garming@catalyst.net.nz>
    * BUG 13879: Simple bind doesn't work against an RODC (with 
non-preloaded
      users).

o  Joseph Sutton <josephsutton@catalyst.net.nz>
    * BUG 14621: "password hash userPassword schemes = CryptSHA256" does 
not seem
      to work with samba-tool.
    * BUG 14984: Changing the machine password against an RODC likely 
destroys
      the domain join.


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

         https://www.samba.org/samba/history/samba-4.14.13.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

