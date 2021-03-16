Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 641FA33D42F
	for <lists+samba-technical@lfdr.de>; Tue, 16 Mar 2021 13:49:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=R/qrhf2BvEAQYNmpXyzvq1FG5e/yZfN8pk3ldKPlorY=; b=NX4OZsJdoX1fuC+Yt/6S1CjpXD
	6mJediN7hjBxFZ1HxvpempoK0QSQhcKvTdOlIaqKcQzCWNjjfLj3bt3aZvzUBAkoWwHpDy53cMO/u
	s6XDRWC0Y/fO2NbLAOgvKRwJlI7HUB65WqjYHpnYrhrAIRRWWfZLCSg4ZX41dbMY8zJx3dODfKcq6
	6u4Oye0lsnjmi2glX0mscLf+JHxqvKHStYSEaESHBMoriIvMkodUTVhCL7KU+8GlF6QyPfpLF+U32
	heJBmzH+5Nyd3mJMctC9/NgNk3vpPVf3jAukHJR5PX4ZoNZ19I2T9+Z/PmNhSOco+0/dJmzRjYlAu
	R++BqWLA==;
Received: from ip6-localhost ([::1]:20202 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lM97c-005hIm-0c; Tue, 16 Mar 2021 12:48:28 +0000
Received: from smtp2.axis.com ([195.60.68.18]:65354) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lM97W-005hIf-Dd
 for samba-technical@lists.samba.org; Tue, 16 Mar 2021 12:48:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1615898902;
 x=1647434902;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R/qrhf2BvEAQYNmpXyzvq1FG5e/yZfN8pk3ldKPlorY=;
 b=hDahsCIHTRZR3dSVf8xKPuKVNnK1SfRYJHcdPxkdyuIdgyQzFqpYSsYB
 /jbvs28tfa1bnYo139fARIAnNwtrsBVZGX7UbwnxOiToBAPuVufvHBZze
 0M/XuKHXhXg3VF0U82fKBVBJTtEjI4pjjzjdPakA8O4mSH2heKYNXNuBi
 C+Nw8K/AZlOiSWmmANZVUqnRF/s2aLPrD0WOd+9wOX5NYGHth5JsZz0Ok
 OQOG0aOTSZ/QSSiHK351L24pOiUpjm81U/vsby64GrHyLp8osFygSse3S
 z2Y01BT9jr93cVIBIN3Q8EdxEAE5JJkcvxv/U98dRXTaysW86m9pPKHzh g==;
To: Steve French <sfrench@samba.org>
Subject: [PATCH v2] cifs: Silently ignore unknown oplock break handle
Date: Tue, 16 Mar 2021 13:48:07 +0100
Message-ID: <20210316124808.11984-1-vincent.whitchurch@axis.com>
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
 Vincent Whitchurch <vincent.whitchurch@axis.com>, kernel@axis.com,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Make SMB2 not print out an error when an oplock break is received for an
unknown handle, similar to SMB1.  The SMB2 lease break path is not
affected by this patch.

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
    v2:
    - Drop change to lease break
    - Rewrite commit message

 fs/cifs/smb2misc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cifs/smb2misc.c b/fs/cifs/smb2misc.c
index 60d4bd1eae2b..4d8576e202e3 100644
--- a/fs/cifs/smb2misc.c
+++ b/fs/cifs/smb2misc.c
@@ -755,7 +755,7 @@ smb2_is_valid_oplock_break(char *buffer, struct TCP_Server_Info *server)
 	}
 	spin_unlock(&cifs_tcp_ses_lock);
 	cifs_dbg(FYI, "Can not process oplock break for non-existent connection\n");
-	return false;
+	return true;
 }
 
 void
-- 
2.28.0


