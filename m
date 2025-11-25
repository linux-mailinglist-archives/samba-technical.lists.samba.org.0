Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FB8C86822
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:12:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=octnfcbzKHl9HbGtvbHo3ac/1He9gMP6otpI2tm785w=; b=1WPmq6sDmYWrDdcopeJbPvWcIL
	ovA+gS5B5aGHwOpVapZ9y5ppD5kMW1PSY/jcm5ZcTIEmZ/jjTbSiQaVjjUjaWFWlo1W3gR4xPxfj0
	eSBr4AZ+2/t4PDRw0UrookkzKJ3frETRRkoa3Sjxwxp7nxkcZ11ZW1G1F8cTZD15wh1QuAFP48TVA
	ukA/sMQEdWD+MYHTG0BgnHKZHR2NmyFVTu+SpU8kK3DjbGJTzBoJ+bXoE3HOTOpM9RAsMej/ipYH1
	l4YbiIS2aGdQawexGsBNfLl1SBCOCYIMfoo6K3ibDMDZKcvfge2BNL34mmFyvun9fYwkfkaUdmrPn
	AKGDN3IA==;
Received: from ip6-localhost ([::1]:51946 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxWm-00DBQe-8K; Tue, 25 Nov 2025 18:12:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43932) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxQg-00D9Xh-3p
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:06:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=octnfcbzKHl9HbGtvbHo3ac/1He9gMP6otpI2tm785w=; b=tkFXeLHnBgjpGY4RWtzGW3IHfn
 B+UvOlk/48zcYd10rCVqjtPT9jPBGnXnRP82VTNeWanM4Q2vEP65giSEM5VEOOoYn2VochghNBM8i
 nQeNX3q3QOxRLRaN7xu+ba1qVkigOnspBh5uLtpBflGzrMQtNqpCY58RzzPsgPtiUNQQH1wQxP6+L
 4Gg5aH/69LeOwwgwWw40iLLpvj/NrOMkOt3hE2RosJBPyzWZzUJ4CbBaI59vBSTI8zZGfxi5EDpFO
 DL8TfV2gEnEUG1vuSmQq7viP6ODpc15XlIXzR/YUAuzRmd5vyrtX/Q6e+uJdxUCWAytvK/zJqjqbY
 ojf2pDC6nobbNfbMh5+O6UL3gsuyTseuPw8j1QnteEPF8aB9GC0V+7o+IFuOTVr2VuoA1n38HvPdk
 KouxRtCOWG9JrMZ7FsAQMtlVvVFatIIQBEDJHl33exYlRf8+lnoVeK3Natkluk3/AM3LZARC4Q1UJ
 tsjphUNegMZEPhnHk3LHLX49;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxNh-00Fday-2Z; Tue, 25 Nov 2025 18:03:14 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 062/145] smb: client: make use of
 smbdirect_socket_set_logging()
Date: Tue, 25 Nov 2025 18:55:08 +0100
Message-ID: <d27914583422a94ad9ab48d698a7cdc0c167c0f2.1764091285.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764091285.git.metze@samba.org>
References: <cover.1764091285.git.metze@samba.org>
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

This will allow the logging to keep working as before,
when we move to common functions in the next commits.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 05ac030ab653..3d3b6fa65781 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -156,6 +156,43 @@ static void smbd_disconnect_rdma_connection(struct smbdirect_socket *sc);
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
@@ -1839,6 +1876,7 @@ static struct smbd_connection *_smbd_get_connection(
 	if (!workqueue)
 		goto create_wq_failed;
 	smbdirect_socket_prepare_create(sc, sp, workqueue);
+	smbdirect_socket_set_logging(sc, NULL, smbd_logging_needed, smbd_logging_vaprintf);
 	/*
 	 * from here we operate on the copy.
 	 */
-- 
2.43.0


