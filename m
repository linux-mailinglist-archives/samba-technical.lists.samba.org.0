Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5E7C1AB81
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:33:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=e7TfcKaWR4gsMnrLU7rOVYWG0pCaz323t4H8ikpYczE=; b=z74cRUe3OHIYKbIaGfKZYEsMMr
	RESHL8dop1Lp1mlaoHx4BDiBSbnJd2olT0FnmcrJqFb//STHWzVIFJPtVWNHXWipzyvrL/o4Q9k0H
	5A7sLWn2IxhJQizvSyfhjisqin3cluqGpcbf22ZrCXQYAkjOOI6NvyGRuXv/+rMfMEsDKeeZC1mY+
	cBQ98LpXQsY+/MJmjRAwv4OTkzgshfhStsxA4/FaOf2iz2bGLDNSRkaJ5WNTnc0JD2DmaHqodHACd
	f9xXK4XFs+dBsivJYodFgCLN4iv11XBdLCQ6kuOVrj5sXpRBYRlaWGIVhOKxePgWnUAtiQT5R5Q2S
	DxVfCPuA==;
Received: from ip6-localhost ([::1]:53696 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6IR-0098QD-ED; Wed, 29 Oct 2025 13:33:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41874) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6C3-0096LD-5j
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:26:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=e7TfcKaWR4gsMnrLU7rOVYWG0pCaz323t4H8ikpYczE=; b=qHiaK1mI5kW/r1hSfgn5s4YKvy
 s6hyhrPWK+YP0e4AD7+muaICPeiVQkJoDuO0FbsjnLRa7ndnzpVh75KXNdKJ67RA1j8pJY53eyrrb
 xCeDb95BE6pIC4GxKhfhbuaqJyCeLpqcozWoagTaWIiX/LjHoV5ZKATrduuqQxl3/bHKCvcQD+wcp
 LK/6315WRlLM7DUvopIQPBaUxNeaWP5NHmFWFfEhgFAQwcspPzyIC6I7rpl7g9Kb6GmLleAM3zsFm
 sccqb/KMtXuDuZ6e0Z0CR7XaC935eVt2c22mNcsqBb+9qT8c8LTOPvF3bSMXbu8vz3k0M0r0hz2QK
 uBqyEXAYnDg3bduXL6uuIuWSpI5GhAZwIhtPlcGKkuGV7kPEu2SPG4uS3gDcEyCi3PPQlN397AYKH
 EMjNGFcOhXhPYCu+CSrw3PfSI7H8CdzEc/1qkaNkNs4SuAQBncEcOOLo+9kul/dHgIofwC309zLUy
 ymkXRX/z1HxgWLN2ex8tZuTa;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Bz-00Bbm0-11; Wed, 29 Oct 2025 13:26:23 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 039/127] smb: smbdirect: introduce
 smbdirect_connection_grant_recv_credits()
Date: Wed, 29 Oct 2025 14:20:17 +0100
Message-ID: <5ad2a4ef1c3df9c69d20248ea607367705ff5651.1761742839.git.metze@samba.org>
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

This is a copy of manage_credits_prior_sending() in the server.

It is very similar to manage_credits_prior_sending() in the
client, the only difference is that
atomic_add(new_credits, &sc->recv_io.credits.count) is done
in the caller there.

It will replace both versions in future.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 .../common/smbdirect/smbdirect_connection.c   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index 36f82b090bc7..da2e9ecdd98d 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -1037,6 +1037,26 @@ static int smbdirect_connection_wait_for_credits(struct smbdirect_socket *sc,
 	} while (true);
 }
 
+__maybe_unused /* this is temporary while this file is included in orders */
+static u16 smbdirect_connection_grant_recv_credits(struct smbdirect_socket *sc)
+{
+	u16 new_credits;
+
+	if (atomic_read(&sc->recv_io.credits.count) >= sc->recv_io.credits.target)
+		return 0;
+
+	new_credits = atomic_read(&sc->recv_io.posted.count);
+	if (new_credits == 0)
+		return 0;
+
+	new_credits -= atomic_read(&sc->recv_io.credits.count);
+	if (new_credits <= 0)
+		return 0;
+
+	atomic_add(new_credits, &sc->recv_io.credits.count);
+	return new_credits;
+}
+
 __maybe_unused /* this is temporary while this file is included in orders */
 static void smbdirect_connection_send_io_done(struct ib_cq *cq, struct ib_wc *wc)
 {
-- 
2.43.0


