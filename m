Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C34777E725
	for <lists+samba-technical@lfdr.de>; Wed, 16 Aug 2023 19:01:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=iEuBIeWH1oM6XVbbiC1eZ4EsFH8shcwIduq5YLNrMTs=; b=kb5H2aXXYcbe298A8Lr5DM5oWh
	xbM/fQWyHJwHHc2zUyjxoh7lCzsJr8I/RS4Jx7Gol9AMOKI89cqM1b+0iYquSLICopusrX7wasyEz
	sM8HBTRcRWsLgpgdIUDrj6Nl0pKcIXc3oQ8xft3zW4xnPQoDz2nginpyf75Tk+E8gRx2JuM2r9KXh
	XPYih5JYt16R0XPJs1sGYBrKGK+rgc2K3RaET2ySHA5gxZhELskg53vQcRwjHieGD4ySsANeLVURx
	EwVRpNs5Mf90+il7YpChB+CMdzBRFJOq5wyYI0STTpg6Hr5VAaWrgYEvAxhYaIlD3/hPopoo9r2cn
	BpgvVDIw==;
Received: from ip6-localhost ([::1]:33472 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qWJtV-00CYTw-CX; Wed, 16 Aug 2023 17:01:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43370) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qWJtJ-00CYSz-6X; Wed, 16 Aug 2023 17:01:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=iEuBIeWH1oM6XVbbiC1eZ4EsFH8shcwIduq5YLNrMTs=; b=CC+989dvVjW7cExxK7o0fAIxb8
 hmX0nJxqDNWcFAUiYhw201JUa+tPj8Gar8kSrrs+7jwaxU8lrOZIG0IkMdvdd8wU7Pxois6CM8wGi
 OkZCeej2p5U20+awHjLBmaotatlBhyZhIPOa9VKoOaC/wNZXeaPWseNFs2rUSbzRr9WRr4JmPMvwB
 5qlqv+2GAi43D9WABSHQBlWT0HsMHW1r221ctqtzJv5ylxoM1ACsMPSPu9cxOil2pj1KJU4So6iGL
 1gElzNIWNfdNafvIVM5YDuDJ61+L5YGGPT6DspLP1hNbesx/elTNRTEBnM9HDDqa8jzXEdcA1mhf+
 FFyIiuJtbajqpFTO8ezl+o2aDv3nuuEXCbOfcGTIt+OteQ62KDwD2LzSUTCmnvtcwLKMwyFIo/eiL
 pNwcnbMuPycTAbX1oAPigSrylPJqHALM7anKnG69lJNLWNBIAzttEGNhWOLGEQWc/uW8IxhxX58aZ
 9AJVhy1l/l9dmjrOaM1Cc0eP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qWJtI-008QBC-20; Wed, 16 Aug 2023 17:01:04 +0000
Message-ID: <1b733a1f-8262-0e21-cb84-48b85e106b94@samba.org>
Date: Wed, 16 Aug 2023 19:01:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: de-DE
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.18.6 Available for Download
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


Changes since 4.18.5
--------------------

o  Jeremy Allison <jra@samba.org>
    * BUG 15420: reply_sesssetup_and_X() can dereference uninitialized tmp
      pointer.
    * BUG 15430: Missing return in reply_exit_done().

o  Andrew Bartlett <abartlet@samba.org>
    * BUG 15289: post-exec password redaction for samba-tool is more 
reliable for
      fully random passwords as it no longer uses regular expressions
      containing the password value itself.
    * BUG 9959: Windows client join fails if a second container 
CN=System exists
      somewhere.

o  Ralph Boehme <slow@samba.org>
    * BUG 15342: Spotlight sometimes returns no results on latest macOS.
    * BUG 15417: Renaming results in NT_STATUS_SHARING_VIOLATION if 
previously
      attempted to remove the destination.
    * BUG 15427: Spotlight results return wrong date in result list.

o  Günther Deschner <gd@samba.org>
    * BUG 15414: "net offlinejoin provision" does not work as non-root user.

o  Pavel Filipenský <pfilipensky@samba.org>
    * BUG 15400: rpcserver no longer accepts double backslash in dfs 
pathname.
    * BUG 15433: cm_prepare_connection() calls close(fd) for the second 
time.

o  Stefan Metzmacher <metze@samba.org>
    * BUG 15346: 2-3min delays at reconnect with 
smb2_validate_sequence_number:
      bad message_id 2.
    * BUG 15441: samba-tool ntacl get segfault if aio_pthread appended.
    * BUG 15446: DCERPC_PKT_CO_CANCEL and DCERPC_PKT_ORPHANED can't be 
parsed.

o  Noel Power <noel.power@suse.com>
    * BUG 15390: Python tarfile extraction needs change to avoid a warning
      (CVE-2007-4559 mitigation).
    * BUG 15435: Regression DFS not working with widelinks = true.

o  Arvid Requate <requate@univention.de>
    * BUG 9959: Windows client join fails if a second container 
CN=System exists
     somewhere.

o  Jones Syue <jonessyue@qnap.com>
    * BUG 15441: samba-tool ntacl get segfault if aio_pthread appended.
    * BUG 15449: mdssvc: Do an early talloc_free() in _mdssvc_open().


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

         https://www.samba.org/samba/history/samba-4.18.6.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team

