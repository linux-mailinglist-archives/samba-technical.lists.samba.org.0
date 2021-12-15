Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2D6475B58
	for <lists+samba-technical@lfdr.de>; Wed, 15 Dec 2021 16:06:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=Hee9BMjn4qeON3ggopnNSJBlMoNzNviueS4LHF+80sg=; b=4uRbR5CQ8+atWAu6oKmKb6bxoK
	pDDRwX3rmIW/vlywxjxCiBny1+D80xhHrdtx80IJWx8T5qPF41LI1E30KzIQOqvpHte3vXgj007uB
	9w7osktR3xcZ8t5DvclLwEVoYei48NtHKqms6N2Bxu8PcVQyfkWeBpiGQJ5tROcog/DDHpi8UbccR
	TT/Hy4kp4VqGv0iKGxKvcRYoEErsGKW333PuAz6V7WoMLRh2+hr7HPqwVev5uSu3eWzvxoxDl9wfq
	PMgj2qzfa/2DuOeZyDJ4LsTrmDD3InFE7HGiDizso724vL8t1yPrCyrLA2uKFOP3IIhNup51ogxnd
	l72dsAYQ==;
Received: from ip6-localhost ([::1]:35596 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mxVqw-000jC8-Hp; Wed, 15 Dec 2021 15:05:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54548) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mxVqq-000jBo-TH; Wed, 15 Dec 2021 15:05:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=Hee9BMjn4qeON3ggopnNSJBlMoNzNviueS4LHF+80sg=; b=QdMCT+j+Mf2bk1ckHv5dPvTB/f
 q3pXDPu4NXdRZNvIwGB/TeyzxrXXyt8KDnJQ7HIWDWv4hBF7akyXxsCyV1BqXzPbXiKjjK1ciyati
 mEaTtB88eKUtvKKa5ErfEMrOoUIQeXSR2eO9yOWjYxVDTysAiyvYg0TcnLuY74HrSoJ9kPhS0/28D
 bc+Hqkcwi+dSaOCkXMCjq/2wQ6ld/kgbgIr8Z0IlEV98nTXTu3hS60luF1mXe8/hTdDweLBq4lses
 Ja8W9tUWV6NQGMlVPzdgTSHo22Um+FzQpHWszeIQBSIsfI3Z61eF4uZJd4KX4C/Q7+mvVskvNsEbN
 zfz5uJagN07EGPcqFDNqJL+ERbhNj0wiaSTERhU1K6k8SIwCiX3rI2CQNKxXlajRJTq+Wn1YJa118
 xfAtpPvETea/5iFxYdOWwPwdSUqgmNPKu1fG+oQB0ukQDIlhRKP2ZHBt30FrvlDdJ8th0nDCUX5Ox
 g/Q9M245jPixlWldDTD8u8Kd;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mxVqq-0030ww-Ax; Wed, 15 Dec 2021 15:05:52 +0000
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.14.11 Available for Download
Message-ID: <b7a08de9-76bb-948e-6367-4c440b9718e5@samba.org>
Date: Wed, 15 Dec 2021 16:05:52 +0100
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

This is the latest stable release of the Samba 4.14 release series.

Important Notes
===============

There have been a few regressions in the security release 4.14.10:

o CVE-2020-25717: A user on the domain can become root on domain members.
https://www.samba.org/samba/security/CVE-2020-25717.html
                   PLEASE [RE-]READ!
                   The instructions have been updated and some workarounds
                   initially adviced for 4.14.10 are no longer required and
                   should be reverted in most cases.

o BUG-14902: User with multiple spaces (eg Fred<space><space>Nurk) become
              un-deletable. While this release should fix this bug, it is
              adviced to have a look at the bug report for more detailed
              information, see 
https://bugzilla.samba.org/show_bug.cgi?id=14902.

Changes since 4.14.10
---------------------

o  Jeremy Allison <jra@samba.org>
    * BUG 14878: Recursive directory delete with veto files is broken.
    * BUG 14879: A directory containing dangling symlinks cannot be 
deleted by
      SMB2 alone when they are the only entry in the directory.

o  Andrew Bartlett <abartlet@samba.org>
    * BUG 14656: Spaces incorrectly collapsed in ldb attributes.
    * BUG 14694: Ensure that the LDB request has not timed out during filter
      processing as the LDAP server MaxQueryDuration is otherwise not 
honoured.
    * BUG 14901: The CVE-2020-25717 username map [script] advice has 
undesired
      side effects for the local nt token.
    * BUG 14902: User with multiple spaces (eg Fred<space><space>Nurk) 
become un-
      deletable.

o  Ralph Boehme <slow@samba.org>
    * BUG 14127: Avoid storing NTTIME_THAW (-2) as value on disk
    * BUG 14922: Kerberos authentication on standalone server in MIT realm
      broken.
    * BUG 14923: Segmentation fault when joining the domain.

o  Alexander Bokovoy <ab@samba.org>
    * BUG 14903: Support for ROLE_IPA_DC is incomplete.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 14788: Memory leak if ioctl(FSCTL_VALIDATE_NEGOTIATE_INFO) 
fails before
      smbd_smb2_ioctl_send.
    * BUG 14899: winbindd doesn't start when "allow trusted domains" is off.
    * BUG 14901: The CVE-2020-25717 username map [script] advice has 
undesired
      side effects for the local nt token.

o  Joseph Sutton <josephsutton@catalyst.net.nz>
    * BUG 14694: Ensure that the LDB request has not timed out during filter
      processing as the LDAP server MaxQueryDuration is otherwise not 
honoured.
    * BUG 14901: The CVE-2020-25717 username map [script] advice has 
undesired
      side effects for the local nt token.


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

         https://www.samba.org/samba/history/samba-4.14.11.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

