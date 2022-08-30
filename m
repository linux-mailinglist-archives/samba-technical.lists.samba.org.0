Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4B55A591A
	for <lists+samba-technical@lfdr.de>; Tue, 30 Aug 2022 04:05:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=0iyXgy6VK0UQULXRca3/KlkR8nwswXUGdIgux7Xh36A=; b=WkUTJ+Gsf7eqHYV3YGGKzodumR
	Hf9d1NdneVeo1093YxgR4PQBYtsCFQTg6Kw63TsRWSTJXKznrYGR086KlKDogrLngqoCgVNCoBzSR
	k47DIGU8pL5I7RUnMoOHuwY2foVbWxgEYW328yjundh9xO1i0RG/o+y9JITO4HwYi0HJ9tZgP6V+W
	0A97cAv2OVk9phkABmRvNKtpoO+LyHEpc22/+jXSTtdj6DvOJXC3vAnKY3t0IUtWrXfuXaT3h8Lub
	OiCCFMMKCQHKj7/E1FPjpyxLOTyUtjoMMhCQCMBIg1TcMR9n1kVUev8tK3WOYjE4Q2OYZ80F8deWe
	oikSrGIg==;
Received: from ip6-localhost ([::1]:61990 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oSqbt-002zIn-NR; Tue, 30 Aug 2022 02:04:13 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31]:43701) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oSqbm-002zIe-Pk
 for samba-technical@lists.samba.org; Tue, 30 Aug 2022 02:04:09 +0000
Received: by mail-vs1-xe31.google.com with SMTP id i12so3339459vsr.10
 for <samba-technical@lists.samba.org>; Mon, 29 Aug 2022 19:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=bTwEdWgT8ox9c+75jXlhxS4V2NQHVwP3Q9qCoDLt3A8=;
 b=itjpDKv+AvLsXFJkNl1Qtdagmzw5W6BluOofk9GCXa28NCnoHN7o3T0WzkSoHuiiAU
 p7Z/5gWHHZSI1wlk/ltmGRFkWTsCuTm2hZ9dWtOQoTReZ0xEIb1YsDCN20UvpIkLXiRU
 TjKGSLSUKaHG1TDRVC60eFOi4VHtK/ORVAoifcV8zBivuEipT8ueMOZMO5brN08XJ9ez
 RVvd9pzHoF1Mz32HrXQpPusyv5TOuvxtiArweHg2lcSl+1YHXPYrHmsZu6ompTEAgvWo
 YGc9IhCOtsjPxeH0CTtv7y5EArD14B++X/gtzf1N7SZa24vjJBpWO5KBprhbXUwrefbL
 tA3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=bTwEdWgT8ox9c+75jXlhxS4V2NQHVwP3Q9qCoDLt3A8=;
 b=U4oUGiLGwKZr+OWO/us9nTCjx5gFzmaIaK+qSU3zcxKYACZr9LNi+jhvUuD2YyKBmQ
 hUstQR+9xNmGP7iwcLMEA3wBvpdv6M+xYjBDEXHwPqxQVjVkbG6WzlmQxMnNrwCpYnwj
 FxUnAPsgYm7khWcuFjnyJc6rWlZ80p3clIBXQz8QtHJRbSclk4Uy4HYDkeIPcIuHcND4
 TRUZnPV+mB8BcMkaU7n4gGFlK40s2D/+jNQ+/B38kmpcShqkApa7GnIUMlAa3E/slLjD
 pFBr45xh10wgvieFRcQJWziVjWjlu10aVqeepusJ9f4UQ4HO3IUPNQZ1KPK3NOQ3aVKz
 ghkw==
X-Gm-Message-State: ACgBeo3bwza7hdQtRwM/PB2dYRqJAAO8+B7Nu1640XqqM7zs52dOEtU+
 FzuUHkXW5e2ZT/BIkGMfKEOzGyA0QYRyo0nbZgg=
