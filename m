Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E2838C4781A
	for <lists+samba-technical@lfdr.de>; Mon, 10 Nov 2025 16:24:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=psxo2bSvkQMI53M1PA4IMWPxzEC7ryfCrtvWP2F0IAE=; b=iOjWZrchn5sfp0wRMwpzfzOjqU
	miZCuNK3mYyqZ/0mAB7l7PmDOMoOVFWfdJKpPsXap70nIE25cODWJDBlFapxj5nOhKvWqfuNpT68O
	Knpk5dYLndSUxiwWtdXtyXum2JaIdGDItMH78ga9ym9uEJeHDdqgHvc4b/R3ZhOLGi2Hv5vrWJPzH
	M/butfrxZ24sKOT2F1/TVED6+bS46Hwk7ikBWV+lXfYdzmshli08tnON8jzGcGly8qaRZv/En7AZd
	L5tuhPqNJDk4Np1j99EWB3aFKJeMOubO/WNcHnoif+XxaUtW3+yc5J/r4ptZ/X1xU4e0IKJ2l90b3
	f+qc+tpA==;
Received: from ip6-localhost ([::1]:59644 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vITkt-00BurH-6T; Mon, 10 Nov 2025 15:24:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19874) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vITko-00BurA-QN
 for samba-technical@lists.samba.org; Mon, 10 Nov 2025 15:24:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=psxo2bSvkQMI53M1PA4IMWPxzEC7ryfCrtvWP2F0IAE=; b=VbtYqc/lZrU2WwNC0DZqGLeuuz
 7Af60UN7bE1lnh+I1SrWA/r7ZM93AhWgQqlJmjTp5z8BnM98ktGkxkGWRK6MtmkJ9vCm1fxp1o3f7
 3SCybmWXiXSHC3p8ES6ztZgH+y8HL+19m3LEDqUIdcen1fUpDpAxtr3urNxvLVPXvCLbDl+0zh0EF
 EZndjC7G0vR4MWewtJIi0H+Gu4nytzvxf8F/+883A2fr1gAZ50kP8FiwTkr/o2k4itPEh+iXQ+Bu9
 4rWgkqNOlNVjShCASYfa0DM/Vwg/ioo+rWJEA/V8oQcDUL0XD12aK5nEbt+9VMAr2FhTzG1mMmwKp
 65N+exszgouoEiEpOEKdRvB9YYu/vgwF5uR5txH6RiaWoxEjzfpyPp+Mtd0fvKa+nalWNLTb26vPd
 flvuAiJPLl1p7AC383ItOvoMqyuS1Q5fSQqY1aFoiidnWpXpbECYzHsDRwg5lvimOth58czgqLqxm
 w7DGgghy3tI2OMW5grD84BRd;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vITko-00DTEk-04; Mon, 10 Nov 2025 15:24:26 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH] smb: server: let smb_direct_disconnect_rdma_connection() turn
 CREATED into DISCONNECTED
Date: Mon, 10 Nov 2025 16:24:20 +0100
Message-ID: <20251110152420.2889233-1-metze@samba.org>
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
Cc: metze@samba.org, Steve French <smfrench@gmail.com>,
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

When smb_direct_disconnect_rdma_connection() turns SMBDIRECT_SOCKET_CREATED
into SMBDIRECT_SOCKET_ERROR, we'll have the situation that
smb_direct_disconnect_rdma_work() will set SMBDIRECT_SOCKET_DISCONNECTING
and call rdma_disconnect(), which likely fails as we never reached
the RDMA_CM_EVENT_ESTABLISHED. it means that
wait_event(sc->status_wait, sc->status == SMBDIRECT_SOCKET_DISCONNECTED)
in free_transport() will hang forever in SMBDIRECT_SOCKET_DISCONNECTING
never reaching SMBDIRECT_SOCKET_DISCONNECTED.

So we directly go from SMBDIRECT_SOCKET_CREATED to
SMBDIRECT_SOCKET_DISCONNECTED.

Fixes: b3fd52a0d85c ("smb: server: let smb_direct_disconnect_rdma_connection() set SMBDIRECT_SOCKET_ERROR...")
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 3d8d8cb456c1..e2be9a496154 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -334,6 +334,9 @@ smb_direct_disconnect_rdma_connection(struct smbdirect_socket *sc)
 		break;
 
 	case SMBDIRECT_SOCKET_CREATED:
+		sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
+		break;
+
 	case SMBDIRECT_SOCKET_CONNECTED:
 		sc->status = SMBDIRECT_SOCKET_ERROR;
 		break;
-- 
2.43.0


