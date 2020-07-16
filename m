Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 19815221C05
	for <lists+samba-technical@lfdr.de>; Thu, 16 Jul 2020 07:42:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=oTFmU6rH05c0yc/EFCCNRAx1y5jjOSqu8GlE/6Ao2Ew=; b=6NKjGXSkNOG/L0j2hVTXDdzdcw
	1FoG5idXNvs7+1ZTrh32yyskqo3iTbAerqEkteiYhmb4Po96Yx3uyZA8Cs/vwS+P5kWxtQcwoA+hn
	AmZT786DT/WM/c600Sm0LeViqlSaBsgTdcmvrY6TwM5yVma89bsSUkpNnnDRuqJPKHmRj3CqcjqI0
	QqY2eV5h9ULILT4llelcu4pJ1Uqe5BAkPSCjGP98TMdEvaq13Q4HXjB21YJlj1LUSqZoEXtjU42Ui
	3EuIAdC8NWoMZnz8TmPfMAEtCeJfOKowTdB6u+Najk++oSSivs/sw91mP1FBuN7tm1kldVi1luREs
	Zi1D6H1Q==;
Received: from localhost ([::1]:46152 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jvwdZ-007ycI-JF; Thu, 16 Jul 2020 05:40:53 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:40129) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jvwdR-007ycB-Oy
 for samba-technical@lists.samba.org; Thu, 16 Jul 2020 05:40:48 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 133so2277395ybu.7
 for <samba-technical@lists.samba.org>; Wed, 15 Jul 2020 22:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=oTFmU6rH05c0yc/EFCCNRAx1y5jjOSqu8GlE/6Ao2Ew=;
 b=YXof61MmqwSd7EINqsROPksbO5ZnsvPgn3EieoA2jADXI1hlk78b0gWcmx7A9r6M64
 cDcatIgXSzWmPrhbmK9YbVfYKJ0EhkdoPscxiaK5+1l0oxOGjbmiUgFm93v6NyabeNLD
 n0ApR62CR5OY65gaYO7CyraRCs7kwu+YKyqO7VWvL9IG5q9J/Y1qdgEFnWyPP/hqC9L1
 AP+jBA3cnpLM+PKH3EGhU/4+em9kfJ6/m7zjYXH1n5ZrWV5lCxXShVBDAL96hlj1Xzpq
 hWhh6/fLAm2XGXhbWxZ4Pm7qeAKwuE26SPZQPcLRskuwgXxwOFpn3iMGiHVlwvmA21/O
 Z9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=oTFmU6rH05c0yc/EFCCNRAx1y5jjOSqu8GlE/6Ao2Ew=;
 b=EMUEPvim9V8m4zDQy6Ji0T0Hn/53DVbmUfQ73AcVZ9fHIl2lEkgi5+f9CD5URwVSVL
 WCUrbwL4xdwKqwnLesjvYlTbFy3dlqosWHsxjl+ZXH4rbaiq8w2WiIXqJhBvEt0/g7Yc
 D6uMB0jrRbwZ2pq5649IFeK8mGQvOVl+bC500e5lrXexY9IfT/J8EJPWC94RY8M3WbeX
 C/UyLEXP8SBB3H5CCfdk+w3JmrcyI1mFi3rxzYaHxsnms5dNJeRgCMjpECbcE23d/yEs
 EdB5+se1La8VIPXcFdMOM8nWwusNgomBqvuXP97HWs7Z4a44xxCUE6wxTfmbPB8JVGbA
 5xRw==
X-Gm-Message-State: AOAM531n2R5hxK0c0d9Jl6SUl7lMAgQ02UfgsZaNkBdG/FmAyavL0XaX
 kHVvX7Py0HpI4FDbSCeqV2NQ0f8PU0MIdwi5WI4=
X-Google-Smtp-Source: ABdhPJwbHlkTVA97LK55eN+rZq5zp69gOcgEs0q9mFWpfdl0UKe9tUFdJOJHz0Y/1iECjhEUpsKKws+qtnFUJlMOlmU=
X-Received: by 2002:a5b:808:: with SMTP id x8mr3814737ybp.375.1594878042086;
 Wed, 15 Jul 2020 22:40:42 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 16 Jul 2020 00:40:31 -0500
Message-ID: <CAH2r5mvKTwGa0W_LcfgNwNQ6QY=pXSBkURV7MtnDz-hfArPTcQ@mail.gmail.com>
Subject: [PATCH][SMB3] warn on confusing error scenario with sec=krb5
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

    When mounting with Kerberos, users have been confused about the
    default error returned in scenarios in which either keyutils is
    not installed or the user did not properly acquire a krb5 ticket.
    Log a warning message in the case that "ENOKEY" is returned
    from the get_spnego_key upcall so that users can better understand
    why mount failed in those two cases.

    CC: Stable <stable@vger.kernel.org>
    Signed-off-by: Steve French <stfrench@microsoft.com>

diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
index 2f4cdd290c46..492688764004 100644
--- a/fs/cifs/smb2pdu.c
+++ b/fs/cifs/smb2pdu.c
@@ -1387,6 +1387,8 @@ SMB2_auth_kerberos(struct SMB2_sess_data *sess_data)
        spnego_key = cifs_get_spnego_key(ses);
        if (IS_ERR(spnego_key)) {
                rc = PTR_ERR(spnego_key);
+               if (rc == -ENOKEY)
+                       cifs_dbg(VFS, "Verify user has a krb5 ticket
and keyutils is installed\n");
                spnego_key = NULL;
                goto out;
        }


-- 
Thanks,

Steve

