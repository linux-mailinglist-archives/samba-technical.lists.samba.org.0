Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDB81FC90
	for <lists+samba-technical@lfdr.de>; Thu, 16 May 2019 00:27:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=BI+5XxI12X2lRwb6h4wr8dsiBHIzz/BpYGz/CVy4Mc4=; b=Qtj1Gjk0G4a0nDf64vTZd7vlRz
	vc0WiMYbEwM85inK4xHcWXr54vc65DxhW97Wl9as9ueKRv1F+ZJM9m3fu1XtOF12GAbhecI7y3LLa
	s+HNuAmZwNF9dWbtF+JVDMAA9f9IQZLK+6PwInEQTgqZhO48OMzeAUwHr8fKaT1+yxnKCtQQitLGs
	mWfFfsFbncsHbvgchOyECXvsKuqqd1dZJuwgvGpr5+ewBUKXqZcouOi3u+NIk99w/+dRLUWW/0LWa
	2Yv6yjNwKC3MgmC+xVXwtE7XqNMlfguJUekr0TM0pGnucZumAoM01rA88kkBZDn87CzhVxsZg36ek
	FRFuuDpg==;
Received: from localhost ([::1]:39590 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hR2M8-003snQ-DI; Wed, 15 May 2019 22:26:36 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:45120) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hR2M3-003snJ-BR
 for samba-technical@lists.samba.org; Wed, 15 May 2019 22:26:33 +0000
Received: by mail-lj1-x242.google.com with SMTP id r76so1207743lja.12
 for <samba-technical@lists.samba.org>; Wed, 15 May 2019 15:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BI+5XxI12X2lRwb6h4wr8dsiBHIzz/BpYGz/CVy4Mc4=;
 b=kASEZCAmJ6x7vfVCdxHXiPm2z4vZO3NkJuKAjvUA4di/S3kmxI7yJcUadArWTSGKpL
 flpaOZvsU32pP/7Oupuu67XHJecRHcSY8W+sbK1yM63am8jUQPDBuD9eUhQAUinAZkoO
 0ctD9R6ltTVnBaCyZcGERS7/qb08y+XNnSgSR9v7cAQi5VM9uAH3wQ23CkZ0vF2t8uN7
 e2AeHm7U0VtIm8kbJHlpFpq3m/yr7Zj7A/w3OoAuI8ZhqlI/AoQt9ngJ9v8JZBK5zbEH
 IP1yJo+yzcp+AqBlXM6uehBDbaaXDeWxGdYS3Gh7U/q2fNR5yHdFO0hmN0snP4NBVZjS
 KBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BI+5XxI12X2lRwb6h4wr8dsiBHIzz/BpYGz/CVy4Mc4=;
 b=W4IfeMHNC8Da/jUavdavCSW2hbVWPNAIPBfNilTTNuTpECMpKUQ0cVv+6uIVqaciU8
 8JO7ywHicdPNsmhi8qENjiOGuAjP3CL5j8N2dGukym5BDLB9HN+ISvYR7XFamoGqbwe1
 8xjlB9SpwbHe6XQ7CB5CQ2xhubchBU1Zw01G44Qsq9FEFZUGexc8KdJf7Z8LS2RHDYeV
 zACd0wxFY/qMnGDJ9GSkwtivYG4Ojzt2diIoEl1hbzMAxiaOfzTlwOES6eA1dvxEB2Yo
 bk+caVILHTdPCUGYhTiXQ25/ydbRKrC4yHMOrax1urE5UmOuaAn4IrLvF3AYr7Z3HP4W
 swKw==
X-Gm-Message-State: APjAAAW7VHSNPI6VVpq6n6JpMf8PTwzL/IXzvr1TM5HAR2Ka+TL67viB
 9b1qdomodc3Z/uvw9EAXATmfG6d46QRKYnXq6Q==
X-Google-Smtp-Source: APXvYqy4NdkTYy5zjAt5CzvxBa9Vv7mWMfLF8QYKz17MP7z6QNLaJDiFFildHcyL0EcxI/paLqlXCK7gCtFfTQHdphI=
X-Received: by 2002:a2e:994:: with SMTP id 142mr13721967ljj.192.1557959189767; 
 Wed, 15 May 2019 15:26:29 -0700 (PDT)
