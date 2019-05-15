Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6843D1E762
	for <lists+samba-technical@lfdr.de>; Wed, 15 May 2019 06:17:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=BfF/cEY+63NPFeE0nnGTP5s2FRqzna+7ou7Ez1fHZIc=; b=dK8n15aqUIkZHP5mz/RpZUpfRT
	0NHmF5E9SeSCh2rrz8XzC8BjskVBeBR4ip029ZC5Ru5u1fQUujSdC7BML76GyFZKZf844sCOdF+/D
	5RpdRzWZK+XPVQ8x6THfUB1m4Ux1n2zapbr42S19wSNQnbdFnYj+cZLjkHMtGSz5h7EYgc9kuXgzt
	IfWNW/kNjW14HcENOX2qbERU/JlOW0fbEuKeaGDwIPUXm3Iv+I5Orp5EluPork92kqLp3cBYubBf3
	Ex7fl/a2DlxK9rg3rCRL5KHYivckg3hMdER86TMWJzJAOe57iWgbNMELTdPZ+b0ZiE3pJZH5HeDUl
	JVO8pg+w==;
Received: from localhost ([::1]:60944 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hQlLB-003gBh-Kc; Wed, 15 May 2019 04:16:29 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:46529) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hQlL6-003gBZ-Un
 for samba-technical@lists.samba.org; Wed, 15 May 2019 04:16:27 +0000
Received: by mail-pg1-x543.google.com with SMTP id t187so645119pgb.13
 for <samba-technical@lists.samba.org>; Tue, 14 May 2019 21:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BfF/cEY+63NPFeE0nnGTP5s2FRqzna+7ou7Ez1fHZIc=;
 b=HgZC3RTNLZvlm/5XzxJnHy0w0DoRXtA9hOhW/m7ICcJe6KpAsPYLSDbM/AfdyQIZCJ
 Zzp7n0ixLTO2jYKlR4aTa/tVxSc+DA9jyjnrJmqzY/6JhcAzthGuy50iS47h1yJmAIWc
 zJtCMEt1W7jhsXC+Vr41ryqdE9u17c6BDht6vir9NmO7wyneSyri/fo+vVl6VdhyaPSF
 CCbwAuzkWwcaQUCJf8a8j8vXj2YXGNWaKRbAJhTDIBxB8euBV30+K9y+mHurO2hwJlUH
 OlmmIIT5rHNLo3Z/k7KecfL3CQnY+czWLYCb/ZB6FZkDryiPUfLEGt7BEsj0tnAdy1N4
 Bd+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BfF/cEY+63NPFeE0nnGTP5s2FRqzna+7ou7Ez1fHZIc=;
 b=XXBzs96eYoIt0k6IuMTLYIeBwLkdvrSqea2ciWVLu34SutTgFPS76pdzBcMjuEvu59
 bKe1PHiXBQd7bndX/xk7pyFtSjhN68Q7VyfnP7nnkB1M/rBAfYh9eU8Osb/t+3KZjWyr
 zMvvKBzd/KT77QHRAVanZ6cBkad50NFunvtaJQQvHUg1eD++8oSmX4jMv/raSiyxohtI
 dnF8USGH9KiYZNEqC/q3huMixZeKagHPL8P7atN2/TGKi9Us2CvqFD7Dvk0oOrURXUle
 nC+jjBhQYGCtBiLBDQ9SAIFLN1zbSRHM6nRN6Y3wOKEwYf6q2Q8B5K4hTyH25GqCA6wm
 //Sw==
X-Gm-Message-State: APjAAAWISi3X89Hact+UNcDiTsOn8YH4Nw/B+CjTkQUd457PANCPJmh6
 sQWfHp4lzn8QWXfjO/VTlqhgev1PkDdIi29Ehjc=
X-Google-Smtp-Source: APXvYqy8nPnvB25D5BAaYVI6FfefnZ4fR45Aui9wsDJbBswv7PdAsPryss5lbt8sGLj3Q8NuYCkRq4fPmmMq9yOdyQE=
X-Received: by 2002:a63:570d:: with SMTP id l13mr42080517pgb.55.1557893777809; 
 Tue, 14 May 2019 21:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <1557806489-11272-1-git-send-email-longli@linuxonhyperv.com>
 <1557806489-11272-2-git-send-email-longli@linuxonhyperv.com>
In-Reply-To: <1557806489-11272-2-git-send-email-longli@linuxonhyperv.com>
Date: Tue, 14 May 2019 23:16:06 -0500
Message-ID: <CAH2r5ms4vU9PXceAemvzw2mQ1feTaKB_DbUHc72VZ8-Gb+X46A@mail.gmail.com>
Subject: Re: [PATCH 2/2] cifs:smbd Use the correct DMA direction when sending
 data
To: Long Li <longli@microsoft.com>
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

merged both patches into cifs-2.6.git for-next

On Mon, May 13, 2019 at 11:02 PM <longli@linuxonhyperv.com> wrote:
>
> From: Long Li <longli@microsoft.com>
>
> When sending data, use the DMA_TO_DEVICE to map buffers. Also log the number
> of requests in a compounding request from upper layer.
>
> Signed-off-by: Long Li <longli@microsoft.com>
> ---
>  fs/cifs/smbdirect.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/fs/cifs/smbdirect.c b/fs/cifs/smbdirect.c
> index 251ef1223206..caac37b1de8c 100644
> --- a/fs/cifs/smbdirect.c
> +++ b/fs/cifs/smbdirect.c
> @@ -903,7 +903,7 @@ static int smbd_create_header(struct smbd_connection *info,
>         request->sge[0].addr = ib_dma_map_single(info->id->device,
>                                                  (void *)packet,
>                                                  header_length,
> -                                                DMA_BIDIRECTIONAL);
> +                                                DMA_TO_DEVICE);
>         if (ib_dma_mapping_error(info->id->device, request->sge[0].addr)) {
>                 mempool_free(request, info->request_mempool);
>                 rc = -EIO;
> @@ -1005,7 +1005,7 @@ static int smbd_post_send_sgl(struct smbd_connection *info,
>         for_each_sg(sgl, sg, num_sgs, i) {
>                 request->sge[i+1].addr =
>                         ib_dma_map_page(info->id->device, sg_page(sg),
> -                              sg->offset, sg->length, DMA_BIDIRECTIONAL);
> +                              sg->offset, sg->length, DMA_TO_DEVICE);
>                 if (ib_dma_mapping_error(
>                                 info->id->device, request->sge[i+1].addr)) {
>                         rc = -EIO;
> @@ -2110,8 +2110,10 @@ int smbd_send(struct TCP_Server_Info *server,
>                 goto done;
>         }
>
> -       rqst_idx = 0;
> +       log_write(INFO, "num_rqst=%d total length=%u\n",
> +                       num_rqst, remaining_data_length);
>
> +       rqst_idx = 0;
>  next_rqst:
>         rqst = &rqst_array[rqst_idx];
>         iov = rqst->rq_iov;
> --
> 2.17.1
>


-- 
Thanks,

Steve

