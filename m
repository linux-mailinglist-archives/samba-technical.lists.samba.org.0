Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1AE31BF6F
	for <lists+samba-technical@lfdr.de>; Mon, 15 Feb 2021 17:36:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=p99Y0IizcDgJJyFvLWYBqAWdhmLE2nZ89U026tr0eGg=; b=kgY5AEeLDb12xqwUqtVYNpb6Q0
	zfZ3jIBnmDxtKoIEJ9i5gGMyQ+PhadjuiSlq1bDkGR9O4vLNwPHyyWzMA+EEGwfMovSApcU1WvNAf
	drvSmJ5aGV2r5hm3kLIwl+3OYNpliYIYUOcF2PLsoaBYRhB9+bebURjBAq2o5nltXMK49DeCjbAto
	Y9E2gk7RuWWem/EDgGc5PAbPOWCLfht6kV7b+xm17P03d5C28S6k9A/QSaBRhsXBjL2nls/yaxDfE
	KjAwa4HcdQDAabuz8veD1WZpPWeL2oeeUTuT3S/5PvobhIVwIAE7zmznT2XmObVRwvw/uFwey+p9n
	u5hO5qyg==;
Received: from ip6-localhost ([::1]:32094 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lBgqJ-00CjAJ-RD; Mon, 15 Feb 2021 16:35:23 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:44667) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lBgq6-00CjA6-Qi
 for samba-technical@lists.samba.org; Mon, 15 Feb 2021 16:35:16 +0000
Received: by mail-il1-x135.google.com with SMTP id y15so5928960ilj.11
 for <samba-technical@lists.samba.org>; Mon, 15 Feb 2021 08:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p99Y0IizcDgJJyFvLWYBqAWdhmLE2nZ89U026tr0eGg=;
 b=EJw3TQMaTEgxG+xxenxwXWMqxKo4ZoBtUH2h4FwcOqRV6/QtYGQwBEBxvsJv15bnRc
 dvDPXT3Focve5ZfHuEATmhmZ2qzU8sbTrBJQ5IYViyNEfynKOwg9B7zfkwXWrocyYEKe
 SREkY7xE+EDu0qcbWsJOXZVuN7YujE+MZniihDK+rPTt0Sasao93PZ7/aUm4d6Het5tp
 Fh/EbSCks8NdGW17iC3KMWuCTrbtzrh7zTUnPC7IHGnSQ23voOYv10qLj4Dp8EeHfjX2
 yJh0qkO7VsWTk9dpgx/i4a8qr6th45vFOn4lkildCUxVzOO1yRu6xCElWYoMYXSmWLGv
 cjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p99Y0IizcDgJJyFvLWYBqAWdhmLE2nZ89U026tr0eGg=;
 b=g1P2PuJ0jhlssz3Jm4aCTM8S91ZxkeSKRL801pthwzCeK+hzKUsYluYV7jYDcdfm8v
 5+zhJ/qR2azzLNHmsyHfhtRfTVDL6QHQRkPnglC4DKfwJA/UYhyZX47CpYG8uic2Whgg
 g1F7bQ18eEAV6K5z8kpTweraa7oz688nHkOvYTJUnqu4EpImpvcgGdbT+EydjWzjdlTE
 M9ZiVVLn38wVqMvdKLE6w6Ew/HurC0fyuPEPhnbg9e/a28Nh1+YNSu4NCa48jZmrsbdy
 Kj73p8GPPtpplnzfUrWCzO5/dsEcFYOIE7LUEh3yEhE5ZlciubM0DCzEJ7OV75peNwy4
 3Cew==
X-Gm-Message-State: AOAM532wE6HBaxec7H7xYkkVjyUEyTi6qo2aMZzN1VyRVEkkvYkTzIiI
 u10DyqygXP95FmCCta+5iO38I5MuaenGOItRfDg=
X-Google-Smtp-Source: ABdhPJyDVoBlsuUNOqBP2XuJTLEKAVsYIxRaxuGbff6zyiXoZeKYAHbxipf2o1BapB3mllRe50630ce+ABVmF0oL0Gk=
X-Received: by 2002:a92:2c08:: with SMTP id t8mr13060037ile.72.1613406908904; 
 Mon, 15 Feb 2021 08:35:08 -0800 (PST)
MIME-Version: 1.0
References: <CAOQ4uxiFGjdvX2-zh5o46pn7RZhvbGHH0wpzLPuPOom91FwWeQ@mail.gmail.com>
 <20210215154317.8590-1-lhenriques@suse.de>
In-Reply-To: <20210215154317.8590-1-lhenriques@suse.de>
Date: Mon, 15 Feb 2021 18:34:57 +0200
Message-ID: <CAOQ4uxgjcCrzDkj-0ukhvHRgQ-D+A3zU5EAe0A=s1Gw2dnTJSA@mail.gmail.com>
Subject: Re: [PATCH v2] vfs: prevent copy_file_range to copy across devices
To: Luis Henriques <lhenriques@suse.de>
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
From: Amir Goldstein via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amir Goldstein <amir73il@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Miklos Szeredi <miklos@szeredi.hu>,
 Greg KH <gregkh@linuxfoundation.org>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 Ian Lance Taylor <iant@google.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Steve French <sfrench@samba.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Dave Chinner <dchinner@redhat.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 ceph-devel <ceph-devel@vger.kernel.org>, Luis Lozano <llozano@chromium.org>,
 Anna Schumaker <anna.schumaker@netapp.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Feb 15, 2021 at 5:42 PM Luis Henriques <lhenriques@suse.de> wrote:
>
> Nicolas Boichat reported an issue when trying to use the copy_file_range
> syscall on a tracefs file.  It failed silently because the file content is
> generated on-the-fly (reporting a size of zero) and copy_file_range needs
> to know in advance how much data is present.
>
> This commit restores the cross-fs restrictions that existed prior to
> 5dae222a5ff0 ("vfs: allow copy_file_range to copy across devices") and
> removes generic_copy_file_range() calls from ceph, cifs, fuse, and nfs.
>
> Fixes: 5dae222a5ff0 ("vfs: allow copy_file_range to copy across devices")
> Link: https://lore.kernel.org/linux-fsdevel/20210212044405.4120619-1-drinkcat@chromium.org/
> Cc: Nicolas Boichat <drinkcat@chromium.org>
> Signed-off-by: Luis Henriques <lhenriques@suse.de>

Code looks ok.
You may add:

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

I agree with Trond that the first paragraph of the commit message could
be improved.
The purpose of this change is to fix the change of behavior that
caused the regression.

Before v5.3, behavior was -EXDEV and userspace could fallback to read.
After v5.3, behavior is zero size copy.

It does not matter so much what makes sense for CFR to do in this
case (generic cross-fs copy).  What matters is that nobody asked for
this change and that it caused problems.

Thanks,
Amir.

