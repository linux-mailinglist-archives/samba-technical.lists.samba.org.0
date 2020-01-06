Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4466113161B
	for <lists+samba-technical@lfdr.de>; Mon,  6 Jan 2020 17:32:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=xkfa5x78Jkq1S3G19eOeCV4/s74GQk+h4IclOxcbIXw=; b=HrQwelqJ5ZefaIqzP8gwSfF6SM
	FSUvdg1X2W2bc1NbbIAj8OJFxZ/HuoKaLmntR4GcqZnRUMwpSTduATDwEU101pu/vkML+Hh/aVNqS
	a2wU0WV0cVyXcvzkalKgNsh7bcCrqEF6E6VtFalftmrxZODyQHihlvrcCwsGyaVoPwiXpAgUZ7y0/
	3GQB6MIis6h/UVr+85sSzxNaVQid4nGphX0+ueO9tWbzPB87DJ7NgWg/qMWmh4YooWEI4TMfDO8Yx
	GskFtwsbdWhjiT5K8rk/uOLlEmr9xz1JuY7adsi9TzMmLvff7dzTHFbbzZ0K4kXdbIg+8NtFO2KWN
	Zu2lOX6w==;
Received: from localhost ([::1]:46856 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ioVHx-002Z6i-1j; Mon, 06 Jan 2020 16:31:33 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:42510) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ioVHr-002Z6b-SU
 for samba-technical@lists.samba.org; Mon, 06 Jan 2020 16:31:30 +0000
Received: by mail-qk1-x741.google.com with SMTP id z14so38659390qkg.9
 for <samba-technical@lists.samba.org>; Mon, 06 Jan 2020 08:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xkfa5x78Jkq1S3G19eOeCV4/s74GQk+h4IclOxcbIXw=;
 b=Ay2ypHHQCw5OM45qxOgJt4lQBnqdj2k4btZswWT7oJkOSSulzoK7KJDwKQiWuyophL
 xGYUinRF1efow7+jRrTjycJQIWNFaiovjSTNyNvhQ7u3fhcKn1J3urU1q/GOSUNNfQmY
 8YZwiCjIMYMAnVYBB0tc6LJA12o2PfEjseCXVkuZsYd24n1vdL+t90eCZqHtjJb2/rZk
 UdP/InagQnVch1wCjOWLZMNq2W/2HgV2bf9n4/YcUmT6cqaZeUT3dGIA/TZVLNt2BZ3g
 gvLyQRoAO2tXH0nAwWYQyA7XhdhijMvUfmoLB60qEUliEYU2ah2cQiuhC7j7hZVMk9Wa
 aubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xkfa5x78Jkq1S3G19eOeCV4/s74GQk+h4IclOxcbIXw=;
 b=FOaFIqjDvIcojS8sW7+xAToZlER9iDauUVDdjB5z+9qFaGjVK9R1E+x1DmNDIQuhW/
 8Wf03podlS/XUOvaMPIBgJuzJOix58BrMELJTQi4abNKYJG45+CjDWgUkFoamTaEa3Fs
 anFT6usPpV8bUQdT7GNXw0vbFsujpbHJ9feKT9VK8HCshvdQ823MBzW0YcD8QJAFw6LW
 WpESjlH/ltuqeH/QuCWm8Yi57veJy3y3m0tcjyKFmPZoVSOCA/RqN2c8qbBuVAd+739N
 QyNBlTa1ln52BGAQy2lVADjNr1JjwfPR7ffTJwASvxSl1rkru+hrmPFf7TdLhPpASg+B
 nN8g==
X-Gm-Message-State: APjAAAWaJoP8fGmtp9UEhCMPe23TiOm9bsfSP6UQlIspcRjp4KaSCOkT
 E6QJpe6htJ6HwmYpEjZLI2I=
X-Google-Smtp-Source: APXvYqxyjU7/0WmK5gKPcdj3oGnynT7bQ/pOta7Sh03zE8dx8WgpBxz6mZLSd9T7J5vGpwhyzyp1HA==
X-Received: by 2002:a05:620a:10a7:: with SMTP id
 h7mr82139014qkk.423.1578328285349; 
 Mon, 06 Jan 2020 08:31:25 -0800 (PST)
Received: from ip-172-31-1-121.ec2.internal
 (ec2-3-231-202-5.compute-1.amazonaws.com. [3.231.202.5])
 by smtp.gmail.com with ESMTPSA id f26sm23434195qtv.77.2020.01.06.08.31.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Jan 2020 08:31:25 -0800 (PST)
To: linux-cifs@vger.kernel.org
Subject: [PATCH 1/2] Convert owner and group SID offsets to LE format
Date: Mon,  6 Jan 2020 16:31:18 +0000
Message-Id: <20200106163119.9083-1-boris.v.protopopov@gmail.com>
X-Mailer: git-send-email 2.24.1.485.gad05a3d8e5
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
From: Boris Protopopov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Boris Protopopov <boris.v.protopopov@gmail.com>
Cc: sfrench@samba.org, sblbir@amazon.com, samba-technical@lists.samba.org,
 boris.v.protopopov@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Convert owner and group SID offsets to LE format
when writing to ntsd

Signed-off-by: Boris Protopopov <boris.v.protopopov@gmail.com>
---
 setcifsacl.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/setcifsacl.c b/setcifsacl.c
index f3d0189..9a301e2 100644
--- a/setcifsacl.c
+++ b/setcifsacl.c
@@ -114,12 +114,14 @@ copy_sec_desc(const struct cifs_ntsd *pntsd, struct cifs_ntsd *pnntsd,
 	if (dacloffset <= osidsoffset) {
 		/* owners placed at end of ACL */
 		nowner_sid_ptr = (struct cifs_sid *)((char *)pnntsd + dacloffset + size);
-		pnntsd->osidoffset = dacloffset + size;
+		osidsoffset = dacloffset + size;
+		pnntsd->osidoffset = htole32(osidsoffset);
 		size = copy_cifs_sid(nowner_sid_ptr, owner_sid_ptr);
 		bufsize += size;
 		/* put group SID after owner SID */
 		ngroup_sid_ptr = (struct cifs_sid *)((char *)nowner_sid_ptr + size);
-		pnntsd->gsidoffset = pnntsd->osidoffset + size;
+		gsidsoffset = osidsoffset + size;
+		pnntsd->gsidoffset = htole32(gsidsoffset);
 	} else {
 		/*
 		 * Most servers put the owner information at the beginning,
-- 
2.14.5


