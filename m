Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 340CCD1DF56
	for <lists+samba-technical@lfdr.de>; Wed, 14 Jan 2026 11:18:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=cV5qgJhr5qbvOPleJHxrmxwzjsLTEkwpqcVKyAw90ng=; b=AnD4mXWDzqDp/bLn2Jf/YpEI/h
	2cj7WVMddiybdifo8YzbmfLf+hXtBD+H8Pp7OUh/3LXpwR5ziIWF3+8pvsDvNX8KmslwkueVh/j5S
	tSBcwFTgINSrPt5FpaLVc6ruYOQjXhMpAH1kHcu6Z7mmq9SwK+5/USoH8Xy4ui0XtXgYAld35t3qQ
	kdAvFVMK0bWaZn7oxjBPzPJ8SAB+5MR2QNyvhbSGvft9do7ctxjp0TSPI++4KWh2UF4/OCC2LfUgE
	KV61yy7j/hXBff/KQm4LIh1C2KInfWEp4kUPlO7i+jZlWCkG259Q2mLxpfbl1YjwmVyGkYbPkRlAI
	NMrrKEQw==;
Received: from ip6-localhost ([::1]:18810 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vfxxN-0005nC-Oj; Wed, 14 Jan 2026 10:18:29 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:49363) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vfxGc-0005jG-27
 for samba-technical@lists.samba.org; Wed, 14 Jan 2026 09:34:20 +0000
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b8765b80a52so72419766b.2
 for <samba-technical@lists.samba.org>; Wed, 14 Jan 2026 01:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768383257; x=1768988057; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cV5qgJhr5qbvOPleJHxrmxwzjsLTEkwpqcVKyAw90ng=;
 b=JOxOTsyOHhKZen0YVb6IXAvXaAztLuTbhCPt2jjQaLyH2RIPpHYcVQ5j2OCbOVTcH0
 nZMm37mZNoJPmhOkaMVUSJ79UtMkK92n4U3hbJbN1iiY18dkz9yY11o7egkEOUbd3Dlu
 CUPShEVQUo0IVOUbvwWA6bDSGXoScfdZPEreK8Gx9EDud/l6tSBOIops/n6kS6jWGg83
 V5ewXa2pSpfk3hcFJTZOLqWf0yujGPAlX3qazqpoMY5gqVP9cjyLI4je5lOw0zG/igH1
 OcDtB6oRGV70I9grwZm4CmOrF38gJDwxpQlNjd9mQr7gLHMEcjcnLH5WdulAdpz6R1ld
 ReUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768383257; x=1768988057;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cV5qgJhr5qbvOPleJHxrmxwzjsLTEkwpqcVKyAw90ng=;
 b=hEBuPWxXJZFNdcKn7gUE4Re3FMO4B87e15C9R83sVsTOWBf1BWfFLXrSRR6zboXlIM
 w2tychwDttKZ3qJ1qPusYdVjOEUxceRL3G1AjlDWEhRIh+NxrRCODUzQPArojnE2e/Kw
 Clp5AOtj6vZFt080D0diLf+opn1Sl60kG7y9RFM05YFw/V4QfwCuirxWik2zhnCXMexR
 WsPq2ZnxWzKH/ilYucSpqAEeJW60jI8EQ2zswd0m4syBAFR+sj3FThc64P7YDq8YOGre
 JKdx+cyHkyg44EfhL47caUeofFhassdxkVQLVdtQwAVpJww360qwAIuh+AIPgnie7sYF
 pyrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDlXueGy1hmb79OJt2U07HDeLwycIBulVZJD0VjYl8iRFaodllpKhXZFdX4G4h6kpoYxgozgXqWGto/kn93tQ=@lists.samba.org
X-Gm-Message-State: AOJu0Yxu8uW2o411KuRedyavdm+PMCIzz3681hyCrur6e5pQAR3N3Rac
 /M3cO5zUecDd5xiulsnBTywQnJn8SoThi1v8BG55CsOZlp6+NgBl9jbMnVtsadnpqfRjXDcV+SH
 +LCfbpi+vrqRSVuBmNo554PG/OkEEj4A=
X-Gm-Gg: AY/fxX5a8tEEqjC4qVtAFbInucMJrXR81Ao5wM/bPyTvnq+RGqPq6xW6g3QcRxyd+5x
 C297euV6D8CsQDzHBLieTV6NEFo/cFMMb0bj48kan/8xOG0rQwSaJ/9EctgKXp8TlHn9Td0KlqS
 R7YjDS8dbExYGxIUYEghW2PY2OkiMPHlbs9Ql5EfTI2C2TwJLon5vpah9onNsIJIxeJLu0vcL2E
 /lcFbdtjbRBDw2N8rV4W0fPLtjDYNC87tWXHkSWxEFalqguMU3z7A5rxFCdkYgJMR+rF9SGtlhQ
 SCAvCoT5J6C4xujIE7DlgoIiXUZ6SnuKMua+Mqe8
X-Received: by 2002:a17:906:6a02:b0:b87:25a6:a906 with SMTP id
 a640c23a62f3a-b87677e0680mr108491266b.46.1768383255915; Wed, 14 Jan 2026
 01:34:15 -0800 (PST)
