Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 67180BD0A8A
	for <lists+samba-technical@lfdr.de>; Sun, 12 Oct 2025 21:11:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=SDybIPq8SOlNbvN/Gg6Tj5xcXCIHombJl3CYZPtQvoA=; b=nXFaxjHmj04lECi+vbIPgw46D4
	yalEURJU0V5vMjpaEvsXZ7LXmzQrsRty1VP5MtM3JhJoFO7UGWaYg9xVlqYUJcgtRAyBC//hx/03+
	P4jVpRqiIDaov2JYn2OF8emFRCFNWBj5QJXHggCpwClLMoLQ/PXTjx6MiVXSb0j9Lu5OTWS/O/M3F
	6V0WY4XvubzRTPhZbLov0AISTx5Km2coiweZ3nJdMjOMwnXxvhbLZ+4BrhhXy7Ot6HuVV3UjCgA3M
	8Ce4kHjRxbHBuhAs0dL77UaGnfnjNUtg5DnAOkDUmiGHz9Fl6oJXp4OSBb+flsIUGzfjk+64QEesZ
	TP523rcQ==;
Received: from ip6-localhost ([::1]:56840 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v81TR-007cNM-2b; Sun, 12 Oct 2025 19:11:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17172) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v81TD-007cJr-G6
 for samba-technical@lists.samba.org; Sun, 12 Oct 2025 19:11:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=SDybIPq8SOlNbvN/Gg6Tj5xcXCIHombJl3CYZPtQvoA=; b=Vh2CEsVGt7hb06a1e10W0NaRqt
 rpgljH3Uh/bYo+3f0mC9/Nfy960I4SiRGfRDpp36NHqdwgLONdU32zgvaDWU6nVXsm9h+6UZfwpWr
 pQ2a/1vNNQ0LOO/0QV3CLIIE2rU5f3YS/MZzYdm8aA//Hs+K7IxDf7b9Y97No5NvUr2iQrk0fLaO+
 Sp1Gr5MkFN/+EmN85fkPVTPNmWH1Oit7VZkZ9hieHrMwoeiyTfpQDSCrW3TNMrWfVlm7qu40dpfxY
 Lev96pTh7LYMz1hD28eBxeijER1CldyWbWMpyralyM25guFob9wYscDC2DvD3LTnmrCaF4/uhRks4
 CaSx0NxMXldiGP8AOTvsbSHK86S7y+rvuc7TDR50p/V1NjGL5bDh57O8FpTWD1dRAovBMP+l+2EpG
 M/zd2cn6M4M44Su0QsH6v0CYoqN78xA+tSRWp0BW9MpQN79+PXlLScKXtWC38fscrACRqhCyXvha0
 FyyQYjD1pPMIdxEs4x5SW/rD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v81TC-008o0A-2I; Sun, 12 Oct 2025 19:11:02 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 03/10] smb: client: let destroy_mr_list() call
 list_del(&mr->list)
Date: Sun, 12 Oct 2025 21:10:23 +0200
Message-ID: <59a58f3a53ccc1d0ac732d3a98986b995fc8e32a.1760295528.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760295528.git.metze@samba.org>
References: <cover.1760295528.git.metze@samba.org>
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

This makes the code clearer and will make further changes easier.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index a20aa2ddf57d..b7be67dacd09 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -2363,6 +2363,7 @@ static void destroy_mr_list(struct smbdirect_socket *sc)
 				mr->sgt.nents, mr->dir);
 		ib_dereg_mr(mr->mr);
 		kfree(mr->sgt.sgl);
+		list_del(&mr->list);
 		kfree(mr);
 	}
 }
-- 
2.43.0


