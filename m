Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88520151F8
	for <lists+samba-technical@lfdr.de>; Mon,  6 May 2019 18:54:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=QHR30QHWaEMKuBtolQ2NneRKOvfmqfNuUO14VeP7MAA=; b=NuW8xnzXJZG6qszTQzv6S3xQv8
	0hvQqt1dkKjNINxKqLqrMeEaws3LGgS31+8bHaUvmU7FnUxmy1UM9fETjU9KFjk3x6kejjliG7z9y
	rHPgHDS+UGcSY86RGuBlmxHKAIYXrbrSfkj4N2wVypJ4Yz/oYlSTM2EQX+rNOf8COIm9HX+DsPLBh
	yrTvt3fiMLiupblh1qZXb4x2fs/XE4SWLr+AScGlO79yqiQbJDGuVNAAE5n4+QKir1lfo9kynx5zA
	/Yltx4VmYBShXBLN04GJZMNHklxgA8Usjlvo+Wxa7wBpSYdRTvE173MRcj8+8rojc1nIOrG4UrSAa
	rE2Lszow==;
Received: from localhost ([::1]:24258 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hNgsN-002lor-SW; Mon, 06 May 2019 16:54:03 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:45587) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hNgsJ-002lok-88
 for samba-technical@lists.samba.org; Mon, 06 May 2019 16:54:01 +0000
Received: by mail-pl1-x644.google.com with SMTP id a5so1717288pls.12
 for <samba-technical@lists.samba.org>; Mon, 06 May 2019 09:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QHR30QHWaEMKuBtolQ2NneRKOvfmqfNuUO14VeP7MAA=;
 b=sgp1r6qYOBFSG8qGTJG4TAg8ach0Efpw/cUCKPggbuUhBsLq/dsFpQUu1zj79P+L2n
 SQi6WZg0PigG7bKi/lRcvCHsMvQjlcbjYocXvG9xz+bz+s27Ad+lKTniP2q0Jvf99mRF
 eiUcivMHfRNVaty/y74wjEqqauujO0MoFWjIgbBOSo7AFY96Lmsqlkh2DUbyjgd8lY6i
 MTBVv/z/DdjpsMVFvoe3mIwjGui+YdRFcukvblRxA8eDGIvja1QM6kOt5xcuTQa0HGWU
 653p5mxnmQfY4ORHVKDSBWljMDTyW/Yz1lt8VPQMwpu8pNfwW8mlhZxIGMF/7oJHXp+a
 bv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QHR30QHWaEMKuBtolQ2NneRKOvfmqfNuUO14VeP7MAA=;
 b=c/haA1mQF3Bk6C9id/hIS9AlqaIM0Vwqe6M/8m6rg1CNsFmU35E/2oYnu3DdN7pHVB
 odq7HTziDWghfUFPNSQB7HTOITwV+zuQ2ZhxAfSWtSkUtF02eCjtuhxZubGWASauS/gY
 aAI6Y6aPCp51NmqXh35G/gxw2XAdp5/yK/tnk+Sf0pwI7nRDVrYEeNCuUfckBRHRQhSI
 TSbCSmS5XUAfWwFPCONjWjfGUVuNsz3cX5clgDThdhMrQc4btvCkLEVigxkZ5c4vSz+R
 bSnrRzFDqlko6v9LD0b75fEpORstJc/nFe5sJmZAyUhG93LA0dqYZqHJBNPYeSYN69WW
 gaAA==
X-Gm-Message-State: APjAAAWqsQWlofxo3fk+3sKhaVTwRKm07dflrcEo/m9noOLzVYC5x6uh
 JEt2bfIFUBzs0CsVUZU3iJMRrmMrKOyxj8y9Efc=
X-Google-Smtp-Source: APXvYqzaGiqL9mR+siJdXaeguo9sKcgdE+1cLSBWlV5e6WWf4IOPJp7Tv6iHi5jRykzIzNd2fEPK3FxER8iyVBqGkxQ=
X-Received: by 2002:a17:902:e00a:: with SMTP id
 ca10mr3094261plb.18.1557161636228; 
 Mon, 06 May 2019 09:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <1557155792-2703-1-git-send-email-kernel@probst.it>
In-Reply-To: <1557155792-2703-1-git-send-email-kernel@probst.it>
Date: Mon, 6 May 2019 11:53:44 -0500
Message-ID: <CAH2r5mtdpOvcE25P2UuNFpOwsNyFiBWRQELQFui+FJGVOOBV8w@mail.gmail.com>
Subject: Re: [PATCH] cifs: fix strcat buffer overflow in
 smb21_set_oplock_level()
To: Christoph Probst <kernel@probst.it>
Content-Type: text/plain; charset="UTF-8"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I think strcpy is clearer - but I don't think it can overflow since if
R, W or W were written to "message" then cinode->oplock would be
non-zero so we would never strcap "None"

On Mon, May 6, 2019 at 10:26 AM Christoph Probst <kernel@probst.it> wrote:
>
> Change strcat to strcpy in the "None" case as it is never valid to append
> "None" to any other message. It may also overflow char message[5], in a
> race condition on cinode if cinode->oplock is unset by another thread
> after "RHW" or "RH" had been written to message.
>
> Signed-off-by: Christoph Probst <kernel@probst.it>
> ---
>  fs/cifs/smb2ops.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
> index c36ff0d..5fd5567 100644
> --- a/fs/cifs/smb2ops.c
> +++ b/fs/cifs/smb2ops.c
> @@ -2936,7 +2936,7 @@ smb21_set_oplock_level(struct cifsInodeInfo *cinode, __u32 oplock,
>                 strcat(message, "W");
>         }
>         if (!cinode->oplock)
> -               strcat(message, "None");
> +               strcpy(message, "None");
>         cifs_dbg(FYI, "%s Lease granted on inode %p\n", message,
>                  &cinode->vfs_inode);
>  }
> --
> 2.1.4
>


-- 
Thanks,

Steve

