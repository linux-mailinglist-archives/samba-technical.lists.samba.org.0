Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C0B1FDD9
	for <lists+samba-technical@lfdr.de>; Thu, 16 May 2019 05:00:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=qVrC4Tuj5UyBfw+iLDxuy7o7a/GjCU+sQeQ56O5xCjQ=; b=fGorhUvkF4XH5VItop9SQuJ3HZ
	U9/DJIdys5bai0y6wszeh2ACedoll4pU+H7DyukCFNs4LCGggOegvxootKJFXaVTB72Vibxbbz4RG
	bbbPO9mUH5zD2tepDjP/RxfFe6/vP2N/R/Gq6a5ljpcFq1ajrMI0rbs+F7kFsdC2wEDnTgpp6GWmw
	tKhLo/eWWUN17Dhgq2w5eH2Umgq9iClD95gHUt/nGRbx6ebRzPpkxjAyLOEP6sJoHrXPBojCN+azI
	jPS8yUQuZoSpRlj/CuzAmtpz+Dc0QonmAUPe5En0EB+CZqA4LW+eCt+yNJNVighEbEDB04FkNiSdR
	tff0badw==;
Received: from localhost ([::1]:43308 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hR6bn-003tmB-6W; Thu, 16 May 2019 02:59:03 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:47076) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hR6bi-003tm4-Sz
 for samba-technical@lists.samba.org; Thu, 16 May 2019 02:59:01 +0000
Received: by mail-pf1-x444.google.com with SMTP id y11so999636pfm.13
 for <samba-technical@lists.samba.org>; Wed, 15 May 2019 19:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qVrC4Tuj5UyBfw+iLDxuy7o7a/GjCU+sQeQ56O5xCjQ=;
 b=LaQAxqZCNGuGalss7W1xQlG5JefFBkrDN10HKyh2spwpNBgqTvOPZgNCAutAgDzpeM
 +r+fmX3D+tXaLddhfWuPPtRA09IH5ammf47tHnMtSR3/V1MMiamRlU7VnG3hrIek4UTJ
 P91rkzAmcBfWR2ENrcgMu+jRl4r6jM6Jdb+RETJV0ETbowdW+CiT8OLW+DRAJFs6ELps
 sPx3nKjr8glEFVeYIldsdlF2Q/15kABE7VthyE5HA0Ba/r3JD9+2ZJaiQO6oWw2x4Li8
 EKo63JGHqnV9uzl/L6DcZ3PNbNS/qJepGawZX35aZ1bcjdIuKjrYSljZYgbnnurhTG8B
 LexA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qVrC4Tuj5UyBfw+iLDxuy7o7a/GjCU+sQeQ56O5xCjQ=;
 b=ANk816H3HlitiAcNCHGnH5L1nRHhMaevYfuze/g6OsLPPguLwk4Mi5ooNGO6m55h9S
 xli8Lb9y2630nqcE5b5xMLgOn0dryxPdtUDqfekLNipOrV5wup4vZkQAHntRVeUvO1Ts
 D8EM2aD9Bgc5vZ6bGvejvOOL0Jjk2qc7pLiaXKjjWZ7g5t1Np8B3pRCXMExJEQcmDspz
 CkldGZdu57rCu00UudacElhHpgS9HCa9rQurZC+YhkYk5siHh6bWdB3s6Y1P6TOQFji9
 /M9VjdORKeX3jWiGEM6jvFdx1VifXzGd1nYQnVETBSheqX3wWVK+XMB2Nf9ewp6gFWBk
 rHmw==
X-Gm-Message-State: APjAAAUIN0apdMeJMid4dIn0d6woqokfBT2XQKbbzItqPqlaNqECTK+/
 uB2WfTcW6QXsUjQwbsiKwlMTwG9eYcBpg5oa6+M=
X-Google-Smtp-Source: APXvYqzPP45QfONTxLmhLPzzS3LwtQ71ySL5Eq03qCl6oEFiGgB5qLoAzHBjErCqOL6EepJAuG0ngUNuM8CQI5krZO8=
X-Received: by 2002:a63:a55:: with SMTP id z21mr47828274pgk.440.1557975536152; 
 Wed, 15 May 2019 19:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <1557954545-17831-1-git-send-email-longli@linuxonhyperv.com>
 <1557954545-17831-2-git-send-email-longli@linuxonhyperv.com>
In-Reply-To: <1557954545-17831-2-git-send-email-longli@linuxonhyperv.com>
Date: Wed, 15 May 2019 21:58:44 -0500
Message-ID: <CAH2r5muSfofEKamfz2GrL3gTrwiR7Ek-gT_f1YapOzsh7Tbb+w@mail.gmail.com>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Wed, May 15, 2019 at 4:10 PM <longli@linuxonhyperv.com> wrote:
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
> +       }
>  }
>
>
> --
> 2.17.1
>


-- 
Thanks,

Steve

