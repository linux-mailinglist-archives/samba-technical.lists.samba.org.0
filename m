Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F3259F353
	for <lists+samba-technical@lfdr.de>; Wed, 24 Aug 2022 08:00:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=cyO/HiQvv5LR5kyCr52FjQTo+TbPW6VjEcp4BAuXvbw=; b=cQOIK13K0FCDUh61Xk1SsjFxoN
	qOo4YVNd3nSKO3TESsN9Ftb6yF5Dn+N5l4roSeef/YMbxKnnILpCc11kYoLx/m9aB2JRmFKr/1Nbf
	WZg1RdEjnoSwvp3jQHPE8QyJZjZaoDyQXBh4CIGdYAYy5iHGORF4r/02k4fYChgac/+G9eC9inTa0
	xLrr+PXEAHz51guTPyLfoSKZQBJ+z2rTGPajwicBHsQ+N+Rjxca2uYY8FgGmV/YidEQFRn7ALNdnl
	lRLB1Uwly9laAqr8NjTGmWumzA7gTi10OWEyzI6TgnQlphv0/77SyPmun7T7VShwIWLq7kCS9OJwX
	Qvfj1bhw==;
Received: from ip6-localhost ([::1]:54536 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oQjPn-002BJR-LX; Wed, 24 Aug 2022 05:58:59 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d]:39879) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oQjPh-002BJI-Ko
 for samba-technical@lists.samba.org; Wed, 24 Aug 2022 05:58:56 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id c3so16546087vsc.6
 for <samba-technical@lists.samba.org>; Tue, 23 Aug 2022 22:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=cyO/HiQvv5LR5kyCr52FjQTo+TbPW6VjEcp4BAuXvbw=;
 b=aLJz5dXNnZFTQkeHOg0b4GBOITFuCZA3r9BV8r4dSNcyG7d+8IQNiK5HF7RmN0PJu6
 0c4jnfl9wrG+TRq6f3GBc3SWjkfvVaia5IlSoTKx6hXsHptqxUyi5l7xkuC65t0oYM/P
 G4oUGIxpgiXhsNYlwn+Wa4AknRwLWeUYHMTRsoG8iD5CSQtWBADBRfc72cE8VVcqlj8e
 Xu/k9Br3Q8wVOxAX1sfJgh2fCSJU/vyW04QwqxALGFeFktmG7AWJc7x5/4ANjPq+BUDx
 3vMiCKGQw+oBO2m2C25BuiWS+tidxf5dnsBT7g7khphYtYGrVFZvfRgOGfhKQqABt9y2
 g13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=cyO/HiQvv5LR5kyCr52FjQTo+TbPW6VjEcp4BAuXvbw=;
 b=sZFgiVo2gu+aZvH5Kdw7HzzWBQ+8Odsg6Awciu8i2xkKHxnlJhOub2gfo0OO8uHyeO
 QhfxfI+AfVe9qzMOCzPNK2LdIMAOPprIy5lqle1R4tJdBVc5IHycrOZO9SBBmvXbzJiC
 H5p9A8Pl6RUwsHilg97GADqCjReTBWJwBPPf4ZbRwPgeujXuFR8rKgt+yIMXlBjNNYss
 t1fHrPtaiziSrIb37JQign6U/+/Xu+jk5oI6qAybvxpPQ/FglGAdxmHBSmRZgVJHFZHq
 gBkhe46r9l52hJtYiOH2BYsecXbv7EZMgqkS6siYqb6qqpfU81EfD8il+yAray/u2g7p
 REiQ==
X-Gm-Message-State: ACgBeo3KISnAWzmi/DQNwNP9d8NGXKBT9lt5gnrcYUpchWI9lX1Em7ky
 2U7y/7WlLSInyt5fCPmoSIzAtqCmEpGVAVtrnaM=
X-Google-Smtp-Source: AA6agR79RFxCJ7V2XPxa+/SFic6Z9RotTxvMBTKU1BwN/Q29XEwR1tZ4M5bE8LWuae9pCvYR6BWb3uxqADEeYz399Gc=
X-Received: by 2002:a67:ce90:0:b0:388:4905:1533 with SMTP id
 c16-20020a67ce90000000b0038849051533mr11623736vse.17.1661320731578; Tue, 23
 Aug 2022 22:58:51 -0700 (PDT)
MIME-Version: 1.0
References: <166126004083.548536.11195647088995116235.stgit@warthog.procyon.org.uk>
 <166126007561.548536.12315282792952269215.stgit@warthog.procyon.org.uk>
In-Reply-To: <166126007561.548536.12315282792952269215.stgit@warthog.procyon.org.uk>
Date: Wed, 24 Aug 2022 00:58:40 -0500
Message-ID: <CAH2r5mur6vxRqwdmV8hLhvb3SZLKRvdUJjmMFJoVLev9a7TM3A@mail.gmail.com>
Subject: Re: [PATCH 5/5] smb3: fix temporary data corruption in insert range
To: David Howells <dhowells@redhat.com>
Content-Type: multipart/mixed; boundary="000000000000106b8c05e6f6609b"
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

