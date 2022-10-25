Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF4160C814
	for <lists+samba-technical@lfdr.de>; Tue, 25 Oct 2022 11:30:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=PGe6snXBv7fILN5hBfNIPnqZdUJMaCgq8lfBKccWWmU=; b=2LrJykOz3lcNhokbAnQkV0wxK+
	N4jqgOw9bxw7gNPUipjPfk5IVRqgDX1crOnTalmx72h8iGraMsH4bGFipWuGwfmw/0FtBouwS8dCT
	u0mCzHqOZXYpeu/I1BRBmYdXf/7pVo02JuIaggLvGPwNMbdlcbbNDTQU1S8gq0DhvEUYorrJ0pUlm
	9VZUIlEcopQiHQ8MUiHOfwEV4+NtREnfURXO5SW7W0T6Z/ckOSLpKbl2u3F9uTa1BRzLL+s2ocSjw
	wZ4SFEsdb8QWoSH338cRK28mdlzzULHpy7ZM8KXYZWi1jz4vrVvpX5Om+4g3BSDNWS2R7dErNUmPZ
	pzh70hAw==;
Received: from ip6-localhost ([::1]:20702 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1onGFz-005oLg-Oe; Tue, 25 Oct 2022 09:29:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14466) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1onGFn-005oKj-7R; Tue, 25 Oct 2022 09:29:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=To:From:Date:Message-ID:CC;
 bh=PGe6snXBv7fILN5hBfNIPnqZdUJMaCgq8lfBKccWWmU=; b=RE/JhuceBW3FrxaIcQ2BgKHUbp
 2plBeO9TAkB33dUA667S1GdxA6lHJUBrPkgx/U3bzGqEk/z3YjRqY3et1+QAw80gxH43R7XLjJl7i
 J17kl30ETeVnJgE6ntqAwa25f5qyddGojizLWm+EwaQndWeHxjHjK7J/fpdKuqO+HdUEc+W2mc9Fa
 2Y4ScMYA5x3QPe1vk7HdMJDEomisHVScBwl9ocNTmkotSqm1gkaeYgArrBg7d/B3+yiqw00Cc0jU+
 i5sfg+bg/sjUVq7r4ZhD6AuMBFozlve3a7EDjRLCXGbakn6RqT7LDsfgKQEPouj7XcAi+hfLi7p06
 s3KaZCJWQwf67R/YytD44Y2hVVAfp0FNvS0oGkwdYzGKtuYMabovUWVo6RL4u5svrYAnh+xJDdsux
 unzSQjLmuokGkvb6WVrdQl6CuavaEa+TsA1uyAXlMAsKbndu2RbpB54+/40MwUGRdQuoK+M2T5veB
 NVKpneDE63swFuNbSdWQXPKN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1onGFm-005gX2-MA; Tue, 25 Oct 2022 09:29:46 +0000
Message-ID: <8762e945-60f3-2c54-44e8-0b13ce19ae2b@samba.org>
Date: Tue, 25 Oct 2022 11:29:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.17.2, 4.16.6 and 4.15.11 Security Releases
 Available for Download
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

This are security releases in order to address the following defects:

o CVE-2022-3437:  There is a limited write heap buffer overflow in the 
GSSAPI
                   unwrap_des() and unwrap_des3() routines of Heimdal 
(included
                   in Samba).
https://www.samba.org/samba/security/CVE-2022-3437.html

o CVE-2022-3592:  A malicious client can use a symlink to escape the 
exported
                   directory. (4.17 only)
https://www.samba.org/samba/security/CVE-2022-3592.html

Changes
-------

o  Volker Lendecke <vl@samba.org>
    * BUG 15207: CVE-2022-3592.

o  Joseph Sutton <josephsutton@catalyst.net.nz>
    * BUG 15134: CVE-2022-3437.


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

         https://www.samba.org/samba/history/samba-4.17.2.html
         https://www.samba.org/samba/history/samba-4.16.6.html
         https://www.samba.org/samba/history/samba-4.15.11.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


