Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F615A525F
	for <lists+samba-technical@lfdr.de>; Mon, 29 Aug 2022 18:58:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=tLgtElRVNub4io8HFoy0eVCtLZ4ui1HNWfhlnz/9Oj4=; b=Wpc6ex6+SQG97GV/fjfZwiWLXB
	THNtkxftj3JO5Ocb0ri+rkwl9cP4G9X8C+KwjIkkpE3UdOMSc8wVbOo9DGrlJCRpx9agrWWkxUafI
	Zh+xH4DCtCi7QEvv0QedQRcTu4HC5/uoifYazIaMKXGOH8hPpGQxnO626VSnguckNiNdGg/exaeDj
	wK87Xa6q5axS85xeVdENFrSqHj5KEGbESqhKG6fISuq2ukA7l6ooOkZ2oxtpYrfEdtQPsV/h3FOEq
	CCVLxhkP2jJ1rLj55ZJN45cq2CPpuEssXICbt2mMZBsLYQIqFcJFo9z6exSKPHlod/Kd73+Ocq5+5
	Mck7WDBw==;
Received: from ip6-localhost ([::1]:50644 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oSi4a-002uVQ-JY; Mon, 29 Aug 2022 16:57:16 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936]:33751) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oSi4V-002uVH-9O
 for samba-technical@lists.samba.org; Mon, 29 Aug 2022 16:57:13 +0000
Received: by mail-ua1-x936.google.com with SMTP id x5so1295704uaf.0
 for <samba-technical@lists.samba.org>; Mon, 29 Aug 2022 09:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=tLgtElRVNub4io8HFoy0eVCtLZ4ui1HNWfhlnz/9Oj4=;
 b=GTlMu3vhB8EnIa6Ny0hhuYlJJ7NK9Tbp9g83oJzbeAv+Ph1yrWVKMk7CR6J+7n0Px6
 j6j4mXzT+lPMUwqcnxmopKYgKzfzt/zwP83ggnrSJV0nXI8zobgGDtyBCn1lFLLNX1V8
 DYd1TIlxREIiZnjNsnH3DAznrpZpXoPeH54mclv6cX5yBOkcgclrs3bjUIfEsEzUNDak
 gPYVVpRDHE5dnQYpAKBXfN84Y5P6JUfzLbEXTwr8bzWl/hIAVUHQBWkGXP0PBdMwp7H0
 i9QUEzHbQVdKfnev1IzxR/loFim4rEkdoB4ej9VkFw1B7i1Aqn8FDGetF1m9RPwVw1pA
 f6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=tLgtElRVNub4io8HFoy0eVCtLZ4ui1HNWfhlnz/9Oj4=;
 b=jNQ+L5+3hpMizUpJBwcybCdYHE5H14Fxw2ct+5hd0EIXVmnA+zgXnAu3tI5R2ZJOJo
 BcyxXqyc07aQSkysENK1mwHeZ9Bi52hofvzgMK1EQXon0jcGcbXEIOTxOewPFvy4wYai
 YP2cVe5+vfyaefhAjgeq/WNlk4wFyWGKkVlWJKCmqjXIfF8XCfzxM3JiCkl6L4D4qBgk
 Jq8B38B4N0UK/hYWhEs56KCZNEDfHF74itmEIUG/t1oQI2l11p4ragP87SW1mYdUyqA9
 yq3q9c85dhDugDWJ2ArzBgW/JRv1Scbd1CcpY/ajhZkG8WxQXXQ5ZeMeRifkpXGtPzXO
 7ytg==
X-Gm-Message-State: ACgBeo0CV+O989LHqndyxoevKtmSIzbuttA6qY/1KbfXwLN4q6hnG/vL
 USWU3z3WFD4gYsD/hSxxd9Klxrr0s0oM1GxRk6E=
X-Google-Smtp-Source: AA6agR7zSxcXS2CfG0cS1OroodRLsExEM9n63ahAtdY3cXQY1VEJhxY/ivX9nKUmqiYviudpqCtJilp3xN7WmGYrMGI=
X-Received: by 2002:a05:6130:10b:b0:37f:a52:99fd with SMTP id
 h11-20020a056130010b00b0037f0a5299fdmr3608271uag.96.1661792229129; Mon, 29
 Aug 2022 09:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <166126004083.548536.11195647088995116235.stgit@warthog.procyon.org.uk>
 <166126004796.548536.8555773200873112505.stgit@warthog.procyon.org.uk>
 <CAH2r5mt5iXtarkUAY7PSMGOLhkQd5LFcEz-rAnTkayxQMq_ppA@mail.gmail.com>
