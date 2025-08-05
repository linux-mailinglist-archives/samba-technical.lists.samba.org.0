Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 667C0B1B820
	for <lists+samba-technical@lfdr.de>; Tue,  5 Aug 2025 18:13:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=gyL4IDc7HU90u8aqDlrz0nY6lM5tSDmbEin3j52zRsw=; b=4Zn4aQurZkrYPhyK/js1B8/uWT
	ENWYz5+d2BYAk+dRl12ViNGsOGKZKOk+nKzoLPbBAo0B2BuZ0nQkH+QyVdLuLJgG6eJq97/uiatD/
	jdIY5PsKA9zxgwVutBxLdVSDT3Wy5q6pUGMEcSregA+rBF3sjMeO8TfCBCEnDFsUHRZODXN9nNow1
	iBDqGq2pQCM4PN0TDKzaRGOTbgcZFjNt6EtARsXbJpopmPuusVQ+ffASMWt5VGPsDQtW+WewKP9Ki
	p7HraxZKAWigETFBfFCXX0f3tkoPYqxGl2g3CBAUpgO+xLQ+sdYzPHpEIG4xLnnNECZMUWICIhoE/
	3tjmHMdg==;
Received: from ip6-localhost ([::1]:61530 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ujKHZ-00EN6W-7f; Tue, 05 Aug 2025 16:12:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41554) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujKH3-00EN0P-JM
 for samba-technical@lists.samba.org; Tue, 05 Aug 2025 16:12:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=gyL4IDc7HU90u8aqDlrz0nY6lM5tSDmbEin3j52zRsw=; b=cJX+tsumD6gZpNo/GvL4/EfB9G
 zRnqnymJpfWDmot2lbItuMmmoHw+ji8RukFOIsAeZSoM9THP2M+rMSRnC+ZS6lKfRvDLpFRIaI2Cb
 APotuzOV0suuhFL+01WNvs8apRUYyE4L7slCPP3WhrDUZtRD7lS/bl58XR3NOhUOF/kagJznQKV0H
 q2WygfKeRi8LsNglAuv+nLUdYk4tcq1WjMkArBe8Y5c6DOucLaR/Q1USmDr8X0S+ivr+EXdHPd3NM
 tJba7cvyn5vmxrice6M2oRDAYksM2zCPBWku2gO9N4wNhhPDOrKtvB2cuc0MwPFk11GGE+DL7g3pq
 yE8VA80iuEQgMVqZpWymeK7H795BosuLKVHTjG3z40DYGs+yoBYiRXLjC1AU+z5Eb8gO0+OyBvw57
 pQ61Vimqas9waLWsiDMriaDJHyfsy4X06p8Ger+Xg/4zjeu//QkHQCisNV4NKKLJFTB8V9RFMFsgL
 z8bT6THMTDmDX9at5+rMZv+X;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujKH1-0019bs-30; Tue, 05 Aug 2025 16:12:24 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 04/17] smb: smbdirect: introduce struct smbdirect_recv_io
Date: Tue,  5 Aug 2025 18:11:32 +0200
Message-ID: <58caaa8827675b0185da18556dfb6fa4f4756141.1754409478.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This will be used in client and server soon
in order to replace smbd_response/smb_direct_recvmsg.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index 5db7815b614f..a7ad31c471a7 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -54,4 +54,19 @@ struct smbdirect_socket {
 	} recv_io;
 };
 
+struct smbdirect_recv_io {
+	struct smbdirect_socket *socket;
+	struct ib_cqe cqe;
+	struct ib_sge sge;
+
+	/* Link to free or reassembly list */
+	struct list_head list;
+
+	/* Indicate if this is the 1st packet of a payload */
+	bool first_segment;
+
+	/* SMBD packet header and payload follows this structure */
+	u8 packet[];
+};
+
 #endif /* __FS_SMB_COMMON_SMBDIRECT_SMBDIRECT_SOCKET_H__ */
-- 
2.43.0


