Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A3390B34DB2
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:10:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Ut6di6MFo5IDvTnkz6YBqcemuEB2OUyUmvKFElUDjs0=; b=OwxILoMGHVRfUMUEQ76JBifKtq
	jkz9AiG2MTMo4q+Qu3mdjr4/I7NCqEpwUzxi4CFBDajxJMMb3VvX1WbrlAwjEbWfY5m2mfW+EEPmh
	pZwCnLqyq7ReXVzx8qB42R8ZLu8mub1xeg35HO/jhj/jNJETt+FOWQpXsJAd7R236XRjoQ7K8lOUB
	03jp0kSFql5mF92WcHFgn1Fqu6MewMJjJEYL/TBjr0lMUgzjxQYSrdKZAfhagvxSpmBMXp8Q09Mob
	CfdQX0SrKutOT0hRSnxYskJpwnBDhnhsWaCAgb5FqSmyAjSkdgcHF7AsMROl1daL3dr3XH5QcXA+L
	BjPASiTg==;
Received: from ip6-localhost ([::1]:39084 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeSI-000Wg9-Lt; Mon, 25 Aug 2025 21:10:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35894) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeNi-000UZA-TC
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 21:05:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Ut6di6MFo5IDvTnkz6YBqcemuEB2OUyUmvKFElUDjs0=; b=3NHzoU9asuzPzGuSS/CNhoujVP
 7Q8PiFfID4b8NhsuRc992rK7fAikA7bNU00fCWEdUPh9DITO4m3qCytdbWoXGyjBrwuggSw5dW8QG
 cvR2KnUgYe9YJnYrMMaAHrNQZuD7CUbGUQaiZ9NAccUY/EJ8TcevKkesk/1ssH/eBNNjloKKnMYbS
 BrNd9S4WGGWxIYILRB0Er8Y5ql+I28MSBeasyZPqY/+ROyore+eIxYG/c0nIs+MySZ5TbQ7xTy0vH
 /+lCgJTVvIPg1xnCPefBqdebiXfWMaFZmlJDziVSeqqtdF1iDuQflC6eBbhWDF5OXN+b4rbUIjHoP
 SRACEgPaQf90c5nx+Ap0ySCeb86DRijKLBrrgIAs2vSPqgiKRd+jyMBRtzXMBvyJxfDUW0QTvnFBx
 TpPhAgjGsUDEGZDMaUc68mpJY1RZGSbamzpbdgoYsFUCmeRQ8uulNlHM8VbIrny4wjAm+/DA6OHU+
 ZTEv/mB8wbGuzTb5RGzNjLnF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeNe-000nvL-2L; Mon, 25 Aug 2025 21:05:31 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 142/142] smb: server: pass struct smbdirect_socket to
 smb_direct_send_negotiate_response()
Date: Mon, 25 Aug 2025 22:41:43 +0200
Message-ID: <5cab3ab295f9916279d3b3308b8c832a61c4cbc1.1756139608.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This will make it easier to move function to the common code
in future.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 4c9d33ee67b5..6e4c2bf7dd93 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -1562,10 +1562,9 @@ static void smb_direct_qpair_handler(struct ib_event *event, void *context)
 	}
 }
 
-static int smb_direct_send_negotiate_response(struct smb_direct_transport *t,
+static int smb_direct_send_negotiate_response(struct smbdirect_socket *sc,
 					      int failed)
 {
-	struct smbdirect_socket *sc = &t->socket;
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	struct smbdirect_send_io *sendmsg;
 	struct smbdirect_negotiate_resp *resp;
@@ -2001,7 +2000,7 @@ static int smb_direct_prepare(struct ksmbd_transport *t)
 	sc->recv_io.credits.target = min_t(u16, sc->recv_io.credits.target, sp->recv_credit_max);
 	sc->recv_io.credits.target = max_t(u16, sc->recv_io.credits.target, 1);
 
-	ret = smb_direct_send_negotiate_response(st, ret);
+	ret = smb_direct_send_negotiate_response(sc, ret);
 out:
 	spin_lock_irq(&sc->recv_io.reassembly.lock);
 	sc->recv_io.reassembly.queue_length--;
-- 
2.43.0


