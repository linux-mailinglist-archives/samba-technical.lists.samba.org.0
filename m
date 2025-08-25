Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CB06BB34DA7
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:09:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=NwE3A7aTkkt91vL+xNeS400xd5NA6hbVr1fqdCj41oo=; b=sF9mQ6s4ec6rV0rLqGCY/kK3NA
	SwX5X/MdpeQTjNqKuIUMV/6UJoawx270qJj1YDyVU95wVuVuDkx0+HIoQ+iDVwXgbygXeuo7bDHaR
	pORoGebExdjagA+ESqF+Vpb3wAnURGofbOlRrCLET3m1UgCdYiLNvZYkVQq2TAawhm3paARuHO6P5
	0flpeiQtPBTR9g1HKcP7cbmIIRraM1MFdNlobYI2eRAEqDglZMiv0VWPJ4b4kVdPv4GeGTO8ebPYb
	p3Vbg8OIIlM39ueIalVU0hD691RAGz2y0nIgD5IjBz7BKxcZYfKzqBD3YExIiW6iA7XBlke5EQz3/
	MkoVffUg==;
Received: from ip6-localhost ([::1]:50650 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeR7-000W8c-LX; Mon, 25 Aug 2025 21:09:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59602) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeMW-000U2t-Kg
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 21:04:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=NwE3A7aTkkt91vL+xNeS400xd5NA6hbVr1fqdCj41oo=; b=pzYokjg1qNKSFdj9XiqfitMavR
 t+BniILcLjBy0wtlHeb44oiZfRKTmJQqs3/48ZSXNtb9rAbcJA4TPCaFCS4Ze0gybz9tAmg/wfUiJ
 hdlRSDW7nwndmI64I/9hkrkgNmlRaRO0ptp/g7/ffDvhO42u9d+FotCpW31X4klXy830+OYsishXb
 76OgF0bi7apVvWTTaNoXZ6HwBMVEUcjen0ShqEODjElfVujHUmhyXh/Fbn/0YxmL70BDNQHMdauA/
 Ul5CaKJ0p8w5LVNbEU+WDIkO45WthklwbAXWsDwunamtqoFzjmoJC3fsylIVsRY/3J5RSc6XhrTrU
 /vMG8QFL7sSYqCBMSUOz5kGJPV8r3CaB5os33jJwdW25JRayF83orJ1dScOIXrSJUOR5Ch26RGy+/
 McPwrAypauQ5TnCaM/8ePEOilVNEHLCH5+zqxdGOApAflYC+b9+7o8P5CuyoQTkWSsc3MNqNnTNaS
 BJKODLkcEZ59xG7Wdxl9w52M;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeMU-000niP-0S; Mon, 25 Aug 2025 21:04:18 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 135/142] smb: server: pass struct smbdirect_socket to
 calc_rw_credits()
Date: Mon, 25 Aug 2025 22:41:36 +0200
Message-ID: <3270445e0b43942129516dd8f52543cb530a46ec.1756139608.git.metze@samba.org>
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
 fs/smb/server/transport_rdma.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index e47ff55af2e0..da48b2ec6dd3 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -990,11 +990,9 @@ static int wait_for_rw_credits(struct smbdirect_socket *sc, int credits)
 				credits);
 }
 
-static int calc_rw_credits(struct smb_direct_transport *t,
+static int calc_rw_credits(struct smbdirect_socket *sc,
 			   char *buf, unsigned int len)
 {
-	struct smbdirect_socket *sc = &t->socket;
-
 	return DIV_ROUND_UP(get_buf_page_count(buf, len),
 			    sc->rw_io.credits.num_pages);
 }
@@ -1390,7 +1388,7 @@ static int smb_direct_rdma_xmit(struct smb_direct_transport *t,
 			buf_len = 0;
 		}
 
-		credits_needed += calc_rw_credits(t, desc_buf, desc_buf_len);
+		credits_needed += calc_rw_credits(sc, desc_buf, desc_buf_len);
 		desc_buf += desc_buf_len;
 		buf_len -= desc_buf_len;
 		desc_num++;
-- 
2.43.0