X-Google-Smtp-Source: AA6agR73ck2APsvltwBXng3NiSKPHyLiFiD7c603UiPl4DJ+f8ljgD3i4dK6WOS8r29RDZnrdlDl4qT+1ItBPUonkdg=
X-Received: by 2002:a05:6102:3e82:b0:38a:ab1a:2702 with SMTP id
 m2-20020a0561023e8200b0038aab1a2702mr4254932vsv.29.1661825044504; Mon, 29 Aug
 2022 19:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <166126004083.548536.11195647088995116235.stgit@warthog.procyon.org.uk>
 <166126004796.548536.8555773200873112505.stgit@warthog.procyon.org.uk>
 <CAH2r5mt5iXtarkUAY7PSMGOLhkQd5LFcEz-rAnTkayxQMq_ppA@mail.gmail.com>
 <CAH2r5msqTBu=wFn_wOaXucTn45WZfyNrAWqwpcGuxMFnpXyubA@mail.gmail.com>
In-Reply-To: <CAH2r5msqTBu=wFn_wOaXucTn45WZfyNrAWqwpcGuxMFnpXyubA@mail.gmail.com>
Date: Mon, 29 Aug 2022 21:03:53 -0500
Message-ID: <CAH2r5mu46pL+GZtpcjdJ-vXjupXFr_4TxVRQ4TTej1yMUf+rkg@mail.gmail.com>
Subject: Re: [PATCH 1/5] smb3: Move the flush out of smb2_copychunk_range()
 into its callers
To: David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
Cc: CIFS <linux-cifs@vger.kernel.org>, Jeff Layton <jlayton@kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>,
 Dave Chinner <dchinner@redhat.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

had some typos in the version I sent (forgot to remove a few lines and
missed an le64 conversion) - will resend updated version

On Mon, Aug 29, 2022 at 11:56 AM Steve French <smfrench@gmail.com> wrote:

