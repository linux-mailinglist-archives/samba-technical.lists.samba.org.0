Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A0D62F404
	for <lists+samba-technical@lfdr.de>; Fri, 18 Nov 2022 12:49:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=puywXNDYXSd6DOzYL6X0dBASfGfJfFJZcaCdFAGPGnM=; b=SEwVBrPyKI27ltYuz9nOXiqusi
	Ci2T9G2v5kizSyaYAd1NW+5OCB0X5X8lG78djt8ZGlNEU0Hxod6BHeQGjz46b6KfqobC/0keJ1pZ6
	cDpr88jsR3sfjezTFz7IgdZmXRKFG9+7RwvMdafsAiXWjP7HBPMN/plB9DN5/GM/Xc8zlcy/+sIlz
	vubUh1Oj6UMprVHSGJ8VSSgukvzRr95EJvfF0uD7JTs207IUVcZuSR4ezNKfwmzG7H72FnmMopZPl
	Rttuhk43qtNoSHNhi8QqjBXfBTGjjwwd84tcPjp+JajrOoY+W458peVg5L1IylxzIbWoWYZbjHrOj
	ZHWorJ0w==;
Received: from ip6-localhost ([::1]:54432 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ovzqs-00FGFk-OG; Fri, 18 Nov 2022 11:48:10 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:39925) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ovzqn-00FGFa-Dm
 for samba-technical@lists.samba.org; Fri, 18 Nov 2022 11:48:07 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 r126-20020a1c4484000000b003cffd336e24so2643733wma.4
 for <samba-technical@lists.samba.org>; Fri, 18 Nov 2022 03:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=puywXNDYXSd6DOzYL6X0dBASfGfJfFJZcaCdFAGPGnM=;
 b=qvEhemKuv1YTSZxdMmVZcpNGHK81orvQSg9IJ5zu5X6x5tRzk1B8xEB4iUUYhkLjMq
 xRHm9VeteUzX1f576K/0kPPiRiRjipG1h7ienao+bPQJJEGERMNQrVC7dbQxPX8bN5Lw
 5we3OaXp6iLAEKxuNQArLUlfJ9k6+iKMzcjW40nyV+R7Pj/tEceylVNekDvbmmOd5UsE
 xWjcMp5JmhfDKC31InI2fwBClseazQSDx1k7LWniQ7B935ZfT/H871PDeg1UCCyP55/k
 CjqbvqT4ecB8pYG6ii4Wf6bJJ1z2Sjyq1vsrHfDhkbD3On1dZs0gktCDHiOEExP7jnxm
 gAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=puywXNDYXSd6DOzYL6X0dBASfGfJfFJZcaCdFAGPGnM=;
 b=QqsP5R+YbGNzCso3YnsXO59rA3d6RX11xb0SguN1DuPSBCnm+1hzdINC54jsmgQMAy
 ypygiq2b16luPdQUCFcs1Pez2ASvsCo3LDC9B29MSpqAYqgnvdkPF0hPOoL6oDJHjgr/
 PILpR7EPI58bxFDZO4TmogIUIkKlQsNAASwJbOoaZts8bW+Cfy2zQGGAnchkaFCXoP/S
 Dyt1unq63QJ/qc0ZrYRWnYpgvtg4IyOASpIEzWcUNkcucEam6PUR0sJ8xhMt3+iuavTn
 Bg09vfaVTyD7szN8y/+8O6wvzqrSM9yhI9lmEmAsI8F3hwgiGf3hzFdfF0DJcRDa8hjh
 Hw8g==
X-Gm-Message-State: ANoB5plic9Mj1P9AVBRpBY2p8q1mbi3lSI19xZIp4gqMn5Z3kr62HlxC
 GWuXIUEF3xMcSWYaSGPdhxE=
X-Google-Smtp-Source: AA0mqf5230MzRSqYS5Yekl4d3DsVgYyrbzvnhgwpOfs3v0u3hpStdf2fetzOeFKy5HoHQe7hQsUI/Q==
X-Received: by 2002:a05:600c:805:b0:3c6:c13f:1194 with SMTP id
 k5-20020a05600c080500b003c6c13f1194mr4588783wmp.132.1668772084119; 
 Fri, 18 Nov 2022 03:48:04 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 he5-20020a05600c540500b003cfd4e6400csm4388203wmb.19.2022.11.18.03.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 03:48:03 -0800 (PST)
Date: Fri, 18 Nov 2022 14:48:00 +0300
To: Steve French <sfrench@samba.org>
Subject: [PATCH] cifs: Use after free in debug code
Message-ID: <Y3dw8KLm7MDgACCY@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
From: Dan Carpenter via samba-technical <samba-technical@lists.samba.org>
Reply-To: Dan Carpenter <error27@gmail.com>
Cc: linux-cifs@vger.kernel.org, Shyam Prasad N <sprasad@microsoft.com>,
 kernel-janitors@vger.kernel.org, Paulo Alcantara <pc@cjr.nz>,
 samba-technical@lists.samba.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This debug code dereferences "old_iface" after it was already freed by
the call to release_iface().  Re-order the debugging to avoid this
issue.

Fixes: b54034a73baf ("cifs: during reconnect, update interface if necessary")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/cifs/sess.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/cifs/sess.c b/fs/cifs/sess.c
index 92e4278ec35d..9e7d9f0baa18 100644
--- a/fs/cifs/sess.c
+++ b/fs/cifs/sess.c
@@ -302,14 +302,14 @@ cifs_chan_update_iface(struct cifs_ses *ses, struct TCP_Server_Info *server)
 
 	/* now drop the ref to the current iface */
 	if (old_iface && iface) {
-		kref_put(&old_iface->refcount, release_iface);
 		cifs_dbg(FYI, "replacing iface: %pIS with %pIS\n",
 			 &old_iface->sockaddr,
 			 &iface->sockaddr);
-	} else if (old_iface) {
 		kref_put(&old_iface->refcount, release_iface);
+	} else if (old_iface) {
 		cifs_dbg(FYI, "releasing ref to iface: %pIS\n",
 			 &old_iface->sockaddr);
+		kref_put(&old_iface->refcount, release_iface);
 	} else {
 		WARN_ON(!iface);
 		cifs_dbg(FYI, "adding new iface: %pIS\n", &iface->sockaddr);
-- 
2.35.1


