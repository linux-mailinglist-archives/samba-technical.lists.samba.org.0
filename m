Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E825370537
	for <lists+samba-technical@lfdr.de>; Sat,  1 May 2021 06:02:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=f+4TWlII0PbWvuuYjwsLJfy5HRgAwAy4zrIJ50WY+RM=; b=PLEoKOELu1z99sXuc0+IUPxz/9
	Hj3mMrdE8myJ1P6PgR/3izg64ufaJBhYB5A30YaqOvOKkyvECXkPkKOYPlufmBShBa4vWAlbMcbc0
	uK8O+vO2+0iTWXCSLdNcmFowJfLexX0vPXHNFy1zfFbxUIrp7DfafJna2WI+hKkV4lQDhPMkUOP/s
	ESVvJG8uzdDvaw0fvg6G+4ajR5F+4v1h53SXUbRmQJ93U4DL+9CtmC+I7qZ9wzjykaAtAt7LwZB3w
	yDNpL5bjlNsWjupu4ZqLyi31/1ml2r9lQjuVcIVAujGaClRy6pLyVoMpdp36U/LGvS+IuqIGybetD
	6dKuSz0g==;
Received: from ip6-localhost ([::1]:50732 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lcgoG-00F63h-GA; Sat, 01 May 2021 04:00:52 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:40754) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lcgoB-00F63a-02
 for samba-technical@lists.samba.org; Sat, 01 May 2021 04:00:49 +0000
Received: by mail-ej1-x631.google.com with SMTP id n2so104956ejy.7
 for <samba-technical@lists.samba.org>; Fri, 30 Apr 2021 21:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f+4TWlII0PbWvuuYjwsLJfy5HRgAwAy4zrIJ50WY+RM=;
 b=c9SaLpULYfBmzVGURa4DgCSXYFu1J0yIp0cHmC0YWGkw1i7SuPlVXyz4apf6FQA+ci
 +kiuJgqMLNH7+vYpJH4TVOvWfDgFAv6B16ZrvfAGdBl07EuFShcaohCFb8RIMm1atFMk
 oHUbRNdRbaWcSh7/11xFzCCwg8rilVtoooXkc2kFtsidneaNx2Gu4zcYcSsEEre5USi0
 +bsJqro4n0G/Pzz2/QXwj30zSYZ4+TtWkpVEykNM6V9kohuwGn9RkrfLScmCbWFgIWFa
 7ImvqiMrWkjJkbZ+mGg9YRQs7b9gyZmaIld9iEMEyETmBeEjU/pCpk6BhSyevz8C4hPr
 6xtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f+4TWlII0PbWvuuYjwsLJfy5HRgAwAy4zrIJ50WY+RM=;
 b=YdQj/C3u6E+ccOOTdEq8PXDK1b3GADCFnuQKLk7MqQvZZOdm37mOzmk0/A9e51J3+a
 sCnoRIFJ/GWNDz55DeA35PUoxubz9SuU3M1Ji1kmWz/Qwj2xjizMB5VSXqPIqmrF3rLY
 DSuiKplkWiGLaShvU3dC9Qi03tefioLYiWsQUVXSse9kMM+VxIVILBmPhFgcpkNDOP5v
 sKWsE4TwMX0JQZc+FjEzNsZXZRqeetu45tx/jTCuTBdotkUGxB8+Q8Odu6kfF0o20KFs
 zWF2H+RnbFDz2EIIMd/3pWW2x5nAXaAjYCgKKvH7poNu7gWcRMIWIVZ1TPeDhegTGck4
 MhQw==
X-Gm-Message-State: AOAM5331Sh/DCQd/BTNWxFuSHFbPlWwazZEVTvMZ8drpN9lkB4fkZQtN
 6COVCpq0KJSnGYmiQXdwNI+ujjwMj20D2oQxTp4=
X-Google-Smtp-Source: ABdhPJxTHGzYASBgn9+0iE3W05IyhiRvJ6IiD+m2kK1d8o35rOxBRdIBuHVxE5pPSZfcqYoD09onAqvGoF9CuHnmnG8=
X-Received: by 2002:a17:907:7283:: with SMTP id
 dt3mr7440546ejc.47.1619841645258; 
 Fri, 30 Apr 2021 21:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5muN3rpUur8jSav=fJfnt_vuJhgOXxMeGmXvT3KvxbBU5w@mail.gmail.com>
In-Reply-To: <CAH2r5muN3rpUur8jSav=fJfnt_vuJhgOXxMeGmXvT3KvxbBU5w@mail.gmail.com>
Date: Sat, 1 May 2021 14:00:33 +1000
Message-ID: <CAN05THQzSCZwypBWg9YZAarjrsQ74qowp4Bneo3crW9FfqVqPA@mail.gmail.com>
Subject: Re: [PATCH] smb3.1.1: allow dumping GCM256 keys to improve debugging
 of encrypted shares
To: Steve French <smfrench@gmail.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 COMMON INTERNET FILE SYSTEM SERVER <linux-cifsd-devel@lists.sourceforge.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

These elements should probably be [32] and not
+ __u8 smb3encryptionkey[SMB3_ENC_DEC_KEY_SIZE];

Because this is now visible to userspace and we can not allow this to
ever change.
Because when GCM512 is eventually released, if we bump
SMB3_ENC_DEC_KEY_SIZE to a larger value we suddenly break userspace.


