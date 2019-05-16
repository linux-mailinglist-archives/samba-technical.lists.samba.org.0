Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3EE20F13
	for <lists+samba-technical@lfdr.de>; Thu, 16 May 2019 21:12:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=E3SfLe+GcgSZNgXopOIwpck3uH6EbiOEcMkiAlQeTSI=; b=gpBSJgNnB1sf8OLpEzXeqSlIT/
	jjd4qOk8P2K5Lfa0MpU6I9LiPmVCCwkcB+sxKlAWgF63q5S9kesCPdWpNHO9RkD/VCz8sKQuRPEOw
	Si9l8hdQKeygOavLK/UVucAbWVruMci1KGmpY2k5BSgTjmufaKovnn9Vx1uY36GgbQv3/EcbghNT1
	WDgAaREs9oGRX2N84UHaj5B5nzQ0sOyaZA993q7S5hKQQQlJAT4J8SxqPAzbZ+XYU3fjNuP92JbMd
	UjJai4/ZOYW4c91XCva1mFME0Vjq8qmAyGPDaW4hYNYb2C/uZAKoiX5nGcDPEucehA+tvTMl/GQlM
	AI3WAcXQ==;
Received: from localhost ([::1]:53516 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hRLnQ-000AtI-9l; Thu, 16 May 2019 19:12:04 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:33967) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hRLnM-000AtB-2p
 for samba-technical@lists.samba.org; Thu, 16 May 2019 19:12:02 +0000
Received: by mail-wm1-x32e.google.com with SMTP id j187so7709126wma.1
 for <samba-technical@lists.samba.org>; Thu, 16 May 2019 12:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=E3SfLe+GcgSZNgXopOIwpck3uH6EbiOEcMkiAlQeTSI=;
 b=kYp4DSAWBV/sJxAofR4YdYvF6OA/5LsmkhsftZ9kA+iIjF3FDgqLcPjFd+Lo3l3ZJ1
 mBuJbhJzvcNs19kEviD8MiMSufSdafzEKiOacLW0p8Tdusz3nHhx+ggqVMblP8WcsPid
 R6AUHBsp3wblDvwP45Yr4V3JKrSVZ4hdM9qQ+n6phvNuh8HlGI4Dpnc6yKXI5STE6e/Y
 xNGgELAR/Wwog67Hgp2yOYBt1Bzz5rlTZyiEQ4bYISfpKgzIp4+ziPLuBSfCYbVx3RXy
 5BUbJVdu/gijz+fH4bdys5GSs4GSz66uT919rZVrTI1z6EDTa6pHJDpdOirzZykIFtY8
 qELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=E3SfLe+GcgSZNgXopOIwpck3uH6EbiOEcMkiAlQeTSI=;
 b=XdTGq9Rla/j1zE7nZtGimoXfdkdPWGba3of65DwIggZ7xmqcImqCeNyQcyiqVoy9uj
 83uECE8K3RhXClKpAAj6c74cKPLaW7pF7lxaCg563ATeo/4aOKqo9qUpSwUusB/Bg00U
 dXvlf5eshBccqBY0kxjLaN1nLEiJY5nAYJ7rykBVuXJ7gt7zy+e3mlpzwkOQy60a0pTx
 p3VzkmoPE7kBwIS9av2mOe+z5ensesYoSi4tAn1f0ZFVgYktS8YLFfVOfw26zCbatrj3
 vpElQjWTChyxn8sQmsR1aK0uOGrp6yYXZ+H4wUl4HLybE/uGHnprFvx6CiI1Fk8Ps4Wn
 v2xg==
X-Gm-Message-State: APjAAAVl6sgfeDySM0TKOlAsTvW4g2geavEARhEoj6kXya4qnCB6wMxe
 7ePUlOBR9kxemMCUIuDsyaStmzRPRIy7zvwGA8IrgA6V
X-Google-Smtp-Source: APXvYqwluiclvdSRiN2w0bSRjXbPs3yMOYdD19Rc7i7Vfu/b02cxNQAgQrXAzezELDpVgyFFP38GsZn8pgYC28vx2iI=
X-Received: by 2002:a05:600c:22cc:: with SMTP id
 12mr17288121wmg.141.1558033919084; 
 Thu, 16 May 2019 12:11:59 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 16 May 2019 12:10:43 -0700
Message-ID: <CACyXjPzjK8UBQastGWBNqQn8ehzwUajQ5_TYNQ7B+JpRQnCeYw@mail.gmail.com>
Subject: If we are going to exit from smbd, we probably should issue a DBG_ERR
 not a DBG_WARNING
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Richard Sharpe via samba-technical <samba-technical@lists.samba.org>
Reply-To: Richard Sharpe <realrichardsharpe@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi folks,

Came across an issue where smbd was silently exiting. Here is a patch:

diff --git a/source3/smbd/server.c b/source3/smbd/server.c
index 3ef7bef..3ac9be9 100644
--- a/source3/smbd/server.c
+++ b/source3/smbd/server.c
@@ -2101,7 +2101,7 @@ extern void build_options(bool screen);
        if (lp_clustering() && !lp_allow_unsafe_cluster_upgrade()) {
                status =3D smbd_claim_version(msg_ctx, samba_version_string=
());
                if (!NT_STATUS_IS_OK(status)) {
-                       DBG_WARNING("Could not claim version: %s\n",
+                       DBG_ERR("Could not claim version: %s\n",
                                    nt_errstr(status));
                        return -1;
                }

Signed-off-by: Richard Sharpe <realrichardsharpe@gmail.com>

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

