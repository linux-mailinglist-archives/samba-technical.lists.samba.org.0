Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7BB49113A
	for <lists+samba-technical@lfdr.de>; Mon, 17 Jan 2022 22:02:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=E/L36AdK5Ipen2tmpRXUP0pX59XDvEK9cBawMrh2MjE=; b=LocG6tq3wzTZmNybQ1neTaPXGL
	Rh0dFdEi8x5CMn3ooBAE4KtUaKBZcNT+MIqqtOH66UOTg/6wIj8YV3pvO8R7g+qA+chXrpU+BdRSY
	w0V9QCEzbAoQNr7udDFe6HAY8QrF9OQ4ODNzxB07CM+aPrtzCgQMDbxLnXH6k/wpWaIV2tVUbohnk
	HMWjjLmhENhBu1MZ53nAx/K+h+QAiHRJHxXNyCPvACWEmaB40FceMf2GByN6SB+8vu1lXiBV//Rsi
	OvTLFXqTCDhHkj8l1h0prM/8u0QW0oJLMhnIi/3xawt884+zfty/CBNN3PponeUopMAwSQ2f9WqGY
	mhx8oZUA==;
Received: from ip6-localhost ([::1]:58664 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1n9Z8I-009Enb-Q1; Mon, 17 Jan 2022 21:01:42 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:44916) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1n9Z8D-009EnS-B7
 for samba-technical@lists.samba.org; Mon, 17 Jan 2022 21:01:40 +0000
Received: by mail-yb1-xb36.google.com with SMTP id z22so49054576ybi.11
 for <samba-technical@lists.samba.org>; Mon, 17 Jan 2022 13:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E/L36AdK5Ipen2tmpRXUP0pX59XDvEK9cBawMrh2MjE=;
 b=DligtBPwqn6VtiU+rpAn5X+wN11F98GkoqMRJbBi53/INouP3OZYi4BtPYLmhfHf7W
 YAbGiO6l/guh3I1zu20VxIFUqvd2xlQ4X2C7GWESOPxMC1Rtmvysn0lBEoc0krZG2eDh
 +EHyAxlxaB91ofBqytmoOm6j3O3EhP+ujjSCroUGMLct0ASx49rMLrK95JesRNrkO97j
 L/5hAuK3K08Y80yWzXfXX9DtZqRenb2y2Gnm40NOQvZUaal9aV8Q+puBweI0GDpnJ31Z
 mPVhhzwNuk8lvKAdau1XGZj3HSTJpTLmM3eurQKuW6CJNz//eHH4uJEJaB28/wgmpS8m
 uyxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E/L36AdK5Ipen2tmpRXUP0pX59XDvEK9cBawMrh2MjE=;
 b=3qp47GJXJmLTy4LNNs8xyNHOau9NNoz/nyX2Yn0kOckbKnK1zdQIYobHmzWtdBXs5l
 i6C2CwJ6eTPEYa48Dy1tYM+ctJd+yFor6TESyOXexVMnocSTlXZsDVvAynD+KdqiDsn3
 7euluBTB0LC7SvVVkCUGpH7BFgHBeCovQyWm8njtVv9Ok8ILCBO5wq8ul6FNE5F+2yYJ
 Z93vL5Q0ngFbhlxmlKcK0Ohktr2XqoEgCwH0QuxuF5UxfcvWjvaIpo9uhXf/wdys5nJy
 6rREx/AYjLYTKCZl0MZn9QnT7YP8gM6KeQWO7kgGS1uPu3pIqYkNRmhT+HRbqAv79M9Z
 vkUQ==
X-Gm-Message-State: AOAM532ORSZnK7JTTV4cjoGX+G3/IOfivIrkIQH2nqRHZYuLp695cCK0
 2wRaAfNWdSd0XoXI4C02lCNUwUkHTB3O0EnFFBE=
X-Google-Smtp-Source: ABdhPJz2qC1gbLERDHPFPmDnVv4rb4ybLBXYBQWsc0lxZSVX9k2ZYOya1CMbAN8jg7o53QZDYaTP6MHHW0h2Q+EsfXA=
X-Received: by 2002:a25:b184:: with SMTP id h4mr13155000ybj.738.1642453295121; 
 Mon, 17 Jan 2022 13:01:35 -0800 (PST)
MIME-Version: 1.0
References: <20220114064625.765511-1-deng.changcheng@zte.com.cn>
In-Reply-To: <20220114064625.765511-1-deng.changcheng@zte.com.cn>
Date: Tue, 18 Jan 2022 07:01:23 +1000
Message-ID: <CAN05THS5A5r8PgaHk8BaK+8kTyT8mJ3LdB__tJCbSb8Cs+yaKQ@mail.gmail.com>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: linux-cifs <linux-cifs@vger.kernel.org>, Zeal Robot <zealci@zte.com.cn>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Changcheng Deng <deng.changcheng@zte.com.cn>, Steve French <sfrench@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This patch is wrong.
qi_iov is not even the trailing element of the array so we cant change
it to be a flexible array member.
This change will likely clobber io_iov so the potential for breaking,
memory leaks or ooops is quite possible.
qi_iov is supposed to be exactly one element in size.

Same for close_iov, while it is the last element in the structure, it
is not a flexible array but an array of exactly one member.
This change to close_iov would likely lead to reading/writing beyond
the end of the structure.


NACK

On Sat, Jan 15, 2022 at 12:44 AM <cgel.zte@gmail.com> wrote:
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

