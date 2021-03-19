Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2EF341EE1
	for <lists+samba-technical@lfdr.de>; Fri, 19 Mar 2021 14:57:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=/M28w1PF8lYT2vZv1ExYZlwHwTaCfjCoY/pOUH0jMv4=; b=U7bZSWJ2YXfErhroWBKcMTbDbx
	FIwHk8Qy0CU8gv97b+EgqZ5hOD0ad/7+L3meVc8kY7RPkJp1obu45OYJChXKVtVxMwMz4YG7jly9y
	gkjcsZi7350gn1ZNWfo+35K8d5HHNCopO1pUaL1OaBrlmOHTj1rFC4Xl0sn1SjmCw3vquc0s0BLSe
	svUeqcKveJZBTzbkL067ki8C/whG+Z0NnWx3Mg16NrIwib5zmdbCkdBQKgzhKi/Jxs71DSzddDpxX
	ynwgjbOKi1at/z+G5neKfMgxEEjAAg8tYYU9ecsZ7dDCLZUZj8+SgHq04CN/06F1gTEO6yMF3bemm
	6ZA5ZRJQ==;
Received: from ip6-localhost ([::1]:29512 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lNFd1-0062Av-F9; Fri, 19 Mar 2021 13:57:27 +0000
Received: from smtp2.axis.com ([195.60.68.18]:9189) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lNFcv-0062Ao-Ur
 for samba-technical@lists.samba.org; Fri, 19 Mar 2021 13:57:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1616162242;
 x=1647698242;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/M28w1PF8lYT2vZv1ExYZlwHwTaCfjCoY/pOUH0jMv4=;
 b=Fa7izohDQrF2E8DwmQA31M2KeSkrOQuLqcvQVWlNpHIOqLTqPqPbCgyT
 VwWpfbzf+NWqlHZjQaSKhBdOeoX+vAC7hbLzjqeijtTF9cfGR4DkvNr1Z
 OHJTtOLHUW+dW/K8HBB4osrd8GE8vFoeAGlUPalS+iq+bSSXtda3DN0Cc
 LgEdGkec30YawtdYHqa5VL/7gOodlfmcUE86GHOkjDibRJS04iJfrLTEZ
 fAz8Wec1UiQyz0szUvNcXxVXFkY8ob6kzLU4OYDvOsV/Kj83zEH0VdKwi
 oKsyx2l07lvbdgBkcec2mVZEBUPzxYx9CT9YlSUNJjtahFvD2V36e7nOd g==;
To: Steve French <sfrench@samba.org>
Subject: [PATCH v3] cifs: Silently ignore unknown oplock break handle
Date: Fri, 19 Mar 2021 14:57:11 +0100
Message-ID: <20210319135711.11802-1-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
From: Vincent Whitchurch via samba-technical <samba-technical@lists.samba.org>
Reply-To: Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc: linux-cifs@vger.kernel.org,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org, tom@talpey.com,
 kernel@axis.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Make SMB2 not print out an error when an oplock break is received for an
unknown handle, similar to SMB1.  The debug message which is printed for
these unknown handles may also be misleading, so fix that too.

The SMB2 lease break path is not affected by this patch.

Without this, a program which writes to a file from one thread, and
opens, reads, and writes the same file from another thread triggers the
below errors several times a minute when run against a Samba server
configured with "smb2 leases = no".

 CIFS: VFS: \\192.168.0.1 No task to wake, unknown frame received! NumMids 2
 00000000: 424d53fe 00000040 00000000 00000012  .SMB@...........
 00000010: 00000001 00000000 ffffffff ffffffff  ................
 00000020: 00000000 00000000 00000000 00000000  ................
 00000030: 00000000 00000000 00000000 00000000  ................

Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---

Notes:
    v3:
    - Change debug print to Tom Talpey's suggestion
    
    v2:
    - Drop change to lease break
    - Rewrite commit message

 fs/cifs/smb2misc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/cifs/smb2misc.c b/fs/cifs/smb2misc.c
index 60d4bd1eae2b..76cd05b8d53b 100644
--- a/fs/cifs/smb2misc.c
+++ b/fs/cifs/smb2misc.c
@@ -754,8 +754,8 @@ smb2_is_valid_oplock_break(char *buffer, struct TCP_Server_Info *server)
 		}
 	}
 	spin_unlock(&cifs_tcp_ses_lock);
-	cifs_dbg(FYI, "Can not process oplock break for non-existent connection\n");
-	return false;
+	cifs_dbg(FYI, "No file id matched, oplock break ignored\n");
+	return true;
 }
 
 void
-- 
2.28.0


