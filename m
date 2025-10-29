Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBDAC1AC44
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:37:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=M+PlIuw3PvuefEMXzkG7J6ekwOeWRvQfpwjle8wrEWU=; b=2q59PMIte4U3+roW07EZ177OAw
	ZxEf3BCTBdzPWATSpWwtO5t7DQ73PdFQ6gdy6GJ6gTXiuujh9uKONDNx3p60o+gxuHBk6NeXzKTda
	H1ro9PZ+4QsvP/BC7XpIg6qv5hHuEBDADyNnt2qlj2ygXrf8bsMYvCIY6fz7cYOEZQDqpRb/23RLL
	qOtVZVMkNPxmjBD/n0jLB0tavCYeHy4CxpoPIyPOqgV/9ahroYU9DBngI0oewJWtqai1YrktYODoV
	Lk+S4jsUKn0nmonKSrZMzo1MxI7h1Xgh4Jxj3LOFLfL+nJbd8IrFGtYi/BF+yM7dLtCGkiQ3Ahrbp
	u2J1+hPA==;
Received: from ip6-localhost ([::1]:21928 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Mf-0099qe-7P; Wed, 29 Oct 2025 13:37:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42234) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Dm-0096ui-Kg
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:28:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=M+PlIuw3PvuefEMXzkG7J6ekwOeWRvQfpwjle8wrEWU=; b=TLP1VNeuRVujORsgOSly85le1l
 3zE8Qr3NzWSqu84SJhwYzvtMkrQHD0XgwGjYzW+iJ9yLT1RqXlat8FJn4ukGUyXdCPMgRKESdoNN0
 NhDNtqcGAm+ZLGUme+kx4RWS2WLb+ocOoabYUWtCaBQLOZZ81z975ZsftuRMZOvBOw0hKwsLFZinJ
 DMjyHvAUEH9WnmrWWmL9YE86umimK4mcjnuo4VFYLkkztwCMVMl1UanWlL7t3lMBGUVj64h8HqMdW
 zAlSJ6kE/I04gFMHlqdYeVkG0R61vJyrQVIpY03U4hOhxR//3WPqvvEp9waoLelS9G01LdHKzs1rD
 XORHbtoPNP9BsEn+J9zow5V63Mi1f0F2jSHwzaWG0VOl3hAkXxhTWYzcoW8fncybIseROdco65hp+
 I0fGo24A+KV/sjg/B4BsmTPegmvAD8DTOYFFX2xxWqKPPY2o7axDMwT7YBNnPCNDHqXdDVMzkyLfY
 rKcp2SXATnrEewvxBMCNxIh5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Dk-00Bc3k-1V; Wed, 29 Oct 2025 13:28:12 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 058/127] smb: client: make use of
 smbdirect_socket_set_logging()
Date: Wed, 29 Oct 2025 14:20:36 +0100
Message-ID: <98a6fccfa4a5e0bf37870fc5a5a775094ae0fdb9.1761742839.git.metze@samba.org>
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
Cc: metze@samba.org, Steve French <smfrench@gmail.com>,
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This will allow the logging to keep working as before,
when we move to common functions in the next commits.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 04a90fd0971c..08192d69617b 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -153,6 +153,43 @@ MODULE_PARM_DESC(smbd_logging_level,
  */
 #include "../common/smbdirect/smbdirect_all_c_files.c"
 
+static bool smbd_logging_needed(struct smbdirect_socket *sc,
+				void *private_ptr,
+				unsigned int lvl,
+				unsigned int cls)
+{
+#define BUILD_BUG_SAME(x) BUILD_BUG_ON(x != SMBDIRECT_LOG_ ##x)
+	BUILD_BUG_SAME(ERR);
+	BUILD_BUG_SAME(INFO);
+#undef BUILD_BUG_SAME
+#define BUILD_BUG_SAME(x) BUILD_BUG_ON(x != SMBDIRECT_ ##x)
+	BUILD_BUG_SAME(LOG_OUTGOING);
+	BUILD_BUG_SAME(LOG_INCOMING);
+	BUILD_BUG_SAME(LOG_READ);
+	BUILD_BUG_SAME(LOG_WRITE);
+	BUILD_BUG_SAME(LOG_RDMA_SEND);
+	BUILD_BUG_SAME(LOG_RDMA_RECV);
+	BUILD_BUG_SAME(LOG_KEEP_ALIVE);
+	BUILD_BUG_SAME(LOG_RDMA_EVENT);
+	BUILD_BUG_SAME(LOG_RDMA_MR);
+#undef BUILD_BUG_SAME
+
+	if (lvl <= smbd_logging_level || cls & smbd_logging_class)
+		return true;
+	return false;
+}
+
+static void smbd_logging_vaprintf(struct smbdirect_socket *sc,
+				  const char *func,
+				  unsigned int line,
+				  void *private_ptr,
+				  unsigned int lvl,
+				  unsigned int cls,
+				  struct va_format *vaf)
+{
+	cifs_dbg(VFS, "%s:%u %pV", func, line, vaf);
+}
+
 #define log_rdma(level, class, fmt, args...)				\
 do {									\
 	if (level <= smbd_logging_level || class & smbd_logging_class)	\
@@ -1832,6 +1869,7 @@ static struct smbd_connection *_smbd_get_connection(
 	if (!workqueue)
 		goto create_wq_failed;
 	smbdirect_socket_prepare_create(sc, sp, workqueue);
+	smbdirect_socket_set_logging(sc, NULL, smbd_logging_needed, smbd_logging_vaprintf);
 	/*
 	 * from here we operate on the copy.
 	 */
-- 
2.43.0


