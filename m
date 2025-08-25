Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 24141B34D04
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:57:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=nlWuKhq9gXfsfec/4CdlOEgLoUCFJj2XM3EMbBn+44w=; b=Syw1+92fO1FRr1A1dZp4+GFvp2
	lRdzQwsNeBXuUza6Wc5FIWM2FG1pT7J/41kYLKdwhZ2ut/AX8z9u5Bbb782we2WKpkXo4VsIchYPn
	KBQc+jk7tlu8biPhgO14aBOvCzOEukjF+bqtFlKxW5pYiBuDQefzDIyGZPU3HAFCZbxVlOsVeK3if
	FlwkniNwDoqCJUfQc0eWZ8F0IB+/WbVN3ffXuaTGqxiA1xq6N4mFOr95FV6lLTTMV92m9VGP6OoXW
	nGblqD6s8bs/6iCgXksBqEO38vNCgsD3b7SNMp7ZJfEUkr3O+Q6OflzoXils9psrURqKSo9A51HsF
	MFcZj1uQ==;
Received: from ip6-localhost ([::1]:30992 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeFY-000R1t-KY; Mon, 25 Aug 2025 20:57:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14350) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeCQ-000PrW-5a
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:54:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=nlWuKhq9gXfsfec/4CdlOEgLoUCFJj2XM3EMbBn+44w=; b=QohTBFxOKmPqyFJ/63voGDtbhI
 TldYhz09LGmv0KP108cDPuzuBBeNmOhSMsvoFV3HLf3163cmUGKXbn6m6FwJIOqvooccrnTuSWXSS
 Qfg9bdvr+3kFVXlLoB5Dplo/6UkKCMOPjuZPbs2+Mdouq9R4EyD5ffAG6SuYsecBbUagOBORlOUSz
 I7W2UmgEpMJx2nKa/J1tn8sSHLs5btLmJnw+K/Hu8XEtmzw7e3p7Ylx0A7keCu59upkZY9rNwwkCk
 CQLqvQGnYZCdTGxEG63jbOuhF5fiqwcVeVABGE9nr0AkhsfcWhWPQkjw4pEy4uLCVARf5JImDhOdB
 EQKYqSZ90NqAwRBP+C4JBwdLkYDL/bBpf+RLlMxupvpa5y+RWOuUgC8mRDNv7vno9kach3AejtpKX
 bhCPKDxYRoLPPe0yexznnddskXJiHQbnbhC/uqIuMhw2BVv8Hcje1QuS+a9k9dMteS9tIYdiqsOUr
 Lq/hLW1g++Dyfm4vAkRBpyCT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeCJ-000lci-2Z; Mon, 25 Aug 2025 20:53:48 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 072/142] smb: client: pass struct smbdirect_socket to
 smbd_post_send_negotiate_req()
Date: Mon, 25 Aug 2025 22:40:33 +0200
Message-ID: <80ba0e1085e96f93af1150de163598d5055c2475.1756139607.git.metze@samba.org>
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
 fs/smb/client/smbdirect.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 9fef01ed6320..e5219b9c0c8a 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -827,9 +827,8 @@ static int smbd_ia_open(
  * After negotiation, the transport is connected and ready for
  * carrying upper layer SMB payload
  */
-static int smbd_post_send_negotiate_req(struct smbd_connection *info)
+static int smbd_post_send_negotiate_req(struct smbdirect_socket *sc)
 {
-	struct smbdirect_socket *sc = &info->socket;
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	struct ib_send_wr send_wr;
 	int rc = -ENOMEM;
@@ -1221,7 +1220,7 @@ static int smbd_negotiate(struct smbd_connection *info)
 	if (rc)
 		return rc;
 
-	rc = smbd_post_send_negotiate_req(info);
+	rc = smbd_post_send_negotiate_req(sc);
 	if (rc)
 		return rc;
 
-- 
2.43.0


