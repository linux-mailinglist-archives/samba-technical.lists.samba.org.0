Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2E3B1B81A
	for <lists+samba-technical@lfdr.de>; Tue,  5 Aug 2025 18:12:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=vy09TOG3qbf7lpqnhHn+8cyvz/O/SxV+WGnY8OySDC8=; b=wi1PKUUD2ErPZUExBH52KysyJe
	fs71YgSGwkhKEMNRSyiZMyhHJvdWZzhN542SBAJzQBoRAYcZwkj95YMACIAY5KkMwV30JKDeO8o2t
	iR1HnZGCLYtnC1a3+nkUgZLcAz5iTKofy7ws1jkGlpPVWwnh3zDjxt+CSDRqyMKqqJUJqOxGnSNx2
	a/C3opOyNUlK5/oVz+mtdy99LfEW4uJK3vGLfLoAOHVP2OKRF1E8pOMHY+ahPiK5vNa4pnbwrsOAR
	K0dwgY8dAaJX1iqJfHU5Yr/EOazhNE8w0zbe4qB2mKpvunfQlrVoe5aShVTu3zfFiILxt2asremPX
	PyOZ5JCQ==;
Received: from ip6-localhost ([::1]:57778 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ujKGs-00EMvX-RM; Tue, 05 Aug 2025 16:12:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36896) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujKGm-00EMuE-IJ
 for samba-technical@lists.samba.org; Tue, 05 Aug 2025 16:12:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=vy09TOG3qbf7lpqnhHn+8cyvz/O/SxV+WGnY8OySDC8=; b=jbSi/rznSwn0qdXUm9mE/iITaX
 bJXQS8xVq/npgkzhf5REWd/Hcodvx5BYGQxZb7nPG21NMJonrnDlS3vgW9S8lInLoL3ptsllEruRY
 U5XxAlLg89+Fdpw+qPJMYvIqljRNLhfZdfmewGS1SU88GUzmwamXgOB4dhctXCPoPdjB7XllV7iK1
 +waJ0bKfBhp33GJRhxgNoxrR0p56iTRnha2TeyJXj6zzMptUOGe0ELahqpf1WcUeZWcu8BuK/4McC
 SJ6Fg/8uMCSHVb+Dy1dcVm35XaAzFPI2Tg8tL1w3CWOKQSZDAOUxlVLdh6mi3/iLiesOW56qGbBvz
 wLozAV/pM6UtOZTRr922x+gh7TZ/WzQTYbHCC6JwYbECHGehWU/H/G0vjks0hKAYfK2k0GGxmhVem
 /NOwfAFxIrb1I2dpBJxFOo8HttOk6/hJ0VdzAwXr24FOty9fagyHDp/c1ttHTJM0wM8t7UVg4p/e5
 AMMz/A032zSp+nutT2zn2MoI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujKGl-0019ZH-2M; Tue, 05 Aug 2025 16:12:07 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 02/17] smb: smbdirect: introduce
 smbdirect_socket.recv_io.expected
Date: Tue,  5 Aug 2025 18:11:30 +0200
Message-ID: <48e2dbdfe70f4d65d29de2dff9b2c209e0efb066.1754409478.git.metze@samba.org>
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

The expected message type can be global as they never change
during the after negotiation process.

This will replace smbd_response->type and smb_direct_recvmsg->type
in future.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index e5b15cc44a7b..5db7815b614f 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -38,6 +38,20 @@ struct smbdirect_socket {
 	} ib;
 
 	struct smbdirect_socket_parameters parameters;
+
+	/*
+	 * The state for posted receive buffers
+	 */
+	struct {
+		/*
+		 * The type of PDU we are expecting
+		 */
+		enum {
+			SMBDIRECT_EXPECT_NEGOTIATE_REQ = 1,
+			SMBDIRECT_EXPECT_NEGOTIATE_REP = 2,
+			SMBDIRECT_EXPECT_DATA_TRANSFER = 3,
+		} expected;
+	} recv_io;
 };
 
 #endif /* __FS_SMB_COMMON_SMBDIRECT_SMBDIRECT_SOCKET_H__ */
-- 
2.43.0


