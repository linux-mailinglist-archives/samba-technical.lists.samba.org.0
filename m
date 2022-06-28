Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F95755BEF1
	for <lists+samba-technical@lfdr.de>; Tue, 28 Jun 2022 09:02:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=qZV32pQqNi1Xes+sVzDbyoXEc4T7q9zkySgqdUYB5KA=; b=QjZO5LXZVVGt4sI2KYBbBYzbK5
	GWhNxCJEUnT0U4F1/cb4Da929caEL3nqO0cXg4UHqD85SwY5KPO9iYv+oGJg+a0oGYgj95Z0JE6Dw
	/JJt2w0+mjnJu9yXa4cH5XTg1YrRGTKBuLQC8H8MX5wvn39sXx9r1TmBmclkKrUznJbrPxKfN/47G
	FeMl0yI1oTVSCF/oZHN25ibM8UMo2BdrxPoHln9dq1/z/Tch06BPKVG4njpRsCPdfVZjdIX0h/EiN
	Ml/mpmEsTxAoFmRmTWqY2Vewkv/WFdgL0RhE6tpN3E0YXfNs3ejfNg1A+lk+BXTI8TUV8PwNolRl8
	8XcaByVg==;
Received: from ip6-localhost ([::1]:26438 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1o65EI-00D6tQ-LE; Tue, 28 Jun 2022 07:01:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45816) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1o65DT-00D6sT-2D; Tue, 28 Jun 2022 07:00:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=qZV32pQqNi1Xes+sVzDbyoXEc4T7q9zkySgqdUYB5KA=; b=lzzLmJnJ3eArMHkNi1nSlzYIvM
 gbuiMO1MpSIMRdS35bdJx9v8ksHpcWUHV/RJj1F32mGS6TOTdSMm4IPb4xeqMzLuhlqu1CXczviCn
 hMFnHez0aRHOMcrRYgDhVY4DQ6Bn7yR0+dW0mDiC9AA2jIca6OytYKRM45SrNnlIRPhiGnZidr8Ou
 aKbp0cXF2RMFT1kQaMGBQGmMDdogwS14iXKR/2fPG6e1lg/6unmMFNW6FFJ7vhUhW2391JXjXDzV4
 jqHRr+tcGkixUO5MSnULbKriCM+4ntWYIF+sXIRD6SHQ8izYWqc2f3xSYoe8dYBQbyY8SjulzGF0y
 u6gcW3iTOCF+yO6HDWLj7hNHqBnhWTL0BGvc3LC8TYAMNaRQIPKi59hybwYVPVtMBL++KYgw2Zeob
 5jqh4lJ5gJVZwN7vJltvyQvDUX5X7HL65I84mzZXkS3JrSDvAhlzUHwnyj8ddSeKVmFeZfTbSbx1I
 QWLhAkTaYLckrH3EPyO6keOg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1o65DS-0024VM-5q; Tue, 28 Jun 2022 07:00:54 +0000
Message-ID: <7018239a-f365-91ef-f488-5d8179b4e23b@samba.org>
Date: Tue, 28 Jun 2022 09:00:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.15.8 Available for Download
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

This is the latest stable release of the Samba 4.15 release series.


Changes since 4.15.7
--------------------

o  Jeremy Allison <jra@samba.org>
    * BUG 15042: Use pathref fd instead of io fd in 
vfs_default_durable_cookie.
    * BUG 15099: Setting fruit:resource = stream in vfs_fruit causes a 
panic.

o  Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
    * BUG 14986: Add support for bind 9.18.
    * BUG 15076: logging dsdb audit to specific files does not work.

o  Ralph Boehme <slow@samba.org>
    * BUG 15069: vfs_gpfs with vfs_shadowcopy2 fail to restore file if 
original
      file had been deleted.

o  Samuel Cabrero <scabrero@samba.org>
    * BUG 15087: netgroups support removed.

o  Samuel Cabrero <scabrero@suse.de>
    * BUG 14674: net ads info shows LDAP Server: 0.0.0.0 depending on 
contacted
      server.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15071: waf produces incorrect names for python extensions with 
Python
      3.11.

o  Noel Power <noel.power@suse.com>
    * BUG 15100: smbclient commands del & deltree fail with
      NT_STATUS_OBJECT_PATH_NOT_FOUND with DFS.

o  Christof Schmitt <cs@samba.org>
    * BUG 15055: vfs_gpfs recalls=no option prevents listing files.

o  Andreas Schneider <asn@samba.org>
    * BUG 15071: waf produces incorrect names for python extensions with 
Python
      3.11.
    * BUG 15091: Compile error in source3/utils/regedit_hexedit.c.
    * BUG 15108: ldconfig: /lib64/libsmbconf.so.0 is not a symbolic link.

o  Andreas Schneider <asn@cryptomilk.org>
    * BUG 15054: smbd doesn't handle UPNs for looking up names.

o  Robert Sprowson <webpages@sprow.co.uk>
    * BUG 14443: Out-by-4 error in smbd read reply max_send clamp.


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

         https://www.samba.org/samba/history/samba-4.15.8.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

-- 
Jule Anger
Release Manager Samba Team      https://samba.org
SerNet Samba Team               https://sernet.de


