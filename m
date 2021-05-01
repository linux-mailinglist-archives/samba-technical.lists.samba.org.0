Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0D93708F4
	for <lists+samba-technical@lfdr.de>; Sat,  1 May 2021 22:50:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=qXdYuOz2TSzmNOz3Svbp51VQOzryV4mpau4B6pSG3Yo=; b=YeOE8dplkohS35pndIwPg9dUk8
	b+N+kHr+oLssFI8nifBdS3yNpoKUXYjycPz66iqaouXwOHuUx6omw7GOD9h9oU6cRKKJylxhJk8hy
	hf4gZI3ouBWehdVMfy2mSMVQKBF13CQ6zJTxwadYLhfEgzwPFEGGqDeLgpNzQ/CaD7ED7qarXQFa6
	+jteq2MiAiui3XVjhBDimraQfYnfKR8//YxW9Phymv7NP//SH5h7jOG1ZEhut5bOwwLRq6HSs/bmg
	Ak9WcXhCFtg2q0SKcq50h9R5+sBtw1gYM0UE+q5Hsxf7/GUEvVMbDG6kOSSgU9UMXGANgYbJyPp4n
	MsImJ7rQ==;
Received: from ip6-localhost ([::1]:55302 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lcwYh-00FEy3-RO; Sat, 01 May 2021 20:49:51 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:44784) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lcwYc-00FExw-HE
 for samba-technical@lists.samba.org; Sat, 01 May 2021 20:49:49 +0000
Received: by mail-ed1-x52a.google.com with SMTP id bf4so1960918edb.11
 for <samba-technical@lists.samba.org>; Sat, 01 May 2021 13:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qXdYuOz2TSzmNOz3Svbp51VQOzryV4mpau4B6pSG3Yo=;
 b=FU8q9BT1X0YgGy/bZoA2du06OmQVoLkj9dkO+NLm2ejMl2KWGSZ1VWYLtP7OL3T+Jv
 SbkLFK+och/zSZ4Afa/VbPhg4bSOuMPowH3K/uu+QdjpzS4cpeWCFXkLcFXp8EPbJ5YC
 9Y/uZXpa4vTQOrBHOKPFvv64gG4LTv/3iLCf++JOSy4nQICgcfdm9RvrKM4v3GhPl1Hq
 dLW9XiQ1gA6ZqdUZflVycS7iPn+xCR9uc5c7Bso+2Gh9qTk/3nZjG8s4Bu5Vb7yzgbt9
 nV7f2pE7pYWt9c0pRqgy9Ts0hBmRNoQFGOESI7oBEvzdlPBNL2seu+9tk0kMfdMJ9R0I
 DuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qXdYuOz2TSzmNOz3Svbp51VQOzryV4mpau4B6pSG3Yo=;
 b=EEzvOeobLODDxdbIgmGgk4f7/ZUVnmBQ0Uan8NCeuaQcaU/oZfVcUqJ1GP5ZtmUSKo
 JkZSPutCF43ZjCXafdztClcQZSEdZAFAv4qa3EehRAoyO4BQiYD8OUDoXD/gug9Bb/4V
 Pcj8Xge+D5EGqtPq57W5onOapi4sSxXOJicHS0eMEKfpI6bpkM1dGIrY/vfRXIN04SzC
 HwhsCLLJecgTkQbGiquMThHXkYGplG2p3YxdpA+7VJTZVgxNDMVw2hG+QaNQR/Pi+GCk
 fetIw8mBJmyf9xcaevT3u85i4eOkFqpj/yrJJSdCihSXufba3153+CbKBtXcmWmiF2Kq
 KQ1w==
X-Gm-Message-State: AOAM532UI0QVNUqhT65s4gPzmscqH4kbjgRdDlxhNHEsjHXBzJNyMcpF
 6gJa816HkP0ddohUS4gA0fd5PgrScQ2moKHeapY=
X-Google-Smtp-Source: ABdhPJySGmehGrxTuuyVQhDG1j4m87N4RpsqPC7dEu2rLfv9YLachSg7TLVFAye+GXqsbT6M+8Iv3g58kpPdcj2HE8c=
X-Received: by 2002:aa7:d88d:: with SMTP id u13mr2778567edq.114.1619902184375; 
 Sat, 01 May 2021 13:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5muN3rpUur8jSav=fJfnt_vuJhgOXxMeGmXvT3KvxbBU5w@mail.gmail.com>
 <CAN05THQzSCZwypBWg9YZAarjrsQ74qowp4Bneo3crW9FfqVqPA@mail.gmail.com>
 <CAH2r5muu3YiBAk1Mf_xOFQJih8Ms7sQhNUKwUrFreggK-Mmr-A@mail.gmail.com>
 <CANT5p=rGGNdVjBSTZm1OsecEW=-5edZhZwBjSU1Q8d8dO+JsPA@mail.gmail.com>
