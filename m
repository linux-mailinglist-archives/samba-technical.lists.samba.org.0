Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0029F4E38B6
	for <lists+samba-technical@lfdr.de>; Tue, 22 Mar 2022 07:08:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=1hm+docfkUVqEam48lSJ/XtpRGXyQocEIR0nX5W2ZtM=; b=ka/R2532Y4HbhacaUUm97/QrgK
	b4CKidCcnaQlTGYRIQw78ddYW3irpWIUzLTNDCGifS1jX9Hfcx2mqaB7qMq2HV8qz9h1vf8AxI6jR
	mnH+slL8WicnEnhgsicGvtNM1fztQG0HcybFr6rNhY5hnYVr170/X9Aiv34yKb6+pP0keHzy8thVT
	4XNfbfCU88R9wFxp44qFXxq4N4YL9CqpLgM+iOBk9I98m0xe0eSePTyN0PF3J6BL6Z0uaqc5uvKQ2
	MPMNRqCKa7936bp5lbw41u4t5BD/wch1oKa6aAEQiAFaI+63rPYuxl4ycgJxtVBWsZTNoexwXVoZE
	XSsx+oAg==;
Received: from ip6-localhost ([::1]:43044 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nWXfy-0048gc-Oi; Tue, 22 Mar 2022 06:07:26 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:41897) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nWXfs-0048gT-V1
 for samba-technical@lists.samba.org; Tue, 22 Mar 2022 06:07:23 +0000
Received: by mail-ej1-x634.google.com with SMTP id a8so34014567ejc.8
 for <samba-technical@lists.samba.org>; Mon, 21 Mar 2022 23:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1hm+docfkUVqEam48lSJ/XtpRGXyQocEIR0nX5W2ZtM=;
 b=VywcMOvEZFwLhpkST2+FlCVyLxNDV0cChbksFCwU8GKcB0RIFZRTZXsWrBSl6KqT4i
 PUZ/EeRnH/koriftEd/z89xhuf5wo4Gi68p05x221zllgBBYSPBJOIKmIXMSojLsMiId
 o8B7fswqMyzlAUiGzX0vV4RmxVFy9NlZ3gkU0q6A1mwwXEgh0sQ6uYaPasUq32rMX12j
 ugAmGJ9ZCyKPg+Sb496yHdkwhcf+o+vDVaAc09v423HDsALdDWOfUiN+mag7XnedL8HI
 8HnZx5Jokft+D06Yj9NVXOvUYH5kKRYeJER9UFZZe4UNoxMwUeK7IGZX60BtL4bZxHlF
 0mMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1hm+docfkUVqEam48lSJ/XtpRGXyQocEIR0nX5W2ZtM=;
 b=wwPEqkbJ3o05RcW2oXYHpYp7dRgDcIgxhbwHfgisCafU9l/DIyxY/OZZO/AWST57Gv
 40oBiGnTdoZZfXJSsJ5jPRfffbuijv+rFdq1GiOI/8xr7Q9ylA7wLSZ5X1U6S0M7yeoF
 2MXSO7PXN0XNGc2kOp6hCXA+G8ORiyaf56MngHNXT7zRuEPDo+hSfCkyRuKHGggr5ABs
 P0onN/T1GA1zZfD3Lut0hY9mRAzYe35lxu38/83r7n6BXH684ftBZnvAR0nWgSwFTU67
 LUsRyjJ74ghSB/eDnv+S+j3NpPqL5ICNxDZxl+PTkTO2z6vUcUe3ZQMd9thhX0nWiWQC
 mJvw==
X-Gm-Message-State: AOAM533tFoXC+Vsx75BWvbdaiYs+7tJPT2JRErbp981lb4xomKfgElD0
 uoZas7hJKQoz4tgK1ikDHR8QYstDmdhOzwMEd24=
X-Google-Smtp-Source: ABdhPJyK/wsqhsSQyJvOrciSXA3uBP98YcKlsmdsB31Cxv9jYH4FgXeH3iTdG9GXePOmDPRombY3tIpaa9KFnEDxPSs=
X-Received: by 2002:a17:907:2ce3:b0:6df:d80f:ca1 with SMTP id
 hz3-20020a1709072ce300b006dfd80f0ca1mr13595196ejc.61.1647929239809; Mon, 21
 Mar 2022 23:07:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220320135015.19794-1-xiam0nd.tong@gmail.com>
In-Reply-To: <20220320135015.19794-1-xiam0nd.tong@gmail.com>
Date: Tue, 22 Mar 2022 11:37:08 +0530
Message-ID: <CANT5p=qEmVtgC5gD5G3D1o+7mxLMpQawnh0DSY+dLD-Dyrw5Uw@mail.gmail.com>
Subject: Re: [PATCH] cifs: fix incorrect use of list iterator after the loop
To: Xiaomeng Tong <xiam0nd.tong@gmail.com>
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
From: Shyam Prasad N via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Prasad N <nspmangalore@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>, sprasad@microsoft.com,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Steven French <sfrench@samba.org>,
 jakobkoschel@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Mar 21, 2022 at 3:50 PM Xiaomeng Tong <xiam0nd.tong@gmail.com> wrote:
>
> The bug is here:
> if (!tcon) {
>         resched = true;
>         list_del_init(&ses->rlist);
>         cifs_put_smb_ses(ses);
>
> Because the list_for_each_entry() never exits early (without any
> break/goto/return inside the loop), the iterator 'ses' after the
> loop will always be an pointer to a invalid struct containing the
> HEAD (&pserver->smb_ses_list). As a result, the uses of 'ses' above
> will lead to a invalid memory access.
>
> The original intention should have been to walk each entry 'ses' in
> '&tmp_ses_list', delete '&ses->rlist' and put 'ses'. So fix it with
> a list_for_each_entry_safe().
>
> Fixes: 3663c9045f51a ("cifs: check reconnects for channels of active tcons too")
> Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
> ---
>  fs/cifs/smb2pdu.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
> index 7e7909b1ae11..f82d6fcb5c64 100644
> --- a/fs/cifs/smb2pdu.c
> +++ b/fs/cifs/smb2pdu.c
> @@ -3858,8 +3858,10 @@ void smb2_reconnect_server(struct work_struct *work)
>         tcon = kzalloc(sizeof(struct cifs_tcon), GFP_KERNEL);
>         if (!tcon) {
>                 resched = true;
> -               list_del_init(&ses->rlist);
> -               cifs_put_smb_ses(ses);
> +               list_for_each_entry_safe(ses, ses2, &tmp_ses_list, rlist) {
> +                       list_del_init(&ses->rlist);
> +                       cifs_put_smb_ses(ses);
> +               }
>                 goto done;
>         }
>
>
> base-commit: 14702b3b2438e2f2d07ae93b5d695c166e5c83d1
> --
> 2.17.1
>

Hi Xiaomeng,
Good catch.
Reviewed-by: Shyam Prasad N <sprasad@microsoft.com>

Steve, This one needs to be marked for CC stable 5.17+

-- 
Regards,
Shyam

