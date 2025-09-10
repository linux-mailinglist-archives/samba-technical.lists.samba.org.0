Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C663B520A1
	for <lists+samba-technical@lfdr.de>; Wed, 10 Sep 2025 21:06:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=YiL6GulIFr+mlSqJ4d1AWNF4hfFaAl0s8YiAXyR4kBI=; b=0s5YGZGfHhCV0gxkDKmSwxczEx
	x/XV87b2fYzU8ke7lWx5Gk1F4OYx3b1RL788GrWCOiTZTJOrupLNWuqkPMVCI/mfXu+DgcsopSUh/
	PbPNb3cLVbe1KFXA8rF1gDoHS94RdNuJQcXph4hH8XkfgF1nEfbB4pyWP4eyVurx0eD7DbpqZTaz/
	A4Pvse3DZleJSUr7n/bgAyiyQ11BFL+bPlK8fBD2iZsTiUTj9N17YUSga0ZwiY0kGPhArb01vNd/Z
	wyQrfEvqSVsKOiBbZyhxl7+AJa2qT4Ve5chOdZPx94DNV+0bmGcOUUcIMnSz20FkwtW39RTupMnZV
	dQ2IWh/w==;
Received: from ip6-localhost ([::1]:56872 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uwQ8E-003Ufu-BB; Wed, 10 Sep 2025 19:05:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44060) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uwQ88-003Ufn-4j
 for samba-technical@lists.samba.org; Wed, 10 Sep 2025 19:05:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=YiL6GulIFr+mlSqJ4d1AWNF4hfFaAl0s8YiAXyR4kBI=; b=gWXrCIrtduAE1K1h0BVyS6jHHO
 rbFiZ16lsPABQKXHbs45oAVZt1kQhaxuvFIJhqJQ4WrqEaSzTo3v4VqXxfWy1N5pdiBpJYEh/KTOe
 QrIBqXYKCkpEMCDyB3C5iy44yQ09vrPuLr1EQG3+RHm65wSrdJ0JYkWT5hi3UcHfMDGoFEAKXAmZH
 fW+pYnQ3WY+jNlrL5DN/ffBSJuoi1E78BIVmBWzqqd+E0+nBMA8TdO+WMw3d0uxnuG+Agp/N9b6M3
 KXgQ4fRLLtUxXZGCaAn+AehvtsqXZQjNg8lp6H7uTb/El3HtElqIwgeSLlkH8mXf8045WRukZdoPN
 rqVPGjipalCvMY5O0CKeDDa8oDOa78MUSQaYYIXMzx+2HYEAWDWHpkYAc5pz18B/qavKV3gNuAcbc
 Ohh08L8DYrAvSFSc4lBDyykc3q8PVhPxBMvtRLUSvIjZTpcPJRRsPu18FGSbDPhfOgQOgCSdlM/Ov
 HeEQxXc8PR6rV7uiqLYgIGH/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uwQ87-003TWY-0V; Wed, 10 Sep 2025 19:05:19 +0000
Message-ID: <642872f4-e076-4588-b011-920479b06949@samba.org>
Date: Wed, 10 Sep 2025 21:05:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: replace for-next-next... Re: [PATCH v4 000/142] smb:
 smbdirect/client/server: make use of common structures
To: Steve French <smfrench@gmail.com>
References: <cover.1756139607.git.metze@samba.org>
 <e6c0ddfe-8942-47a0-8277-b4176a5918e0@samba.org>
 <CAH2r5msKSbUfOVXUabNQep3s2H4kW0AMnDh0XA68Pk3_oqaHCQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAH2r5msKSbUfOVXUabNQep3s2H4kW0AMnDh0XA68Pk3_oqaHCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Tom Talpey <tom@talpey.com>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Steve, hi Namjae,

I found "ksmbd: smbdirect: validate data_offset and data_length field of smb_direct_data_transfer"
https://git.samba.org/?p=ksmbd.git;a=commitdiff;h=927f8fe05e334d016c598d2cc965161c2808d9ba
in ksmbd-for-next-next.

I added a Fixes and Reviewed-by tag
https://git.samba.org/?p=metze/linux/wip.git;a=commitdiff;h=fa36db4e8d62aa9c3ba1200323d8e01e4eb88b19
and two additional patches:
ksmbd: smbdirect: verify remaining_data_length respects max_fragmented_recv_size
https://git.samba.org/?p=metze/linux/wip.git;a=commitdiff;h=9e881174900e53dd2b17c0c0933cc4395ceb47a6
smb: client: let recv_done verify data_offset, data_length and remaining_data_length
https://git.samba.org/?p=metze/linux/wip.git;a=commitdiff;h=174faeea9ee496b724206d405b74db8b05729f11

I think these should go into 6.17.

