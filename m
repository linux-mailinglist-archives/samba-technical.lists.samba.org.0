Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A334910F6
	for <lists+samba-technical@lfdr.de>; Mon, 17 Jan 2022 21:27:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=UvHJLX7IdGzz1pAEtv5SH8by2bDEnibSRbenuruMozU=; b=auZn6/ww6ZyybLSYECNHSHFKPq
	Z/jBkzLan/S9cjUVx7oFheT7JPzYEmZpFuAE1XyxXQU4xVLZM8U5vjL50WweOSzE1OIlXyO15Hf1w
	xJZc4MR96moyxG5R8p4YmN4UMJQXkI3zv/biYoBSNzktQrCjQdL1yflIurti5h19PjPJJvijiVewm
	vKtTHjLzTofSy69T3YSWWRUSilPK9Za5LyB3PFmUUl+imgafrBYbfNjVyXHFdbfaRKzaeMklC14xo
	6nH/iuKavk5WvgFE0NKcPUiYGAFCdoFNqM0GBIokYm2Zu/ib2gW1ekzMOSPml799RXVFAbyR0vjGY
	KAJyZfBQ==;
Received: from ip6-localhost ([::1]:57868 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1n9Yb1-009EPk-4T; Mon, 17 Jan 2022 20:27:19 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:39520) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1n9Yav-009EPb-PI
 for samba-technical@lists.samba.org; Mon, 17 Jan 2022 20:27:16 +0000
Received: by mail-lf1-x12e.google.com with SMTP id br17so62094171lfb.6
 for <samba-technical@lists.samba.org>; Mon, 17 Jan 2022 12:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UvHJLX7IdGzz1pAEtv5SH8by2bDEnibSRbenuruMozU=;
 b=nD6UwUsWlWWn3+8gIxQfzwEte1mhQ83mOiZ+3vV1xc5HfFrToq2AaEPGH+oXHW836J
 /N3bzIZ3AFgdrNva4+qXJLPUEkFmr9or/lsmG4lfox1sI7QHUVEN1h510+NXEDLdsMLf
 J5mk/XXTQHcXCTS/uBriOCXz+qCc1J6PlGnS+1chS8pkOPRC3vDAXF2hva6AFxfpXeZ1
 cH5Ie0JtAbATuayIBP4uv4+CJPFinP2DLHQgcHmlLfk1MOD+lxp7pRhoSua0Fkx7wS28
 nbbXTTmnTOEnE+G1l2Del9r6UOH6/0G5IJTbGXBuAamiBDfoz6BvbK6gH+iV8FcogjgX
 DtpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UvHJLX7IdGzz1pAEtv5SH8by2bDEnibSRbenuruMozU=;
 b=cgtZmLU+DjH6pOFSQiT0zSkyjb0vkl791ffh7si53KQFudTgufoIlllEtLBojn3rOI
 vZCrsRJFngFINbQ0gJ0muil1mNAb/QZMWKVKVKl3DAVlqcD76ZxrfgVMF18fgs+xAORj
 MJqD6Ke588FsdawApQuwtny/ebGR4mCtUqR8ZEMvYTEqyaDWyMonQKGyuDU4lzUcLOME
 YXvBVARMJmXZ4H4TTMTu2sdp3P/FQvBynD1LGoT9Cp3yapfV/hirBe+HKwf52JC2t4ub
 BKOdOEQdhsXi5qA2q0Wa0HC2krAgejMTCb6xgvpRxO+guxwmeSSK5SmFrbhOMMPe+/fH
 jtAw==
X-Gm-Message-State: AOAM530HUrI19QGHxpKdBEUKTaRR9DZpOyv1h7ESMcfk43B1OUJeXFr+
 shSOOcalHC9dprhK7HQ+L0FBaNvPXRFxqyBjonw=
X-Google-Smtp-Source: ABdhPJzSjj3jXK0JEgHFned13cyE7P7wdzpQ11/VjVcSoX3gLfiDYpRXata+lJUvxbMQTujI2IxyTJXRGpAP6SzaV9E=
X-Received: by 2002:a05:6512:3090:: with SMTP id
 z16mr11502446lfd.601.1642451232764; 
 Mon, 17 Jan 2022 12:27:12 -0800 (PST)
MIME-Version: 1.0
References: <20220114064625.765511-1-deng.changcheng@zte.com.cn>
In-Reply-To: <20220114064625.765511-1-deng.changcheng@zte.com.cn>
Date: Mon, 17 Jan 2022 14:26:58 -0600
Message-ID: <CAH2r5msz3iUwJVirtSmpZNbxpbtD3A8t7YfeGHDLtko6u4w+-g@mail.gmail.com>
Subject: Re: [PATCH] cifs: Replace one-element array with flexible-array member
To: cgel.zte@gmail.com
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
Cc: CIFS <linux-cifs@vger.kernel.org>, Zeal Robot <zealci@zte.com.cn>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Changcheng Deng <deng.changcheng@zte.com.cn>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Doesn't this change the address of the assignment in this line in the
function (smb2_ioctl_query_info)?

        /* Close */
        rqst[2].rq_iov = &vars->close_iov[0];

On Fri, Jan 14, 2022 at 8:44 AM <cgel.zte@gmail.com> wrote:
>
> From: Changcheng Deng <deng.changcheng@zte.com.cn>
>
> There is a regular need in the kernel to provide a way to declare having
> a dynamically sized set of trailing elements in a structure. Kernel code
> should always use "flexible array members" for these cases. The older
> style of one-element or zero-length arrays should no longer be used.
> Reference:
> https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
> ---
>  fs/cifs/smb2ops.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
> index af5d0830bc8a..5c104b2f308a 100644
> --- a/fs/cifs/smb2ops.c
> +++ b/fs/cifs/smb2ops.c
> @@ -1609,10 +1609,10 @@ struct iqi_vars {
>         struct smb_rqst rqst[3];
>         struct kvec rsp_iov[3];
>         struct kvec open_iov[SMB2_CREATE_IOV_SIZE];
> -       struct kvec qi_iov[1];
> +       struct kvec qi_iov[];
>         struct kvec io_iov[SMB2_IOCTL_IOV_SIZE];
>         struct kvec si_iov[SMB2_SET_INFO_IOV_SIZE];
> -       struct kvec close_iov[1];
> +       struct kvec close_iov[];
>  };
>
>  static int
> --
> 2.25.1
>


-- 
Thanks,

Steve

