Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E403C4023ED
	for <lists+samba-technical@lfdr.de>; Tue,  7 Sep 2021 09:19:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=FOwlCxDP0ojfidohTfeKgPwLZSkWeCq1RN8g9/+WSdw=; b=wx1d0vuzVmUB5/GrjGwoJwH/39
	Q2yqozxSFMpcPy/KhTL9hVUJYIQp9grRXm6AEHHjVV8FaE4goYVYBYjH/R/yAk4NIulnqxRHTrwPL
	UINv8BEMlgzbCAu3WVAbsQIVYIWXHgvJTa0iKwZQxEOBDm1fOkH0ZJH0eVPR5lsLi5b7p6I/QJM0s
	cZmNBeD722z3k2Vd8nJlyl7HqaFDsjuZTmJC1jOZw6jYM0IsFvypmX2KWDETSc9/mfUzDRS9M41GP
	3iDjl/NJECR7DUFS9u96gx8ZFMsKNCN/ZK1m34Cl65pX8Ie9Em3GiFQzwemraEZcPvtJx17Bfaku8
	Qh46WQRw==;
Received: from ip6-localhost ([::1]:46638 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mNVNE-00DYiB-VF; Tue, 07 Sep 2021 07:18:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12624) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mNVN2-00DYhl-Mc; Tue, 07 Sep 2021 07:18:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=FOwlCxDP0ojfidohTfeKgPwLZSkWeCq1RN8g9/+WSdw=; b=eJz98YpHFzn0o1ZSdLAZ5KvXyS
 tZqTCKhIHLgESWHlUcey1eP+WzHN/0XrwStUnMHXBS4mLIMarmbo/60xnAcGIjfe2WpBPuH79UC8g
 aUPF5lgaf64tyxKuLbPHqEMqhDuajy9mgG5yzi/XbNApgPESvhnVpKSqfQRlyFq58LKXK6rl5Vkmw
 hn0bdpqbB+ohCs7lHM3H276YolmwOzZMsELH9hYwwMYjIZdGXhjJXHPwXVc3qa550nFj8WAb48wNx
 2ZjEl//NCLssf66vsfO8fiht7GaIEg3awr5xONvWqhRvdRhiY0CWX+TVWF1nuikn4RiL1sqZY+Tmv
 XlX5vx8/Qlqc7ZtjACE00jf8lybJvCaYnUU33VAlNlOJfozSCDs6fUXce9kUYSU2hpIziIYZG0Kzt
 L78UxGwEtx6ZAaq8ib1/55dCVmP8gGmtUf7flcH+BTgXxHm7cL4ZVldD7y3NLQtJTVcF06l/N//TK
 7EC83mWcgxwkZAPdTWCxfjro;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mNVN2-0050ys-5D; Tue, 07 Sep 2021 07:18:16 +0000
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.13.11 Available for Download
Message-ID: <d7be1ff3-0d22-e84e-256f-5fe8bcdfb325@samba.org>
Date: Tue, 7 Sep 2021 09:18:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
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

This is the latest stable release of the Samba 4.13 release series.


Changes since 4.13.10
---------------------

o  Jeremy Allison <jra@samba.org>
    * BUG 14769: smbd panic on force-close share during offload write.

o  Ralph Boehme <slow@samba.org>
    * BUG 14731: Fix returned attributes on fake quota file handle and avoid
      hitting the VFS.
    * BUG 14783: smbd "deadtime" parameter doesn't work anymore.
    * BUG 14787: net conf list crashes when run as normal user.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 14607: Work around special SMB2 READ response behavior of 
NetApp Ontap
      7.3.7.
    * BUG 14793: Start the SMB encryption as soon as possible.

o  Andreas Schneider <asn@samba.org>
    * BUG 14792: Winbind should not start if the socket path for the 
privileged
      pipe is too long.


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

         https://www.samba.org/samba/history/samba-4.13.11.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