MIME-Version: 1.0
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
 <m3mywef74xhcakianlrovrnaadnhzhfqjfusulkcnyioforfml@j2xnk7dzkmv4>
 <8af369636c32b868f83669c49aea708ca3b894ac.camel@kernel.org>
 <CAOQ4uxgD+Sgbbg9K2U0SF9TyUOBb==Z6auShUWc4FfPaDCQ=rg@mail.gmail.com>
 <ec78bf021fa1f6243798945943541ba171e337e7.camel@kernel.org>
 <cb5d2da6-2090-4639-ad96-138342bba56d@oracle.com>
 <ce700ee20834631eceededc8cd15fc5d00fee28e.camel@kernel.org>
 <20260113-mondlicht-raven-82fc4eb70e9d@brauner>
 <aWZcoyQLvbJKUxDU@infradead.org>
 <ce418800f06aa61a7f47f0d19394988f87a3da07.camel@kernel.org>
 <aWc3mwBNs8LNFN4W@infradead.org>
In-Reply-To: <aWc3mwBNs8LNFN4W@infradead.org>
Date: Wed, 14 Jan 2026 10:34:04 +0100
X-Gm-Features: AZwV_QjTKvsgUAM6BTw2rpBHAs0ymZXhE-dNbh6dt2ll27JlZs1InITXkkYC5Xs
Message-ID: <CAOQ4uxhMjitW_DC9WK9eku51gE1Ft+ENhD=qq3uehwrHO=RByA@mail.gmail.com>
Subject: Re: [PATCH 00/24] vfs: require filesystems to explicitly opt-in to
 lease support
To: Christoph Hellwig <hch@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 14 Jan 2026 10:18:26 +0000
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>,
 Alexander Aring <alex.aring@gmail.com>, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Sandeep Dhavale <dhavale@google.com>,
 Martin Brandenburg <martin@omnibond.com>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Anders Larsen <al@alarsen.net>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 jfs-discussion@lists.sourceforge.net, linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, Ilya Dryomov <idryomov@gmail.com>,
 linux-mtd@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Yue Hu <zbestahu@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 devel@lists.orangefs.org, Hugh Dickins <hughd@google.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, ntfs3@lists.linux.dev,
 Joseph Qi <joseph.qi@linux.alibaba.com>, linux-mm@kvack.org,
 Viacheslav Dubeyko <slava@dubeyko.com>, linux-btrfs@vger.kernel.org,
 Gao Xiang <xiang@kernel.org>, linux-ext4@vger.kernel.org,
 Salah Triki <salah.triki@gmail.com>, Carlos Maiolino <cem@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Shyam Prasad N <sprasad@microsoft.com>, samba-technical@lists.samba.org,
 linux-doc@vger.kernel.org, linux-cifs@vger.kernel.org,
 Chao Yu <chao@kernel.org>, linux-nfs@vger.kernel.org,
 Tom Talpey <tom@talpey.com>, ocfs2-devel@lists.linux.dev,
 Bharath SM <bharathsm@microsoft.com>, linux-nilfs@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Eric Van Hensbergen <ericvh@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, Hans de Goede <hansg@kernel.org>,
 gfs2@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Theodore Ts'o <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 linux-erofs@lists.ozlabs.org, v9fs@lists.linux.dev,
 Jonathan Corbet <corbet@lwn.net>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <sfrench@samba.org>, Chuck Lever <chuck.lever@oracle.com>,
 Hongbo Li <lihongbo22@huawei.com>, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, David Woodhouse <dwmw2@infradead.org>,
 Trond Myklebust <trondmy@kernel.org>, Joel Becker <jlbec@evilplan.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jan 14, 2026 at 7:28=E2=80=AFAM Christoph Hellwig <hch@infradead.or=
g> wrote:
>
> On Tue, Jan 13, 2026 at 12:06:42PM -0500, Jeff Layton wrote:
> > Fair point, but it's not that hard to conceive of a situation where
> > someone inadvertantly exports cgroupfs or some similar filesystem:
>
> Sure.  But how is this worse than accidentally exporting private data
> or any other misconfiguration?
>

My POV is that it is less about security (as your question implies), and
more about correctness.

The special thing about NFS export, as opposed to, say, ksmbd, is
open by file handle, IOW, the export_operations.

I perceive this as a very strange and undesired situation when NFS
file handles do not behave as persistent file handles.

FUSE will gladly open a completely different object, sometimes
a different object type from an NFS client request after server restart.

I suppose that the same could happen with tmpfs and probably some
other fs.

This problem is old and welded into the system, but IMO adding more
kernel filesystems, which consciously export file handles that do not
survive server reboot does not serve users interests well.

One could claim that this is a bug that can be fixed by adding boot_id
to said file handles, but why fix something that nobody asked for?

cgroupfs, pidfs, nsfs, all gained open_by_handle_at() capability for
a known reason, which was NOT NFS export.

If the author of open_by_handle_at() support (i.e. brauner) does not
wish to imply that those fs should be exported to NFS, why object?

We could have the opt-in/out of NFS export fixes per EXPORT_OP_
flags and we could even think of allowing admin to make this decision
per vfsmount (e.g. for cgroupfs).

In any case, I fail to see how objecting to the possibility of NFS export
opt-out serves anyone.

Thanks,
Amir.

