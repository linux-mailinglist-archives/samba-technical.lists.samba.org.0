Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7308943CA4F
	for <lists+samba-technical@lfdr.de>; Wed, 27 Oct 2021 15:06:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=9/klff5NQOaJN6unIsLhbpEE3dBj9oVeRtfrI8RkCrE=; b=3m9SeYMhdvkQ0R5MvAFGMXGZk/
	PfqYH+JhXxnqtQtem8tmFmw7eyWFZ32VLS2VxiATqUwJVCNZ8BgHtiMB4Mb+5PUInGgiKsu9Qyw++
	yBIrAbOOyvIjhnLMd1tb2OER4WCYw66aeY97Ik+nBGaswa85WoMASv4WrwrNlcMTxCdbVtyb0aImQ
	bls0eZOce+wsghzb2cQFdXVI8tcINiI0ykosHZfRqzzwHt7l5Yp5UGjMVkBMBEeJ1dm/FU1/4deuC
	HCBZnTGh3JGubLIn77Ea7CdpmUbCRUt+Bf0Z27thdZqMIm3+IVhCAm+yzFAdGb/2gWmd9kVlSXJen
	vQY5TC0g==;
Received: from ip6-localhost ([::1]:47318 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mficx-000x5C-O5; Wed, 27 Oct 2021 13:05:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56794) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mficr-000x4t-VK; Wed, 27 Oct 2021 13:05:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=9/klff5NQOaJN6unIsLhbpEE3dBj9oVeRtfrI8RkCrE=; b=zKfTTAzAIC1WtBjn2Z/lyVDrDJ
 wTGicxXE2Hgk1VGp2AFm6f40hV9IoIPvnw626hedeRoVWk6+QqldqK9l6j5/tb/MP4XZsnas8YY+t
 OSnPod33JJtowwDGtyw0FtGALfBPEQe09MIXBrKMkyVgA5kZB9HTRoYdEbGTz4qii3glfm8DjBMt3
 HB4e6c1B4mVSuwVbarN6zC+0urdErMlPSlGgVrmrOhvGkvWft+ISEjPTsdBVZeBmUTet+Dabhsa2H
 bbim6cdE3zmBFB8domc2sqMo0WxyVSBQRSgYITX0lyxFBuxGbr96qemE6HIJuam3vuXjpalnjhCHZ
 DqmaGc3BQ/kzBtX7vX3EfQEhUNaATLYWVlyZaxWZGd+8iKfGTMFapyPWtkvLx7cMXX6pxSuXoheLp
 oeYjJlMfRw6pBXqAp77Kps42D7wlNci1ZLx+7Ol0kBckF+PN6to1Ddauq9MEFEEWpRSI5fLUOjbv1
 ULdYLzjYq4gel/uLxAKFXfgB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mficr-003VMD-CI; Wed, 27 Oct 2021 13:05:53 +0000
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.15.1 Available for Download
Message-ID: <1344581e-537c-5681-a6f2-1bc008de5ae3@samba.org>
Date: Wed, 27 Oct 2021 15:05:53 +0200
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

This is the latest stable release of the Samba 4.15 release series.


Changes since 4.15.0
--------------------

o  Jeremy Allison <jra@samba.org>
    * BUG 14682: vfs_shadow_copy2: core dump in make_relative_path.
    * BUG 14685: Log clutter from filename_convert_internal.
    * BUG 14862: MacOSX compilation fixes.

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
    * BUG 14868: rodc_rwdc test flaps.

o  Andrew Bartlett <abartlet@samba.org>
    * BUG 14642: Provide a fix for MS CVE-2020-17049 in Samba [SECURITY] 
'Bronze
      bit' S4U2Proxy Constrained Delegation bypass in Samba with embedded
      Heimdal.
    * BUG 14836: Python ldb.msg_diff() memory handling failure.
    * BUG 14845: "in" operator on ldb.Message is case sensitive.
    * BUG 14848: Release LDB 2.4.1 for Samba 4.15.1.
    * BUG 14854: samldb_krbtgtnumber_available() looks for incorrect string.
    * BUG 14871: Fix Samba support for UF_NO_AUTH_DATA_REQUIRED.
    * BUG 14874: Allow special chars like "@" in samAccountName when 
generating
      the salt.

o  Ralph Boehme <slow@samba.org>
    * BUG 14826: Correctly ignore comments in CTDB public addresses file.

o  Isaac Boukris <iboukris@gmail.com>
    * BUG 14642: Provide a fix for MS CVE-2020-17049 in Samba [SECURITY] 
'Bronze
      bit' S4U2Proxy Constrained Delegation bypass in Samba with embedded
      Heimdal.

o  Viktor Dukhovni <viktor@twosigma.com>
    * BUG 12998: Fix transit path validation.

o  Pavel Filipenský <pfilipen@redhat.com>
    * BUG 14852: Fix that child winbindd logs to log.winbindd instead of
      log.wb-<DOMAIN>.

o  Luke Howard <lukeh@padl.com>
    * BUG 14642: Provide a fix for MS CVE-2020-17049 in Samba [SECURITY] 
'Bronze
      bit' S4U2Proxy Constrained Delegation bypass in Samba with embedded
      Heimdal.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 14855: SMB3 cancel requests should only include the MID 
together with
      AsyncID when AES-128-GMAC is used.

o  Alex Richardson <Alexander.Richardson@cl.cam.ac.uk>
    * BUG 14862: MacOSX compilation fixes.

o  Andreas Schneider <asn@samba.org>
    * BUG 14870: Prepare to operate with MIT krb5 >= 1.20.

o  Martin Schwenke <martin@meltin.net>
    * BUG 14826: Correctly ignore comments in CTDB public addresses file.

o  Joseph Sutton <josephsutton@catalyst.net.nz>
    * BUG 14642: Provide a fix for MS CVE-2020-17049 in Samba [SECURITY] 
'Bronze
      bit' S4U2Proxy Constrained Delegation bypass in Samba with embedded
      Heimdal.
    * BUG 14836: Python ldb.msg_diff() memory handling failure.
    * BUG 14845: "in" operator on ldb.Message is case sensitive.
    * BUG 14864: Heimdal prefers RC4 over AES for machine accounts.
    * BUG 14868: rodc_rwdc test flaps.
    * BUG 14871: Fix Samba support for UF_NO_AUTH_DATA_REQUIRED.
    * BUG 14874: Allow special chars like "@" in samAccountName when 
generating
      the salt.

o  Nicolas Williams <nico@twosigma.com>
    * BUG 14642: Provide a fix for MS CVE-2020-17049 in Samba [SECURITY] 
'Bronze
      bit' S4U2Proxy Constrained Delegation bypass in Samba with embedded
      Heimdal.


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

         https://www.samba.org/samba/history/samba-4.15.1.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

