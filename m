Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8973F5BB6
	for <lists+samba-technical@lfdr.de>; Tue, 24 Aug 2021 12:07:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=fRTKBj0TvXCdm/aj92KiFTv1szQJnXVlup7jGfsSQGs=; b=a5cyT48klX+Nvj/jPI684joxSC
	qsLr/E/o9Y0oGBaVU8OVAkykpn29liB09SS4T34uMDxozDYTRY/9TR47nmEqYF+LLTX4k6l+MaUzO
	cYNNLmWhFcMFgTc9jMFbRntUhEVikrWKQJQ2ef7GgMlJAzlbIJYA2r241q+mMfwMuw7v7Dw7zUzqe
	BLzlqGksGCovpOAjYNqJzVrFHK9XVg01inudNoftyJ/IeUQ16LKNKa5/fYSNxClft8GbpTLjlPJ8V
	5/nQQLpHpoiX+7KEHRDvNFB8mmzHNkv8hJUlMGeX8OKIeYCLATbimR9uiy491MtIHDVrdUc5xiIa5
	bXL82VYA==;
Received: from ip6-localhost ([::1]:31314 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mITJh-008fBf-BQ; Tue, 24 Aug 2021 10:06:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31542) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mITJZ-008fBQ-W6; Tue, 24 Aug 2021 10:05:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=1V73KsRzPuqR16P/1ZyVIRWHtCRrx+TXEWfb/g0mgno=; b=bqoOSKuW1+12QcloV67Ra5uCEN
 WQFKXjDPM4++x9b2tK9jzXkY4/zQ/XQrQ7jDZr3T2r7WjSH3XnrViheGP59LKrm8bnfvXr7AZZRp+
 BSHQu1OHd/lZPO1TBBLOwRadk3NwbuOxJEt6Fysb/xSw5U0L9dHw8SpydEqPy5/83kUQeGyRxg7Sq
 jUpqqbQ8afoxu24ndzRv3oRA7yRCko9FHD0w+kftnIunGRCRbvPXsipsOPyFQJaiD02FMLN1Pmlj3
 DYymx1ICk5OH2lKyQW4scp/glY1vRb7w7hOGPaZQyPfKBywr8kWTmZ/2Zk2qPjb1GKna4zPjgZDZP
 ZrmXEueeZx/+zcrR29JZR1EVdrhWjs6eA4pYNen1azTkuzN6dqtFGHyPU+j+jm+U5tBAzRFdR/t3o
 3ARHFkoDTwpfjKwRe2zwT1valjdQ4jjWgw4tqDwLnzRO67sXqGjhpMNfogUXI2NKvlV2o4NuQX1/I
 wccBZDBvshp+eRtjqbeM3nYq;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mITJC-002jz2-Jo; Tue, 24 Aug 2021 10:05:30 +0000
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.14.7 Available for Download
Message-ID: <5c671a20-576f-2425-6b93-f6f44f35ea53@samba.org>
Date: Tue, 24 Aug 2021 12:05:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: de-DE
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

Release Announcements
---------------------

This is the latest stable release of the Samba 4.14 release series.


Changes since 4.14.6
--------------------

o  Jeremy Allison <jra@samba.org>
    * BUG 14769: smbd panic on force-close share during offload write.

o  Ralph Boehme <slow@samba.org>
    * BUG 12033: smbd should support copy_file_range() for 
FSCTL_SRV_COPYCHUNK.
    * BUG 14731: Fix returned attributes on fake quota file handle and avoid
      hitting the VFS.
    * BUG 14756: vfs_shadow_copy2 fix inodes not correctly updating inode
      numbers.

o  David Gajewski <dgajews@math.utoledo.edu>
    * BUG 14774: Fix build on Solaris.

o  Björn Jacke <bj@sernet.de>
    * BUG 14654: Make dos attributes available for unreadable files.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 14607: Work around special SMB2 READ response behavior of 
NetApp Ontap
      7.3.7.
    * BUG 14793: Start the SMB encryption as soon as possible.


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

         https://www.samba.org/samba/history/samba-4.14.7.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