MIME-Version: 1.0
References: <1557954545-17831-1-git-send-email-longli@linuxonhyperv.com>
 <1557954545-17831-2-git-send-email-longli@linuxonhyperv.com>
In-Reply-To: <1557954545-17831-2-git-send-email-longli@linuxonhyperv.com>
Date: Wed, 15 May 2019 15:26:18 -0700
Message-ID: <CAKywueSxXB3av+4qhi07u2VCMmRPxXTiFBHc4kt5gdRQZQTJXQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] cifs: Allocate memory for all iovs in smb2_ioctl
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

=D1=81=D1=80, 15 =D0=BC=D0=B0=D1=8F 2019 =D0=B3. =D0=B2 14:10, <longli@linu=
xonhyperv.com>:
>
> From: Long Li <longli@microsoft.com>
>
> An IOCTL uses up to 2 iovs. The 1st iov is the command itself, the 2nd io=
v is
> optional data for that command. The 1st iov is always allocated on the he=
ap
> but the 2nd iov may point to a variable on the stack. This will trigger a=
n
> error when passing the 2nd iov for RDMA I/O.
>
> Fix this by allocating a buffer for the 2nd iov.
>
> Signed-off-by: Long Li <longli@microsoft.com>
> ---
>  fs/cifs/smb2pdu.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
> index 29f011d8d8e2..710ceb875161 100644
> --- a/fs/cifs/smb2pdu.c
> +++ b/fs/cifs/smb2pdu.c
> @@ -2538,11 +2538,25 @@ SMB2_ioctl_init(struct cifs_tcon *tcon, struct sm=
b_rqst *rqst,
>         struct kvec *iov =3D rqst->rq_iov;
>         unsigned int total_len;
>         int rc;
> +       char *in_data_buf;
>
>         rc =3D smb2_plain_req_init(SMB2_IOCTL, tcon, (void **) &req, &tot=
al_len);
>         if (rc)
>                 return rc;
>
> +       if (indatalen) {
> +               /*
> +                * indatalen is usually small at a couple of bytes max, s=
o
> +                * just allocate through generic pool
> +                */
> +               in_data_buf =3D kmalloc(indatalen, GFP_NOFS);
> +               if (!in_data_buf) {
> +                       cifs_small_buf_release(req);
> +                       return -ENOMEM;
> +               }
> +               memcpy(in_data_buf, in_data, indatalen);
> +       }
> +
>         req->CtlCode =3D cpu_to_le32(opcode);
>         req->PersistentFileId =3D persistent_fid;
>         req->VolatileFileId =3D volatile_fid;
> @@ -2563,7 +2577,7 @@ SMB2_ioctl_init(struct cifs_tcon *tcon, struct smb_=
rqst *rqst,
>                        cpu_to_le32(offsetof(struct smb2_ioctl_req, Buffer=
));
>                 rqst->rq_nvec =3D 2;
>                 iov[0].iov_len =3D total_len - 1;
> -               iov[1].iov_base =3D in_data;
> +               iov[1].iov_base =3D in_data_buf;
>                 iov[1].iov_len =3D indatalen;
>         } else {
>                 rqst->rq_nvec =3D 1;
> @@ -2605,8 +2619,11 @@ SMB2_ioctl_init(struct cifs_tcon *tcon, struct smb=
_rqst *rqst,
>  void
>  SMB2_ioctl_free(struct smb_rqst *rqst)
>  {
> -       if (rqst && rqst->rq_iov)
> +       if (rqst && rqst->rq_iov) {
>                 cifs_small_buf_release(rqst->rq_iov[0].iov_base); /* requ=
est */
> +               if (rqst->rq_iov[1].iov_len)
> +                       kfree(rqst->rq_iov[1].iov_base);
> +       }
>  }
>
>
> --
> 2.17.1
>

Looks correct.

Reviewed-by: Pavel Shilovsky <pshilov@microsoft.com>

--
Best regards,
Pavel Shilovsky

