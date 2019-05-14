Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2D11E419
	for <lists+samba-technical@lfdr.de>; Tue, 14 May 2019 23:42:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=5m8suSOXj3rzby4LAxsQcSwGgLVkjYeR9u7Qjs8sKQk=; b=xeWaDfyim3M0bXNcPPszkqBN1v
	LERczY6jqeiY/MPZV8FYXo/BT9ebG9UO8hhf17O5rbb5xtTFps+Nvy7NgASbsfRlmOzyZSWPEPjQP
	wcPSE5pXqvicr9Jxuy4vTXql4lE9stOqG+t2Tez7PqT3l3RXLYe7kMv2eGFJVXU6NPMwIRIbnOdYr
	QHS03b6f0pZzy9uxLxKgCpCtdRdBpuVgIm0nMKi2slTMYauA7ZY7kRPdZzxCMfQGRngsm5a4X9L0c
	wHBXPqiXhrqYykq6FupvhIu1YUYMis75zE/BxVFkC0a8VJofQ4Dr059BDI7+fEvzvjWMCEjkuF3PM
	mzdhffrw==;
Received: from localhost ([::1]:57828 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hQfB1-003fMV-DL; Tue, 14 May 2019 21:41:35 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:35357) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hQfAx-003fLw-3A
 for samba-technical@lists.samba.org; Tue, 14 May 2019 21:41:33 +0000
Received: by mail-lj1-x241.google.com with SMTP id m20so631770lji.2
 for <samba-technical@lists.samba.org>; Tue, 14 May 2019 14:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5m8suSOXj3rzby4LAxsQcSwGgLVkjYeR9u7Qjs8sKQk=;
 b=c6TXiImMg/nQjL/P6h7bIbTERKpUGdYxZxwBURtDusJzfsXpEpr4/6fZP7DoX90W7B
 3EbUs92KZc+z7ty0fyBfxdWZZu9h5dc0Nfjwr2nYfYX0Wx1f5uZYyDgQ2IEDxc7Xg5y6
 A/nz3dgWLg1ARdFYUh/0tgCraZNtf90bA+I+1yXAlaUW0EPfW+zhXpiwU91nul396Noa
 7qQXWJfFmRC5367OU7GjG2jUOkBhowtMBQI5d9/KXkFkaTaDhQtq1HJnykRHbOLS5/Tm
 e93bIIxlm3Tqht5AHvjI4qWrglSR69H3mxvAOB7MeQAFOAZJPs2joxZIT+xXjnSj+LQk
 XlKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5m8suSOXj3rzby4LAxsQcSwGgLVkjYeR9u7Qjs8sKQk=;
 b=uXMDQ4V9kQ042MO0OaRHmyU0XTx3AbrkFRRWT8wu33QmqH3+4Je0mn/VrmxDXqic9E
 WgU+QINFgdN8qKL2OE3MPDvAl4nG+FrQ9/JGjByFRmwV7zlViOUuGloP+/lBSod/rNl3
 xIGsAMvTQVG4tBmjPtaAACVULb4kyeL3yTt0NMKSpRm56ZnfHJUybmNKlTqYNnMDaGzd
 UAnJXgALTTQLUMcGtC9TluV79RSTYb0N6mZcKEXyc/9oFTetuuWX8R2VZMFT0kFcX01g
 LvpB6Ut94QRyGaRexyj8Lel9Yg2eUCGmpV5ukPgEoOYNUjqCO0F2Y2DV/R8/XGVLhFGj
 wEEA==
X-Gm-Message-State: APjAAAVCTMMYCPnS87QU7zbytFteDEjn9Dx3GS0hDQoEFS3AgWybsRRO
 v+RWtRVA8gLWxFhuJIFF2AQDGToEl1bT8/XAeA==
X-Google-Smtp-Source: APXvYqzJfN5/jEVrICMKNKf1Gbk6t97scfit5Or0E0rGafJU60pSgkm96WWXDbFmc/eogZh3Ay8RlJQmxCehuE6fsIo=
X-Received: by 2002:a2e:994:: with SMTP id 142mr10090225ljj.192.1557870090361; 
 Tue, 14 May 2019 14:41:30 -0700 (PDT)
MIME-Version: 1.0
References: <1557806489-11272-1-git-send-email-longli@linuxonhyperv.com>
 <1557806489-11272-2-git-send-email-longli@linuxonhyperv.com>
In-Reply-To: <1557806489-11272-2-git-send-email-longli@linuxonhyperv.com>
Date: Tue, 14 May 2019 14:41:18 -0700
Message-ID: <CAKywueSKyttaG8h_OrFE-ZCvDy_QCRQkdKQmW7m2wtrJ+fsT6Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] cifs:smbd Use the correct DMA direction when sending
 data
To: Long Li <longli@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Pavel Shilovsky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Shilovsky <piastryyy@gmail.com>
Cc: Steve French <sfrench@samba.org>, linux-cifs <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

=D0=BF=D0=BD, 13 =D0=BC=D0=B0=D1=8F 2019 =D0=B3. =D0=B2 21:02, <longli@linu=
xonhyperv.com>:
>
> From: Long Li <longli@microsoft.com>
>
> When sending data, use the DMA_TO_DEVICE to map buffers. Also log the num=
ber
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
> @@ -903,7 +903,7 @@ static int smbd_create_header(struct smbd_connection =
*info,
>         request->sge[0].addr =3D ib_dma_map_single(info->id->device,
>                                                  (void *)packet,
>                                                  header_length,
> -                                                DMA_BIDIRECTIONAL);
> +                                                DMA_TO_DEVICE);
>         if (ib_dma_mapping_error(info->id->device, request->sge[0].addr))=
 {
>                 mempool_free(request, info->request_mempool);
>                 rc =3D -EIO;
> @@ -1005,7 +1005,7 @@ static int smbd_post_send_sgl(struct smbd_connectio=
n *info,
>         for_each_sg(sgl, sg, num_sgs, i) {
>                 request->sge[i+1].addr =3D
>                         ib_dma_map_page(info->id->device, sg_page(sg),
> -                              sg->offset, sg->length, DMA_BIDIRECTIONAL)=
;
> +                              sg->offset, sg->length, DMA_TO_DEVICE);
>                 if (ib_dma_mapping_error(
>                                 info->id->device, request->sge[i+1].addr)=
) {
>                         rc =3D -EIO;
> @@ -2110,8 +2110,10 @@ int smbd_send(struct TCP_Server_Info *server,
>                 goto done;
>         }
>
> -       rqst_idx =3D 0;
> +       log_write(INFO, "num_rqst=3D%d total length=3D%u\n",
> +                       num_rqst, remaining_data_length);
>
> +       rqst_idx =3D 0;
>  next_rqst:
>         rqst =3D &rqst_array[rqst_idx];
>         iov =3D rqst->rq_iov;
> --
> 2.17.1
>

Acked-by: Pavel Shilovsky <pshilov@microsoft.com>

--
Best regards,
Pavel Shilovsky

