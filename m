Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5E9886F02
	for <lists+samba-technical@lfdr.de>; Fri, 22 Mar 2024 15:48:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=2dzRd2+RISoYKGE/ucShUTjhAS+0hbTNEpYIAQNB4E4=; b=YnX/ysPSCSkzopivcp6EJ1ed+C
	ZGkTCOnAl+VTPtoNtFM+BjTSWciI+U2v6sna06a096wEDay3Yfm7j7rR0rq3rI0Ef2QBb7f1mwLgT
	5s78coXd7QJDme6oDfd+L21SMdU+MiaIBwLkrT/HHQxEwv+09mAgChfNAaTLle+gQsvYCPHasoYwy
	z/pAEMkU1qfPeI2PNC/Egr3FSpom7yBfjgN38d0gXWqlCz5+3L4fgMZGKPK9l1F9cE0jg9dbXa+5Y
	DE9DIiEQKrJw9wtS7RmPSobeSSe5GyVNZQJNv+JOnrFiKrh9hm2COEvEqR3AxjzMA6NTzuvq/OTfD
	LlBTaDHg==;
Received: from ip6-localhost ([::1]:63518 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rngBQ-00100V-Bc; Fri, 22 Mar 2024 14:47:49 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:46382) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rngBF-001007-2q
 for samba-technical@lists.samba.org; Fri, 22 Mar 2024 14:47:44 +0000
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2d68cf90ec4so37149041fa.1
 for <samba-technical@lists.samba.org>; Fri, 22 Mar 2024 07:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711118857; x=1711723657; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2dzRd2+RISoYKGE/ucShUTjhAS+0hbTNEpYIAQNB4E4=;
 b=Og4FTo2MAaaaiYKPZz4meugfC8YVu6Mm8rmfOai0HVkaabECNL68uMcW0egFfQVWFw
 kO1rAU2GxMAWxbw/6y1ns8BMAF11AlgRPD4HPCamZIt4EKxGoBJGBmI8ENMYkPv6W0/I
 VncpCG59l4wOVmt2hnJE7Npcb13555ef42EwFOw5GImj3ZlPtX86W99E2yeXKX+R/Kgy
 Mg08EUJ9idQ5tMGH1mOkAjAcpF3qzi3H1SsJWeF9fOoRJCGTKIY/eKcNv8GeDp7D61mN
 bRF7b7xDqJ4Z3fFv9kLK0NAe5sJKxHuoKqWDRKFrar5FelDm7vDp/vLwH8tjIg9Op5LB
 YF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711118857; x=1711723657;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2dzRd2+RISoYKGE/ucShUTjhAS+0hbTNEpYIAQNB4E4=;
 b=lznUNYXkJO+gII3JYmKRqEYDx4yW9dSWwoJqXhWN4al3lxadTWQ4AWoZc2xZL2p8kJ
 iuZ4dHGKk9yxxwFbVWePlgpjx7fBXpdw3SsG2QdPckv/OfIuv3aUhComMNzpHhvyG6C5
 9kqbjFrmpmh66mfPa4Sm0bZV/agSQ1s3CpvfE0P3yjwRsLJmD3xPZ2fZ+4k1ZGK0DDlW
 cKv/J1SDHsfYH3E82hm07UGdhrU2I8c5HWTqv4AV81PqtKIvF+HlSSD5o1DjCdUQ/eub
 neWBoLPPAImk2Ov+5O3V35YQbQsGSEbt0sjVhDm5br2w/1WK9JqfhcWIiSBs9SBznMLx
 eyOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEJty81XGW9qcsONKq/0lpUZEFOzXwTD0shA7XQmaMLAD2DBU7Z8NdP1RJ76uFmaRY13I1xMRAgOLIJj62Ff+x8w/aLQNxMj+GIdLTqec5
X-Gm-Message-State: AOJu0Yzn/3SPa5rtUtgPRv9nv906eD3aokIZmL2jNMp3FAi3yDYBPNsY
 SVdNlVfUWtwJG5nn8aUeTQmra31lAuDcwWUv3hsxnrp+QnxmQL++pbyTVI9BoytQie+Jv034w8s
 yWCoY+RjZDR/z10LbhJeGJ8pHNb0=