In-Reply-To: <CANT5p=rGGNdVjBSTZm1OsecEW=-5edZhZwBjSU1Q8d8dO+JsPA@mail.gmail.com>
Date: Sun, 2 May 2021 06:49:30 +1000
Message-ID: <CAN05THTmZCNXsH4_i=0CO6CaVOYuZ=z5XHW+U_=q3Djxz6XxBA@mail.gmail.com>
Subject: Re: [PATCH] smb3.1.1: allow dumping GCM256 keys to improve debugging
 of encrypted shares
To: Shyam Prasad N <nspmangalore@gmail.com>
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
Cc: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 COMMON INTERNET FILE SYSTEM SERVER <linux-cifsd-devel@lists.sourceforge.net>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, May 1, 2021 at 8:53 PM Shyam Prasad N <nspmangalore@gmail.com> wrote:
>
> Looks good to me.
>
> On a related note, we need a way for the root user to dump keys for
> another SMB session to the same path. This will be useful for
> mutli-user scenario.
> i.e. for dumping keys for SMB session as another user.
> Since we're adding a new IOCTL, perhaps we should add another arg
> which identifies the user? Maybe based on the UID:GID of the user
> session, in addition to the path supplied?

Or as an alternative, dump an array of ALL user sessions with
information about which user and which part of a multi-channel
connection that the keys belong to.
And let userspace sort out "which keys do I need for my wireshark session".