> e.g. something like the following
>
>
> On Mon, Aug 29, 2022 at 12:06 AM Steve French <smfrench@gmail.com> wrote:
> >
> > Shouldn't this be using filemap_write_and_wait_range() not
> > filemap_write_and_wait as we see in similar code in ext4 (and
> > shouldn't it check rc in some of these cases)?   For example for the
> > copychunk_range example shouldn't the patch be modified similar to the
> > following:
> >
> > diff --git a/fs/cifs/cifsfs.c b/fs/cifs/cifsfs.c
> > index e9fb338b8e7e..51963e83daf7 100644
> > --- a/fs/cifs/cifsfs.c
> > +++ b/fs/cifs/cifsfs.c
> > @@ -1219,8 +1219,6 @@ ssize_t cifs_file_copychunk_range(unsigned int xid,
> >
> >         cifs_dbg(FYI, "copychunk range\n");
> >
> > -       filemap_write_and_wait(src_inode->i_mapping);
> > -
> >         if (!src_file->private_data || !dst_file->private_data) {
> >                 rc = -EBADF;
> >                 cifs_dbg(VFS, "missing cifsFileInfo on copy range src
> file\n");
> > @@ -1250,6 +1248,12 @@ ssize_t cifs_file_copychunk_range(unsigned int
> xid,
> >         lock_two_nondirectories(target_inode, src_inode);
> >
> >         cifs_dbg(FYI, "about to flush pages\n");
> > +
> > +       rc = filemap_write_and_wait_range(src_inode->i_mapping, off,
> > +                                         off + len - 1);
> > +        if (rc)
> > +               goto out;
> > +
> >         /* should we flush first and last page first */
> >         truncate_inode_pages(&target_inode->i_data, 0);
> >
> > On Tue, Aug 23, 2022 at 8:09 AM David Howells via samba-technical
> > <samba-technical@lists.samba.org> wrote:
> > >
> > > Move the flush out of smb2_copychunk_range() into its callers.  This
> will
> > > allow the pagecache to be invalidated between the flush and the
> operation
> > > in smb3_collapse_range() and smb3_insert_range().
> > >
> > > Signed-off-by: David Howells <dhowells@redhat.com>
> > > cc: Steve French <stfrench@microsoft.com>
> > > cc: Ronnie Sahlberg <lsahlber@redhat.com>
> > > ---
> > >
> > >  fs/cifs/cifsfs.c  |    2 ++
> > >  fs/cifs/smb2ops.c |   20 ++++++++------------
> > >  2 files changed, 10 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/fs/cifs/cifsfs.c b/fs/cifs/cifsfs.c
> > > index f54d8bf2732a..e9fb338b8e7e 100644
> > > --- a/fs/cifs/cifsfs.c
> > > +++ b/fs/cifs/cifsfs.c
> > > @@ -1219,6 +1219,8 @@ ssize_t cifs_file_copychunk_range(unsigned int
> xid,
> > >
> > >         cifs_dbg(FYI, "copychunk range\n");
> > >
> > > +       filemap_write_and_wait(src_inode->i_mapping);
> > > +
> > >         if (!src_file->private_data || !dst_file->private_data) {
> > >                 rc = -EBADF;
> > >                 cifs_dbg(VFS, "missing cifsFileInfo on copy range src
> file\n");
> > > diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
> > > index 96f3b0573606..7e3de6a0e1dc 100644
> > > --- a/fs/cifs/smb2ops.c
> > > +++ b/fs/cifs/smb2ops.c
> > > @@ -1600,17 +1600,8 @@ smb2_copychunk_range(const unsigned int xid,
> > >         int chunks_copied = 0;
> > >         bool chunk_sizes_updated = false;
> > >         ssize_t bytes_written, total_bytes_written = 0;
> > > -       struct inode *inode;
> > >
> > >         pcchunk = kmalloc(sizeof(struct copychunk_ioctl), GFP_KERNEL);
> > > -
> > > -       /*
> > > -        * We need to flush all unwritten data before we can send the
> > > -        * copychunk ioctl to the server.
> > > -        */
> > > -       inode = d_inode(trgtfile->dentry);
> > > -       filemap_write_and_wait(inode->i_mapping);
> > > -
> > >         if (pcchunk == NULL)
> > >                 return -ENOMEM;
> > >
> > > @@ -3689,6 +3680,8 @@ static long smb3_collapse_range(struct file
> *file, struct cifs_tcon *tcon,
> > >                 goto out;
> > >         }
> > >
> > > +       filemap_write_and_wait(inode->i_mapping);
> > > +
> > >         rc = smb2_copychunk_range(xid, cfile, cfile, off + len,
> > >                                   i_size_read(inode) - off - len, off);
> > >         if (rc < 0)
> > > @@ -3716,18 +3709,21 @@ static long smb3_insert_range(struct file
> *file, struct cifs_tcon *tcon,
> > >         int rc;
> > >         unsigned int xid;
> > >         struct cifsFileInfo *cfile = file->private_data;
> > > +       struct inode *inode = file_inode(file);
> > >         __le64 eof;
> > >         __u64  count;
> > >
> > >         xid = get_xid();
> > >
> > > -       if (off >= i_size_read(file->f_inode)) {
> > > +       if (off >= i_size_read(inode)) {
> > >                 rc = -EINVAL;
> > >                 goto out;
> > >         }
> > >
> > > -       count = i_size_read(file->f_inode) - off;
> > > -       eof = cpu_to_le64(i_size_read(file->f_inode) + len);
> > > +       count = i_size_read(inode) - off;
> > > +       eof = cpu_to_le64(i_size_read(inode) + len);
> > > +
> > > +       filemap_write_and_wait(inode->i_mapping);
> > >
> > >         rc = SMB2_set_eof(xid, tcon, cfile->fid.persistent_fid,
> > >                           cfile->fid.volatile_fid, cfile->pid, &eof);
> > >
> > >
> > >
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
> Thanks,
>
> Steve
>


-- 
Thanks,

Steve
