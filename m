Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 636851FCB1
	for <lists+samba-technical@lfdr.de>; Thu, 16 May 2019 01:12:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=cN3+Ygjn4FIdAipa5bUqsDEqVVhDGW46hPCnToLIxo4=; b=j0TGCEq7iRh7iHcaAtILJXGmst
	x5GHc/5VDDYzUzYJTEtM5oTRnxWanXoHJJ3HbjwKSM1TpkPN5aVz9wkFJJAqHddz8pMfsz5L2NinF
	K9HhETgQB0oL6Yaydi42M0G5DYiySnyIFmcrFHPd0iNC8v5cE/XcA9YiDcUJPfDZgstJ5/W+Rc9Rb
	CHDsryms8B68tSM8XirHdJFNz+ufkIx9DGPPXgfoLWv4aBsPJ8RMz6lO35GihJKpHce7Q1X1jWNUs
	qVKALGmfHHmmh+Mkw2zzflfl+8tVJub/bE7VPMW0T8bhFNNvIWniNSwfCO8OSMq+1uGFoALeSwv2g
	//AmyI/g==;
Received: from localhost ([::1]:40662 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hR33u-003t2r-8u; Wed, 15 May 2019 23:11:50 +0000
Received: from mail-it1-x142.google.com ([2607:f8b0:4864:20::142]:54539) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hR33p-003t2k-ET
 for samba-technical@lists.samba.org; Wed, 15 May 2019 23:11:47 +0000
Received: by mail-it1-x142.google.com with SMTP id a190so3006525ite.4
 for <samba-technical@lists.samba.org>; Wed, 15 May 2019 16:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cN3+Ygjn4FIdAipa5bUqsDEqVVhDGW46hPCnToLIxo4=;
 b=WygKCYcnp10z8Ruf7KIWgzGuHed1D/DN7EURO6AsVIXU5Gi5ulDpcHEf5dneDB0szJ
 XQLyWhxBOaoOVQMY1CuvkH5pUV1kL64SZguQ9b9f8KR9d1feJIPm/3hwgutvH4ArY1nD
 biBIJCE+DRRQ1V4H7DN931zb56/DU+MCDYGhy8iXQ9sgPFdlFgb4us9e1hSspr58dyN7
 Nf6FAxEIOEiawAK32P8OMVdgPnQ4OhevuQ/ZO+UzYSzvAmiUhBf1Eh69QpOMcTt1CZcU
 cwQ4Iyy9kh6Zwf+KaWhpgYFa7KsLfzhdv5UNmmuG0mBATqy6+lGf/ESHygMbZ959tvpb
 v5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cN3+Ygjn4FIdAipa5bUqsDEqVVhDGW46hPCnToLIxo4=;
 b=TaLvIYEShWIkHxrCLCX1e9ASBY8XXI/+o1pPxzJ+eEUjYo+OieL66zLP67X4/GCkpo
 VLDRlulcp4eieDYNIlZS6iosHpA9z+9oLniefKmxzbwjmwE5NyTmnZbKyCd+NUjsflNr
 kLnmNoL6IMwyl9A3rjyCkfiYgGQQMd8SZJZhDa7Z5RJHcjmwmWTKs9z1cTj3IkSyETsA
 /VdRM4DgdKANhDuHtb2oiyQhHXeTO74HUHtq82RwX4quUTj/r7GKQcZssnzFFI8DR484
 eV3J6ZK7uqlrvowfb8E1e+oKb6iu+0nOzK4Sws/gU19VCTDvSHJ9VDl8fuSLrBFmS8t1
 FBTw==
X-Gm-Message-State: APjAAAUTV79rVSw0K/TfiFCIq4/NnYi6Z3a5hOCR7z8IZHXynwwRZ633
 jAu+bp4EoCA8Gal8plm1RMRhyl4F8kZMc9aEBts=
X-Google-Smtp-Source: APXvYqycWgySzDHc20+yTvOMmVS6nuQ8hTsHDl682JxKLCfUYs7sznmDxHdhjWmszO0bPpBoXvKmc/qT/9UpNPtG5GE=
X-Received: by 2002:a05:660c:8c6:: with SMTP id
 g6mr4171191itl.17.1557961903672; 
 Wed, 15 May 2019 16:11:43 -0700 (PDT)
MIME-Version: 1.0
References: <1557954545-17831-1-git-send-email-longli@linuxonhyperv.com>
 <1557954545-17831-2-git-send-email-longli@linuxonhyperv.com>
In-Reply-To: <1557954545-17831-2-git-send-email-longli@linuxonhyperv.com>
Date: Thu, 16 May 2019 09:11:32 +1000
Message-ID: <CAN05THR1VL6W2YJSeNdOsWpM1r7PhMESyzJYSgjZD7=bSFvY+Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] cifs: Allocate memory for all iovs in smb2_ioctl
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: Steve French <sfrench@samba.org>, linux-cifs <linux-cifs@vger.kernel.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, May 16, 2019 at 7:10 AM <longli@linuxonhyperv.com> wrote:
>
> From: Long Li <longli@microsoft.com>
>
> An IOCTL uses up to 2 iovs. The 1st iov is the command itself, the 2nd iov is
> optional data for that command. The 1st iov is always allocated on the heap
> but the 2nd iov may point to a variable on the stack. This will trigger an
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
> @@ -2538,11 +2538,25 @@ SMB2_ioctl_init(struct cifs_tcon *tcon, struct smb_rqst *rqst,
>         struct kvec *iov = rqst->rq_iov;
>         unsigned int total_len;
>         int rc;
> +       char *in_data_buf;
>
>         rc = smb2_plain_req_init(SMB2_IOCTL, tcon, (void **) &req, &total_len);
>         if (rc)
>                 return rc;
>
> +       if (indatalen) {
> +               /*
> +                * indatalen is usually small at a couple of bytes max, so
> +                * just allocate through generic pool
> +                */
> +               in_data_buf = kmalloc(indatalen, GFP_NOFS);
> +               if (!in_data_buf) {
> +                       cifs_small_buf_release(req);
> +                       return -ENOMEM;
> +               }
> +               memcpy(in_data_buf, in_data, indatalen);
> +       }
> +
>         req->CtlCode = cpu_to_le32(opcode);
>         req->PersistentFileId = persistent_fid;
>         req->VolatileFileId = volatile_fid;
> @@ -2563,7 +2577,7 @@ SMB2_ioctl_init(struct cifs_tcon *tcon, struct smb_rqst *rqst,
>                        cpu_to_le32(offsetof(struct smb2_ioctl_req, Buffer));
>                 rqst->rq_nvec = 2;
>                 iov[0].iov_len = total_len - 1;
> -               iov[1].iov_base = in_data;
> +               iov[1].iov_base = in_data_buf;
>                 iov[1].iov_len = indatalen;
>         } else {
>                 rqst->rq_nvec = 1;
> @@ -2605,8 +2619,11 @@ SMB2_ioctl_init(struct cifs_tcon *tcon, struct smb_rqst *rqst,
>  void
>  SMB2_ioctl_free(struct smb_rqst *rqst)
>  {
> -       if (rqst && rqst->rq_iov)
> +       if (rqst && rqst->rq_iov) {
>                 cifs_small_buf_release(rqst->rq_iov[0].iov_base); /* request */
> +               if (rqst->rq_iov[1].iov_len)
> +                       kfree(rqst->rq_iov[1].iov_base);

You don't need the conditional. kfree(NULL) is safe,.

> +       }
>  }
>
>
> --
> 2.17.1
>

Reviewed-by: Ronnie sahlberg <lsahlber@redhat.com>