X-Google-Smtp-Source: AGHT+IE6kfa9YMuN0JLgk2024WMR8YCUyZkuq3KGPuHXRbYND0bWpu4iaMpWZht1hbVvWpIk8jbapPctesc+ZqoG5NI=
X-Received: by 2002:ac2:4d82:0:b0:513:d8b4:90be with SMTP id
 g2-20020ac24d82000000b00513d8b490bemr1756823lfe.24.1711118856514; Fri, 22 Mar
 2024 07:47:36 -0700 (PDT)
MIME-Version: 1.0
References: <ZfQC6Xk+E6HtCtsI@rbudubuntu.daqjip3ntomehmqy3wvpaa3zyf.bx.internal.cloudapp.net>
 <CA+EPQ67TC27FTmN30QRHji61ymrD=0y-NZ_CHOi7tAq2qcFWQw@mail.gmail.com>
In-Reply-To: <CA+EPQ67TC27FTmN30QRHji61ymrD=0y-NZ_CHOi7tAq2qcFWQw@mail.gmail.com>
Date: Fri, 22 Mar 2024 09:47:24 -0500
Message-ID: <CAH2r5mt1X3wp89FLUN_VEzA1kCQmu8x8bVAyi0cdG7-b2V=Bmw@mail.gmail.com>
Subject: Re: [PATCH] Retrying on failed server close
To: Ritvik Budhiraja <budhirajaritviksmb@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: pc@manguebit.com, tom@talpey.com, sprasad@microsoft.com,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, sfrench@samba.org, bharathsm.hsk@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Do you know a repro scenario where you can get the server to return
EAGAIN or EBUSY?

SInce close is also issued from other paths than the one you issued
retries from (_cifsFileInfo_put) - are there other cases we should be
retrying?  e.g. error paths in do_create and atomic_open, cifs_open,
cifs_close_dir, find_cifs_entry

Also do you know a scenario where we can repro the negative total open
files count?

