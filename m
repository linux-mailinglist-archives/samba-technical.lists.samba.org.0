Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AA74E4D9C59
	for <lists+samba-technical@lfdr.de>; Tue, 15 Mar 2022 14:35:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=qYCDU3BpzsGXQlWdQ70UlJVBwWQum/llaLIANov0uAY=; b=K9nslr+enIIGcXu8Cjoafstwxc
	lhMKwPxA2YGpwSPuwzlRa4kJqkP/yfTkVMEKeHYD6KsrPXSVZccWnWc/TK7x3WUqAO61guYvsCtgl
	Ywv0OLFQLwQcBAoZrBf+RNsNDEAeLc7Rbui8SHmpBTa5udyNErv5f4kRJaYS5px7VKaxfYL/qMbPr
	dLyg/hSgSzyorF5XlTnbRDCmdyK7ZrnRR36IlfwRrNiK0Z1QHoy8+4N53YIDnEGAf5BVKStBRj8YL
	tiUiMBAy99SccNJS7nT4zfWiriSJ1kFFmM5LrQK02Q35q0TBdOL904GgM43aRA19oPsgEyAl5RB2f
	jHSzSxnA==;
Received: from ip6-localhost ([::1]:36376 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nU7KK-002X7s-UO; Tue, 15 Mar 2022 13:35:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37576) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nU7K9-002X6t-JK; Tue, 15 Mar 2022 13:34:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=To:From:Date:Message-ID:CC;
 bh=qYCDU3BpzsGXQlWdQ70UlJVBwWQum/llaLIANov0uAY=; b=uP37MYc1wbKRbY9C3mpa9ecYHn
 jxAVNjiWUGns8XDpaPdRBwtvmTxrkhRXjt0gDEJs5f6I6dQCIXEuUqwup5L0umrHH+73HN87+IICD
 9JkPeHRyK9y24hLpivijosrBtftjvcch6lNL2Cumlyz+xTDIrLEMhodOrnbxhuslL17qaUsiSNmRK
 yLFrbWChIJylO1+XxOTEVwTNRNuwN3tNO5AZ2o8RpP9dxW96xv28kFLiyktCarUUcJC/DlZGGD67u
 WkxXwElW1cQZM28xhbUA86sRKu7zfZF1mPICpT27LhLWDH7nQAMcKHGsK5B7oJEf5jJVxRijUSej6
 PJ1SF6Dj3gcdy/v9gmBF0E8mW8vR+fBs70UkcCkmrQLGWb7tqRVhvfs/V9iJ6+Eg+IRVWzgLbTH7p
 zaLilX1TLnhjYForLlT0kO8ooe+81iPpvMcreQMEfG85UO3xcE7N9q2OjDFlmGFK6XamOslCOoOY4
 v+/yfvILrp2Hgfzms1LD5Q76;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nU7K8-001XT4-OK; Tue, 15 Mar 2022 13:34:52 +0000
Message-ID: <17797329-3a24-0a5d-fa59-a412081b885f@samba.org>
Date: Tue, 15 Mar 2022 14:34:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: de-DE
Subject: [Announce] Samba 4.15.6 Available for Download
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
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


Changes since 4.15.5
--------------------

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

o  Günther Deschner <gd@samba.org>
    * BUG 8691: pam_winbind will not allow gdm login if password about 
to expire.

o  Pavel Filipenský <pfilipen@redhat.com>
    * BUG 14971: virusfilter_vfs_openat: Not scanned: Directory or 
special file.

o  Björn Jacke <bj@sernet.de>
    * BUG 13631: DFS fix for AIX broken.
    * BUG 14974: Solaris and AIX acl modules: wrong function arguments.
    * BUG 7239: Function aixacl_sys_acl_get_file not declared / coredump.

o  Volker Lendecke <vl@samba.org>
    * BUG 14900: Regression: Samba 4.15.2 on macOS segfaults intermittently
      during strcpy in tdbsam_getsampwnam.
    * BUG 14989: Fix a use-after-free in SMB1 server.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 14968: smb2_signing_decrypt_pdu() may not decrypt with
      gnutls_aead_cipher_decrypt() from gnutls before 3.5.2.
    * BUG 14984: changing the machine password against an RODC likely 
destroys
      the domain join.
    * BUG 14993: authsam_make_user_info_dc() steals memory from its struct
      ldb_message *msg argument.
    * BUG 14995: Use Heimdal 8.0 (pre) rather than an earlier snapshot.

o  Andreas Schneider <asn@samba.org>
    * BUG 14967: Samba autorid fails to map AD users if id rangesize 
fits in the
      id range only once.


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

         https://www.samba.org/samba/history/samba-4.15.6.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