In-Reply-To: <CAH2r5mt5iXtarkUAY7PSMGOLhkQd5LFcEz-rAnTkayxQMq_ppA@mail.gmail.com>
Date: Mon, 29 Aug 2022 11:56:58 -0500
Message-ID: <CAH2r5msqTBu=wFn_wOaXucTn45WZfyNrAWqwpcGuxMFnpXyubA@mail.gmail.com>
Subject: Re: [PATCH 1/5] smb3: Move the flush out of smb2_copychunk_range()
 into its callers
To: David Howells <dhowells@redhat.com>
Content-Type: multipart/mixed; boundary="0000000000008249a205e76427e5"
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
Cc: linux-cifs@vger.kernel.org, jlayton@kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 willy@infradead.org, lsahlber@redhat.com, sfrench@samba.org,
 dchinner@redhat.com, linux-fsdevel@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--0000000000008249a205e76427e5
Content-Type: text/plain; charset="UTF-8"

e.g. something like the following


On Mon, Aug 29, 2022 at 12:06 AM Steve French <smfrench@gmail.com> wrote:
>
> Shouldn't this be using filemap_write_and_wait_range() not
> filemap_write_and_wait as we see in similar code in ext4 (and
> shouldn't it check rc in some of these cases)?   For example for the
> copychunk_range example shouldn't the patch be modified similar to the
> following:
>
> diff --git a/fs/cifs/cifsfs.c b/fs/cifs/cifsfs.c
> index e9fb338b8e7e..51963e83daf7 100644
> --- a/fs/cifs/cifsfs.c
> +++ b/fs/cifs/cifsfs.c
> @@ -1219,8 +1219,6 @@ ssize_t cifs_file_copychunk_range(unsigned int xid,
>
>         cifs_dbg(FYI, "copychunk range\n");
>
> -       filemap_write_and_wait(src_inode->i_mapping);
> -
>         if (!src_file->private_data || !dst_file->private_data) {
>                 rc = -EBADF;
>                 cifs_dbg(VFS, "missing cifsFileInfo on copy range src file\n");
> @@ -1250,6 +1248,12 @@ ssize_t cifs_file_copychunk_range(unsigned int xid,
>         lock_two_nondirectories(target_inode, src_inode);
>
>         cifs_dbg(FYI, "about to flush pages\n");
> +
> +       rc = filemap_write_and_wait_range(src_inode->i_mapping, off,
> +                                         off + len - 1);
> +        if (rc)
> +               goto out;
> +
>         /* should we flush first and last page first */
>         truncate_inode_pages(&target_inode->i_data, 0);
>
> On Tue, Aug 23, 2022 at 8:09 AM David Howells via samba-technical
> <samba-technical@lists.samba.org> wrote:
> >
> > Move the flush out of smb2_copychunk_range() into its callers.  This will
> > allow the pagecache to be invalidated between the flush and the operation
> > in smb3_collapse_range() and smb3_insert_range().
> >
> > Signed-off-by: David Howells <dhowells@redhat.com>
> > cc: Steve French <stfrench@microsoft.com>
> > cc: Ronnie Sahlberg <lsahlber@redhat.com>
> > ---
> >
> >  fs/cifs/cifsfs.c  |    2 ++
> >  fs/cifs/smb2ops.c |   20 ++++++++------------
> >  2 files changed, 10 insertions(+), 12 deletions(-)
> >
> > diff --git a/fs/cifs/cifsfs.c b/fs/cifs/cifsfs.c
> > index f54d8bf2732a..e9fb338b8e7e 100644
> > --- a/fs/cifs/cifsfs.c
> > +++ b/fs/cifs/cifsfs.c
> > @@ -1219,6 +1219,8 @@ ssize_t cifs_file_copychunk_range(unsigned int xid,
> >
> >         cifs_dbg(FYI, "copychunk range\n");
> >
> > +       filemap_write_and_wait(src_inode->i_mapping);
> > +
> >         if (!src_file->private_data || !dst_file->private_data) {
> >                 rc = -EBADF;
> >                 cifs_dbg(VFS, "missing cifsFileInfo on copy range src file\n");
> > diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
> > index 96f3b0573606..7e3de6a0e1dc 100644
> > --- a/fs/cifs/smb2ops.c
> > +++ b/fs/cifs/smb2ops.c
> > @@ -1600,17 +1600,8 @@ smb2_copychunk_range(const unsigned int xid,
> >         int chunks_copied = 0;
> >         bool chunk_sizes_updated = false;
> >         ssize_t bytes_written, total_bytes_written = 0;
> > -       struct inode *inode;
> >
> >         pcchunk = kmalloc(sizeof(struct copychunk_ioctl), GFP_KERNEL);
> > -
> > -       /*
> > -        * We need to flush all unwritten data before we can send the
> > -        * copychunk ioctl to the server.
> > -        */
> > -       inode = d_inode(trgtfile->dentry);
> > -       filemap_write_and_wait(inode->i_mapping);
> > -
> >         if (pcchunk == NULL)
> >                 return -ENOMEM;
> >
> > @@ -3689,6 +3680,8 @@ static long smb3_collapse_range(struct file *file, struct cifs_tcon *tcon,
> >                 goto out;
> >         }
> >
> > +       filemap_write_and_wait(inode->i_mapping);
> > +
> >         rc = smb2_copychunk_range(xid, cfile, cfile, off + len,
> >                                   i_size_read(inode) - off - len, off);
> >         if (rc < 0)
> > @@ -3716,18 +3709,21 @@ static long smb3_insert_range(struct file *file, struct cifs_tcon *tcon,
> >         int rc;
> >         unsigned int xid;
> >         struct cifsFileInfo *cfile = file->private_data;
> > +       struct inode *inode = file_inode(file);
> >         __le64 eof;
> >         __u64  count;
> >
> >         xid = get_xid();
> >
> > -       if (off >= i_size_read(file->f_inode)) {
> > +       if (off >= i_size_read(inode)) {
> >                 rc = -EINVAL;
> >                 goto out;
> >         }
> >
> > -       count = i_size_read(file->f_inode) - off;
> > -       eof = cpu_to_le64(i_size_read(file->f_inode) + len);
> > +       count = i_size_read(inode) - off;
> > +       eof = cpu_to_le64(i_size_read(inode) + len);
> > +
> > +       filemap_write_and_wait(inode->i_mapping);
> >
> >         rc = SMB2_set_eof(xid, tcon, cfile->fid.persistent_fid,
> >                           cfile->fid.volatile_fid, cfile->pid, &eof);
> >
> >
> >
>
>
> --
> Thanks,
>
> Steve



-- 
Thanks,

Steve

--0000000000008249a205e76427e5
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb3-use-filemap_write_and_wait_range-instead-of-fil.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-use-filemap_write_and_wait_range-instead-of-fil.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l7f06g0v0>
X-Attachment-Id: f_l7f06g0v0

RnJvbSA1YjEyZTdlOWRjZWZlNjgzYzE4Y2NmYTA2NGQyMTZjOGY4MzY3MmQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IE1vbiwgMjkgQXVnIDIwMjIgMTE6NTM6NDEgLTA1MDAKU3ViamVjdDogW1BBVENIXSBz
bWIzOiB1c2UgZmlsZW1hcF93cml0ZV9hbmRfd2FpdF9yYW5nZSBpbnN0ZWFkIG9mCiBmaWxlbWFw
X3dyaXRlX2FuZF93YWl0CgpXaGVuIGRvaW5nIGluc2VydCByYW5nZSBhbmQgY29sbGFwc2UgcmFu
Z2Ugd2Ugc2hvdWxkIGJlCndyaXRpbmcgb3V0IHRoZSBjYWNoZWQgcGFnZXMgZm9yIHRoZSByYW5n
ZXMgYWZmZWN0ZWQgYnV0IG5vdAp0aGUgd2hvbGUgZmlsZS4KClNpZ25lZC1vZmYtYnk6IFN0ZXZl
IEZyZW5jaCA8c3RmcmVuY2hAbWljcm9zb2Z0LmNvbT4KLS0tCiBmcy9jaWZzL2NpZnNmcy5jICB8
IDggKysrKysrLS0KIGZzL2NpZnMvc21iMm9wcy5jIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZnMvY2lmcy9jaWZz
ZnMuYyBiL2ZzL2NpZnMvY2lmc2ZzLmMKaW5kZXggZTlmYjMzOGI4ZTdlLi41MTk2M2U4M2RhZjcg
MTAwNjQ0Ci0tLSBhL2ZzL2NpZnMvY2lmc2ZzLmMKKysrIGIvZnMvY2lmcy9jaWZzZnMuYwpAQCAt
MTIxOSw4ICsxMjE5LDYgQEAgc3NpemVfdCBjaWZzX2ZpbGVfY29weWNodW5rX3JhbmdlKHVuc2ln
bmVkIGludCB4aWQsCiAKIAljaWZzX2RiZyhGWUksICJjb3B5Y2h1bmsgcmFuZ2VcbiIpOwogCi0J
ZmlsZW1hcF93cml0ZV9hbmRfd2FpdChzcmNfaW5vZGUtPmlfbWFwcGluZyk7Ci0KIAlpZiAoIXNy
Y19maWxlLT5wcml2YXRlX2RhdGEgfHwgIWRzdF9maWxlLT5wcml2YXRlX2RhdGEpIHsKIAkJcmMg
PSAtRUJBREY7CiAJCWNpZnNfZGJnKFZGUywgIm1pc3NpbmcgY2lmc0ZpbGVJbmZvIG9uIGNvcHkg
cmFuZ2Ugc3JjIGZpbGVcbiIpOwpAQCAtMTI1MCw2ICsxMjQ4LDEyIEBAIHNzaXplX3QgY2lmc19m
aWxlX2NvcHljaHVua19yYW5nZSh1bnNpZ25lZCBpbnQgeGlkLAogCWxvY2tfdHdvX25vbmRpcmVj
dG9yaWVzKHRhcmdldF9pbm9kZSwgc3JjX2lub2RlKTsKIAogCWNpZnNfZGJnKEZZSSwgImFib3V0
IHRvIGZsdXNoIHBhZ2VzXG4iKTsKKworCXJjID0gZmlsZW1hcF93cml0ZV9hbmRfd2FpdF9yYW5n
ZShzcmNfaW5vZGUtPmlfbWFwcGluZywgb2ZmLAorCQkJCQkgIG9mZiArIGxlbiAtIDEpOworCWlm
IChyYykKKwkJZ290byBvdXQ7CisKIAkvKiBzaG91bGQgd2UgZmx1c2ggZmlyc3QgYW5kIGxhc3Qg
cGFnZSBmaXJzdCAqLwogCXRydW5jYXRlX2lub2RlX3BhZ2VzKCZ0YXJnZXRfaW5vZGUtPmlfZGF0
YSwgMCk7CiAKZGlmZiAtLWdpdCBhL2ZzL2NpZnMvc21iMm9wcy5jIGIvZnMvY2lmcy9zbWIyb3Bz
LmMKaW5kZXggN2M5NDFjZTFlN2E5Li4xMjMxOWNlZjQyYTcgMTAwNjQ0Ci0tLSBhL2ZzL2NpZnMv
c21iMm9wcy5jCisrKyBiL2ZzL2NpZnMvc21iMm9wcy5jCkBAIC0zNjg4LDYgKzM2ODgsNyBAQCBz
dGF0aWMgbG9uZyBzbWIzX2NvbGxhcHNlX3JhbmdlKHN0cnVjdCBmaWxlICpmaWxlLCBzdHJ1Y3Qg
Y2lmc190Y29uICp0Y29uLAogCiAJZmlsZW1hcF9pbnZhbGlkYXRlX2xvY2soaW5vZGUtPmlfbWFw
cGluZyk7CiAJZmlsZW1hcF93cml0ZV9hbmRfd2FpdChpbm9kZS0+aV9tYXBwaW5nKTsKKwlyYyA9
IGZpbGVtYXBfd3JpdGVfYW5kX3dhaXRfcmFuZ2UoaW5vZGUtPmlfbWFwcGluZywgb2ZmLCBvbGRf
ZW9mIC0gMSk7CiAJdHJ1bmNhdGVfcGFnZWNhY2hlX3JhbmdlKGlub2RlLCBvZmYsIG9sZF9lb2Yp
OwogCiAJcmMgPSBzbWIyX2NvcHljaHVua19yYW5nZSh4aWQsIGNmaWxlLCBjZmlsZSwgb2ZmICsg
bGVuLApAQCAtMzczOSw2ICszNzQwLDcgQEAgc3RhdGljIGxvbmcgc21iM19pbnNlcnRfcmFuZ2Uo
c3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCBjaWZzX3Rjb24gKnRjb24sCiAKIAlmaWxlbWFwX2lu
dmFsaWRhdGVfbG9jayhpbm9kZS0+aV9tYXBwaW5nKTsKIAlmaWxlbWFwX3dyaXRlX2FuZF93YWl0
KGlub2RlLT5pX21hcHBpbmcpOworCXJjID0gZmlsZW1hcF93cml0ZV9hbmRfd2FpdF9yYW5nZShp
bm9kZS0+aV9tYXBwaW5nLCBvZmYsIGVvZiAtIDEpOwogCXRydW5jYXRlX3BhZ2VjYWNoZV9yYW5n
ZShpbm9kZSwgb2ZmLCBvbGRfZW9mKTsKIAogCXJjID0gU01CMl9zZXRfZW9mKHhpZCwgdGNvbiwg
Y2ZpbGUtPmZpZC5wZXJzaXN0ZW50X2ZpZCwKLS0gCjIuMzQuMQoK
--0000000000008249a205e76427e5--