As there as conflicts with for-next-next I rebased it again
and made sure each commit compiles and the result still passes
the tests I made last time.

The result can be found under
git fetch https://git.samba.org/metze/linux/wip.git for-6.18/fs-smb-20250910-v6
https://git.samba.org/?p=metze/linux/wip.git;a=shortlog;h=refs/heads/for-6.18/fs-smb-20250910-v6

Please have a look and replace for-next-next again...
The diff against the current for-next-next (e2e99af785ee91ce20c6d583e396660494db77a2)
and for-6.18/fs-smb-20250910-v6 (1fb2a52741e836f54a4691cbd74d9d70d736e506) follows below.

Thanks!
metze

  fs/smb/client/smbdirect.c                  | 19 ++++++++++++++++++-
  fs/smb/common/smbdirect/smbdirect_socket.h |  2 +-
  fs/smb/server/transport_rdma.c             | 25 +++++++++++++++++--------
  3 files changed, 36 insertions(+), 10 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 322334097e30..6215a6e91c67 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -548,7 +548,9 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
  	struct smbdirect_socket *sc = response->socket;
  	struct smbdirect_socket_parameters *sp = &sc->parameters;
  	u16 old_recv_credit_target;
-	int data_length = 0;
+	u32 data_offset = 0;
+	u32 data_length = 0;
+	u32 remaining_data_length = 0;
  	bool negotiate_done = false;

  	log_rdma_recv(INFO,
@@ -600,7 +602,22 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
  	/* SMBD data transfer packet */
  	case SMBDIRECT_EXPECT_DATA_TRANSFER:
  		data_transfer = smbdirect_recv_io_payload(response);
+
+		if (wc->byte_len <
+		    offsetof(struct smbdirect_data_transfer, padding))
+			goto error;
+
+		remaining_data_length = le32_to_cpu(data_transfer->remaining_data_length);
+		data_offset = le32_to_cpu(data_transfer->data_offset);
  		data_length = le32_to_cpu(data_transfer->data_length);
+		if (wc->byte_len < data_offset ||
+		    wc->byte_len < (u64)data_offset + data_length)
+			goto error;
+
+		if (remaining_data_length > sp->max_fragmented_recv_size ||
+		    data_length > sp->max_fragmented_recv_size ||
+		    (u64)remaining_data_length + (u64)data_length > (u64)sp->max_fragmented_recv_size)
+			goto error;

  		if (data_length) {
  			if (sc->recv_io.reassembly.full_packet_received)
diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index 8542de12002a..91eb02fb1600 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -63,7 +63,7 @@ const char *smbdirect_socket_status_string(enum smbdirect_socket_status status)
  	case SMBDIRECT_SOCKET_DISCONNECTING:
  		return "DISCONNECTING";
  	case SMBDIRECT_SOCKET_DISCONNECTED:
-		return "DISCONNECTED,";
+		return "DISCONNECTED";
  	case SMBDIRECT_SOCKET_DESTROYED:
  		return "DESTROYED";
  	}
diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 33d2f5bdb827..e371d8f4c80b 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -538,7 +538,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
  	case SMBDIRECT_EXPECT_DATA_TRANSFER: {
  		struct smbdirect_data_transfer *data_transfer =
  			(struct smbdirect_data_transfer *)recvmsg->packet;
-		unsigned int data_length;
+		u32 remaining_data_length, data_offset, data_length;
  		u16 old_recv_credit_target;

  		if (wc->byte_len <
@@ -548,15 +548,24 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
  			return;
  		}

+		remaining_data_length = le32_to_cpu(data_transfer->remaining_data_length);
  		data_length = le32_to_cpu(data_transfer->data_length);
-		if (data_length) {
-			if (wc->byte_len < sizeof(struct smbdirect_data_transfer) +
-			    (u64)data_length) {
-				put_recvmsg(sc, recvmsg);
-				smb_direct_disconnect_rdma_connection(sc);
-				return;
-			}
+		data_offset = le32_to_cpu(data_transfer->data_offset);
+		if (wc->byte_len < data_offset ||
+		    wc->byte_len < (u64)data_offset + data_length) {
+			put_recvmsg(sc, recvmsg);
+			smb_direct_disconnect_rdma_connection(sc);
+			return;
+		}
+		if (remaining_data_length > sp->max_fragmented_recv_size ||
+		    data_length > sp->max_fragmented_recv_size ||
+		    (u64)remaining_data_length + (u64)data_length > (u64)sp->max_fragmented_recv_size) {
+			put_recvmsg(sc, recvmsg);
+			smb_direct_disconnect_rdma_connection(sc);
+			return;
+		}

+		if (data_length) {
  			if (sc->recv_io.reassembly.full_packet_received)
  				recvmsg->first_segment = true;





