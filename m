Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6DB9D8941
	for <lists+samba-technical@lfdr.de>; Mon, 25 Nov 2024 16:25:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=X21o0askVNhpHDyLETkz20Xwwsqx+5zagatW3E+3+cs=; b=MhjPmsAwnT2eU2N4JNYtyYRwPM
	sUIv/UyqteX6RwLutgSlP35RcUhW7f5TSOny6kFbKjEn5txXE2jTlDc42tMYtQMvfsJ2kcH+zdlQW
	/sFHI6Fn6yNIuV3POUup9N2zs9tMTeqy/DMtrNZ/Lonxmls9ZJR1nzRui/bOvGF3jlBE8wvVwLyzo
	MhL+LLA/2bLwsOr+hnqyewgSy+nurlMm7g5cCQ2RZn8gIbyZFxyvQlA1QMjZ563lXXahI5vQayA3b
	GgOS2HHbyhPotEX1oYKJJ5Mif6M9ppvVYHvmYz3m5CEVyHACmJ9DJAUnVL9laqGAppMkGmzNF0kDy
	R0yWVI/w==;
Received: from ip6-localhost ([::1]:46366 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tFaxx-000kLT-7z; Mon, 25 Nov 2024 15:25:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28338) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tFaxo-000kKm-Cy; Mon, 25 Nov 2024 15:25:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=X21o0askVNhpHDyLETkz20Xwwsqx+5zagatW3E+3+cs=; b=zna1CFtygFJAtS+TVHyI/R5GLF
 Jg+P5nAijO/c+UYiEmvw+uUgJzdcckUjLiMJd+Mo7xslsFEuZY5U3nCQZz84zB3AcuEwlZQin6lSW
 a8VYPk7nedNV60jUJWaE0llX58+9hnMGudqE4HvsbMEfZ2e2f5qQNOKceT0f20jvuIsATVotIfH/6
 3TBuV04XVXlDpmaJPoGf478pnVzt652uAkfn/syZL8ZKk019E0n0uumYR4ouel4WQWVGUxYD1cjJu
 wWkKW9bbIgk2T5lOv1rA+kRvb5IdHG15UKq8KjdPLTS45vcbVQyJfdi6dC5Wp7xOx8tC5MHmXlxBk
 LNeUTjO///hcTUZM+D73WcNTAo7W0XfuzhPE84xKQ8ZlTBbU8jSOVjkj3IwamMbxLTnlrxGfq3Wg1
 owypAiUQuLksQzAbRLjExWVV6Aia3KEEU2OnwtdAzEfjc2wRSVLrwedjTHk8h8ZSJj6TYY1iqmYPn
 B3NdsWCXuE2AOMVDv5s/Fggb;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tFaxn-001Onx-31; Mon, 25 Nov 2024 15:25:23 +0000
Message-ID: <24350b0d-48c1-4a26-a47f-ac366ed53b8c@samba.org>
Date: Mon, 25 Nov 2024 16:25:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE, en-US
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.21.2 Available for Download
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

This is the latest stable release of the Samba 4.21 release series.


Changes since 4.21.1
--------------------

o  Ralph Boehme <slow@samba.org>
    * BUG 15732: smbd fails to correctly check sharemode against OVERWRITE
      dispositions.
    * BUG 15754: Panic in close_directory.

o  Pavel Filipenský <pfilipensky@samba.org>
    * BUG 15752: winexe no longer works with samba 4.21.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 14356: protocol error - Unclear debug message "pad length 
mismatch" for
      invalid bind packet.
    * BUG 15425: NetrGetLogonCapabilities QueryLevel 2 needs to be 
implemented.
    * BUG 15740: gss_accept_sec_context() from Heimdal does not imply
      GSS_C_MUTUAL_FLAG with GSS_C_DCE_STYLE.
    * BUG 15749: winbindd should call process_set_title() for locator child.

o  Martin Schwenke <mschwenke@ddn.com>
    * BUG 15320: Update CTDB to track all TCP connections to public IP 
addresses.


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

         https://www.samba.org/samba/history/samba-4.21.2.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

