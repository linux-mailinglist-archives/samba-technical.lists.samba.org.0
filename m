Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E4433193588
	for <lists+samba-technical@lfdr.de>; Thu, 26 Mar 2020 03:02:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=4xp15kfS5NUhuffpTH0eDvjkAD1zDSgezpo7dNfleWM=; b=W/yfhfuIHxpmdU2uA2NIL/RM1m
	OzKnlyjh7BgQOkjzHE8kMXguYqqELJtlea9GhkdUj5pUudyYg664Kv3QOnhjrRLztiT3wyJyO3S6T
	5uVBZpH2D/QZxjg0n6fhYj5U/P9hBuBc2e0dazT2/lz50l9WgeRYW8UWsQ6jC7EC0EOhU7sar+TKJ
	aAlvCf2977tYtuJEGiK1O27nkAu/WHb1S1dONj7iPwbiCSHnNrxt9KW2viYywJ/TdCUmCtAKNJdXp
	KChEAqGfOiX2xdcw8HDPDLywCchnvFxm4iYJScEFJPs5wpBMtH+MhEILCs8Pce0s4LZ6kCMJKzSuq
	lVkLLEOQ==;
Received: from localhost ([::1]:56166 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jHHqk-000jrW-TU; Thu, 26 Mar 2020 02:02:26 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:40547) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jHHqf-000jrP-PD
 for samba-technical@lists.samba.org; Thu, 26 Mar 2020 02:02:24 +0000
Received: by mail-io1-xd41.google.com with SMTP id k9so4496885iov.7
 for <samba-technical@lists.samba.org>; Wed, 25 Mar 2020 19:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4xp15kfS5NUhuffpTH0eDvjkAD1zDSgezpo7dNfleWM=;
 b=A470PTWmd3GEYYQ4A9YPKgbChJGyiY4F/5V6tcTy0Ga8tbBdJSYPz/yC1fvPflKC8t
 WT1IfvFT5UA8wR63Th2NKqY/PfnKZBL2AlVbiXDux3dX32OD+3x48cmCev8maPRSMctw
 fpJ2WGSxh3ZXObrhTsnQjWHPAF7jDOWQon21L1ZpOloI/0Aw7A7OxyIAFk6q9OCaypmO
 asZ8yswb5cUYK7ryzf6JBnfJ3G3zJWWwcZnMccr2dxbWr5hbvukhmq+Jj9Usat4VM6xk
 LZyyXwmJTzoZjDhXYwz4nKOePITfEIm/WUbVlGg86nkknSWbaIs5H5iqcDmYuBmLO+F7
 UoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4xp15kfS5NUhuffpTH0eDvjkAD1zDSgezpo7dNfleWM=;
 b=GSumNcmfvDcNsWMe1gmyXd4neUHCQ074z/JUt/rGasUMzSUqiZpNsOqN0Yi12L37wI
 l87WAhX3YsXQxnf7MAYuqIIp8plkdxZLq7r3fWlHqGTKn0Qov2L6+UWqyiQx55yRLWGQ
 iJIia2Xb9rPPZg07iTNM2h2aMAHZsAcanU+BAAy+KNFJCWTEngJmcH9ylrnSh4nmao1B
 o+3IpRyT0rU5IzjtuwDspsO+htKx6HYn1PfUl4prkPhAvLt+dTk0VM5K02x7I/07KJUG
 QKFSBe62dPkfGQdMVIrTcprdHEzdlyuJdIl2Yh6gYRpF7mKMpzwvgr2RePhQif7lLIcL
 t/Yg==
X-Gm-Message-State: ANhLgQ3EYCdL+1yd6rnoY4jyQvA1mt3bNOoTI9aR5kMAFYam6/wUVL1V
 MsJR/KF2ONIjKeA+xkXnwC1HDRU18C3AT7ruqpU=
X-Google-Smtp-Source: ADFU+vucW6te80eivq0ZUfTKnqSxSc1+eL3rS9tLJ0yst4sgacQvScGP8hbBJX3hkuA0Xv/JiphAaGlq1hTtVpSHdco=
X-Received: by 2002:a05:6638:a99:: with SMTP id
 25mr5874582jas.37.1585188137103; 
 Wed, 25 Mar 2020 19:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <1585164614-123696-1-git-send-email-longli@linuxonhyperv.com>
In-Reply-To: <1585164614-123696-1-git-send-email-longli@linuxonhyperv.com>
Date: Thu, 26 Mar 2020 12:02:05 +1000
Message-ID: <CAN05THTH8-pK9uw77COWSUQ_knztT1o1Ms0b=2PPvmBJd=ovUw@mail.gmail.com>
Subject: Re: [PATCH] cifs: smbd: Calculate the correct maximum packet size for
 segmented SMBDirect send/receive
To: Long Li <longli@microsoft.com>
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
Cc: Steve French <sfrench@samba.org>, linux-cifs <linux-cifs@vger.kernel.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, longli@linuxonhyperv.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Long Li,

Mostly looks good  but the magic constant 49 I think is wrong.
49 is the structure size of the read/write request header
but for these sizes, if they are odd it just means that the header contain a
variable sized blob.
I.e. the size is 48 bytes (for the fixed part of the header) + a variable part
which in this case are the ChannelInfo blobs.

So we should probably add to smb2pdu.h a
#define MAX_SMB2_READWRITE_RESPONSE_SIZE 48
and use this in the calculations. Then we need to add the maximum size
we will use for ChannelInfo.

