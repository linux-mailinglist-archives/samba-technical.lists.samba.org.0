Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 967A5475ABC
	for <lists+samba-technical@lfdr.de>; Wed, 15 Dec 2021 15:37:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=AF/RsakAYTumLTkfbUQrOLpnaopf7CwYLgUxEq/l0/M=; b=gICjY816p3C8FZYhkUnIqxMfpC
	hFyHhwluKAHFJ3jgg0MFZ/O4V2QxCZvZn/IGA6hlQv6xFZeOAZhN9WXfhQcnzuQ6XM91fG4Krjfc0
	OxjRHrZ7cEM22Uh6jp3QYmlnIEFZd01UWCl37gCh96lWeB1F1OVESOxaq7yppNdf60e2/rUJHshuo
	+eS+OmImiBvQthE+4unq0WSek5vblO12Krm1twSAIssNOewENRtQR6URJU6qUQ1RfOpioB/0hDEsr
	px82dVAn5EqJwPciUzXSsj/Pj3L85m5qj/oZ1FRa22TPhrAyff4mxD/6b8nJQJmMzAhXQnu63+Z54
	Iaq90VYg==;
Received: from ip6-localhost ([::1]:29556 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mxVOi-000h0s-5y; Wed, 15 Dec 2021 14:36:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54538) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mxVOd-000h0Z-18; Wed, 15 Dec 2021 14:36:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=AF/RsakAYTumLTkfbUQrOLpnaopf7CwYLgUxEq/l0/M=; b=rbA2EToLs7CWPuJmYlhINp3Dsh
 sdrUJPajNg7X/Wf1+RroB8D071uicMJJ4Zdh/aqoU9kfb1EvVRfwwP+snUikSEJpUnd6ytWEuMKrC
 fAF6UMyiW4AinCGeKXxRa+wetKNWm39iW8J+qSurPbxZ6BA1dIdagGqW9rBGH5b2s9LlujkB+7x5u
 OTT8MSSSi7syGPttBIS9kG6EUNv53CHEsSlMchrtPf3wjcfVDQoO70JaomuYarzyuyaYIgOYa8KqW
 6WGDQLkq+UeMvrys3E+gW0iZx1tSBjiR8lsYbiVBw8sSa08B5Og/m3r9S47ZeUmrvxvIpHLYcPSKy
 FCaslnKCWoSi0x7hV4vD6L6TlWST8mXYY7fpJpY6rdLcfdL55E41CZ897cq6kNRLVh+BUGPIxlSSL
 EXtW+li5qEFOHj023zqnDlm5AuzaoSS8R98DKWGhgx5keKiON36gZzP/gSlfZO+igTjemH+M2DsbD
 vVx1pwJq6YjmP3nqvd+tffb6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mxVOc-0030QU-G2; Wed, 15 Dec 2021 14:36:42 +0000
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.13.15 Available for Download
Message-ID: <1aef63fd-647c-b8b1-333a-81d251a8a436@samba.org>
Date: Wed, 15 Dec 2021 15:36:42 +0100
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

This is the latest stable release of the Samba 4.13 release series.

Important Notes
===============

There have been a few regressions in the security release 4.13.14:

o CVE-2020-25717: A user on the domain can become root on domain members.
https://www.samba.org/samba/security/CVE-2020-25717.html
                   PLEASE [RE-]READ!
                   The instructions have been updated and some workarounds
                   initially adviced for 4.13.14 are no longer required and
                   should be reverted in most cases.

o BUG-14902: User with multiple spaces (eg Fred<space><space>Nurk) become
              un-deletable. While this release should fix this bug, it is
              adviced to have a look at the bug report for more detailed
              information, see 
https://bugzilla.samba.org/show_bug.cgi?id=14902.

Changes since 4.13.14
---------------------

o  Andrew Bartlett <abartlet@samba.org>
    * BUG 14656: Spaces incorrectly collapsed in ldb attributes.
    * BUG 14901: The CVE-2020-25717 username map [script] advice has 
undesired
      side effects for the local nt token.
    * BUG 14902: User with multiple spaces (eg Fred<space><space>Nurk) 
become un-
      deletable.

o  Ralph Boehme <slow@samba.org>
    * BUG 14922: Kerberos authentication on standalone server in MIT realm
      broken.

o  Alexander Bokovoy <ab@samba.org>
    * BUG 14903: Support for ROLE_IPA_DC is incomplete.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 14899: winbindd doesn't start when "allow trusted domains" is off.
    * BUG 14901: The CVE-2020-25717 username map [script] advice has 
undesired
      side effects for the local nt token.

o  Joseph Sutton <josephsutton@catalyst.net.nz>
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

         https://www.samba.org/samba/history/samba-4.13.15.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

