Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 024FDAE8F52
	for <lists+samba-technical@lfdr.de>; Wed, 25 Jun 2025 22:19:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=CBZb5cDGLg5Cpz5eR4nb4ApAgqbN2A3G1lLtKu1Ecio=; b=UFH0yR5OVCpS0v2SurlNWsERP4
	ScnBZKFSjy8pvUG1KUtc1jt7hDsj0a1AIdIolSpwu/TP1Tay5LrlwLfhuEGMqHSlZjFD3gnpCylpz
	ng1VdZndtJcdnWxbLIp+AcHk2XBzeo6A+pzC9QH5aGaQmKoL58GKI/qAf6T+dHnOCpExGsO5jugVt
	QhEC65C+UXg68FlZyqDJhwhuzVdoCzpWMPaHkZwtUDItRSVCA9JLTGKQSE9l852sN1digPyLMyRpB
	StSHGkKTuWkvOt4DxM2x/dNkG5kH5XoyQ8j5l93yJIinAnfG2kKw4ENM9y8iYOsAfgAdaQAtvBRGB
	rjs0+zyw==;
Received: from ip6-localhost ([::1]:29602 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uUWaA-007scL-Rb; Wed, 25 Jun 2025 20:19:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15204) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uULFv-007pnj-B5
 for samba-technical@lists.samba.org; Wed, 25 Jun 2025 08:13:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:Cc:To:From;
 bh=CBZb5cDGLg5Cpz5eR4nb4ApAgqbN2A3G1lLtKu1Ecio=; b=tz1JFH2x5/xHuvBFVTe1GgoD12
 s7qAKYSNBhchEXF+k9ePAs+HPZZk9/y8zRWchw2dIQ6KYKp8+IR1krCtRiGJJYHxOcemVdgAWXFyo
 2/CvpWCBAxtyi7SpP9egHI/i/5VuQ7V1nTVMYosyf5TBDLO8JWeb6PCqAM4JQwqSMzS9yrJfFFrnx
 OGnwejB9ceQkx0v5H7yVuGV/Fgy20JfpacEcYyIqQYm4XnO5iuyaEmzAfUXlQ7YhW8XPzth787U0j
 0t16IKe/dMbWvWEpyD+qWgJiR5l8IaaqOG9UFeepxVFowTp3d9a6BnZyQ5Ne7qo7T/QoUxtkr8rpl
 mYGAekvT8BUBeoNajRNowjDtoB/Rd9pwo3FnfpT8D0bp46t3y+Gk9A6Tf6eu/1+5AweBpgx+Z6EOC
 idpFdt8OdfOLcgVAnAMSwlqvSojW5eNjpAR0J1B1i/8QnCHrKJfXpWsaPm2M5IUXo7KB7XOE9YdJi
 nsxVUt9RhyhztGh4nEpcGlTI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uULFu-00CNwO-1b; Wed, 25 Jun 2025 08:13:18 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH] smb: client: remove \t from TP_printk statements
Date: Wed, 25 Jun 2025 10:13:04 +0200
Message-Id: <20250625081304.943870-1-metze@samba.org>
X-Mailer: git-send-email 2.34.1
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
Cc: metze@samba.org, stable@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

The generate '[FAILED TO PARSE]' strings in trace-cmd report output like this:

  rm-5298  [001]  6084.533748493: smb3_exit_err:        [FAILED TO PARSE] xid=972 func_name=cifs_rmdir rc=-39
  rm-5298  [001]  6084.533959234: smb3_enter:           [FAILED TO PARSE] xid=973 func_name=cifs_closedir
  rm-5298  [001]  6084.533967630: smb3_close_enter:     [FAILED TO PARSE] xid=973 fid=94489281833 tid=1 sesid=96758029877361
  rm-5298  [001]  6084.534004008: smb3_cmd_enter:       [FAILED TO PARSE] tid=1 sesid=96758029877361 cmd=6 mid=566
  rm-5298  [001]  6084.552248232: smb3_cmd_done:        [FAILED TO PARSE] tid=1 sesid=96758029877361 cmd=6 mid=566
  rm-5298  [001]  6084.552280542: smb3_close_done:      [FAILED TO PARSE] xid=973 fid=94489281833 tid=1 sesid=96758029877361
  rm-5298  [001]  6084.552316034: smb3_exit_done:       [FAILED TO PARSE] xid=973 func_name=cifs_closedir

Cc: stable@vger.kernel.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/trace.h | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/fs/smb/client/trace.h b/fs/smb/client/trace.h
index 52bcb55d9952..93e5b2bb9f28 100644
--- a/fs/smb/client/trace.h
+++ b/fs/smb/client/trace.h
@@ -140,7 +140,7 @@ DECLARE_EVENT_CLASS(smb3_rw_err_class,
 		__entry->len = len;
 		__entry->rc = rc;
 	),