Maybe we should have a define also for the MAX_SMB2_CHANNEL_INFO_SIZE

regards
ronnie sahlberg

On Thu, Mar 26, 2020 at 5:31 AM longli--- via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> From: Long Li <longli@microsoft.com>
>
> The packet size needs to take account of SMB2 header size and possible
> encryption header size. This is only done when signing is used and it is for
> RDMA send/receive, not read/write.
>
> Also remove the dead SMBD code in smb2_negotiate_r(w)size.
>
> Signed-off-by: Long Li <longli@microsoft.com>
> ---
>  fs/cifs/smb2ops.c   | 38 ++++++++++++++++----------------------
>  fs/cifs/smbdirect.c |  3 +--
>  2 files changed, 17 insertions(+), 24 deletions(-)
>
> diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
> index 4c0922596467..9043d34eef43 100644
> --- a/fs/cifs/smb2ops.c
> +++ b/fs/cifs/smb2ops.c
> @@ -332,16 +332,6 @@ smb2_negotiate_wsize(struct cifs_tcon *tcon, struct smb_vol *volume_info)
>         /* start with specified wsize, or default */
>         wsize = volume_info->wsize ? volume_info->wsize : CIFS_DEFAULT_IOSIZE;
>         wsize = min_t(unsigned int, wsize, server->max_write);
> -#ifdef CONFIG_CIFS_SMB_DIRECT
> -       if (server->rdma) {
> -               if (server->sign)
> -                       wsize = min_t(unsigned int,
> -                               wsize, server->smbd_conn->max_fragmented_send_size);
> -               else
> -                       wsize = min_t(unsigned int,
> -                               wsize, server->smbd_conn->max_readwrite_size);
> -       }
> -#endif
>         if (!(server->capabilities & SMB2_GLOBAL_CAP_LARGE_MTU))
>                 wsize = min_t(unsigned int, wsize, SMB2_MAX_BUFFER_SIZE);
>
> @@ -360,8 +350,15 @@ smb3_negotiate_wsize(struct cifs_tcon *tcon, struct smb_vol *volume_info)
>  #ifdef CONFIG_CIFS_SMB_DIRECT
>         if (server->rdma) {
>                 if (server->sign)
> +                       /*
> +                        * Account for SMB2 data transfer packet header
> +                        * SMB2_READ/SMB2_WRITE (49) and possible encryption
> +                        * headers
> +                        */
>                         wsize = min_t(unsigned int,
> -                               wsize, server->smbd_conn->max_fragmented_send_size);
> +                               wsize,
> +                               server->smbd_conn->max_fragmented_send_size -
> +                                       49 - sizeof(struct smb2_transform_hdr));
>                 else
>                         wsize = min_t(unsigned int,
>                                 wsize, server->smbd_conn->max_readwrite_size);
> @@ -382,16 +379,6 @@ smb2_negotiate_rsize(struct cifs_tcon *tcon, struct smb_vol *volume_info)
>         /* start with specified rsize, or default */
>         rsize = volume_info->rsize ? volume_info->rsize : CIFS_DEFAULT_IOSIZE;
>         rsize = min_t(unsigned int, rsize, server->max_read);
> -#ifdef CONFIG_CIFS_SMB_DIRECT
> -       if (server->rdma) {
> -               if (server->sign)
> -                       rsize = min_t(unsigned int,
> -                               rsize, server->smbd_conn->max_fragmented_recv_size);
> -               else
> -                       rsize = min_t(unsigned int,
> -                               rsize, server->smbd_conn->max_readwrite_size);
> -       }
> -#endif
>
>         if (!(server->capabilities & SMB2_GLOBAL_CAP_LARGE_MTU))
>                 rsize = min_t(unsigned int, rsize, SMB2_MAX_BUFFER_SIZE);
> @@ -411,8 +398,15 @@ smb3_negotiate_rsize(struct cifs_tcon *tcon, struct smb_vol *volume_info)
>  #ifdef CONFIG_CIFS_SMB_DIRECT
>         if (server->rdma) {
>                 if (server->sign)
> +                       /*
> +                        * Account for SMB2 data transfer packet header
> +                        * SMB2_READ/SMB2_WRITE (49) and possible encryption
> +                        * headers
> +                        */
>                         rsize = min_t(unsigned int,
> -                               rsize, server->smbd_conn->max_fragmented_recv_size);
> +                               rsize,
> +                               server->smbd_conn->max_fragmented_recv_size -
> +                                       49 - sizeof(struct smb2_transform_hdr));
>                 else
>                         rsize = min_t(unsigned int,
>                                 rsize, server->smbd_conn->max_readwrite_size);
> diff --git a/fs/cifs/smbdirect.c b/fs/cifs/smbdirect.c
> index eb1e40af9f3a..0327b575ab87 100644
> --- a/fs/cifs/smbdirect.c
> +++ b/fs/cifs/smbdirect.c
> @@ -2097,8 +2097,7 @@ int smbd_send(struct TCP_Server_Info *server,
>         for (i = 0; i < num_rqst; i++)
>                 remaining_data_length += smb_rqst_len(server, &rqst_array[i]);
>
> -       if (remaining_data_length + sizeof(struct smbd_data_transfer) >
> -               info->max_fragmented_send_size) {
> +       if (remaining_data_length > info->max_fragmented_send_size) {
>                 log_write(ERR, "payload size %d > max size %d\n",
>                         remaining_data_length, info->max_fragmented_send_size);
>                 rc = -EINVAL;
> --
> 2.17.1
>
>

