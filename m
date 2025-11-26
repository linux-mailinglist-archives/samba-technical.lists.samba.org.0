Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD84C8977A
	for <lists+samba-technical@lfdr.de>; Wed, 26 Nov 2025 12:15:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=w8d8HkGlrqvwcgdedF2R9zrbiIWX+UmAkB48YnlIjUY=; b=IgykTeVtI1CAixbzidySO1tAgG
	924VmKvfGmyX9sU6FLbn3xXZrbrr/ulHrh1n7Zly5N1tjhTp+G2GurBfGLEB7OZ4MlCb0j8SYGKZJ
	eolxf+l1glCvUVnbiAwTT6IlvZBv2NuKXjPLRVLt5wVAyp9b41nuuog4cT0zjCpOB7JkfS/SX1N16
	mSg/DS82T3wH3p7UdhT3yhfl/CV7APRpqbcHwermy2DFUhuU8l+SuACJi1H9AW2k/k0UrdQHpWPVL
	vbTWfRQk+2iDcQNqqRncUVFz4/jiB2jqBBvEs4JFtYQqT1bbsLPlM+Ck9ydplytu5PTEKsVltkYtS
	QxmLAIdw==;
Received: from ip6-localhost ([::1]:32794 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vODTg-00DNEA-Ch; Wed, 26 Nov 2025 11:14:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14706) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vODTb-00DNE3-D4
 for samba-technical@lists.samba.org; Wed, 26 Nov 2025 11:14:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=w8d8HkGlrqvwcgdedF2R9zrbiIWX+UmAkB48YnlIjUY=; b=ZXRUy89ujMdpZlfRBgYAZZ4KAQ
 N8vm91aRdV0nshI3bSrJ//DFt0C0vd52bqlFFYj3OXLe80Si21a297z2JzmWso/xw08BayVyfPSKO
 3Z2HQfAa+aI1vCq/0rrEouUKdT3AHH93vq/YR4P7RBLq8m/bLRQKk4gTLto/cndSUVp1jlo1cksBm
 S/LU4SGK1e3D9jScHfbs/PgAIrcC1A7c6lC9gnm7bXZ8/KRzY0P6fwtdq3Tfeu/zxjM7ofjnF8iKp
 XvBWhZGsfikg7ny7r0xEoz8SVO1zT96iuRFGk+/B32OVYimfeS8TcPkwTIyiUTT+3Yxztw1fesqdF
 vI7Ukv5uJLcIPAM6NacG6+uAeZuwQOCL7EP9I2wYG5WLpf+BNFPevmvz+aU8KJkThFnzRq8nk8JjO
 cczkNwMTVEKZX7knsLQCs1+kNkUMRJR1yczqFAB4MOsxeq176menwXq/1a1YP1r3YzLRjGzBeITcg
 DXJFWlWye10K4d2qtaep9uQs;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vODTZ-00FpBW-0F; Wed, 26 Nov 2025 11:14:21 +0000
To: netdev@vger.kernel.org
Subject: [PATCH] net: define IPPROTO_SMBDIRECT and SOL_SMBDIRECT constants
Date: Wed, 26 Nov 2025 12:14:06 +0100
Message-ID: <20251126111407.1786854-1-metze@samba.org>
X-Mailer: git-send-email 2.43.0
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
Cc: Tom Talpey <tom@talpey.com>, Kuniyuki Iwashima <kuniyu@google.com>,
 Xin Long <lucien.xin@gmail.com>, linux-cifs@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
 samba-technical@lists.samba.org, Willem de Bruijn <willemb@google.com>,
 Namjae Jeon <linkinjeon@kernel.org>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This patch adds IPPROTO_SMBDIRECT and SOL_SMBDIRECT constants to the
networking subsystem. These definitions are essential for applications
to set socket options and protocol identifiers related to the SMBDIRECT
protocol, defined in [MS-SMBD] by Microsoft. It is used as wrapper
around RDMA in order to provide a transport for SMB3, but Microsoft also
uses it as transport for other protocols.