On Fri, Mar 22, 2024 at 2:33=E2=80=AFAM Ritvik Budhiraja
<budhirajaritviksmb@gmail.com> wrote:
>
> Attaching the updated patch
>
>
> On Fri, 15 Mar 2024 at 01:12, Ritvik Budhiraja <budhirajaritviksmb@gmail.=
com> wrote:
>>
>> In the current implementation, CIFS close sends a close to the server
>> and does not check for the success of the server close. This patch adds
>> functionality to check for server close return status and retries
>> in case of an EBUSY or EAGAIN error
>>
>> Signed-off-by: Ritvik Budhiraja <rbudhiraja@microsoft.com>
>> ---
>>  fs/smb/client/cifsfs.c   | 11 +++++++
>>  fs/smb/client/cifsglob.h |  7 +++--
>>  fs/smb/client/file.c     | 63 ++++++++++++++++++++++++++++++++++++----
>>  fs/smb/client/smb1ops.c  |  4 +--
>>  fs/smb/client/smb2ops.c  |  9 +++---
>>  5 files changed, 80 insertions(+), 14 deletions(-)
>>
>> diff --git a/fs/smb/client/cifsfs.c b/fs/smb/client/cifsfs.c
>> index fb368b191eef..e4b2ded86fce 100644
>> --- a/fs/smb/client/cifsfs.c
>> +++ b/fs/smb/client/cifsfs.c
>> @@ -160,6 +160,7 @@ struct workqueue_struct     *decrypt_wq;
>>  struct workqueue_struct        *fileinfo_put_wq;
>>  struct workqueue_struct        *cifsoplockd_wq;
>>  struct workqueue_struct        *deferredclose_wq;
>> +struct workqueue_struct        *serverclose_wq;
>>  __u32 cifs_lock_secret;
>>
>>  /*
>> @@ -1890,6 +1891,13 @@ init_cifs(void)
>>                 goto out_destroy_cifsoplockd_wq;
>>         }
>>
>> +       serverclose_wq =3D alloc_workqueue("serverclose",
>> +                                          WQ_FREEZABLE|WQ_MEM_RECLAIM, =
0);
>> +       if (!serverclose_wq) {
>> +               rc =3D -ENOMEM;
>> +               goto out_destroy_serverclose_wq;
>> +       }
>> +
>>         rc =3D cifs_init_inodecache();
>>         if (rc)
>>                 goto out_destroy_deferredclose_wq;
>> @@ -1964,6 +1972,8 @@ init_cifs(void)
>>         destroy_workqueue(decrypt_wq);
>>  out_destroy_cifsiod_wq:
>>         destroy_workqueue(cifsiod_wq);
>> +out_destroy_serverclose_wq:
>> +       destroy_workqueue(serverclose_wq);
>>  out_clean_proc:
>>         cifs_proc_clean();
>>         return rc;
>> @@ -1993,6 +2003,7 @@ exit_cifs(void)
>>         destroy_workqueue(cifsoplockd_wq);
>>         destroy_workqueue(decrypt_wq);
>>         destroy_workqueue(fileinfo_put_wq);
>> +       destroy_workqueue(serverclose_wq);
>>         destroy_workqueue(cifsiod_wq);
>>         cifs_proc_clean();
>>  }
>> diff --git a/fs/smb/client/cifsglob.h b/fs/smb/client/cifsglob.h
>> index 53c75cfb33ab..c99bc3b3ff56 100644
>> --- a/fs/smb/client/cifsglob.h
>> +++ b/fs/smb/client/cifsglob.h
>> @@ -429,10 +429,10 @@ struct smb_version_operations {
>>         /* set fid protocol-specific info */
>>         void (*set_fid)(struct cifsFileInfo *, struct cifs_fid *, __u32)=
;
>>         /* close a file */
>> -       void (*close)(const unsigned int, struct cifs_tcon *,
>> +       int (*close)(const unsigned int, struct cifs_tcon *,
>>                       struct cifs_fid *);
>>         /* close a file, returning file attributes and timestamps */
>> -       void (*close_getattr)(const unsigned int xid, struct cifs_tcon *=
tcon,
>> +       int (*close_getattr)(const unsigned int xid, struct cifs_tcon *t=
con,
>>                       struct cifsFileInfo *pfile_info);
>>         /* send a flush request to the server */
>>         int (*flush)(const unsigned int, struct cifs_tcon *, struct cifs=
_fid *);
>> @@ -1420,6 +1420,7 @@ struct cifsFileInfo {
>>         bool invalidHandle:1;   /* file closed via session abend */
>>         bool swapfile:1;
>>         bool oplock_break_cancelled:1;
>> +       bool offload:1; /* offload final part of _put to a wq */
>>         unsigned int oplock_epoch; /* epoch from the lease break */
>>         __u32 oplock_level; /* oplock/lease level from the lease break *=
/
>>         int count;
>> @@ -1428,6 +1429,7 @@ struct cifsFileInfo {
>>         struct cifs_search_info srch_inf;
>>         struct work_struct oplock_break; /* work for oplock breaks */
>>         struct work_struct put; /* work for the final part of _put */
>> +       struct work_struct serverclose; /* work for serverclose */
>>         struct delayed_work deferred;
>>         bool deferred_close_scheduled; /* Flag to indicate close is sche=
duled */
>>         char *symlink_target;
>> @@ -2085,6 +2087,7 @@ extern struct workqueue_struct *decrypt_wq;
>>  extern struct workqueue_struct *fileinfo_put_wq;
>>  extern struct workqueue_struct *cifsoplockd_wq;
>>  extern struct workqueue_struct *deferredclose_wq;
>> +extern struct workqueue_struct *serverclose_wq;
>>  extern __u32 cifs_lock_secret;
>>
>>  extern mempool_t *cifs_mid_poolp;
>> diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
>> index c3b8e7091a4d..c1379ec27dcd 100644
>> --- a/fs/smb/client/file.c
>> +++ b/fs/smb/client/file.c
>> @@ -445,6 +445,7 @@ cifs_down_write(struct rw_semaphore *sem)
>>  }
>>
>>  static void cifsFileInfo_put_work(struct work_struct *work);
>> +void serverclose_work(struct work_struct *work);
>>
>>  struct cifsFileInfo *cifs_new_fileinfo(struct cifs_fid *fid, struct fil=
e *file,
>>                                        struct tcon_link *tlink, __u32 op=
lock,
>> @@ -491,6 +492,7 @@ struct cifsFileInfo *cifs_new_fileinfo(struct cifs_f=
id *fid, struct file *file,
>>         cfile->tlink =3D cifs_get_tlink(tlink);
>>         INIT_WORK(&cfile->oplock_break, cifs_oplock_break);
>>         INIT_WORK(&cfile->put, cifsFileInfo_put_work);
>> +       INIT_WORK(&cfile->serverclose, serverclose_work);
>>         INIT_DELAYED_WORK(&cfile->deferred, smb2_deferred_work_close);
>>         mutex_init(&cfile->fh_mutex);
>>         spin_lock_init(&cfile->file_info_lock);
>> @@ -582,6 +584,40 @@ static void cifsFileInfo_put_work(struct work_struc=
t *work)
>>         cifsFileInfo_put_final(cifs_file);
>>  }
>>
>> +void serverclose_work(struct work_struct *work)
>> +{
>> +       struct cifsFileInfo *cifs_file =3D container_of(work,
>> +                       struct cifsFileInfo, serverclose);
>> +
>> +       struct cifs_tcon *tcon =3D tlink_tcon(cifs_file->tlink);
>> +
>> +       struct TCP_Server_Info *server =3D tcon->ses->server;
>> +       int rc;
>> +       int retries =3D 0;
>> +       int MAX_RETRIES =3D 4;
>> +
>> +       do {
>> +               if (server->ops->close_getattr)
>> +                       rc =3D server->ops->close_getattr(0, tcon, cifs_=
file);
>> +               else if (server->ops->close)
>> +                       rc =3D server->ops->close(0, tcon, &cifs_file->f=
id);
>> +
>> +               if (rc =3D=3D -EBUSY || rc =3D=3D -EAGAIN) {
>> +                       retries++;
>> +                       msleep(250);
>> +               }
>> +       } while ((rc =3D=3D -EBUSY || rc =3D=3D -EAGAIN) && (retries < M=
AX_RETRIES)
>> +       );
>> +
>> +       if (retries =3D=3D MAX_RETRIES)
>> +               printk(KERN_WARNING "[CIFS_CLOSE] Serverclose failed %d =
times, giving up\n", MAX_RETRIES);
>> +
>> +       if (cifs_file->offload)
>> +               queue_work(fileinfo_put_wq, &cifs_file->put);
>> +       else
>> +               cifsFileInfo_put_final(cifs_file);
>> +}
>> +
>>  /**
>>   * cifsFileInfo_put - release a reference of file priv data
>>   *
>> @@ -622,10 +658,13 @@ void _cifsFileInfo_put(struct cifsFileInfo *cifs_f=
ile,
>>         struct cifs_fid fid =3D {};
>>         struct cifs_pending_open open;
>>         bool oplock_break_cancelled;
>> +       bool serverclose_offloaded =3D false;
>>
>>         spin_lock(&tcon->open_file_lock);
>>         spin_lock(&cifsi->open_file_lock);
>>         spin_lock(&cifs_file->file_info_lock);
>> +
>> +       cifs_file->offload =3D offload;
>>         if (--cifs_file->count > 0) {
>>                 spin_unlock(&cifs_file->file_info_lock);
>>                 spin_unlock(&cifsi->open_file_lock);
>> @@ -667,13 +706,20 @@ void _cifsFileInfo_put(struct cifsFileInfo *cifs_f=
ile,
>>         if (!tcon->need_reconnect && !cifs_file->invalidHandle) {
>>                 struct TCP_Server_Info *server =3D tcon->ses->server;
>>                 unsigned int xid;
>> +               int rc;
>>
>>                 xid =3D get_xid();
>>                 if (server->ops->close_getattr)
>> -                       server->ops->close_getattr(xid, tcon, cifs_file)=
;
>> +                       rc =3D server->ops->close_getattr(xid, tcon, cif=
s_file);
>>                 else if (server->ops->close)
>> -                       server->ops->close(xid, tcon, &cifs_file->fid);
>> +                       rc =3D server->ops->close(xid, tcon, &cifs_file-=
>fid);
>>                 _free_xid(xid);
>> +
>> +               if (rc =3D=3D -EBUSY || rc =3D=3D -EAGAIN) {
>> +                       // Server close failed, hence offloading it as a=
n async op
>> +                       queue_work(serverclose_wq, &cifs_file->serverclo=
se);
>> +                       serverclose_offloaded =3D true;
>> +               }
>>         }
>>
>>         if (oplock_break_cancelled)
>> @@ -681,10 +727,15 @@ void _cifsFileInfo_put(struct cifsFileInfo *cifs_f=
ile,
>>
>>         cifs_del_pending_open(&open);
>>
>> -       if (offload)
>> -               queue_work(fileinfo_put_wq, &cifs_file->put);
>> -       else
>> -               cifsFileInfo_put_final(cifs_file);
>> +       // if serverclose has been offloaded to wq (on failure), it will
>> +       // handle offloading put as well. If serverclose not offloaded,
>> +       // we need to handle offloading put here.
>> +       if (!serverclose_offloaded) {
>> +               if (offload)
>> +                       queue_work(fileinfo_put_wq, &cifs_file->put);
>> +               else
>> +                       cifsFileInfo_put_final(cifs_file);
>> +       }
>>  }
>>
>>  int cifs_open(struct inode *inode, struct file *file)
>> diff --git a/fs/smb/client/smb1ops.c b/fs/smb/client/smb1ops.c
>> index a9eaba8083b0..212ec6f66ec6 100644
>> --- a/fs/smb/client/smb1ops.c
>> +++ b/fs/smb/client/smb1ops.c
>> @@ -753,11 +753,11 @@ cifs_set_fid(struct cifsFileInfo *cfile, struct ci=
fs_fid *fid, __u32 oplock)
>>         cinode->can_cache_brlcks =3D CIFS_CACHE_WRITE(cinode);
>>  }
>>
>> -static void
>> +static int
>>  cifs_close_file(const unsigned int xid, struct cifs_tcon *tcon,
>>                 struct cifs_fid *fid)
>>  {
>> -       CIFSSMBClose(xid, tcon, fid->netfid);
>> +       return CIFSSMBClose(xid, tcon, fid->netfid);
>>  }
>>
>>  static int
>> diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
>> index 4695433fcf39..1dcd4944958f 100644
>> --- a/fs/smb/client/smb2ops.c
>> +++ b/fs/smb/client/smb2ops.c
>> @@ -1411,14 +1411,14 @@ smb2_set_fid(struct cifsFileInfo *cfile, struct =
cifs_fid *fid, __u32 oplock)
>>         memcpy(cfile->fid.create_guid, fid->create_guid, 16);
>>  }
>>
>> -static void
>> +static int
>>  smb2_close_file(const unsigned int xid, struct cifs_tcon *tcon,
>>                 struct cifs_fid *fid)
>>  {
>> -       SMB2_close(xid, tcon, fid->persistent_fid, fid->volatile_fid);
>> +       return SMB2_close(xid, tcon, fid->persistent_fid, fid->volatile_=
fid);
>>  }
>>
>> -static void
>> +static int
>>  smb2_close_getattr(const unsigned int xid, struct cifs_tcon *tcon,
>>                    struct cifsFileInfo *cfile)
>>  {
>> @@ -1429,7 +1429,7 @@ smb2_close_getattr(const unsigned int xid, struct =
cifs_tcon *tcon,
>>         rc =3D __SMB2_close(xid, tcon, cfile->fid.persistent_fid,
>>                    cfile->fid.volatile_fid, &file_inf);
>>         if (rc)
>> -               return;
>> +               return rc;
>>
>>         inode =3D d_inode(cfile->dentry);
>>
>> @@ -1458,6 +1458,7 @@ smb2_close_getattr(const unsigned int xid, struct =
cifs_tcon *tcon,
>>
>>         /* End of file and Attributes should not have to be updated on c=
lose */
>>         spin_unlock(&inode->i_lock);
>> +       return rc;
>>  }
>>
>>  static int
>> --
>> 2.34.1
>>


--=20
Thanks,

Steve