On Sat, May 1, 2021 at 8:20 AM Steve French <smfrench@gmail.com> wrote:
>
> Previously we were only able to dump CCM or GCM-128 keys (see "smbinfo
> keys" e.g.)
> to allow network debugging (e.g. wireshark) of mounts to SMB3.1.1 encrypted
> shares.  But with the addition of GCM-256 support, we have to be able to dump
> 32 byte instead of 16 byte keys which requires adding an additional ioctl
> for that.
>
> Signed-off-by: Steve French <stfrench@microsoft.com>
> ---
>  fs/cifs/cifs_ioctl.h | 19 +++++++++++++++++++
>  fs/cifs/ioctl.c      | 33 +++++++++++++++++++++++++++++++++
>  2 files changed, 52 insertions(+)
>
> diff --git a/fs/cifs/cifs_ioctl.h b/fs/cifs/cifs_ioctl.h
> index f262c64516bc..9f2ed9cccb08 100644
> --- a/fs/cifs/cifs_ioctl.h
> +++ b/fs/cifs/cifs_ioctl.h
> @@ -57,6 +57,12 @@ struct smb_query_info {
>   /* char buffer[]; */
>  } __packed;
>
> +/*
> + * Dumping the commonly used 16 byte (e.g. CCM and GCM128) keys still supported
> + * for backlevel compatibility, but is not sufficient for dumping the less
> + * frequently used GCM256 (32 byte) keys (see the newer "CIFS_DUMP_FULL_KEY"
> + * ioctl for dumping decryption info for GCM256 mounts)
> + */
>  struct smb3_key_debug_info {
>   __u64 Suid;
>   __u16 cipher_type;
> @@ -65,6 +71,18 @@ struct smb3_key_debug_info {
>   __u8 smb3decryptionkey[SMB3_SIGN_KEY_SIZE];
>  } __packed;
>
> +/*
> + * Dump full key (32 byte encrypt/decrypt keys instead of 16 bytes)
> + * is needed if GCM256 (stronger encryption) negotiated
> + */
> +struct smb3_full_key_debug_info {
> + __u64 Suid;
> + __u16 cipher_type;
> + __u8 auth_key[16]; /* SMB2_NTLMV2_SESSKEY_SIZE */
> + __u8 smb3encryptionkey[SMB3_ENC_DEC_KEY_SIZE];
> + __u8 smb3decryptionkey[SMB3_ENC_DEC_KEY_SIZE];
> +} __packed;
> +
>  struct smb3_notify {
>   __u32 completion_filter;
>   bool watch_tree;
> @@ -78,6 +96,7 @@ struct smb3_notify {
>  #define CIFS_QUERY_INFO _IOWR(CIFS_IOCTL_MAGIC, 7, struct smb_query_info)
>  #define CIFS_DUMP_KEY _IOWR(CIFS_IOCTL_MAGIC, 8, struct smb3_key_debug_info)
>  #define CIFS_IOC_NOTIFY _IOW(CIFS_IOCTL_MAGIC, 9, struct smb3_notify)
> +#define CIFS_DUMP_FULL_KEY _IOWR(CIFS_IOCTL_MAGIC, 10, struct
> smb3_full_key_debug_info)
>  #define CIFS_IOC_SHUTDOWN _IOR ('X', 125, __u32)
>
>  /*
> diff --git a/fs/cifs/ioctl.c b/fs/cifs/ioctl.c
> index ef41fa878793..e4321e2a27d2 100644
> --- a/fs/cifs/ioctl.c
> +++ b/fs/cifs/ioctl.c
> @@ -218,6 +218,7 @@ long cifs_ioctl(struct file *filep, unsigned int
> command, unsigned long arg)
>  {
>   struct inode *inode = file_inode(filep);
>   struct smb3_key_debug_info pkey_inf;
> + struct smb3_full_key_debug_info pfull_key_inf;
>   int rc = -ENOTTY; /* strange error - but the precedent */
>   unsigned int xid;
>   struct cifsFileInfo *pSMBFile = filep->private_data;
> @@ -354,6 +355,38 @@ long cifs_ioctl(struct file *filep, unsigned int
> command, unsigned long arg)
>   else
>   rc = 0;
>   break;
> + /*
> + * Dump full key (32 bytes instead of 16 bytes) is
> + * needed if GCM256 (stronger encryption) negotiated
> + */
> + case CIFS_DUMP_FULL_KEY:
> + if (pSMBFile == NULL)
> + break;
> + if (!capable(CAP_SYS_ADMIN)) {
> + rc = -EACCES;
> + break;
> + }
> +
> + tcon = tlink_tcon(pSMBFile->tlink);
> + if (!smb3_encryption_required(tcon)) {
> + rc = -EOPNOTSUPP;
> + break;
> + }
> + pfull_key_inf.cipher_type =
> + le16_to_cpu(tcon->ses->server->cipher_type);
> + pfull_key_inf.Suid = tcon->ses->Suid;
> + memcpy(pfull_key_inf.auth_key, tcon->ses->auth_key.response,
> + 16 /* SMB2_NTLMV2_SESSKEY_SIZE */);
> + memcpy(pfull_key_inf.smb3decryptionkey,
> +       tcon->ses->smb3decryptionkey, SMB3_ENC_DEC_KEY_SIZE);
> + memcpy(pfull_key_inf.smb3encryptionkey,
> +       tcon->ses->smb3encryptionkey, SMB3_ENC_DEC_KEY_SIZE);
> + if (copy_to_user((void __user *)arg, &pfull_key_inf,
> + sizeof(struct smb3_full_key_debug_info)))
> + rc = -EFAULT;
> + else
> + rc = 0;
> + break;
>   case CIFS_IOC_NOTIFY:
>   if (!S_ISDIR(inode->i_mode)) {
>   /* Notify can only be done on directories */
>
> --
> Thanks,
>
> Steve

