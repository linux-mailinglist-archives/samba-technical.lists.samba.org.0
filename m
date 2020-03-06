Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5AE17BB9B
	for <lists+samba-technical@lfdr.de>; Fri,  6 Mar 2020 12:25:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=YxbVP1dbYpzUb/UGM75ZC9s3j/6ng6cq5uqHoB60O1w=; b=MeWGwdV4qv1m3g0ogbPy1qNX97
	7bm7eimA47HV9dPaAV1xws73NQw79RwVwahnLJx1WFDgSqif9PCyfxgD07paQ2zwA7Qs6+djQ6Vtx
	QtrHoD36SMM2kjkDycGv1zNXBw4a7EeWIXKlSuC0RANinzV9I1dRuCRi6C04iPKGi1lrNyJTRQ4T8
	FHpU5C1RtxdvxiPi7RznAi4+mSzNnImm4AYUCH0S/i1PHpJukiPkQOLF4bOhvPAKoB13IVzrqjSpu
	dFeNUykuzpZC1H014iW91IpCS+zO4uaS+sQ2G8FeEu6QZsQjgPxGTQTBTpS7n62waL8Zei+Wn17Lc
	svg6lUzw==;
Received: from localhost ([::1]:21702 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jAB6i-00FHht-Nn; Fri, 06 Mar 2020 11:25:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32072) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jAB6e-00FHhm-EI
 for samba-technical@lists.samba.org; Fri, 06 Mar 2020 11:25:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=YxbVP1dbYpzUb/UGM75ZC9s3j/6ng6cq5uqHoB60O1w=; b=gEQp6yqgOfr4khBDXxKT2bnaAy
 i5kSaDvXUizbfXfx+LiZwCKeFpgh302dVI1wEUfvh8l+aRpVf9reowPiYCs3B3Psys1F8yyNnHVwe
 FU58z/diXmIX5mgS2hXeLRa+VdRLnTiUskZH0SjPvk2cQ/ZXiuTBkUTz7n/y2EXgSVU6EmEeOd7Wt
 L1y7xRp1jF5xQ8S04WlPFdJEtl3ifPZQO5WqMcoRKRmol65q5naW5HrtPCFxtWOOhqprqtevgifsT
 w/wOPRkUO25WVnDXD5Y6Hc9g2CmyT0fVXRluhCrMMuegzPXZawJU2J/ueiGCY/RI2nqZHnS1mXH0w
 BBGUnnIsj9wi7fEnQp1tU99g1WTOFiQ/ZrNenN7XVyI22cUIDEbNfP4Jad/B1JWPuXUQCuViN6wm1
 7Lk5H1A7QNO9vXj8XxhJsSe/hGny/Ej52YrM6ARgH3JTyd2bbXa7sxnCVnFT+uk+SlisFnwRFu0xw
 tfzgxpiFNS//ifExGnQsyB1h;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jAB6d-0005Vq-RK; Fri, 06 Mar 2020 11:25:27 +0000
Subject: Re: Using vfs_fruit alongside vfs_recycle
To: Isaac Boukris <iboukris@gmail.com>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <CAC-fF8Tc=3A=fBU5DpstKcg7YxYvi0ugFSBTAGSMz2tp6H1MFA@mail.gmail.com>
 <73341d2e-2a86-a43f-6fa5-dd1473cdef6e@samba.org>
Message-ID: <5b8bae24-553b-25cf-b942-6d6b2404d8c0@samba.org>
Date: Fri, 6 Mar 2020 12:25:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <73341d2e-2a86-a43f-6fa5-dd1473cdef6e@samba.org>
Content-Type: multipart/mixed; boundary="------------AD0D09AA89B1BF46316EA047"
Content-Language: en-US
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------AD0D09AA89B1BF46316EA047
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Am 3/6/20 um 12:16 PM schrieb Ralph Boehme via samba-technical:
> Am 3/6/20 um 12:02 PM schrieb Isaac Boukris via samba-technical:
>> Hi,
>>
>> The manpage of vfs_fruit states that "This module is not stackable
>> other than described in this manpage.", is this still correct?
> 
> well, everything is is simply not tested systematically. Many
> combinations may work, with some you may run into issues...
> 
>> I'm looking into a bug report which I can reproduce on master, where
>> usage of vfs_fruit alongside vfs_recycle causes an error log at level
>> 0 upon deleting a file, failing to find "._filename". So I wonder if
>> this configuration is unsupported or is there a logical bug here.
> 
> Iirc I've never worked with systems where vfs_recycle was configured
> with fruit, so I haven't seen this before.
> 
>> [2020/03/06 12:28:48.627691,  0]
>> ../../source3/modules/vfs_recycle.c:239(recycle_get_file_size)
>>   recycle: stat for ./._test.txt returned No such file or directory
> 
> Hm, maybe just a too high log level in vfs_recycle?

Yeah, looking at the codepath in vfs_recycle that leads up to this
message it is going via unlink -> recycle_get_file_size. vfs_recycle is
assuming that any path passed to unlink must exist, otherwise it logs
the error.

Attached patch should fix it. Can you file a bugreport?

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

--------------AD0D09AA89B1BF46316EA047
Content-Type: text/x-systemd-unit; charset=UTF-8;
 name="bugXXX-master-vfs-recycle.path"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="bugXXX-master-vfs-recycle.path"

From fab569cd73ed56055e3f8e7978dfe7a1a4412440 Mon Sep 17 00:00:00 2001
From: Ralph Boehme <slow@samba.org>
Date: Fri, 6 Mar 2020 12:22:25 +0100
Subject: [PATCH] vfs_recycle: prevent flooding the log if we're called on
 non-existant paths

vfs_recycle is assuming that any path passed to unlink must exist, otherwise it
logs this error. Turn this into a DEBUG level message.

BUG: ...
See also: https://bugzilla.redhat.com/show_bug.cgi?id=1780802

Signed-off-by: Ralph Boehme <slow@samba.org>
---
 source3/modules/vfs_recycle.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/source3/modules/vfs_recycle.c b/source3/modules/vfs_recycle.c
index a1d32bf10cb..ab1e6aa4dcf 100644
--- a/source3/modules/vfs_recycle.c
+++ b/source3/modules/vfs_recycle.c
@@ -236,8 +236,8 @@ static off_t recycle_get_file_size(vfs_handle_struct *handle,
 	}
 
 	if (SMB_VFS_STAT(handle->conn, smb_fname_tmp) != 0) {
-		DEBUG(0,("recycle: stat for %s returned %s\n",
-			 smb_fname_str_dbg(smb_fname_tmp), strerror(errno)));
+		DBG_DEBUG("stat for %s returned %s\n",
+			 smb_fname_str_dbg(smb_fname_tmp), strerror(errno));
 		size = (off_t)0;
 		goto out;
 	}
-- 
2.24.1


--------------AD0D09AA89B1BF46316EA047--

