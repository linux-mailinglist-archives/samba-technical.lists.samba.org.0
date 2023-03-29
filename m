Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1F86CEC22
	for <lists+samba-technical@lfdr.de>; Wed, 29 Mar 2023 16:51:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=pIYF3eiM8dRKwKu5FQ6HEH/9Cm9WK2xIEbznNQ70dOE=; b=4604LsS+YG1IaVOOjKuRnaiccv
	7zJ++z7hitn6462JOq7gQHjekKEtU+aEZskxqqrnM9s2IRrqeVyb6VT2z2bx3tXC8iZk2TwLdKShc
	yH5tRrfUTluTVsWi6kelaqc01sIGySNTi/yVlHlZkFW2zLfBLZzQ/3a4sLzku/OfqNK2h0d8IOyd8
	nUqggQBjnr+hIqeDibHznJ2q62kdAMkx2fEfqhumRObFpygfzuF4tj7qjVU1T2T8FTF4syrl1K8lq
	z/WOZnsVtgrosHBbJIsTAQPJ49HC9ecpz5Xfm6y8D/k+DlhaeIXkUf+n7JsIV+4E/rLPbeO7RlsMH
	MxPP0GKw==;
Received: from ip6-localhost ([::1]:23332 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1phX8U-005dXN-B8; Wed, 29 Mar 2023 14:50:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54124) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1phX8J-005dWQ-AX; Wed, 29 Mar 2023 14:50:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=To:From:Date:Message-ID:CC;
 bh=pIYF3eiM8dRKwKu5FQ6HEH/9Cm9WK2xIEbznNQ70dOE=; b=c3CqNy36VLr9LRZjXztc/lqO74
 mJ47LIPlqjcnLvbgqqWubeVsZxZ1A5/nVHKzi5fDUyKfJHlpMcR0++tSwOFDUuP+SHwVBCWgNrN8K
 rhpvdf/IRAltv0/k6CvDlAb59WQs6G7bTN+RXiBDlnbnZUjqQny3SXiYvTlFK5v39IqDpQm/T4PbF
 O/ChzAo6EZh6Jt6VdRdvzpfuGBHZ0NW28iZcm0kwVT2fr9XPrcd3+3mMO4JTy3cSqD4RTZS50rSyR
 xLvcACwSq0guf6+lC2hIPiPAibRELi0jrYlZIh2TIp5pA6miXLPabZyYFM/u5oDdi5W+IKq9qJDlw
 5gtxKnafiJAFOrqPmSd4OR76J/a0mUc1RyCWd9hP489mgC2TPPebskCs5Nylkozpo+5l8K0sBBJKH
 UMx1eQxR45nmsaHvpelkBPP50Y4fqPF4vxYGgoClS8HoNKtQDXUZoOb6ub54eJ57DsWFcpHuekVbi
 IRbs3sXvdTdGiDmE92U6zLAd;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1phX8I-0065zE-Kf; Wed, 29 Mar 2023 14:50:38 +0000
Message-ID: <61a0cc47-d7fd-b8f0-3997-586ef675bb09@samba.org>
Date: Wed, 29 Mar 2023 16:50:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: de-DE, en-US
Subject: [Announce] Samba 4.18.1, 4.17.7., 4.16.10 Security Releases are
 available for Download
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

This are security releases in order to address the following defects:

o CVE-2023-0225: An incomplete access check on dnsHostName allows 
authenticated
                  but otherwise unprivileged users to delete this 
attribute from
                  any object in the directory.
https://www.samba.org/samba/security/CVE-2023-0225.html

o CVE-2023-0922: The Samba AD DC administration tool, when operating 
against a
                  remote LDAP server, will by default send new or reset
                  passwords over a signed-only connection.
https://www.samba.org/samba/security/CVE-2023-0922.html

o CVE-2023-0614: The fix in 4.6.16, 4.7.9, 4.8.4 and 4.9.7 for 
CVE-2018-10919
                  Confidential attribute disclosure via LDAP filters was
                  insufficient and an attacker may be able to obtain
                  confidential BitLocker recovery keys from a Samba AD DC.
                  Installations with such secrets in their Samba AD should
                  assume they have been obtained and need replacing.
https://www.samba.org/samba/security/CVE-2023-0614.html


Changes
-------

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
    * BUG 15276: CVE-2023-0225.

o  Andrew Bartlett <abartlet@samba.org>
    * BUG 15270: CVE-2023-0614.
    * BUG 15331: ldb wildcard matching makes excessive allocations.
    * BUG 15332: large_ldap test is inefficient.

o  Rob van der Linde <rob@catalyst.net.nz>
    * BUG 15315: CVE-2023-0922.

o  Joseph Sutton <josephsutton@catalyst.net.nz>
    * BUG 14810: CVE-2020-25720 [SECURITY] Create Child permission 
should not
      allow full write to all attributes (additional changes).
    * BUG 15270: CVE-2023-0614.
    * BUG 15276: CVE-2023-0225.


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
using GnuPG (ID AA99442FB680B620). The Samba source code can be
downloaded from:

         https://download.samba.org/pub/samba/stable/

The release notes are available online at:

         https://www.samba.org/samba/history/samba-4.18.1.html
         https://www.samba.org/samba/history/samba-4.17.7.html
https://www.samba.org/samba/history/samba-4.16.10.html

If you are building/using ldb from a system library, you'll
also need the related updated ldb tarball, otherwise you can ignore it.
The uncompressed ldb tarballs have been signed using GnuPG (ID 
4793916113084025).
The ldb source code can be downloaded from:

samba-4.18.1:
https://download.samba.org/pub/ldb/ldb-2.7.2.tar.gz
samba-4.17.7:
https://download.samba.org/pub/ldb/ldb-2.6.2.tar.gz
samba-4.16.10:
https://download.samba.org/pub/ldb/ldb-2.5.3.tar.gz

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


