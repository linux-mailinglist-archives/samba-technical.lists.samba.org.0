Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CB01DC79087
	for <lists+samba-technical@lfdr.de>; Fri, 21 Nov 2025 13:40:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=pf0Y7V6zXMOhec+D1eTtFZtRtloGjE6Q6JzbMbbBUjw=; b=CwJ+9dZTa+zRAw9iSRa1CiHo5j
	IErGr1lMq4R+BVUe7yohXa2t1cbbN4iXn1SsTTYsrb7aB7wnB6jTfrkgHDPfh3puut/clbcHqv///
	jVZ4F1k6DqVMmUY5XP2QUIl/vk/D52vsli7gUrUKkR6SCortcjsCimL3GoH8oK/N/ld1eCLwd6x5b
	kmuSpaPAbhsppwWORUO218EfviLhWek98PNE7Zx1ZMri6PlhPrdnTbXafFl7cXK4A4zh9QC+UVrym
	q0HPWUDkBrILfCSQ3dV47G8lslgILZE0N1FEHMHmi02M3K1s2YHbS+Pg8koU5dKj9Vqe3ZTkJ6KT+
	PMVBg1gA==;
Received: from ip6-localhost ([::1]:41322 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vMQQI-00Cqt1-UT; Fri, 21 Nov 2025 12:39:35 +0000
Received: from mx1.manguebit.org ([143.255.12.172]:43332) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vMQQC-00Cqsu-Ot
 for samba-technical@lists.samba.org; Fri, 21 Nov 2025 12:39:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=manguebit.org; s=dkim; h=Content-Type:MIME-Version:Date:References:
 In-Reply-To:Subject:Cc:To:From:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=pf0Y7V6zXMOhec+D1eTtFZtRtloGjE6Q6JzbMbbBUjw=; b=N0ZIV6asN74sdUF9RvJ8i20y87
 EhgFaZHtLYX0u2GXi2qngXseJhIc9k+VFSnh8nwG2y5Hg0OUKnHK/iWf8xYLdWJlTu1ejJLxHF68s
 DDD7JEkGWlm6z7VF5yXA9paZ1pBCWRQRop91Y9lmVJeDZ0F4yQdEiSwIjxN84as/cD4N4XlhujlcD
 33ZEPMR2fUGzAvrrkOSklMRqjKOaIPcLiVrSozdLd5/TeIURkrqofijocSDxOGqTnyeJgdPO0Q/Bz
 lbHNjc5i8zgv8Gc8cPFv3K50vEuvkFNoovFq4zNAC2uBO5fHtHUHJgbwXCG4Hfh//SuJ2JLil8x2r
 FC9Zrk+Q==;
Received: from pc by mx1.manguebit.org with local (Exim 4.98.2)
 id 1vMQQ2-00000000H6l-0U5Z; Fri, 21 Nov 2025 09:39:19 -0300
Message-ID: <33405621d347fe99dd3a26dc5b67d417@manguebit.org>
To: ssrane_b23@ee.vjti.ac.in, sfrench@samba.org
Subject: Re: [PATCH] cifs: fix memory leak in smb3_fs_context_parse_param
 error path
In-Reply-To: <20251118150257.35455-1-ssranevjti@gmail.com>
References: <20251118150257.35455-1-ssranevjti@gmail.com>
Date: Fri, 21 Nov 2025 09:39:18 -0300
MIME-Version: 1.0
Content-Type: text/plain
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
From: Paulo Alcantara via samba-technical <samba-technical@lists.samba.org>
Reply-To: Paulo Alcantara <pc@manguebit.org>
Cc: linux-cifs@vger.kernel.org, sprasad@microsoft.com,
 david.hunter.linux@gmail.com,
 syzbot+87be6809ed9bf6d718e3@syzkaller.appspotmail.com,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org, tom@talpey.com,
 bharathsm@microsoft.com, Shaurya Rane <ssrane_b23@ee.vjti.ac.in>,
 khalid@kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

ssrane_b23@ee.vjti.ac.in writes:

> From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
>
> Add proper cleanup of ctx->source and fc->source to the
> cifs_parse_mount_err error handler. This ensures that memory allocated
> for the source strings is correctly freed on all error paths, matching
> the cleanup already performed in the success path by
> smb3_cleanup_fs_context_contents().
> Pointers are also set to NULL after freeing to prevent potential
> double-free issues.
>
> This change fixes a memory leak originally detected by syzbot. The
> leak occurred when processing Opt_source mount options if an error
> happened after ctx->source and fc->source were successfully
> allocated but before the function completed.
>
> The specific leak sequence was:
> 1. ctx->source = smb3_fs_context_fullpath(ctx, '/') allocates memory
> 2. fc->source = kstrdup(ctx->source, GFP_KERNEL) allocates more memory
> 3. A subsequent error jumps to cifs_parse_mount_err
> 4. The old error handler freed passwords but not the source strings,
> causing the memory to leak.
>
> This issue was not addressed by commit e8c73eb7db0a ("cifs: client:
> fix memory leak in smb3_fs_context_parse_param"), which only fixed
> leaks from repeated fsconfig() calls but not this error path.
>
> Reported-by: syzbot+87be6809ed9bf6d718e3@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=87be6809ed9bf6d718e3
> Fixes: 24e0a1eff9e2 ("cifs: switch to new mount api")
> Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
> ---
>  fs/smb/client/fs_context.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/fs/smb/client/fs_context.c b/fs/smb/client/fs_context.c
> index 0f894d09157b..975f1fa153fd 100644
> --- a/fs/smb/client/fs_context.c
> +++ b/fs/smb/client/fs_context.c
> @@ -1834,6 +1834,12 @@ static int smb3_fs_context_parse_param(struct fs_context *fc,
>  	ctx->password = NULL;
>  	kfree_sensitive(ctx->password2);
>  	ctx->password2 = NULL;
> +	kfree(ctx->source);
> +	ctx->source = NULL;
> +	if (fc) {
> +		kfree(fc->source);
> +		fc->source = NULL;
> +	}

The non-NULL check of @fc makes no sense.

Otherwise looks good:

Reviewed-by: Paulo Alcantara (Red Hat) <pc@manguebit.org>

