Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D56D6B201E
	for <lists+samba-technical@lfdr.de>; Thu,  9 Mar 2023 10:32:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=wQTXM2HYrhXGUfnbeNNrjhvKPTqyPjfL1o0J7mFRyH0=; b=hgNZGPwlVbfAzk+yV3XK2d4l17
	3zAPyIGY1SLZHYIKnsMLRkvMdlWgsqCingykgJcPyuJFncq7ZMNXqA6By5nGtu43ts2PlzIGZp9GJ
	ueREoXZoR4Bny9A8Ea2/V1q8d0LR8uEyMMByzh9ddYbmJ8SGt0oj+atnG7m4w2ChhyKF0oWqfRCrL
	MsmrpE+1yAue1hhoF8H+m8UurFUlK0yi6k1wxqvsK3nLgk4SLsUAu4PxQJWiQBtI62HzAG0NUzzZo
	Wan+FAaeMyz+FcH1swPXvVmpeyZx84jx5mIDNwyMtBNlSN06JTcta4aGVmaf1P9cJtVj6AaeBHgCF
	Ul12Tm9Q==;
Received: from ip6-localhost ([::1]:21226 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1paCcx-000bmi-FP; Thu, 09 Mar 2023 09:31:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48620) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1paCcn-000blj-H8; Thu, 09 Mar 2023 09:31:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=wQTXM2HYrhXGUfnbeNNrjhvKPTqyPjfL1o0J7mFRyH0=; b=ek2mFTnXTgbWuKMp/RYaN/Y8vB
 Y7zg8Pr38kVbz9/s7Z4yiJiER3ojBCuRdGymlhsO//OvSmuSgjiw+JFJ5LkJMgTs/lIByremuvOlt
 tqGyfWfPFfv/Ky/z0v99vW6MmdouEMXVWiYPTFgK6rwz6nFU7hc7AaHgbNiOTpzGwzOqGr88JIaZ9
 WZTD62/Om8Z/VVF1i+uHmVjUlK56jVg9ilvHuXfWmMndUOCmmAe1zPdaKp6MWgPDgtdbBNCFBgnWv
 2JCMdrw6blnjElRndVGWfFlurhTFo4eO2UDv2EDGUrJUg8gcOpkedSZAStJXqaI7H/3RbMppyFhjX
 iA4BNTR/tN2pwp8SDYlmOMXx1cwtz1aapP9OBeeILEaiOe8wydTXAIlUrKUEWofXJqpTl1kagtbJr
 QdjC5ZO+IXs9RfNr2m3w4ChjR48MbgLi+HdnHcg5wwKijPZU/jDhgXcOzMh4gItnABvnnoyg7A9Td
 lrgLQKmaBu8TfCe+R4v5CKb+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1paCcm-001iWa-RK; Thu, 09 Mar 2023 09:31:48 +0000
Message-ID: <27194286-98a4-35ed-00fd-8c0338491e66@samba.org>
Date: Thu, 9 Mar 2023 10:31:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.17.6 Available for Download
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

This is the latest stable release of the Samba 4.17 release series.


Changes since 4.17.5
--------------------

o  Jeremy Allison <jra@samba.org>
    * BUG 15314: streams_xattr is creating unexpected locks on folders.

o  Andrew Bartlett <abartlet@samba.org>
    * BUG 10635: Use of the Azure AD Connect cloud sync tool is now 
supported for
      password hash synchronisation, allowing Samba AD Domains to 
synchronise
      passwords with this popular cloud environment.

o  Ralph Boehme <slow@samba.org>
    * BUG 15299: Spotlight doesn't work with latest macOS Ventura.

o  Volker Lendecke <vl@samba.org>
    * BUG 15310: New samba-dcerpc architecture does not scale gracefully.

o  John Mulligan <jmulligan@redhat.com>
    * BUG 15307: vfs_ceph incorrectly uses fsp_get_io_fd() instead of
      fsp_get_pathref_fd() in close and fstat.

o  Noel Power <noel.power@suse.com>
    * BUG 15293: With clustering enabled samba-bgqd can core dump due to use
      after free.

o  baixiangcpp <baixiangcpp@gmail.com>
    * BUG 15311: fd_load() function implicitly closes the fd where it 
should not.


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

         https://www.samba.org/samba/history/samba-4.17.6.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