--000000000000106b8c05e6f6609b
Content-Type: text/plain; charset="UTF-8"

lightly updated to move inode lock down one line and fix signed off

On Tue, Aug 23, 2022 at 8:24 AM David Howells via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> insert range doesn't discard the affected cached region
> so can risk temporarily corrupting file data.
>
> Also includes some minor cleanup (avoiding rereading
> inode size repeatedly unnecessarily) to make it clearer.
>
> Cc: stable@vger.kernel.org
> Fixes: 7fe6fe95b9360 ("cifs: FALLOC_FL_INSERT_RANGE support")
> Signed-off-by: David Howells <dhowells@redhat.com>
> Signed-off-by: Steve French <stfrench@microsoft.com>
> cc: Ronnie Sahlberg <lsahlber@redhat.com>
> ---
>
>  fs/cifs/smb2ops.c |   24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
> index 5b5ddc1b4638..00c8d6a715c7 100644
> --- a/fs/cifs/smb2ops.c
> +++ b/fs/cifs/smb2ops.c
> @@ -3722,35 +3722,43 @@ static long smb3_insert_range(struct file *file, struct cifs_tcon *tcon,
>         struct cifsFileInfo *cfile = file->private_data;
>         struct inode *inode = file_inode(file);
>         __le64 eof;
> -       __u64  count;
> +       __u64  count, old_eof;
> +
> +       inode_lock(inode);
>
>         xid = get_xid();
>
> -       if (off >= i_size_read(inode)) {
> +       old_eof = i_size_read(inode);
> +       if (off >= old_eof) {
>                 rc = -EINVAL;
>                 goto out;
>         }
>
> -       count = i_size_read(inode) - off;
> -       eof = cpu_to_le64(i_size_read(inode) + len);
> +       count = old_eof - off;
> +       eof = cpu_to_le64(old_eof + len);
>
> +       filemap_invalidate_lock(inode->i_mapping);
>         filemap_write_and_wait(inode->i_mapping);
> +       truncate_pagecache_range(inode, off, old_eof);
>
>         rc = SMB2_set_eof(xid, tcon, cfile->fid.persistent_fid,
>                           cfile->fid.volatile_fid, cfile->pid, &eof);
>         if (rc < 0)
> -               goto out;
> +               goto out_2;
>
>         rc = smb2_copychunk_range(xid, cfile, cfile, off, count, off + len);
>         if (rc < 0)
> -               goto out;
> +               goto out_2;
>
> -       rc = smb3_zero_range(file, tcon, off, len, 1);
> +       rc = smb3_zero_data(file, tcon, off, len, xid);
>         if (rc < 0)
> -               goto out;
> +               goto out_2;
>
>         rc = 0;
> +out_2:
> +       filemap_invalidate_unlock(inode->i_mapping);
>   out:
> +       inode_unlock(inode);
>         free_xid(xid);
>         return rc;
>  }
>
>
>


-- 
Thanks,

Steve

--000000000000106b8c05e6f6609b
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb3-fix-temporary-data-corruption-in-insert-range.patch"
Content-Disposition: attachment; 
	filename="0001-smb3-fix-temporary-data-corruption-in-insert-range.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l777gmnn0>
X-Attachment-Id: f_l777gmnn0

RnJvbSBiMDQ0YjRkZDYwNDgxOGVmYTNkNzAzNmQxNGI5NzUwZTNkZWI5YmYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBEYXZpZCBIb3dlbGxzIHZpYSBzYW1iYS10ZWNobmljYWwgPHNh
bWJhLXRlY2huaWNhbEBsaXN0cy5zYW1iYS5vcmc+CkRhdGU6IFR1ZSwgMjMgQXVnIDIwMjIgMTQ6
MDc6NTUgKzAxMDAKU3ViamVjdDogW1BBVENIXSBzbWIzOiBmaXggdGVtcG9yYXJ5IGRhdGEgY29y
cnVwdGlvbiBpbiBpbnNlcnQgcmFuZ2UKCmluc2VydCByYW5nZSBkb2Vzbid0IGRpc2NhcmQgdGhl
IGFmZmVjdGVkIGNhY2hlZCByZWdpb24Kc28gY2FuIHJpc2sgdGVtcG9yYXJpbHkgY29ycnVwdGlu
ZyBmaWxlIGRhdGEuCgpBbHNvIGluY2x1ZGVzIHNvbWUgbWlub3IgY2xlYW51cCAoYXZvaWRpbmcg
cmVyZWFkaW5nCmlub2RlIHNpemUgcmVwZWF0ZWRseSB1bm5lY2Vzc2FyaWx5KSB0byBtYWtlIGl0
IGNsZWFyZXIuCgpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpGaXhlczogN2ZlNmZlOTViOTM2
MCAoImNpZnM6IEZBTExPQ19GTF9JTlNFUlRfUkFOR0Ugc3VwcG9ydCIpClNpZ25lZC1vZmYtYnk6
IERhdmlkIEhvd2VsbHMgPGRob3dlbGxzQHJlZGhhdC5jb20+CmNjOiBSb25uaWUgU2FobGJlcmcg
PGxzYWhsYmVyQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IFN0ZXZlIEZyZW5jaCA8c3RmcmVu
Y2hAbWljcm9zb2Z0LmNvbT4KLS0tCiBmcy9jaWZzL3NtYjJvcHMuYyB8IDI0ICsrKysrKysrKysr
KysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDggZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZnMvY2lmcy9zbWIyb3BzLmMgYi9mcy9jaWZzL3NtYjJvcHMu
YwppbmRleCA1YjVkZGMxYjQ2MzguLjdjOTQxY2UxZTdhOSAxMDA2NDQKLS0tIGEvZnMvY2lmcy9z
bWIyb3BzLmMKKysrIGIvZnMvY2lmcy9zbWIyb3BzLmMKQEAgLTM3MjIsMzUgKzM3MjIsNDMgQEAg
c3RhdGljIGxvbmcgc21iM19pbnNlcnRfcmFuZ2Uoc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCBj
aWZzX3Rjb24gKnRjb24sCiAJc3RydWN0IGNpZnNGaWxlSW5mbyAqY2ZpbGUgPSBmaWxlLT5wcml2
YXRlX2RhdGE7CiAJc3RydWN0IGlub2RlICppbm9kZSA9IGZpbGVfaW5vZGUoZmlsZSk7CiAJX19s
ZTY0IGVvZjsKLQlfX3U2NCAgY291bnQ7CisJX191NjQgIGNvdW50LCBvbGRfZW9mOwogCiAJeGlk
ID0gZ2V0X3hpZCgpOwogCi0JaWYgKG9mZiA+PSBpX3NpemVfcmVhZChpbm9kZSkpIHsKKwlpbm9k
ZV9sb2NrKGlub2RlKTsKKworCW9sZF9lb2YgPSBpX3NpemVfcmVhZChpbm9kZSk7CisJaWYgKG9m
ZiA+PSBvbGRfZW9mKSB7CiAJCXJjID0gLUVJTlZBTDsKIAkJZ290byBvdXQ7CiAJfQogCi0JY291
bnQgPSBpX3NpemVfcmVhZChpbm9kZSkgLSBvZmY7Ci0JZW9mID0gY3B1X3RvX2xlNjQoaV9zaXpl
X3JlYWQoaW5vZGUpICsgbGVuKTsKKwljb3VudCA9IG9sZF9lb2YgLSBvZmY7CisJZW9mID0gY3B1
X3RvX2xlNjQob2xkX2VvZiArIGxlbik7CiAKKwlmaWxlbWFwX2ludmFsaWRhdGVfbG9jayhpbm9k
ZS0+aV9tYXBwaW5nKTsKIAlmaWxlbWFwX3dyaXRlX2FuZF93YWl0KGlub2RlLT5pX21hcHBpbmcp
OworCXRydW5jYXRlX3BhZ2VjYWNoZV9yYW5nZShpbm9kZSwgb2ZmLCBvbGRfZW9mKTsKIAogCXJj
ID0gU01CMl9zZXRfZW9mKHhpZCwgdGNvbiwgY2ZpbGUtPmZpZC5wZXJzaXN0ZW50X2ZpZCwKIAkJ
CSAgY2ZpbGUtPmZpZC52b2xhdGlsZV9maWQsIGNmaWxlLT5waWQsICZlb2YpOwogCWlmIChyYyA8
IDApCi0JCWdvdG8gb3V0OworCQlnb3RvIG91dF8yOwogCiAJcmMgPSBzbWIyX2NvcHljaHVua19y
YW5nZSh4aWQsIGNmaWxlLCBjZmlsZSwgb2ZmLCBjb3VudCwgb2ZmICsgbGVuKTsKIAlpZiAocmMg
PCAwKQotCQlnb3RvIG91dDsKKwkJZ290byBvdXRfMjsKIAotCXJjID0gc21iM196ZXJvX3Jhbmdl
KGZpbGUsIHRjb24sIG9mZiwgbGVuLCAxKTsKKwlyYyA9IHNtYjNfemVyb19kYXRhKGZpbGUsIHRj
b24sIG9mZiwgbGVuLCB4aWQpOwogCWlmIChyYyA8IDApCi0JCWdvdG8gb3V0OworCQlnb3RvIG91
dF8yOwogCiAJcmMgPSAwOworb3V0XzI6CisJZmlsZW1hcF9pbnZhbGlkYXRlX3VubG9jayhpbm9k
ZS0+aV9tYXBwaW5nKTsKICBvdXQ6CisJaW5vZGVfdW5sb2NrKGlub2RlKTsKIAlmcmVlX3hpZCh4
aWQpOwogCXJldHVybiByYzsKIH0KLS0gCjIuMzQuMQoK
--000000000000106b8c05e6f6609b--

