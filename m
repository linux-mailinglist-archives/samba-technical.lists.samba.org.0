Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D50B1B81B
	for <lists+samba-technical@lfdr.de>; Tue,  5 Aug 2025 18:12:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Bh68EdVExnVkeLOMNqsgNTCQscf3EXNVbkCB3TL2LJU=; b=xOVwIs4AIsqhPd8lxMhrs9mdGT
	ZAbetPiEnpd0uoNILXmxYgzrfBZ+pCrWinYfCEmFLclJVueknOBAUPqpRiTkoqw15Lxu1wblpe/y6
	MFKmYsQPymEwtfMBdUU1QLWPT4s1fht+/XtbDCAP9IuqVId2hnob8V2k8+SZslt6Uh2Gp2Yvbsjlw
	pKTtunChix9vfwL1YqXW/AKk04jdMO1k5nGBDcbQ59ACJmojyAzMd8/ESQozsC5UOq/uXW6AtU7rf
	+MK8Gmj1tBgdsoUFWSTvpaBj7Bex5L6b4Cw/qYoZAtA1tVhYT13DzU9HV8D0p2fMlF3ls3e0QrDeA
	DWK+nAlA==;
Received: from ip6-localhost ([::1]:24738 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ujKGh-00EMtn-Qy; Tue, 05 Aug 2025 16:12:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61094) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujKGd-00EMtN-J3
 for samba-technical@lists.samba.org; Tue, 05 Aug 2025 16:12:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Bh68EdVExnVkeLOMNqsgNTCQscf3EXNVbkCB3TL2LJU=; b=YKyT3mUoSlTBWqsUgqnqcRdkAx
 TpgdcPjQxdCgVc4S/hHhp3kpiPsJbCosqK439nySYMm6dappDGM4EuDopi0313zLJBIshHHSeVbA8
 xUADe/FjXAfNKbA+lGd+8iZ6mE5iT/gnyBzduom4ZoaL7bgymWkr6LU1dnyLYX8NE4EG6C8Nu+6Ly
 U9GWR0a1j/komt7o6DhY0eDjvi3+tkL6RvOGzCgEmUcBjOH+XvcQ8GAZr30jm/C0nEXlYkf0bp6iM
 nJ2a2Fb82hZEjoCKZjujEks+PcyugsdR2TSRWHiOkIhYVxm1FyElF8DFFjQ8NjL6n6zW471h064fc
 9zYMk4iBDHWk+/m+RFKCqRcbUfsmRZwvqeZTYhbURNfZx3lsMsW4y5YD9BvNFjOO6QBGeANJQv5dm
 AticqjQOAludFQ8tE7Kg3CkS4EXU+3CHQ16xgBiQh24fRlzDcUYA/CDhvKu75+tTMnJH+Mdy0eUhr
 xtjUGE3/f/BICVn8eoGeT0ou;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujKGd-0019Yw-06; Tue, 05 Aug 2025 16:11:59 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 01/17] smb: client: remove unused
 smbd_connection->fragment_reassembly_remaining
Date: Tue,  5 Aug 2025 18:11:29 +0200
Message-ID: <23c4c45dba966820bebcf579b8937596a6333c8e.1754409478.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754409478.git.metze@samba.org>
References: <cover.1754409478.git.metze@samba.org>
MIME-Version: 1.0
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: metze@samba.org, Steve French <smfrench@gmail.com>,
 Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/cifs_debug.c | 2 --
 fs/smb/client/smbdirect.h  | 1 -
 2 files changed, 3 deletions(-)

diff --git a/fs/smb/client/cifs_debug.c b/fs/smb/client/cifs_debug.c
index fe107ef8c4cd..d462fed843ee 100644
--- a/fs/smb/client/cifs_debug.c
+++ b/fs/smb/client/cifs_debug.c
@@ -467,13 +467,11 @@ static int cifs_debug_data_proc_show(struct seq_file *m, void *v)
 		seq_printf(m, "\nRead Queue count_reassembly_queue: %x "
 			"count_enqueue_reassembly_queue: %x "
 			"count_dequeue_reassembly_queue: %x "
-			"fragment_reassembly_remaining: %x "
 			"reassembly_data_length: %x "
 			"reassembly_queue_length: %x",
 			server->smbd_conn->count_reassembly_queue,
 			server->smbd_conn->count_enqueue_reassembly_queue,
 			server->smbd_conn->count_dequeue_reassembly_queue,
-			server->smbd_conn->fragment_reassembly_remaining,
 			server->smbd_conn->reassembly_data_length,
 			server->smbd_conn->reassembly_queue_length);
 		seq_printf(m, "\nCurrent Credits send_credits: %x "
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index ea04ce8a9763..a2026c542989 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -75,7 +75,6 @@ struct smbd_connection {
 	atomic_t send_credits;
 	atomic_t receive_credits;
 	int receive_credit_target;
-	int fragment_reassembly_remaining;
 
 	/* Memory registrations */
 	/* Maximum number of RDMA read/write outstanding on this connection */
-- 
2.43.0


