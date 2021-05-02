Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C083709CC
	for <lists+samba-technical@lfdr.de>; Sun,  2 May 2021 06:07:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=d3Mx25mIfY/NWQQXEqlAycCuo/zi3tJ4++mdSAEETq0=; b=k6t2Z62mg3jXaO/WojUsr3kR6C
	9U82NldkpV11FE1rL+8fG0X0PzU+phtOii7qW35pY+Mx3mC6hZRdJXtjM6t2IWkm/RKgNFlIC1ukA
	O1ytzx4Gs9/8rEi1nAGBFTDhh29LYWURdX7E45eDkWzYlNqrKpSPTopxgp5kB2yz61ers6OWWieSR
	R7FkuUAW+9V8EK+M8MYnbHIH073Ty1Zj3lDhXHuBMkgw8kYIkjnacDjFT7aZ/HhLcI4DMM2MaNZuU
	MH6pL+Qii4k0OR0VVxXQXMYVJeG7EmlBTKboFyaay5tGhDs2Ixl6MvcmRx86StWUBAElbCbNYBZG6
	xu2x48tg==;
Received: from ip6-localhost ([::1]:56250 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ld3Ms-00FFnc-FE; Sun, 02 May 2021 04:06:06 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:42697) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ld3Mm-00FFnV-Rw
 for samba-technical@lists.samba.org; Sun, 02 May 2021 04:06:03 +0000
Received: by mail-lf1-x132.google.com with SMTP id c11so3134226lfi.9
 for <samba-technical@lists.samba.org>; Sat, 01 May 2021 21:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d3Mx25mIfY/NWQQXEqlAycCuo/zi3tJ4++mdSAEETq0=;
 b=rAn88flmBrpuNZW+vCLhNf7UUbnNkxqGOgoVmkpBh8OJpK3DxGKscjdYnj4+70R4+4
 M2sepISORmBq2TcxoBlYR4OVy/SHsQPdZmF9/V15kXLh/UOukI/wK1lHjYD3PHSxrIR8
 ecut88yQ5oncNywlSEdQTAJ6kRiBOKt0GYcarId82uCb6u7nYS0JOvWYzc/64yf4wBqz
 66Qc9Eklt1CTsxRMS1bQpLrikBsw5aXzjT6Vf619Js3wJWdLmThtiejO6DLkEPBH2q8j
 W9fd/O+zU0OXVbJH1G7C9tryk60NnRLumkbLz287q4DH4/gacsRRZ7n1Wcv6FV75z9k5
 6iXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d3Mx25mIfY/NWQQXEqlAycCuo/zi3tJ4++mdSAEETq0=;
 b=d6f4iyEknJoQPGYz8WVS5irdwV7qDRR0E8yOk0gPRvoklnSnctzt8bxRU3kWDQHApo
 7vDhLRiDVYv2dYo4Zi4zcxNOp3otGEr2hmPrz+LKE1fgZLSO4dgwtiOPfWM7/6iwwsw4
 VacTxGgN6/giBNGIh8qDTqQV5nGZ9OlyCdDlQub7PwTGe667Y3vIH4KVyd9iVb2pVaMk
 asKbo1seQLm23KysIYDemfeVgvcprMdvk2ackhbK6gozyuLFPreFoWoJdenzuow2Lmzn
 fDc0z2uR8fbvRHoJ6aTaEzDqS8YLNVFtoVha4h4V+Us5sFtDlhckFwWbTyZ0WzAOFZDi
 3/lw==
X-Gm-Message-State: AOAM532oCAt1aChVy5nWdHFC0AEdtqZakRo0C/bi2lx9I9JPd2MZ/cUM
 OIIAEQG8uvcoz3q2KN+mbCqAjlXXCWF8pEydClA=
X-Google-Smtp-Source: ABdhPJzmF0alC1S/wWz4TigdR5VYpPYghRpp9P8e6LVuqPsCihIIVnfxq9iWWni8MKS9OjYTXn66oiIgh/5r3U1V2gA=
X-Received: by 2002:a19:e21d:: with SMTP id z29mr4309446lfg.175.1619928357792; 
 Sat, 01 May 2021 21:05:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5muN3rpUur8jSav=fJfnt_vuJhgOXxMeGmXvT3KvxbBU5w@mail.gmail.com>
 <CAN05THQzSCZwypBWg9YZAarjrsQ74qowp4Bneo3crW9FfqVqPA@mail.gmail.com>
 <CAH2r5muu3YiBAk1Mf_xOFQJih8Ms7sQhNUKwUrFreggK-Mmr-A@mail.gmail.com>
 <CANT5p=rGGNdVjBSTZm1OsecEW=-5edZhZwBjSU1Q8d8dO+JsPA@mail.gmail.com>
 <CAN05THTmZCNXsH4_i=0CO6CaVOYuZ=z5XHW+U_=q3Djxz6XxBA@mail.gmail.com>
