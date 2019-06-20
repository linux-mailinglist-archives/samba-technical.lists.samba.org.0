Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FE94C65F
	for <lists+samba-technical@lfdr.de>; Thu, 20 Jun 2019 06:55:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=MW/su+o+v6T2QvqNurMqmEV75+/lw0/F2WltmYliioY=; b=WCLIsYdLmK+GvIr0Gt4VpEwdxY
	tCse8aCi+nsnPjKbeq3ON5oP6tEHg1qeqbWwNNP1hSNX2U4PBx9PXpSBNpSWjbGpeeuhxZawh7zmj
	MvSpiK1kST2kOn9OMEDb3TQO5XlUMd2APrTJ/XTSBiI5Z65QYwwtA23jt8p+PeytFjRngJ2Rxu1+C
	wTmFtNTCGxYDZeXG8zna/3sF9rGRzjxTPHYG83fREHhiREZl+45adkRb4IKzZEnBrrbWFAfO09r8X
	fhdgfJVecNlPhCSVL3LDnjv36Jl4GZJbRxPZ0YY+YgLKDBtdqLCJYeQHq3d6NtDYfzNDvExngtg85
	Dyew4SkQ==;
Received: from localhost ([::1]:49112 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hdp6C-000aX8-Nv; Thu, 20 Jun 2019 04:55:00 +0000
Received: from mail-yw1-xc42.google.com ([2607:f8b0:4864:20::c42]:43854) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hdp68-000aX0-9F
 for samba-technical@lists.samba.org; Thu, 20 Jun 2019 04:54:58 +0000
Received: by mail-yw1-xc42.google.com with SMTP id t2so601738ywe.10
 for <samba-technical@lists.samba.org>; Wed, 19 Jun 2019 21:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MW/su+o+v6T2QvqNurMqmEV75+/lw0/F2WltmYliioY=;
 b=Ij5vc5EQe6TuQ/Qgy9n9DYJ7YL5mY/CwRppCFMX+ripR+JCHJLgDwvJvx8evQ+nj8l
 W4uQ7NQFBuq1mQA6QNQL3o1hC5tyeEF4eUNZzFSSaraeWShHJtP0rKljpypVW7BipLjH
 QRcbMdtMATD0//MxBrcQrxV47gJQ7iZyRHtWbduEGeRQ1jjtepPJ7yoxx1aLbduO1ebQ
 9Vq01EHi9WAbl3LT+gJFjFiS6pPZUe9tTT/yxiQJQx3SNNmSUq8/Owkxsx8wF/rs4O3J
 0qu0SP9qtw8clasOTYMeOd5Vgje9uB6A8NxLlRZbPcRhPjw93+mg1gBFcqzrZa+dRt3R
 PYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MW/su+o+v6T2QvqNurMqmEV75+/lw0/F2WltmYliioY=;
 b=C6OPdCQHiDL4IXtYnGTQ6cFtUxyCl0vMmGJ+ATBKKRrWWYDdj2XfrKSvnq6GUIRxZL
 4tSCGqB/A/yusALYpSo8IehIViG+BXrut945d7zCLjD/ibRY9XjrDWj/TDpIGyYr2IR1
 poNx1YblHUTHJfW+pY1Ad70TsR69riFezwcoeg3FcnC5/A+jWjRnUIU77QSMeMEyocSa
 BmHgb7tdO8toRIQFTaDSYHOMQYwcB9NTFdKWl90FUAS7RiVeaBfvirnsb5Ntg9kO3Zo4
 8TYnzePC0alIXwft/cxwsaKd1b9D6CJcKcPLQXr4Y9EhPU3V2oBOj5YWxmlc0qddvxIr
 9YDw==
X-Gm-Message-State: APjAAAVmQxYsNNalec1LepzZX1RUvdgq8UnFG2cpdjWkNKo2uhp7ZGih
 1Xjl//jLrXkFJrCB97nxl5FJjqDNNG6ZmAms7BQ=
X-Google-Smtp-Source: APXvYqy2rK+hyU7hguWLx5KcbQPTkp92xKub1ixmVaXc9j4NT0mzvZWNapqiGllShOFv0/zWVAA2w4d1qEQuubOgfmE=
X-Received: by 2002:a0d:f5c4:: with SMTP id e187mr56869040ywf.88.1561006494419; 
 Wed, 19 Jun 2019 21:54:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5ms8f_wTwBVofvdRF=tNH2NJHvJC6sWYCJyG6E5PVGTwZQ@mail.gmail.com>
 <CAN05THSoKCKCFXkzfSiKC0XUb3R1S3B9nc2b9B+8ksKDn+NE_A@mail.gmail.com>
 <CAH2r5mu0kZFhOyg3sXw6NVaAjyVGKuNdRGP=r_MoKqtJSqXJbw@mail.gmail.com>
 <CAN05THRq6CM-3ZHK5WNE-VA60N0MxSHTxeM7sp-hz-ehOTeEOA@mail.gmail.com>
In-Reply-To: <CAN05THRq6CM-3ZHK5WNE-VA60N0MxSHTxeM7sp-hz-ehOTeEOA@mail.gmail.com>
Date: Thu, 20 Jun 2019 07:54:42 +0300
Message-ID: <CAOQ4uxg8cz_0=5BaMAniD+50mbvrC7kbEsXhEe2oWKrXfecptg@mail.gmail.com>
Subject: Re: [SMB3][PATCH] fix copy_file_range when copying beyond end of
 source file
To: ronnie sahlberg <ronniesahlberg@gmail.com>
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
From: Amir Goldstein via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amir Goldstein <amir73il@gmail.com>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Steve French <smfrench@gmail.com>, "Darrick J. Wong" <darrick.wong@oracle.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Jun 20, 2019 at 6:28 AM ronnie sahlberg
<ronniesahlberg@gmail.com> wrote:
>
> Guess we need a fix to the man page.

You mean like this? ;-)
https://lore.kernel.org/linux-fsdevel/20190529174318.22424-15-amir73il@gmail.com/


@@ -1546,6 +1547,14 @@ smb2_copychunk_range(const unsigned int xid,
        tcon = tlink_tcon(trgtfile->tlink);

        while (len > 0) {
+               if (src_off >= inode->i_size) {
+                       cifs_dbg(FYI, "nothing to do on copychunk\n");
+                       goto cchunk_out; /* nothing to do */
+               } else if (src_off + len > inode->i_size) {
+                       /* consider adding check to see if src oplocked */
+                       len = inode->i_size - src_off;
+                       cifs_dbg(FYI, "adjust copychunk len %lld less\n", len);
+               }
                pcchunk->SourceOffset = cpu_to_le64(src_off);
                pcchunk->TargetOffset = cpu_to_le64(dest_off);
                pcchunk->Length =

You can do this shortening before entering the while loop,
then you won't need to SMB2_request_res_key() from the server.
and certainly no need to do that in every loop iteration...

Thanks,
Amir.

