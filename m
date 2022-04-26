Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 498F250FD15
	for <lists+samba-technical@lfdr.de>; Tue, 26 Apr 2022 14:33:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=PJTTJhzXadCYVOW2jS7UhV/IAqBDAvjRQkQw6sMkFWE=; b=SuW5XKjqZprni9cfG69cLy7yHC
	fQRIvSBNqBQE3kGoun5x5MtJbDzPupqz4mccKVIOjapYWFqFeCKnVKFdrKpsMRFoIFMFPkJ/GLx/t
	F8l21gs3xafQMcQATlnXk9giWI2f+YQoDaNhWCs8sWNCkPOsu4crevyAUZo+pr2lQwt7Nke8F0+mx
	SAlKBmiNEN7coENC+D8zxMBTrKD/1A6a2GwA6sHlApGqk/cF5wsl2hkd9C4/+Ls1yXKWkpjQ/WEvW
	WPAiz1xa8mvrmkysgRBwcBVFIZC3tlU/TfhvmY7SbnmTKjb8MPZous4/hRVR4DRLMRlEpEjTOvE7j
	fDcRziWA==;
Received: from ip6-localhost ([::1]:35148 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1njKMU-002Hqb-PU; Tue, 26 Apr 2022 12:32:10 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:36813) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1njKMP-002HqQ-On
 for samba-technical@lists.samba.org; Tue, 26 Apr 2022 12:32:08 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id f38so32674561ybi.3
 for <samba-technical@lists.samba.org>; Tue, 26 Apr 2022 05:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=purestorage.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=PJTTJhzXadCYVOW2jS7UhV/IAqBDAvjRQkQw6sMkFWE=;
 b=DdYMV/bKMK46WJCH0fPVTQHfP+htlxzfFf+31dl+Uix0fgk/1l6+nJIwRp4Xf3fr06
 y8WcDaNKVGbIAttO54RcQlkuBthlgAmYb2wvQ1Jih9Qp+DW/Fu95Ho2i7OWsW7tI+c27
 L2ZDl7vHJy0kSxvlaks87hUmtwgyraICvNTtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=PJTTJhzXadCYVOW2jS7UhV/IAqBDAvjRQkQw6sMkFWE=;
 b=lnMYaz7QO7e61PBzEcooOVW2Hn0DdrI1o0irs+pYkpy1vxFF9iAGhJWe5erTVY8rNd
 vV43bAsXQliU4TIZUtr591JpUw2KuGA9bIaD6eWP6R1b/YMsdkJibrzIwn5iEwORFR6C
 ImBipG10Yk2nhT/jlnhfXHM2L38hni4GjqPPhWCCKgAxI6HephhFsRKkt4wqOQQIdBmM
 3ICz8YH5X6HHleFfgAsmo6Lu+MKIOkv5RUdT6BfeWpLzXvha5MIbL2rvi88uMcQFomiy
 NilX3g5AAa2irPogaRseKnSlKeu+xQCoI/g2MkiTdgo1Kb8H0MoecoV9h7PTRj4LX1RD
 oC+Q==
X-Gm-Message-State: AOAM533woF+mQEDJ8+Ef9SqtJ3XIdBs8rjXK0u1Mhss+RZN6zmLQbR0p
 n/1/QMQFZzknEKfThP9kK6M9YlMFdHltjwVSY1tkLMu1DB2PIgAH
X-Google-Smtp-Source: ABdhPJw8gVkBbq6yt0E1rf7KYS1X3Q+Rn2YxSNHxFRDb0KyEL9+54AzsZAwg+jkzK9iXvHRLJNuyEuoTWjKrIsdKxbc=
X-Received: by 2002:a5b:4ce:0:b0:633:d3e3:1f5c with SMTP id
 u14-20020a5b04ce000000b00633d3e31f5cmr21680545ybp.256.1650976323602; Tue, 26
 Apr 2022 05:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <CALhMaTQZO22JcTVcoDzNcOGBtHwRjHU5Q=Fe7Zi-su2XHeJUjg@mail.gmail.com>
In-Reply-To: <CALhMaTQZO22JcTVcoDzNcOGBtHwRjHU5Q=Fe7Zi-su2XHeJUjg@mail.gmail.com>
Date: Tue, 26 Apr 2022 14:31:52 +0200
Message-ID: <CALhMaTTc7OC1UWLk1NqdyZ6TxpVdZnPVq_EJhzZWW3Z+Acw_bA@mail.gmail.com>
Subject: [PATCH] cifs: fix race condition in smb2_compound_op
To: samba-technical@lists.samba.org
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
From: Ondrej Hubsch via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ondrej Hubsch <ohubsch@purestorage.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

When cfile->count becomes 1 after it is passed to smb2_compound_op (aka
cfile becomes the last reference to the file handle) the call to
cifsFileInfo_put will cause a SMB2_CLOSE being immediately sent to the
server -- just before the compound request. The compound request then
contains an incorrect (already closed) handle, resulting in EBADF/EIO
errors.

This can happen for instance when:

1) close(fd) was called, but there are still references held in
wdata->cfile in cifs_writedata's -- these are cleaned up asynchronously in
cifs_writedata_release.
2) smb2_query_path_info is called and successfully fetches cfile through
cifs_get_readable_path
3) asynchronous cleanup of all wdata->cfiles completes

Then the cfile->count can be 1, triggering this bug.

This patch addresses this situation by removing the call to
cifsFileInfo_put as it is also called in the finished section right after
compound_send_recv.

Bug: https://bugzilla.samba.org/show_bug.cgi?id=15051
Signed-off-by: Ondrej Hubsch <ohubsch@purestorage.com>
---
 fs/cifs/smb2inode.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/cifs/smb2inode.c b/fs/cifs/smb2inode.c
index fe5bfa245fa7..d82bd244ecab 100644
--- a/fs/cifs/smb2inode.c
+++ b/fs/cifs/smb2inode.c
@@ -361,14 +361,12 @@ smb2_compound_op(const unsigned int xid, struct
cifs_tcon *tcon,
  after_close:
        num_rqst++;

-       if (cfile) {
-               cifsFileInfo_put(cfile);
-               cfile = NULL;
+       if (cfile)
                rc = compound_send_recv(xid, ses, server,
                                        flags, num_rqst - 2,
                                        &rqst[1], &resp_buftype[1],
                                        &rsp_iov[1]);
-       } else
+       else
                rc = compound_send_recv(xid, ses, server,
                                        flags, num_rqst,
                                        rqst, resp_buftype,
--
2.27.0

