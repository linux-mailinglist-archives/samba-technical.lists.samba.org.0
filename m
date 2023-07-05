Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F0174831B
	for <lists+samba-technical@lfdr.de>; Wed,  5 Jul 2023 13:44:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=EKcCJKaaYJRhLZ7u5RDYetL5F6zIMH+JLJ22j9zIEtQ=; b=FanitIcAw8W6srRcwS0fuCbFBX
	itSx+sHCjxdnk1Fc4+faU6//idb+v1/KDga1liovlkjATW+X91vaAPNKKCd8ROcVV7N3QA7wztZNC
	zzUg4fU6UOJMiPa5xggM4vZbdIxcHqt2BZY05m/wfMi76lxrcUjd/g2XSl10a+jYx20dzDDpvxsC6
	tv03sBuliHL6kPrW0LcGhszcBeP7Cg/+EzbUESVlPQlKMEl3rHvwcn0m6GOFk/NJp+QswlhbwFd8K
	ac/QCD43/nrUxL3xZUrP8jkd+MC3SZmqufZI73QtK8zWL2Kmu0xWi7xgesdQEv78g05GuQQl46zkR
	/PCr0VcQ==;
Received: from ip6-localhost ([::1]:38738 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qH0vY-000HuC-2d; Wed, 05 Jul 2023 11:44:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32752) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qH0vK-000HsZ-Fz; Wed, 05 Jul 2023 11:43:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=EKcCJKaaYJRhLZ7u5RDYetL5F6zIMH+JLJ22j9zIEtQ=; b=nNvTan7EN3MbfsiVybId42s31U
 EItaGF2YCgN3a5rVkuUznqP3dkSe5UwaIVYfbrbQgnoB9Y1WKI1bDKjAtWxGHyMKi0SXEsSRJb5eJ
 cY+xkvtOZCslIbxMEXnT8JYQ4QgJL30C0//fa3sPoUz/kfRmcrSJrE1HKpLqikoNQmv5O0XtakeWO
 3d8UTU1S3LEuYOyyJ3iCNApdXsb+d8iE/rIZPvZqxfHcm903L0q6dnMb5n8vN8fxMrKP+fybq4+ul
 pS+7FjFXU/YvYlMt0FGoDSB/LTlA/wTsENRfr/HiIPDlH17qfZi6l7Q+xP1IG1PUPAUPFi8Wd2QGL
 wpKAaJrbZBXhEafxFQHaadGKO52mmBM0LP7E16Qz2w32sk+72LsY3FU20poRUY5/4T2mMFCpdwzBm
 MsSXR+1q1bK9vO/ARlQ6rRzRCfkjkLNb88WY9dVAjW+6/VakqoDTrKUpQkRajKNOxyF6h4Qek/0KH
 a/W2HA/sMCfeKqAIHtQMVpJ3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qH0vK-000EGi-0r; Wed, 05 Jul 2023 11:43:54 +0000
Message-ID: <6547d955-0ec3-6967-72db-ec99fad9fcef@samba.org>
Date: Wed, 5 Jul 2023 13:43:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.18.4 Available for Download
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

This is the latest stable release of the Samba 4.18 release series.


Changes since 4.18.3
--------------------

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
    * BUG 15404: Backport --pidl-developer fixes.

o  Samuel Cabrero <scabrero@samba.org>
    * BUG 14030: Named crashes on DLZ zone update.

o  Björn Jacke <bj@sernet.de>
    * BUG 2312: smbcacls and smbcquotas do not check // before the server.

o  Volker Lendecke <vl@samba.org>
    * BUG 15382: cli_list loops 100% CPU against pre-lanman2 servers.
    * BUG 15391: smbclient leaks fds with showacls.
    * BUG 15402: smbd returns NOT_FOUND when creating files on a r/o 
filesystem.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15355: NSS_WRAPPER_HOSTNAME doesn't match NSS_WRAPPER_HOSTS 
entry and
      causes test timeouts.

o  Noel Power <noel.power@suse.com>
    * BUG 15384: net ads lookup (with unspecified realm) fails.

o  Christof Schmitt <cs@samba.org>
    * BUG 15381: Register Samba processes with GPFS.

o  Andreas Schneider <asn@samba.org>
    * BUG 15390: Python tarfile extraction needs change to avoid a warning
      (CVE-2007-4559 mitigation).
    * BUG 15398: The winbind child segfaults when listing users with 
`winbind
      scan trusted domains = yes`.

o  Jones Syue <jonessyue@qnap.com>
    * BUG 15383: Remove comments about deprecated 'write cache size'.
    * BUG 15403: smbget memory leak if failed to download files recursively.


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

         https://www.samba.org/samba/history/samba-4.18.4.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


