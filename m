Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B93936F3C6
	for <lists+samba-technical@lfdr.de>; Fri, 30 Apr 2021 03:39:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=3vnKpdG4uNNbz2i23AnxpC8s1aCNAmIyKjAfQh1TkGw=; b=z11O5mCQEQsHs4C6dU0qGxJ+tB
	jbcDXL9wZHz09H8J3gGuy+wCemRDGNmCk9JsGTyEfLV+USvTnhT8UmwKapwkzD2rg4zPirHNkddKM
	jY0Pdeurl1rV2itUHutjdSFvehesBPVe2EkNpe6d+psx/KF8ysd2/HTg2j+4RGqpp5zdB9eO8gjMx
	dVBUBX8N+97682dzmy3+RbuE+bin9UN1JwkC0cKF0ezoq0qPoeELJHYAQiDUm/av9D9Hs2kNYR6EH
	lMdZl4hi/updZa6VyVtvhaEP+YjfBigSqTMPf8KVrdXtTUy2PpEE+NQ1njY2YXtiWtwJMtf7iHiin
	MTAhEJSA==;
Received: from ip6-localhost ([::1]:38900 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lcI7R-00DH3s-3C; Fri, 30 Apr 2021 01:39:01 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:33670) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lcI7M-00DH3k-6D
 for samba-technical@lists.samba.org; Fri, 30 Apr 2021 01:38:58 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 o26-20020a1c4d1a0000b0290146e1feccdaso1050958wmh.0
 for <samba-technical@lists.samba.org>; Thu, 29 Apr 2021 18:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=I63/fqrhbzV4TJtCH6ZcsYOv8Kt/Bani/E9xCdu+S0A=;
 b=ai2DjHylva6M+6FLKkiQbOiFdbdulmyu5sVTcDG4DEAV7tFq1YcuI08bQcDtjJ8oWu
 sCQfYv14Q+PVb1gnJSXAiPkWs4zPqBtj//fdBt1xoyfAPo+zMMEloB9skzaDe5OhkQ9u
 QPo5UyDD8QBhPxO5x0+4LzpwDJOFICwPinp6vJYPUqdFAS6B9uzelKZ8r1PsvDPh286d
 lMDGeF0k5SSf2Io7KHuLVF0ZBOAo5ZoWw1QweGjK0Nt0RPc+SKXbY8pZFSbdI7z56ZDX
 35teRxKLeARBWQlZD1Spwycd8iasNSeeFyiJE+uPmfpOyVnvpQ7SqSLRBPWt4CH76KHL
 uSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=I63/fqrhbzV4TJtCH6ZcsYOv8Kt/Bani/E9xCdu+S0A=;
 b=ST31dMmVBfZ9mChr9Fcn0atJVehDjRr9ovrduCoYebGEemAIW/aouy4ctD68Peyjgd
 he0dFm3DFcWT7h9uHTGPbHgyMaBPL6glqBSfEPKE36lIt3a6JaD5NcaIJi8M4L3YtqWq
 T3ld964Q3w4jlMw5a1wqAC3Hwon4kKfTMUyYWNbhDkg5IUu7GVw9JckfqZ0Nk51pxzsw
 O676F5aLabqexjtcBjcbUDCOnKdlDBeR9Mzb4hOJ23707G7Pw68OUyzyOap5xJZsZEXz
 OrrOskwO05WMblb+0WLGS03wcIZrmVprWubhCPeu6KI7GDatrY1sCuuWPTv/Fd05fslF
 Yofg==
X-Gm-Message-State: AOAM530aewjI4sKUEkYwbyTUyMEnlr81mnAJmCacQAFa7UzSQZ7jnlRN
 144ZjDjNgt6D4ta1SsLr1ZChnfX+eCkFoB2XWdz6IZRp+3bxuRnI
X-Google-Smtp-Source: ABdhPJzlK8d1irvPX6Fqk67s763i+jsFZFKScYq71eKXIIjR3pLH8FE6+PAY96BI4dpVvz0D27VXGrwIxUKgisBvY20=
X-Received: by 2002:a1c:1bc1:: with SMTP id
 b184mr13492764wmb.119.1619746734951; 
 Thu, 29 Apr 2021 18:38:54 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 30 Apr 2021 07:08:44 +0530
Message-ID: <CAHbM3qj_N3XKNC0q3nfmkqjDsGis+rRd8eSRUjs2LWYrUNZZyg@mail.gmail.com>
Subject: Fallback to NTLMSSP allowed if KDC is not reachable?
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Shilpa K via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shilpa K <shilpa.krishnareddy@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

In one instance, port 88 was blocked while port 445 and port 139 were
allowed on the DC. In this scenario, when we tried to execute 'net ads join
-k', it was not working. But, with the below code modification, it will
fallback to NTLMSSP and works. Is it expected to fallback to NTLMSSP in net
ads commands if krb does not work?

Thanks,
Shilpa

diff --git a/source3/utils/net_ads.c b/source3/utils/net_ads.c
index 23ab0f9133..0d94ce692e 100644
--- a/source3/utils/net_ads.c
+++ b/source3/utils/net_ads.c
@@ -297,6 +297,8 @@ retry:
                }
        }

+       ads->auth.flags |= ADS_AUTH_ALLOW_NTLMSSP;
+
        status = ads_connect(ads);

        if (!ADS_ERR_OK(status)) {

diff --git a/source3/libnet/libnet_join.c b/source3/libnet/libnet_join.c
index 103120d8ec..53875fb946 100644
--- a/source3/libnet/libnet_join.c
+++ b/source3/libnet/libnet_join.c
@@ -152,6 +152,8 @@ static ADS_STATUS libnet_connect_ads(const char
*ad_domain_name,
                my_ads->auth.password = SMB_STRDUP(password);
        }

+       my_ads->auth.flags |= ADS_AUTH_ALLOW_NTLMSSP;
+
        status = ads_connect_user_creds(my_ads);
        if (!ADS_ERR_OK(status)) {
                ads_destroy(&my_ads);