SMBDIRECT works over Infiniband, RoCE and iWarp.
RoCEv2 is based on IP/UDP and iWarp is based on IP/TCP,
so these use IP addresses natively.
Infiniband and RoCEv1 require IPOIB in order to be used for
SMBDIRECT.

So instead of adding a PF_SMBDIRECT, which would only use AF_INET[6],
we use IPPROTO_SMBDIRECT instead, this uses a number not
allocated from IANA, as it would not appear in an IP header.

This is similar to IPPROTO_SMC, IPPROTO_MPTCP and IPPROTO_QUIC,
which are linux specific values for the socket() syscall.

  socket(AF_INET, SOCK_STREAM, IPPROTO_SMBDIRECT);
  socket(AF_INET6, SOCK_STREAM, IPPROTO_SMBDIRECT);

This will allow the existing smbdirect code used by
cifs.ko and ksmbd.ko to be moved behind the socket layer [1],
so that there's less special handling. Only sock_sendmsg()
sock_recvmsg() are used, so that the main stream handling
is done all the same for tcp, smbdirect and later also quic.

The special RDMA read/write handling will be via direct
function calls as they are currently done for the in kernel
consumers.

As a start __sock_create(kern=0)/sk->sk_kern_sock == 0 will
still cause a -EPROTONOSUPPORT. So only in kernel consumers
will be supported for now.

Once I have developed a stable interface for the RDMA read/write
handling using sendmsg/recvmsg with MSG_OOB and msg_control,
it will also exposed to userspace in order to allow Samba to
use it.

[1]
https://git.samba.org/?p=metze/linux/wip.git;a=shortlog;h=refs/heads/master-ipproto-smbdirect

Cc: David S. Miller <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Willem de Bruijn <willemb@google.com>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Xin Long <lucien.xin@gmail.com>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Cc: linux-rdma@vger.kernel.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>

---

In order to avoid conflicts with the addition of IPPROTO_QUIC,
the patch is based on netdev-next/main + the patch adding
IPPROTO_QUIC and SOL_QUIC [2].

[2]
https://lore.kernel.org/quic/0cb58f6fcf35ac988660e42704dae9960744a0a7.1763994509.git.lucien.xin@gmail.com/T/#u

As the numbers of IPPROTO_QUIC and SOL_QUIC are already used
in various userspace applications it would be good to have
this merged to netdev-next/main even if the actual
implementation is still waiting for review.

Having IPPROTO_SMBDIRECT+SOL_SMBDIRECT merged would also make
thinks easier for me.
---
 include/linux/socket.h  | 1 +
 include/uapi/linux/in.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/linux/socket.h b/include/linux/socket.h
index b4563ffe552b..350a579a87da 100644
--- a/include/linux/socket.h
+++ b/include/linux/socket.h
@@ -402,6 +402,7 @@ struct ucred {
 #define SOL_SMC		286
 #define SOL_VSOCK	287
 #define SOL_QUIC	288
+#define SOL_SMBDIRECT	289
 
 /* IPX options */
 #define IPX_TYPE	1
diff --git a/include/uapi/linux/in.h b/include/uapi/linux/in.h
index 34becd90d3a6..b30caa6db8ca 100644
--- a/include/uapi/linux/in.h
+++ b/include/uapi/linux/in.h
@@ -85,6 +85,8 @@ enum {
 #define IPPROTO_RAW		IPPROTO_RAW
   IPPROTO_SMC = 256,		/* Shared Memory Communications		*/
 #define IPPROTO_SMC		IPPROTO_SMC
+  IPPROTO_SMBDIRECT = 257,	/* RDMA based transport (mostly used by SMB3) */
+#define IPPROTO_SMBDIRECT	IPPROTO_SMBDIRECT
   IPPROTO_QUIC = 261,		/* A UDP-Based Multiplexed and Secure Transport	*/
 #define IPPROTO_QUIC		IPPROTO_QUIC
   IPPROTO_MPTCP = 262,		/* Multipath TCP connection		*/
-- 
2.43.0


