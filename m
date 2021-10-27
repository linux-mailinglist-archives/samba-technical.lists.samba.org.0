Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E874943CAB2
	for <lists+samba-technical@lfdr.de>; Wed, 27 Oct 2021 15:31:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=gihstKYLMhaOPD3AFHOxQ8/krCUbAzE3pjkKgfwAHUY=; b=HDG8Bg/voqgjx/DDSwqSr3I8+M
	lCKyovCiXfLE3e3bu40tLSr0CqM3ozwyalW+9hsxsmm4nRY0DnHThRhXXb81WH8aQVN1mk/Ckturw
	VemoRRbHh6gDs45jP7nFxDPzbUH9s32B26Az+9xGKEabHre9gzRp38YGWaXfchO8e90fQtA2fMahd
	jOh43IWwS98pQmK43dqplne2aMY+QOJOb8UDjh72W9LQXMOolaWvu1pZKlHmXJ/BHfbOocZbVYgXE
	FTK6ic4+4T+tGPdu8NLQ1F2/9dM481OZ/RoFuAHuIReLZiaF34EdzrM0wY/X/CvPpRq0QGN5MNXyf
	H0q3rfjQ==;
Received: from ip6-localhost ([::1]:54650 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mfj1e-000zc3-4t; Wed, 27 Oct 2021 13:31:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56812) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mfj1X-000zX6-2M; Wed, 27 Oct 2021 13:31:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=gihstKYLMhaOPD3AFHOxQ8/krCUbAzE3pjkKgfwAHUY=; b=YVuO0V+GtsI6sTpNmuWoSUVYCB
 0ce1vYuIZv5fEllqTq14QoI+fvu3iiDmOP4K03datCYpRVMddwJSlA5aDI+2y8ZG3L9kQ/5AObC4a
 MPQlkVsyvt0cuV2yb43jkKjsiq1YA8eHJUs7hRyCtDrFco0D4XMoJ73jO8y62etP3rL4ik5fR9ufG
 sGtUg4lNSXDr/XLTtNfijHw5mUtMMyCtf4mxwK5ZGk85W0LaPLT+P7SeDNbfNbmEwI4aDEcXagbfh
 fHlP0VN12zr4pYampxM9ZBAg6OcDmp0FezPdZ9my5XLe4To9Oht10xGQPhaIJ1VahLxP//qJAfWw3
 +j+AV3dqlYWF3D12VK0q2QSyDtp6cx43Y38mDUTesO/sSqIOg32Py1HtVbvxlNeoirwqm17n5NFLP
 jyzoX/6I0qwase4MHTGQd2uLohZ4tGZWnYEUX2PzcmEqopI4PBdN7hq3VlkWq6sN2uY7ZbieHiwvf
 ejJPs23shI0J6+yvC9SdHsyw;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mfj1W-003VyC-Dt; Wed, 27 Oct 2021 13:31:22 +0000
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.14.9 Available for Download
Message-ID: <2135408b-50c9-9c34-d95d-f8134838d46f@samba.org>
Date: Wed, 27 Oct 2021 15:31:22 +0200
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

This is the latest stable release of the Samba 4.14 release series.


Changes since 4.14.8
--------------------

o  Jeremy Allison <jra@samba.org>
    * BUG 14682: vfs_shadow_copy2: core dump in make_relative_path.

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
    * BUG 14868: rodc_rwdc test flaps.
    * BUG 14881: Backport bronze bit fixes, tests, and selftest 
improvements.

o  Andrew Bartlett <abartlet@samba.org>
    * BUG 14836: Python ldb.msg_diff() memory handling failure.
    * BUG 14642: Provide a fix for MS CVE-2020-17049 in Samba [SECURITY] 
'Bronze
      bit' S4U2Proxy Constrained Delegation bypass in Samba with embedded
      Heimdal.
    * BUG 14845: "in" operator on ldb.Message is case sensitive.
    * BUG 14848: Release LDB 2.3.1 for Samba 4.14.9.
    * BUG 14870: Prepare to operate with MIT krb5 >= 1.20.
    * BUG 14871: Fix Samba support for UF_NO_AUTH_DATA_REQUIRED.
    * BUG 14874: Allow special chars like "@" in samAccountName when 
generating
      the salt.
    * BUG 14881: Backport bronze bit fixes, tests, and selftest 
improvements.

o  Ralph Boehme <slow@samba.org>
    * BUG 14826: Correctly ignore comments in CTDB public addresses file.

o  Isaac Boukris <iboukris@gmail.com>
    * BUG 14642: Provide a fix for MS CVE-2020-17049 in Samba [SECURITY] 
'Bronze
      bit' S4U2Proxy Constrained Delegation bypass in Samba with embedded
      Heimdal.
    * BUG 14881: Backport bronze bit fixes, tests, and selftest 
improvements.

o  Viktor Dukhovni <viktor@twosigma.com>
    * BUG 12998: Fix transit path validation.
    * BUG 14881: Backport bronze bit fixes, tests, and selftest 
improvements.

o  Luke Howard <lukeh@padl.com>
    * BUG 14642: Provide a fix for MS CVE-2020-17049 in Samba [SECURITY] 
'Bronze
      bit' S4U2Proxy Constrained Delegation bypass in Samba with embedded
      Heimdal.
    * BUG 14881: Backport bronze bit fixes, tests, and selftest 
improvements.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 14881: Backport bronze bit fixes, tests, and selftest 
improvements.

o  Andreas Schneider <asn@samba.org>
    * BUG 14870: Prepare to operate with MIT krb5 >= 1.20.
    * BUG 14881: Backport bronze bit fixes, tests, and selftest 
improvements.

o  Martin Schwenke <martin@meltin.net>
    * BUG 14826: Correctly ignore comments in CTDB public addresses file.

o  Joseph Sutton <josephsutton@catalyst.net.nz>
    * BUG 14642: Provide a fix for MS CVE-2020-17049 in Samba [SECURITY] 
'Bronze
      bit' S4U2Proxy Constrained Delegation bypass in Samba with embedded
      Heimdal.
    * BUG 14845: "in" operator on ldb.Message is case sensitive.
    * BUG 14868: rodc_rwdc test flaps.
    * BUG 14871: Fix Samba support for UF_NO_AUTH_DATA_REQUIRED.
    * BUG 14874: Allow special chars like "@" in samAccountName when 
generating
      the salt.
    * BUG 14881: Backport bronze bit fixes, tests, and selftest 
improvements.

o  Nicolas Williams <nico@twosigma.com>
    * BUG 14642: Provide a fix for MS CVE-2020-17049 in Samba [SECURITY] 
'Bronze
      bit' S4U2Proxy Constrained Delegation bypass in Samba with embedded
      Heimdal.
    * BUG 14881: Backport bronze bit fixes, tests, and selftest 
improvements.


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

         https://www.samba.org/samba/history/samba-4.14.9.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

