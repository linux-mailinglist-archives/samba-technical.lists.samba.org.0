Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF92672631
	for <lists+samba-technical@lfdr.de>; Wed, 18 Jan 2023 19:02:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=RBr7m0/JS2rvcKUb0AlQBV2939S38sqFk0z7SSutX5A=; b=kwBeHWhP4NwvnbXi2mCsRVG81G
	gEofC5cJKKnwRAkS2BqD79QSTSPVXNQQpdOKWpPY6d5TjnHBOofh+uBTbIyWLllvCYn6nheDAXTUY
	yQeuVk4KCX1IuHtoEvq6lq6HOchOS4fVXzpsGWxZeWMEZ0IcZHz3a4Cc4fa39asxbCY3V/21eRmLO
	P/dA795zQpWHdK5PFg9gHDtM9PwAMYwSiVvkkHP01dU52zdR5nZ3jqW2bWKnifCdWrim6TInbkXcd
	fB/XMhKVIVVNr0Ff0jQq2wPItsVEKrQtmQJRv7k0XFhMBkkBcMrx+5lSGYjt4CIjFGZv2U0MVyRSu
	5VzNsoGw==;
Received: from ip6-localhost ([::1]:30974 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pICkt-000g30-NE; Wed, 18 Jan 2023 18:01:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46664) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pICkh-000g24-Vq; Wed, 18 Jan 2023 18:01:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=RBr7m0/JS2rvcKUb0AlQBV2939S38sqFk0z7SSutX5A=; b=cAT9tNPohIkDn6WcIkX7t7JQp6
 MOtjanQuDPaNLInh8EnmTtKYC+uL+E7GMFt84U8vS5g6cy0SKp8mgLVWmHWU285wuTg++Q/o4tmv+
 5751p3TUr0crbjb3zg6kbIKKoekvgUkSqNFWfuatWArMh1P3G3oMHsyMdNHXuz3NLqnXpQhc8b/HR
 KWhMvRDTTS0hdIx17DYKAQg0UOu3E829+LfjCkrIE3Wdgd8Ni9/1UbhiYo3h6yhnnKCuPJ8JFfIow
 96DvKTOLZbklfpCF0QVI/V1jk8ncg5xlTq/ANRPPQjzxTaBIfNCm5ERSoPQ1WyWDJj5td9laPexiU
 Is+9ueIJLm+U+4M6058Yga6hDn2GQmmExtxuufegsOOEoVaT5POxV3J6pkwh7WPrHV5tq+igR/FC8
 mor85ux6rTPf69ebF9SJp9kXYfoy/PepetzdKq2y8HPiibKuD3rIHuDl9ZdtyGyZtY07r1PdOYR96
 KihCHkJxuJPXxuC+1tvXLC+9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pICkh-0097Ck-5L; Wed, 18 Jan 2023 18:01:35 +0000
Message-ID: <1f018166-c9d0-cacf-844c-f65cd3582846@samba.org>
Date: Wed, 18 Jan 2023 19:01:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.18.0rc1 Available for Download
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
=====================

This is the first release candidate of Samba 4.18.  This is *not*
intended for production environments and is designed for testing
purposes only.  Please report any defects via the Samba bug reporting
system at https://bugzilla.samba.org/.

Samba 4.18 will be the next version of the Samba suite.


UPGRADING
=========


NEW FEATURES/CHANGES
====================

More succinct samba-tool error messages
---------------------------------------

Historically samba-tool has reported user error or misconfiguration by
means of a Python traceback, showing you where in its code it noticed
something was wrong, but not always exactly what is amiss. Now it
tries harder to identify the true cause and restrict its output to
describing that. Particular cases include:

  * a username or password is incorrect
  * an ldb database filename is wrong (including in smb.conf)
  * samba-tool dns: various zones or records do not exist
  * samba-tool ntacl: certain files are missing
  * the network seems to be down
  * bad --realm or --debug arguments

Accessing the old samba-tool messages
-------------------------------------

This is not new, but users are reminded they can get the full Python
stack trace, along with other noise, by using the argument '-d3'.
This may be useful when searching the web.

The intention is that when samba-tool encounters an unrecognised
problem (especially a bug), it will still output a Python traceback.
If you encounter a problem that has been incorrectly identified by
samba-tool, please report it on https://bugzilla.samba.org.

Colour output with samba-tool --color
-------------------------------------

For some time a few samba-tool commands have had a --color=yes|no|auto
option, which determines whether the command outputs ANSI colour
codes. Now all samba-tool commands support this option, which now also
accepts 'always' and 'force' for 'yes', 'never' and 'none' for 'no',
and 'tty' and 'if-tty' for 'auto' (this more closely matches
convention). With --color=auto, or when --color is omitted, colour
codes are only used when output is directed to a terminal.

Most commands have very little colour in any case. For those that
already used it, the defaults have changed slightly.

  * samba-tool drs showrepl: default is now 'auto', not 'no'

  * samba-tool visualize: the interactions between --color-scheme,
    --color, and --output have changed slightly. When --color-scheme is
    set it overrides --color for the purpose of the output diagram, but
    not for other output like error messages.

No colour with NO_COLOR environment variable
--------------------------------------------

With both samba-tool --color=auto (see above) and some other places
where we use ANSI colour codes, the NO_COLOR environment variable will
disable colour output. See https://no-color.org/ for a description of
this variable. `samba-tool --color=always` will use colour regardless
of NO_COLOR.

New wbinfo option --change-secret-at
------------------------------------

The wbinfo command has a new option, --change-secret-at=<DOMAIN CONTROLLER>
which forces the trust account password to be changed at a specified domain
controller. If the specified domain controller cannot be contacted the
password change fails rather than trying other DCs.


REMOVED FEATURES
================


smb.conf changes
================

   Parameter Name                          Description     Default
   --------------                          -----------     -------


KNOWN ISSUES
============

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.18#Release_blocking_bugs


#######################################
Reporting bugs & Development Discussion
#######################################

Please discuss this release on the samba-technical mailing list or by
joining the #samba-technical:matrix.org matrix room, or
#samba-technical IRC channel on irc.libera.chat

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

         https://download.samba.org/pub/samba/rc/

The release notes are available online at:

https://download.samba.org/pub/samba/rc/samba-4.18.0rc1.WHATSNEW.txt

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