In-Reply-To: <CAN05THTmZCNXsH4_i=0CO6CaVOYuZ=z5XHW+U_=q3Djxz6XxBA@mail.gmail.com>
Date: Sat, 1 May 2021 23:05:46 -0500
Message-ID: <CAH2r5msrS0Ox86NgpfUrwv_MPEU7pYGdG=JfYwK9Btia6W8PLA@mail.gmail.com>
Subject: Re: [PATCH] smb3.1.1: allow dumping GCM256 keys to improve debugging
 of encrypted shares
To: ronnie sahlberg <ronniesahlberg@gmail.com>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Shyam Prasad N <nspmangalore@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 COMMON INTERNET FILE SYSTEM SERVER <linux-cifsd-devel@lists.sourceforge.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I think it is reasonably easy to read in an optional SUID (smb session
uid) as a parm on the new "DUMP_FULL_KEY" ioctl - less code to add in
the followon patch.  Will spin something up later tonight

On Sat, May 1, 2021 at 3:49 PM ronnie sahlberg <ronniesahlberg@gmail.com> wrote:
>
> On Sat, May 1, 2021 at 8:53 PM Shyam Prasad N <nspmangalore@gmail.com> wrote:
> >
> > Looks good to me.
> >
> > On a related note, we need a way for the root user to dump keys for
> > another SMB session to the same path. This will be useful for
> > mutli-user scenario.
> > i.e. for dumping keys for SMB session as another user.
> > Since we're adding a new IOCTL, perhaps we should add another arg
> > which identifies the user? Maybe based on the UID:GID of the user
> > session, in addition to the path supplied?
>
> Or as an alternative, dump an array of ALL user sessions with
> information about which user and which part of a multi-channel
> connection that the keys belong to.
> And let userspace sort out "which keys do I need for my wireshark session".
>
> >
> > Regards,
> > Shyam
> >
> > On Sat, May 1, 2021 at 9:49 AM Steve French <smfrench@gmail.com> wrote:
> > >
> > > changed as suggested - see attached
> > >
> > > On Fri, Apr 30, 2021 at 11:00 PM ronnie sahlberg
> > > <ronniesahlberg@gmail.com> wrote:
> > > >
> > > > These elements should probably be [32] and not
> > > > + __u8 smb3encryptionkey[SMB3_ENC_DEC_KEY_SIZE];
> > > >
> > > > Because this is now visible to userspace and we can not allow this to
> > > > ever change.
> > > > Because when GCM512 is eventually released, if we bump
> > > > SMB3_ENC_DEC_KEY_SIZE to a larger value we suddenly break userspace.
> > > >
> > > >
> > > > On Sat, May 1, 2021 at 8:20 AM Steve French <smfrench@gmail.com> wrote:
> > > > >
> > > > > Previously we were only able to dump CCM or GCM-128 keys (see "smbinfo
> > > > > keys" e.g.)
> > > > > to allow network debugging (e.g. wireshark) of mounts to SMB3.1.1 encrypted
> > > > > shares.  But with the addition of GCM-256 support, we have to be able to dump
> > > > > 32 byte instead of 16 byte keys which requires adding an additional ioctl
> > > > > for that.
> > > > >
> > > > > Signed-off-by: Steve French <stfrench@microsoft.com>
> > > > > ---
> > > > >  fs/cifs/cifs_ioctl.h | 19 +++++++++++++++++++
> > > > >  fs/cifs/ioctl.c      | 33 +++++++++++++++++++++++++++++++++
> > > > >  2 files changed, 52 insertions(+)
> > > > >
> > > > > diff --git a/fs/cifs/cifs_ioctl.h b/fs/cifs/cifs_ioctl.h
> > > > > index f262c64516bc..9f2ed9cccb08 100644
> > > > > --- a/fs/cifs/cifs_ioctl.h
> > > > > +++ b/fs/cifs/cifs_ioctl.h
> > > > > @@ -57,6 +57,12 @@ struct smb_query_info {
> > > > >   /* char buffer[]; */
> > > > >  } __packed;
> > > > >
> > > > > +/*
> > > > > + * Dumping the commonly used 16 byte (e.g. CCM and GCM128) keys still supported
> > > > > + * for backlevel compatibility, but is not sufficient for dumping the less
> > > > > + * frequently used GCM256 (32 byte) keys (see the newer "CIFS_DUMP_FULL_KEY"
> > > > > + * ioctl for dumping decryption info for GCM256 mounts)
> > > > > + */
> > > > >  struct smb3_key_debug_info {
> > > > >   __u64 Suid;
> > > > >   __u16 cipher_type;
> > > > > @@ -65,6 +71,18 @@ struct smb3_key_debug_info {
> > > > >   __u8 smb3decryptionkey[SMB3_SIGN_KEY_SIZE];
> > > > >  } __packed;
> > > > >
> > > > > +/*
> > > > > + * Dump full key (32 byte encrypt/decrypt keys instead of 16 bytes)
> > > > > + * is needed if GCM256 (stronger encryption) negotiated
> > > > > + */
> > > > > +struct smb3_full_key_debug_info {
> > > > > + __u64 Suid;
> > > > > + __u16 cipher_type;
> > > > > + __u8 auth_key[16]; /* SMB2_NTLMV2_SESSKEY_SIZE */
> > > > > + __u8 smb3encryptionkey[SMB3_ENC_DEC_KEY_SIZE];
> > > > > + __u8 smb3decryptionkey[SMB3_ENC_DEC_KEY_SIZE];
> > > > > +} __packed;
> > > > > +
> > > > >  struct smb3_notify {
> > > > >   __u32 completion_filter;
> > > > >   bool watch_tree;
> > > > > @@ -78,6 +96,7 @@ struct smb3_notify {
> > > > >  #define CIFS_QUERY_INFO _IOWR(CIFS_IOCTL_MAGIC, 7, struct smb_query_info)
> > > > >  #define CIFS_DUMP_KEY _IOWR(CIFS_IOCTL_MAGIC, 8, struct smb3_key_debug_info)
> > > > >  #define CIFS_IOC_NOTIFY _IOW(CIFS_IOCTL_MAGIC, 9, struct smb3_notify)
> > > > > +#define CIFS_DUMP_FULL_KEY _IOWR(CIFS_IOCTL_MAGIC, 10, struct
> > > > > smb3_full_key_debug_info)
> > > > >  #define CIFS_IOC_SHUTDOWN _IOR ('X', 125, __u32)
> > > > >
> > > > >  /*
> > > > > diff --git a/fs/cifs/ioctl.c b/fs/cifs/ioctl.c
> > > > > index ef41fa878793..e4321e2a27d2 100644
> > > > > --- a/fs/cifs/ioctl.c
> > > > > +++ b/fs/cifs/ioctl.c
> > > > > @@ -218,6 +218,7 @@ long cifs_ioctl(struct file *filep, unsigned int
> > > > > command, unsigned long arg)
> > > > >  {
> > > > >   struct inode *inode = file_inode(filep);
> > > > >   struct smb3_key_debug_info pkey_inf;
> > > > > + struct smb3_full_key_debug_info pfull_key_inf;
> > > > >   int rc = -ENOTTY; /* strange error - but the precedent */
> > > > >   unsigned int xid;
> > > > >   struct cifsFileInfo *pSMBFile = filep->private_data;
> > > > > @@ -354,6 +355,38 @@ long cifs_ioctl(struct file *filep, unsigned int
> > > > > command, unsigned long arg)
> > > > >   else
> > > > >   rc = 0;
> > > > >   break;
> > > > > + /*
> > > > > + * Dump full key (32 bytes instead of 16 bytes) is
> > > > > + * needed if GCM256 (stronger encryption) negotiated
> > > > > + */
> > > > > + case CIFS_DUMP_FULL_KEY:
> > > > > + if (pSMBFile == NULL)
> > > > > + break;
> > > > > + if (!capable(CAP_SYS_ADMIN)) {
> > > > > + rc = -EACCES;
> > > > > + break;
> > > > > + }
> > > > > +
> > > > > + tcon = tlink_tcon(pSMBFile->tlink);
> > > > > + if (!smb3_encryption_required(tcon)) {
> > > > > + rc = -EOPNOTSUPP;
> > > > > + break;
> > > > > + }
> > > > > + pfull_key_inf.cipher_type =
> > > > > + le16_to_cpu(tcon->ses->server->cipher_type);
> > > > > + pfull_key_inf.Suid = tcon->ses->Suid;
> > > > > + memcpy(pfull_key_inf.auth_key, tcon->ses->auth_key.response,
> > > > > + 16 /* SMB2_NTLMV2_SESSKEY_SIZE */);
> > > > > + memcpy(pfull_key_inf.smb3decryptionkey,
> > > > > +       tcon->ses->smb3decryptionkey, SMB3_ENC_DEC_KEY_SIZE);
> > > > > + memcpy(pfull_key_inf.smb3encryptionkey,
> > > > > +       tcon->ses->smb3encryptionkey, SMB3_ENC_DEC_KEY_SIZE);
> > > > > + if (copy_to_user((void __user *)arg, &pfull_key_inf,
> > > > > + sizeof(struct smb3_full_key_debug_info)))
> > > > > + rc = -EFAULT;
> > > > > + else
> > > > > + rc = 0;
> > > > > + break;
> > > > >   case CIFS_IOC_NOTIFY:
> > > > >   if (!S_ISDIR(inode->i_mode)) {
> > > > >   /* Notify can only be done on directories */
> > > > >
> > > > > --
> > > > > Thanks,
> > > > >
> > > > > Steve
> > >
> > >
> > >
> > > --
> > > Thanks,
> > >
> > > Steve
> >
> >
> >
> > --
> > Regards,
> > Shyam



-- 
Thanks,

Steve