-	TP_printk("\tR=%08x[%x] xid=%u sid=0x%llx tid=0x%x fid=0x%llx offset=0x%llx len=0x%x rc=%d",
+	TP_printk("R=%08x[%x] xid=%u sid=0x%llx tid=0x%x fid=0x%llx offset=0x%llx len=0x%x rc=%d",
 		  __entry->rreq_debug_id, __entry->rreq_debug_index,
 		  __entry->xid, __entry->sesid, __entry->tid, __entry->fid,
 		  __entry->offset, __entry->len, __entry->rc)
@@ -190,7 +190,7 @@ DECLARE_EVENT_CLASS(smb3_other_err_class,
 		__entry->len = len;
 		__entry->rc = rc;
 	),
-	TP_printk("\txid=%u sid=0x%llx tid=0x%x fid=0x%llx offset=0x%llx len=0x%x rc=%d",
+	TP_printk("xid=%u sid=0x%llx tid=0x%x fid=0x%llx offset=0x%llx len=0x%x rc=%d",
 		__entry->xid, __entry->sesid, __entry->tid, __entry->fid,
 		__entry->offset, __entry->len, __entry->rc)
 )
@@ -247,7 +247,7 @@ DECLARE_EVENT_CLASS(smb3_copy_range_err_class,
 		__entry->len = len;
 		__entry->rc = rc;
 	),
-	TP_printk("\txid=%u sid=0x%llx tid=0x%x source fid=0x%llx source offset=0x%llx target fid=0x%llx target offset=0x%llx len=0x%x rc=%d",
+	TP_printk("xid=%u sid=0x%llx tid=0x%x source fid=0x%llx source offset=0x%llx target fid=0x%llx target offset=0x%llx len=0x%x rc=%d",
 		__entry->xid, __entry->sesid, __entry->tid, __entry->target_fid,
 		__entry->src_offset, __entry->target_fid, __entry->target_offset, __entry->len, __entry->rc)
 )
@@ -298,7 +298,7 @@ DECLARE_EVENT_CLASS(smb3_copy_range_done_class,
 		__entry->target_offset = target_offset;
 		__entry->len = len;
 	),
-	TP_printk("\txid=%u sid=0x%llx tid=0x%x source fid=0x%llx source offset=0x%llx target fid=0x%llx target offset=0x%llx len=0x%x",
+	TP_printk("xid=%u sid=0x%llx tid=0x%x source fid=0x%llx source offset=0x%llx target fid=0x%llx target offset=0x%llx len=0x%x",
 		__entry->xid, __entry->sesid, __entry->tid, __entry->target_fid,
 		__entry->src_offset, __entry->target_fid, __entry->target_offset, __entry->len)
 )
@@ -482,7 +482,7 @@ DECLARE_EVENT_CLASS(smb3_fd_class,
 		__entry->tid = tid;
 		__entry->sesid = sesid;
 	),
-	TP_printk("\txid=%u sid=0x%llx tid=0x%x fid=0x%llx",
+	TP_printk("xid=%u sid=0x%llx tid=0x%x fid=0x%llx",
 		__entry->xid, __entry->sesid, __entry->tid, __entry->fid)
 )
 
@@ -521,7 +521,7 @@ DECLARE_EVENT_CLASS(smb3_fd_err_class,
 		__entry->sesid = sesid;
 		__entry->rc = rc;
 	),
-	TP_printk("\txid=%u sid=0x%llx tid=0x%x fid=0x%llx rc=%d",
+	TP_printk("xid=%u sid=0x%llx tid=0x%x fid=0x%llx rc=%d",
 		__entry->xid, __entry->sesid, __entry->tid, __entry->fid,
 		__entry->rc)
 )
@@ -794,7 +794,7 @@ DECLARE_EVENT_CLASS(smb3_cmd_err_class,
 		__entry->status = status;
 		__entry->rc = rc;
 	),
-	TP_printk("\tsid=0x%llx tid=0x%x cmd=%u mid=%llu status=0x%x rc=%d",
+	TP_printk("sid=0x%llx tid=0x%x cmd=%u mid=%llu status=0x%x rc=%d",
 		__entry->sesid, __entry->tid, __entry->cmd, __entry->mid,
 		__entry->status, __entry->rc)
 )
@@ -829,7 +829,7 @@ DECLARE_EVENT_CLASS(smb3_cmd_done_class,
 		__entry->cmd = cmd;
 		__entry->mid = mid;
 	),
-	TP_printk("\tsid=0x%llx tid=0x%x cmd=%u mid=%llu",
+	TP_printk("sid=0x%llx tid=0x%x cmd=%u mid=%llu",
 		__entry->sesid, __entry->tid,
 		__entry->cmd, __entry->mid)
 )
@@ -867,7 +867,7 @@ DECLARE_EVENT_CLASS(smb3_mid_class,
 		__entry->when_sent = when_sent;
 		__entry->when_received = when_received;
 	),
-	TP_printk("\tcmd=%u mid=%llu pid=%u, when_sent=%lu when_rcv=%lu",
+	TP_printk("cmd=%u mid=%llu pid=%u, when_sent=%lu when_rcv=%lu",
 		__entry->cmd, __entry->mid, __entry->pid, __entry->when_sent,
 		__entry->when_received)
 )
@@ -898,7 +898,7 @@ DECLARE_EVENT_CLASS(smb3_exit_err_class,
 		__assign_str(func_name);
 		__entry->rc = rc;
 	),
-	TP_printk("\t%s: xid=%u rc=%d",
+	TP_printk("%s: xid=%u rc=%d",
 		__get_str(func_name), __entry->xid, __entry->rc)
 )
 
@@ -924,7 +924,7 @@ DECLARE_EVENT_CLASS(smb3_sync_err_class,
 		__entry->ino = ino;
 		__entry->rc = rc;
 	),
-	TP_printk("\tino=%lu rc=%d",
+	TP_printk("ino=%lu rc=%d",
 		__entry->ino, __entry->rc)
 )
 
@@ -950,7 +950,7 @@ DECLARE_EVENT_CLASS(smb3_enter_exit_class,
 		__entry->xid = xid;
 		__assign_str(func_name);
 	),
-	TP_printk("\t%s: xid=%u",
+	TP_printk("%s: xid=%u",
 		__get_str(func_name), __entry->xid)
 )
 
-- 
2.34.1


