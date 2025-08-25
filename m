Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D252B34CE1
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:54:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=nXX0xsh6etPOf9jHyYpLrCiNVXCPykH9CMGvPAJCVTo=; b=c4WR14EfD+aT4b6Fc1czW4saLE
	sO2t8OimC5w1NipZ51Os265jhuor4FoFEM34ocriKWjWc5Ha+fHXaP++iSBWe5KfkKWw1a7jyn3HY
	JT1pwohIkozQP/iFeCiu0+fTrBpgfFRXgqJvjT/6ZAgWUGKSxE46FYvv48e9ca+CRHdSp/u25HGdt
	apo4+N3rOxkE68H9XqNPkFKpKExpbge/JPWWyCGzqIacDNDabzIMFNaMwApVLRnmhuI1X8vObubg4
	Fv/UEedk8DP5HlGH6STNO5f/NliOIYn0nplGEgAZPoOYb2x9BkkXcd2SeHbbMyAUbajH8Oc/cbCe+
	3AkOcjSg==;
Received: from ip6-localhost ([::1]:43900 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeCl-000Py4-9R; Mon, 25 Aug 2025 20:54:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13072) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeAL-000Oxm-DH
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:51:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=nXX0xsh6etPOf9jHyYpLrCiNVXCPykH9CMGvPAJCVTo=; b=zg/Qw+YH9B0egyhK14mf5YGQoi
 kXvThLhbatQlLHHR9my8Hu6sP8lPQ+bzU3wB40849uSSuiWj7vcY44VDJKXYPPX9Or7HKWvCXNr0+
 v2V/N0+sKBNZwM0ocPU+y+KQ74JjAGuQnXirRbnO9uvNCwYFHO2Vq1r34JD52Aegj5vsDK2sQAEai
 Pgbogs1o1/xuLUmtTRQkePCopFUA382dz1cVn8Q34SnqZAioKADuDuf7OdyoIYOjtBKEAKvn/PDSb
 qI0dqjUWLMoHMTMOOEuoa3CNS0AGz66Nx7ZtePptN7WHKydePfphHpck8kfcRg0QyqwMXCcENpebR
 N/fPDw1WBsaJcR+msm212pVNHM1tJvtKICtCffJXr3daSubc36gFoBznN7+fRmTQFyuayuS2dM0eo
 9Q7q+2IQNdR/MdIG7EpsohcbzPR5pfFvXrj5F8DOzn0WXO+hdfC3PY7rntjuIvymNbv9bJkkdKaz/
 rOoU2vuj0RbdOsHgdKz3lk9q;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeAH-000lCC-1R; Mon, 25 Aug 2025 20:51:42 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 059/142] smb: client: pass struct smbdirect_socket to
 {allocate, destroy}_mr_list()
Date: Mon, 25 Aug 2025 22:40:20 +0200
Message-ID: <435f17a96f74c91918be670c38b87c1f2f37cac1.1756139607.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756139607.git.metze@samba.org>
References: <cover.1756139607.git.metze@samba.org>
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

This will make it easier to move function to the common code
in future.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 0f68c35bef2a..4db70c2c369a 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -40,8 +40,8 @@ static int smbd_post_recv(
 
 static int smbd_post_send_empty(struct smbd_connection *info);
 
-static void destroy_mr_list(struct smbd_connection *info);
-static int allocate_mr_list(struct smbd_connection *info);
+static void destroy_mr_list(struct smbdirect_socket *sc);
+static int allocate_mr_list(struct smbdirect_socket *sc);
 
 struct smb_extract_to_rdma {
 	struct ib_sge		*sge;
@@ -1518,7 +1518,7 @@ void smbd_destroy(struct TCP_Server_Info *server)
 		msleep(1000);
 		cifs_server_lock(server);
 	}
-	destroy_mr_list(info);
+	destroy_mr_list(sc);
 
 	ib_free_cq(sc->ib.send_cq);
 	ib_free_cq(sc->ib.recv_cq);
@@ -1843,7 +1843,7 @@ static struct smbd_connection *_smbd_get_connection(
 		goto negotiation_failed;
 	}
 
-	rc = allocate_mr_list(info);
+	rc = allocate_mr_list(sc);
 	if (rc) {
 		log_rdma_mr(ERR, "memory registration allocation failed\n");
 		goto allocate_mr_failed;
@@ -2225,9 +2225,8 @@ static void smbd_mr_recovery_work(struct work_struct *work)
 	}
 }
 
-static void destroy_mr_list(struct smbd_connection *info)
+static void destroy_mr_list(struct smbdirect_socket *sc)
 {
-	struct smbdirect_socket *sc = &info->socket;
 	struct smbdirect_mr_io *mr, *tmp;
 
 	disable_work_sync(&sc->mr_io.recovery_work);
@@ -2248,9 +2247,8 @@ static void destroy_mr_list(struct smbd_connection *info)
  * Recovery is done in smbd_mr_recovery_work. The content of list entry changes
  * as MRs are used and recovered for I/O, but the list links will not change
  */
-static int allocate_mr_list(struct smbd_connection *info)
+static int allocate_mr_list(struct smbdirect_socket *sc)
 {
-	struct smbdirect_socket *sc = &info->socket;
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	int i;
 	struct smbdirect_mr_io *smbdirect_mr, *tmp;
-- 
2.43.0