>
> Regards,
> Shyam
>
> On Sat, May 1, 2021 at 9:49 AM Steve French <smfrench@gmail.com> wrote:
> >
> > changed as suggested - see attached
> >
> > On Fri, Apr 30, 2021 at 11:00 PM ronnie sahlberg
> > <ronniesahlberg@gmail.com> wrote:
> > >
> > > These elements should probably be [32] and not
> > > + __u8 smb3encryptionkey[SMB3_ENC_DEC_KEY_SIZE];
> > >
> > > Because this is now visible to userspace and we can not allow this to
> > > ever change.
> > > Because when GCM512 is eventually released, if we bump
> > > SMB3_ENC_DEC_KEY_SIZE to a larger value we suddenly break userspace.
> > >
> > >
> > > On Sat, May 1, 2021 at 8:20 AM Steve French <smfrench@gmail.com> wrote:
> > > >
> > > > Previously we were only able to dump CCM or GCM-128 keys (see "smbinfo
> > > > keys" e.g.)
> > > > to allow network debugging (e.g. wireshark) of mounts to SMB3.1.1 encrypted
> > > > shares.  But with the addition of GCM-256 support, we have to be able to dump
> > > > 32 byte instead of 16 byte keys which requires adding an additional ioctl
> > > > for that.
> > > >
> > > > Signed-off-by: Steve French <stfrench@microsoft.com>
> > > > ---
> > > >  fs/cifs/cifs_ioctl.h | 19 +++++++++++++++++++
> > > >  fs/cifs/ioctl.c      | 33 +++++++++++++++++++++++++++++++++
> > > >  2 files changed, 52 insertions(+)
> > > >
> > > > diff --git a/fs/cifs/cifs_ioctl.h b/fs/cifs/cifs_ioctl.h
> > > > index f262c64516bc..9f2ed9cccb08 100644
> > > > --- a/fs/cifs/cifs_ioctl.h
> > > > +++ b/fs/cifs/cifs_ioctl.h
> > > > @@ -57,6 +57,12 @@ struct smb_query_info {
> > > >   /* char buffer[]; */
> > > >  } __packed;
> > > >
> > > > +/*
> > > > + * Dumping the commonly used 16 byte (e.g. CCM and GCM128) keys still supported
> > > > + * for backlevel compatibility, but is not sufficient for dumping the less
> > > > + * frequently used GCM256 (32 byte) keys (see the newer "CIFS_DUMP_FULL_KEY"
> > > > + * ioctl for dumping decryption info for GCM256 mounts)
> > > > + */
> > > >  struct smb3_key_debug_info {
> > > >   __u64 Suid;
> > > >   __u16 cipher_type;
> > > > @@ -65,6 +71,18 @@ struct smb3_key_debug_info {
> > > >   __u8 smb3decryptionkey[SMB3_SIGN_KEY_SIZE];
> > > >  } __packed;
> > > >
> > > > +/*
> > > > + * Dump full key (32 byte encrypt/decrypt keys instead of 16 bytes)
> > > > + * is needed if GCM256 (stronger encryption) negotiated
> > > > + */
> > > > +struct smb3_full_key_debug_info {
> > > > + __u64 Suid;
> > > > + __u16 cipher_type;
> > > > + __u8 auth_key[16]; /* SMB2_NTLMV2_SESSKEY_SIZE */
> > > > + __u8 smb3encryptionkey[SMB3_ENC_DEC_KEY_SIZE];
> > > > + __u8 smb3decryptionkey[SMB3_ENC_DEC_KEY_SIZE];
> > > > +} __packed;
> > > > +
> > > >  struct smb3_notify {
> > > >   __u32 completion_filter;
> > > >   bool watch_tree;
> > > > @@ -78,6 +96,7 @@ struct smb3_notify {
> > > >  #define CIFS_QUERY_INFO _IOWR(CIFS_IOCTL_MAGIC, 7, struct smb_query_info)
> > > >  #define CIFS_DUMP_KEY _IOWR(CIFS_IOCTL_MAGIC, 8, struct smb3_key_debug_info)
> > > >  #define CIFS_IOC_NOTIFY _IOW(CIFS_IOCTL_MAGIC, 9, struct smb3_notify)
> > > > +#define CIFS_DUMP_FULL_KEY _IOWR(CIFS_IOCTL_MAGIC, 10, struct
> > > > smb3_full_key_debug_info)
> > > >  #define CIFS_IOC_SHUTDOWN _IOR ('X', 125, __u32)
> > > >
> > > >  /*
> > > > diff --git a/fs/cifs/ioctl.c b/fs/cifs/ioctl.c
> > > > index ef41fa878793..e4321e2a27d2 100644
> > > > --- a/fs/cifs/ioctl.c
> > > > +++ b/fs/cifs/ioctl.c
> > > > @@ -218,6 +218,7 @@ long cifs_ioctl(struct file *filep, unsigned int
> > > > command, unsigned long arg)
> > > >  {
> > > >   struct inode *inode = file_inode(filep);
> > > >   struct smb3_key_debug_info pkey_inf;
> > > > + struct smb3_full_key_debug_info pfull_key_inf;
> > > >   int rc = -ENOTTY; /* strange error - but the precedent */
> > > >   unsigned int xid;
> > > >   struct cifsFileInfo *pSMBFile = filep->private_data;
> > > > @@ -354,6 +355,38 @@ long cifs_ioctl(struct file *filep, unsigned int
> > > > command, unsigned long arg)
> > > >   else
> > > >   rc = 0;
> > > >   break;
> > > > + /*
> > > > + * Dump full key (32 bytes instead of 16 bytes) is
> > > > + * needed if GCM256 (stronger encryption) negotiated
> > > > + */
> > > > + case CIFS_DUMP_FULL_KEY:
> > > > + if (pSMBFile == NULL)
> > > > + break;
> > > > + if (!capable(CAP_SYS_ADMIN)) {
> > > > + rc = -EACCES;
> > > > + break;
> > > > + }
> > > > +
> > > > + tcon = tlink_tcon(pSMBFile->tlink);
> > > > + if (!smb3_encryption_required(tcon)) {
> > > > + rc = -EOPNOTSUPP;
> > > > + break;
> > > > + }
> > > > + pfull_key_inf.cipher_type =
> > > > + le16_to_cpu(tcon->ses->server->cipher_type);
> > > > + pfull_key_inf.Suid = tcon->ses->Suid;
> > > > + memcpy(pfull_key_inf.auth_key, tcon->ses->auth_key.response,
> > > > + 16 /* SMB2_NTLMV2_SESSKEY_SIZE */);
> > > > + memcpy(pfull_key_inf.smb3decryptionkey,
> > > > +       tcon->ses->smb3decryptionkey, SMB3_ENC_DEC_KEY_SIZE);
> > > > + memcpy(pfull_key_inf.smb3encryptionkey,
> > > > +       tcon->ses->smb3encryptionkey, SMB3_ENC_DEC_KEY_SIZE);
> > > > + if (copy_to_user((void __user *)arg, &pfull_key_inf,
> > > > + sizeof(struct smb3_full_key_debug_info)))
> > > > + rc = -EFAULT;
> > > > + else
> > > > + rc = 0;
> > > > + break;
> > > >   case CIFS_IOC_NOTIFY:
> > > >   if (!S_ISDIR(inode->i_mode)) {
> > > >   /* Notify can only be done on directories */
> > > >
> > > > --
> > > > Thanks,
> > > >
> > > > Steve
> >
> >
> >
> > --
> > Thanks,
> >
> > Steve
>
>
>
> --
> Regards,
> Shyam

