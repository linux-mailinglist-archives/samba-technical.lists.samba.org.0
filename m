Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 712CA2EF048
	for <lists+samba-technical@lfdr.de>; Fri,  8 Jan 2021 10:59:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=0Ds7Njz5/XCIcf0AMC454SF9b/HBKMbqlkN1lJ8g4Qg=; b=Y/8Hp2xWYzuHadivP2oFchJQRz
	FQxTqcaFphwbZhRU6XkuvRqJEIu3NG5o5VaWGG5Q/awaElO9m3BXen/VjkNhVmDGnfCQaFEmn6bSR
	COn8HwJuTAxHAnsx4JUJSKYWBnoEHx+cnUpZkspsOuQdmIvD3GCsCpZiTLfFJtmfVVWbW6vMaz3A4
	W9mX9Bdk/E/axxlijV1E6wMJdIKJ46KH3hnUjV7/W1DLhtI8R2NEe3Bu2HUwdk6XQiCqOQLhRIOt9
	OhZ56qzWgwfpgDDULaiio41u9U9UHQoy5MECB/SOG32iumuo1V5Ztd5JjWmnVmfvBOb9aRRgPf4Gm
	NHJbfQiw==;
Received: from ip6-localhost ([::1]:47924 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kxoWy-0055TS-IQ; Fri, 08 Jan 2021 09:58:04 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935]:37864) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kxoWp-0055TL-9F
 for samba-technical@lists.samba.org; Fri, 08 Jan 2021 09:58:00 +0000
Received: by mail-ua1-x935.google.com with SMTP id 17so3260138uaq.4
 for <samba-technical@lists.samba.org>; Fri, 08 Jan 2021 01:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=uIUmOQ6N+w9xi+SQYwDGxfEclSdm+sPOBxEHUk9ap70=;
 b=Utp42TB8v2N7Bc1FcQU/eXe3FOUXkB+/PuuUCe6Wq5aq6nyCyuKPKlcxcbFqCTWuN5
 AtASoKjaS7cu+3m7Qj/bkEnrkwKK38KijS7mDRhGK5nbwp+xrurXpgEXniiPJB2Si+hf
 ZaQjyvjtncCCHztDiYpsKlikju+6D2wA12tVWZt1BbHjEAsbHYPDMlm7Ox2icjuvAHde
 PDGz8D1Sq7u2Kh6CtIs3QWKaMj7BoMk96oZLTYGCwz39TCfc9z3BILTpgsH7P+zn+Sn/
 8MegqFREnsilS5h5fAjzZrCAondQ/6+1KllKhqQTuaXAsr5TUnHkgkMVnfKr1LUTLogh
 fZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=uIUmOQ6N+w9xi+SQYwDGxfEclSdm+sPOBxEHUk9ap70=;
 b=Dmss9hgjCNFWBR2/wh2C1JXzFzwmgcfj4Zaf6IIKbYujybXJqLKvKrEvhMj3+jQKRK
 LPr6RZOgZqP6Af7C+7ZPGUjhq0usu17yio/ugtdeszxJeRaakrKtOOUCUvDrSE6Xjn+t
 EtQdCNafZiU97DLO5vHODLXSymw4s8Isvk4oDYn38FYtjLM4fyWiL4sMsZPysPxRh03o
 CDsl9BNNn4wgNhE7NU6YQ2mZV6AE9Ab4fzic9HSPuHsYBKqPCxpJ0DSntYUYAxNeJJuY
 5qituPapMxUzx4Ld3dmhCESbuecZWy7XJ3yAUPl4vyHTDRjl6EDHSU2oGtpBa+1rI2Ck
 anog==
X-Gm-Message-State: AOAM531Qmyg4MtWGBkd24W16ovNiRtp5lu16MkM0DCLeGKCI3a5qPgV9
 UxVADiehha8JbhuSV8ZYleg8AQ+9sogchcS0g8Hm5J1WX8RruQ==
X-Google-Smtp-Source: ABdhPJy/HJTQFZ10WGEB4wg41hrgOW9qC3XzISIIwUNIJtvcM0NwgvdKVPxVAlq79Ns6LxQp1ASSeP8+lfmXlEOR2dM=
X-Received: by 2002:ab0:4363:: with SMTP id k90mr2211013uak.31.1610099857204; 
 Fri, 08 Jan 2021 01:57:37 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 8 Jan 2021 15:27:20 +0530
Message-ID: <CAHbM3qgJv3he3LSokE-V1yPUttueT1esXF0vNQqHSnRPDtqz9A@mail.gmail.com>
Subject: Initializing case based parameters during share switch in
 create_conn_struct_tos_cwd()
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

We are creating DFS referrals when a folder is created under the share
root. In one instance, an user was trying to create a folder with the name
"FOLDER~1" (with exactly 8 chars in the folder name) from Windows. So, we
created the DFS referral with the name ending "FOLDER~1" and returned the
error STATUS_PATH_NOT_COVERED to the client. Then,the client had sent
DFS_GET_REFERRALS request. While  processing this request, when
unix_convert() is called as part of returning the referral, it was
normalizing the name to lowercase because the name is a mangled name and
the below parameters were null:

conn->case sensitive = 0
conn->share_case_preserve = 0
and default case is lower

The case_sensitive and short_case_preserve were null because we were not
initializing these values in conn struct to the share configuration that we
were switching to. We are using below settings for the share:

case sensitive = no
preserve case = yes
short preserve case = yes
default case = lower

I used the code changes that are in the below patch and now we return the
folder name in the referral as is. Could you please review this patch and
let me know if it is fine?

Thanks,
Shilpa

  diff --git a/source3/smbd/msdfs.c b/source3/smbd/msdfs.c
index 50014e1832..d39d7ee859 100644
--- a/source3/smbd/msdfs.c
+++ b/source3/smbd/msdfs.c
@@ -427,6 +427,17 @@ static NTSTATUS create_conn_struct_as_root(TALLOC_CTX
*ctx,
        }

        conn->fs_capabilities = SMB_VFS_FS_CAPABILITIES(conn,
&conn->ts_res);
+
+  /* Case options for the share. */
+  if (lp_case_sensitive(snum) == Auto) {
+    conn->case_sensitive = False;
+  } else {
+    conn->case_sensitive = lp_case_sensitive(snum) == 1;
+  }
+
+  conn->case_preserve = lp_preserve_case(snum);
+  conn->short_case_preserve = lp_short_preserve_case(snum);
+
        *pconn = conn;

        return NT_STATUS_OK;
