Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C9A6D9218
	for <lists+samba-technical@lfdr.de>; Thu,  6 Apr 2023 10:56:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=B9/Axgxw789vjHSKYobykbKjrh7zpjCP2oBQY/iyJas=; b=s/kKfeWeoX+AfRULOuq/l/4xXA
	uVYbGdjxnjazWqLFFcWekNBmJQLcrA0aFcDib/PGU0HZ8+qKDakURc7bnPOLrZP282lCoepAEc58C
	VjaR7COrr9NgDZCLKBRFjwC4RSXiqn/I9dJsvG7wB+PAFkT6W350q98YG1qfxqpktJCUWvPh0AiHw
	3DoHa/u4CiIe15COdkK83AvojST5tZgXg/vKBlWAkYWqKBwISnlHEkYneNBpvx5zQ9RkzkNxNIP9J
	MUc1gDydfS/1Awpecm3ZA8vaM7JU60pT+1uLvFYuBZpbbbl2nMpeDEF7Ne/i5EfYKEGxwO7SN503/
	053EYifw==;
Received: from ip6-localhost ([::1]:51164 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pkLPW-009bQm-Um; Thu, 06 Apr 2023 08:56:03 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:43918) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pkLPR-009bQd-UB
 for samba-technical@lists.samba.org; Thu, 06 Apr 2023 08:56:00 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 n9-20020a05600c4f8900b003f05f617f3cso4208604wmq.2
 for <samba-technical@lists.samba.org>; Thu, 06 Apr 2023 01:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680771357; x=1683363357;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B9/Axgxw789vjHSKYobykbKjrh7zpjCP2oBQY/iyJas=;
 b=g2Qr6/zrh6oFLeQwJDsSseiOxtP6XC12UfICsXT7C5TxfsJmqVjA5vXPfdX55N3GPn
 DAlxL19v8t0N+VL0qgHnv0J68yF5bXDL6fYpU8hVu7pFG0nF8LHfFuySXkC4pj0shrWo
 AqbL64xpw3haU35F24Rn4eng4wRzXDXoiE3gw+6JMbh+R7YyU18HxF3E3vYbsYKV3JX4
 JHKomehQAXR8Aqvz8Hl1g38JDGsnqHAm5oHTczMSzTDyjgweTN1eSeKF7108aZoOCKwX
 iBXYJVoTmUva0PG7fqGJa72oBPIsceTDgqR08my16yMl909EYZQlD+8JVDlxhw0fyVPV
 GBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680771357; x=1683363357;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B9/Axgxw789vjHSKYobykbKjrh7zpjCP2oBQY/iyJas=;
 b=tWpZh1e93ZSyeL0hscxNLybeOB7fmUehXDRRZ05MeRNlDfKOIr80dVaKPGkiHP6qnB
 6HTmvv9MVGQJbeQt3j/uOHzKFeCCwmZHFrWr0/c692j2dzWLKhYZutnQUK1qE1Mfnkp8
 jeceYSKcuO7W7qbJKI3YJW7WhLEOiDNYbXZoH64fkQO2JdqPma/bD/eXzn6BevaBjzi2
 bku+0WSa0+c+fTaR+Vq6gvy6ynx0lhr4i28V13f73nt+d0BJ+JHIA36X5fMVmpVMM8AP
 5Arh4I+jSyi0yYd3vEydceUmZLcpaRrOIKkRbSJLYLIq9Y+MDBd6+rqJclXmGTelp3U9
 1ETw==
X-Gm-Message-State: AAQBX9c9Y9HOLQNYHl0o6C11MTB+6RpdDH5QYFfzSzMI2QIb5A9KRYz8
 qtOQMRBD9xX95OuEn6PoxuM=
X-Google-Smtp-Source: AKy350ZzuCVLy75YllzgUZ6DCi3WQ+PI9bLc0iV07zUhK+fXpzHZ0SEvAy6OfQcqLb2K7iCTgd4HqA==
X-Received: by 2002:a7b:c7c6:0:b0:3ef:6e1c:3ffa with SMTP id
 z6-20020a7bc7c6000000b003ef6e1c3ffamr6710681wmk.28.1680771356751; 
 Thu, 06 Apr 2023 01:55:56 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 13-20020a05600c230d00b003ed2384566fsm975582wmo.21.2023.04.06.01.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 01:55:56 -0700 (PDT)
Date: Thu, 6 Apr 2023 11:55:47 +0300
To: Paulo Alcantara <pc@manguebit.com>
Subject: [PATCH] cifs: double lock in cifs_reconnect_tcon()
Message-ID: <ZC6JEx4dvWUvgcwW@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

This lock was supposed to be an unlock.

Fixes: 6cc041e90c17 ("cifs: avoid races in parallel reconnects in smb1")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 fs/cifs/cifssmb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cifs/cifssmb.c b/fs/cifs/cifssmb.c
index 0d30b17494e4..9d963caec35c 100644
--- a/fs/cifs/cifssmb.c
+++ b/fs/cifs/cifssmb.c
@@ -120,7 +120,7 @@ cifs_reconnect_tcon(struct cifs_tcon *tcon, int smb_command)
 	spin_lock(&server->srv_lock);
 	if (server->tcpStatus == CifsNeedReconnect) {
 		spin_unlock(&server->srv_lock);
-		mutex_lock(&ses->session_mutex);
+		mutex_unlock(&ses->session_mutex);
 
 		if (tcon->retry)
 			goto again;
-- 
2.39.1


