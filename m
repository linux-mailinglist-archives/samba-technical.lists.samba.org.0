Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1752DC1AA9F
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:27:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=raVU44fq84Z1bOescz1ZncJMleud/FRovMPWrjhHHFQ=; b=uvlQGge4lwbIkhqz7QmFqz9qYB
	K0dV6u4Iods/iVroa1VGtMGb+9opijkNI2zJGiO/dDzA4sT8bTUZd5Fw7oMvV6pRG5sOIZSsODgkH
	4+zMDefis5Zf10ruhTsH6i7few4yrfP12iKr/vjDCEWG2yxF3KVNArCYkcEgIm54nsqQ30beIEfaL
	1+c30kD16gdIS4CmxVXeih6ydtEh5/CJhrRN33qyc1Vm2Cz0JSdj5IXyN4jqEgsvHjPvDlhx+/vPQ
	U1WfVKEMNceDQggyS98qb8g4sNcxivobSXaTJ+MXPXew5gLnoobSvmaRjwREus6nSWn1gzape+LVr
	uAGpZF5A==;
Received: from ip6-localhost ([::1]:53454 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Cj-0096U9-E0; Wed, 29 Oct 2025 13:27:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31676) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE69v-0095fQ-1O
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:24:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=raVU44fq84Z1bOescz1ZncJMleud/FRovMPWrjhHHFQ=; b=q3MPkuyjJiwm0b8I6aT3Ps+2iC
 w+Kjyy5H90pxm9doAZNJlh/aIh9fbPGtWIdOk1hyPY1J2dKMuXeW4FPmUiBFj7Xfk6XJ+XiKG59hZ
 +lXYJP8ihJI4b5nOLgvz7Qisbue4hBzegFuDoMVMZMHzfc3NRDh0FkgQLYcGH9ZVQoDCan+HsMgz/
 POp0JtE4L0ugqmjFKnDltvJFAaOT0eqReo8vcNzVHNWO1wOHKNJQ6NgasvG4ah4Q3VN8ZoHMpOwXZ
 HeAtixCmmYEEp7PX6CgF4CmQIayl5m8JjFFKqqlmuFUeKZtcdOOVJXWUywyDP58/EOMCgxah3Xb2u
 zpQ+dUqACw6o2zAAQ0kA6lnplVf3yBYOzl/OiETglFHWhns9xDSNiq64mfMR8h9VfQu9BAkK9QANn
 ohjyBkCIGbBX38qmvJbwggBwC95/P4yw6dHwqNRiefoKjEU3EoN7IozqeCt4H+xwoP4VJaYTKVZ8r
 b+MwCXPlfqvc3dW3Zgm6o0Qq;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE69s-00BbSE-1Z; Wed, 29 Oct 2025 13:24:12 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 017/127] smb: smbdirect: introduce
 smbdirect_frwr_is_supported()
Date: Wed, 29 Oct 2025 14:19:55 +0100
Message-ID: <43ac610b77dfac6b8244dd65a293d382ff069cd9.1761742839.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761742839.git.metze@samba.org>
References: <cover.1761742839.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This will replace frwr_is_supported() on the client and
rdma_frwr_is_supported() on the server.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/common/smbdirect/smbdirect_connection.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index 8d00a456c513..e90aa3b72b44 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -11,6 +11,22 @@ static void smbdirect_connection_schedule_disconnect(struct smbdirect_socket *sc
 static void smbdirect_connection_disconnect_work(struct work_struct *work);
 static void smbdirect_connection_idle_timer_work(struct work_struct *work);
 
+__maybe_unused /* this is temporary while this file is included in orders */
+static bool smbdirect_frwr_is_supported(const struct ib_device_attr *attrs)
+{
+	/*
+	 * Test if FRWR (Fast Registration Work Requests) is supported on the
+	 * device This implementation requires FRWR on RDMA read/write return
+	 * value: true if it is supported
+	 */
+
+	if (!(attrs->device_cap_flags & IB_DEVICE_MEM_MGT_EXTENSIONS))
+		return false;
+	if (attrs->max_fast_reg_page_list_len == 0)
+		return false;
+	return true;
+}
+
 __maybe_unused /* this is temporary while this file is included in orders */
 static void smbdirect_socket_prepare_create(struct smbdirect_socket *sc,
 					    const struct smbdirect_socket_parameters *sp,
-- 
2.43.0


