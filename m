Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EF2D23334
	for <lists+samba-technical@lfdr.de>; Thu, 15 Jan 2026 09:40:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=LXI/JsxBbKF9LcEy7WQN83dkdhDN53l6d1BjVlfpBx8=; b=jvPEHle28ULBsmbFQmOSAKcahA
	OCF27jjWlXHuh/3bIcXR8Wk5z13GDkP2pht4Q4rNHNZ9oYpW4/FT2vFZndwLZqeiAfh7ZUat/c5Yg
	D7A1jZ9lGaz74k97cyulXH0LwheVyxLVBWrN987H/7Uz8MFJ24/RuGRony7FVVS6+K+7028ndti2j
	KhFU1UQdhf/At/xEorm0fVT6NvDkYKNTWBnX7Y+nUof8usquVjK9+L1+hIdnEgvOj4fgB/V5XJq4m
	uNWP3iGmhna6QwNJ3CXGPE9k5SkcgGPrDSUZeYP+FWhf2j62Mpcq5LVE8nryQF14jDGa7D+zqOo/t
	fuOtLguQ==;
Received: from ip6-localhost ([::1]:57070 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vgItB-000A9A-TT; Thu, 15 Jan 2026 08:39:33 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:52504) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vg1dj-00074I-PY
 for samba-technical@lists.samba.org; Wed, 14 Jan 2026 14:14:30 +0000
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6505d3adc3aso13498774a12.1
 for <samba-technical@lists.samba.org>; Wed, 14 Jan 2026 06:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768400067; x=1769004867; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LXI/JsxBbKF9LcEy7WQN83dkdhDN53l6d1BjVlfpBx8=;
 b=GgtsxMqaBzUjSRQf+Z5wWAuGRzFSzash5vnZ0O85b0bYbH6It+W+/kyJK2bs5BvL7O
 bTsjGDUFSJOY/5SAexaqnYVyEmyt4aHdFPGes+SQ7wbTTy15PmkwJVei/KZJ0EVyK7L6
 cHXhJkLaYsR9Hx8eSb88zE3HH0lXmOFWvtMAPU8fY66eVBY+/BiQBhDFCRFRN2Bz8UrJ
 lqEX/UKIbWHryENshR3Zds2BH4bhJNRMHnJA1Mx4nr06tb+dTCKrCTRJtoBwoj8I1kBo
 V20ug5qEtLTPRFs8/klU+MtiLoz39ZOgvJSwcwb5alQFg3n28PzS6C4SlT5Es4wf3Png
 pf4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768400067; x=1769004867;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LXI/JsxBbKF9LcEy7WQN83dkdhDN53l6d1BjVlfpBx8=;
 b=VExtvw8w5tr7noCv80pBaJ+BGroXU1ncU2efUgqgfkFmxoIu39+ZlJVhwVFvts8KZj
 VME4L4frbstWCVdspIqvaIRfiDx2M5lFf7jQJNQAxVIchJJFSO3POS1zNVaJsvdABga6
 +zIaYk7DqCRKMq7dd7MIH5yezyzsLlAFfe0udrHS4AhaGtPWm7xHclBkvoLV0xjI58Ko
 tnuNh99a+kuNfpN3vAKNTqaJXPtyea5jhH5FyWiHmXJVKh0UTSVZ6NBoeqEod3axcXP7
 jRZs5KiYsrdKa9WxoMd6uwyoc97QldksBnFqAp4hzWgBIDKZ2HErwlleJTYbSEEWOTRy
 7Kpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK4v/AWmSRmewku0Sdv/fUYIiLzTtRBSuQhJmorIzFyYyRq9SVFSg2bOM0wtJooA5uPSQ5r/auGMbkxdQUx6s=@lists.samba.org
X-Gm-Message-State: AOJu0YwAqImM25zF/aIqk67wBnGKt/w/Ow41IxUjigfr6fJ77BJ5kdPA
 cmx7u+Jk16Fv5U/zlLX7wfL/i1RVWy+LGSgFElg7ziBOrZSwfZYFzXHFD5QVoDvLe1tsUIJJFij
 avxjn7gHKwf+oLvlr0jtaHd54kNQJ+HM=
X-Gm-Gg: AY/fxX4FnPhzAgtI+IEWxW5W6GZb81Q70OC8YeQuLUS6+cwAkux/Gdziw6DtGlSpzhs
 2eYQ8YlScF2QRBF+CruD/aWI1r4r9HWbsg/JUS6tdBVrkzwbcGhgTYcb1OYaXlKtchkQzrI++0T
 l1W3YDA2VUBx/CrwsyU+MA+oMCPq5tWpFEHc2SC8FE9mZ415oXY0R3FyyzNkUR9UudBilBCKDSv
 alDbEQrBeQdIS5HJJ39u9eq8bs2f9CRzQWnhRWwGT41IlnTL+wz3sQVVmZzdUe98mS7Kl15H/dm
 yL1bxNNnBpvQoowEMIkWLI1S1Fz4aQ==
X-Received: by 2002:a05:6402:210c:b0:64b:42a6:3946 with SMTP id
 4fb4d7f45d1cf-653ec10b2c1mr2391600a12.7.1768400066360; Wed, 14 Jan 2026
 06:14:26 -0800 (PST)
MIME-Version: 1.0
References: <8af369636c32b868f83669c49aea708ca3b894ac.camel@kernel.org>
 <CAOQ4uxgD+Sgbbg9K2U0SF9TyUOBb==Z6auShUWc4FfPaDCQ=rg@mail.gmail.com>
 <ec78bf021fa1f6243798945943541ba171e337e7.camel@kernel.org>
 <cb5d2da6-2090-4639-ad96-138342bba56d@oracle.com>
 <ce700ee20834631eceededc8cd15fc5d00fee28e.camel@kernel.org>
 <20260113-mondlicht-raven-82fc4eb70e9d@brauner>
 <aWZcoyQLvbJKUxDU@infradead.org>
 <ce418800f06aa61a7f47f0d19394988f87a3da07.camel@kernel.org>
 <aWc3mwBNs8LNFN4W@infradead.org>
 <CAOQ4uxhMjitW_DC9WK9eku51gE1Ft+ENhD=qq3uehwrHO=RByA@mail.gmail.com>
 <aWeUv2UUJ_NdgozS@infradead.org>
 <c40862cd65a059ad45fa88f5473722ea5c5f70a5.camel@kernel.org>
In-Reply-To: <c40862cd65a059ad45fa88f5473722ea5c5f70a5.camel@kernel.org>
Date: Wed, 14 Jan 2026 15:14:13 +0100
X-Gm-Features: AZwV_QgcgdaBnds1gv_V4-TD2P8OEmx8uWYCKQoKmrAoITMmwNZxXsYhEeLI48A
Message-ID: <CAOQ4uxhDwR7dteLaqURX+9CooGM1hA7PL6KnVmSwX11ZdKxZTA@mail.gmail.com>
Subject: Re: [PATCH 00/24] vfs: require filesystems to explicitly opt-in to
 lease support
To: Jeff Layton <jlayton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 15 Jan 2026 08:39:31 +0000
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
 linux-cifs@vger.kernel.org, Chao Yu <chao@kernel.org>,
 linux-nfs@vger.kernel.org, Tom Talpey <tom@talpey.com>,
 ocfs2-devel@lists.linux.dev, Bharath SM <bharathsm@microsoft.com>,
 linux-nilfs@vger.kernel.org, David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
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
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
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

On Wed, Jan 14, 2026 at 2:41=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> On Wed, 2026-01-14 at 05:06 -0800, Christoph Hellwig wrote:
> > On Wed, Jan 14, 2026 at 10:34:04AM +0100, Amir Goldstein wrote:
> > > On Wed, Jan 14, 2026 at 7:28=E2=80=AFAM Christoph Hellwig <hch@infrad=
ead.org> wrote:
> > > >
> > > > On Tue, Jan 13, 2026 at 12:06:42PM -0500, Jeff Layton wrote:
> > > > > Fair point, but it's not that hard to conceive of a situation whe=
re
> > > > > someone inadvertantly exports cgroupfs or some similar filesystem=
:
> > > >
> > > > Sure.  But how is this worse than accidentally exporting private da=
ta
> > > > or any other misconfiguration?
> > > >
> > >
> > > My POV is that it is less about security (as your question implies), =
and
> > > more about correctness.
> >
> > I was just replying to Jeff.
> >
> > > The special thing about NFS export, as opposed to, say, ksmbd, is
> > > open by file handle, IOW, the export_operations.
> > >
> > > I perceive this as a very strange and undesired situation when NFS
> > > file handles do not behave as persistent file handles.
> >
> > That is not just very strange, but actually broken (discounting the
> > obscure volatile file handles features not implemented in Linux NFS
> > and NFSD).  And the export ops always worked under the assumption
> > that these file handles are indeed persistent.  If they're not we
> > do have a problem.
> >
> > >
> > > cgroupfs, pidfs, nsfs, all gained open_by_handle_at() capability for
> > > a known reason, which was NOT NFS export.
> > >
> > > If the author of open_by_handle_at() support (i.e. brauner) does not
> > > wish to imply that those fs should be exported to NFS, why object?
> >
> > Because "want to export" is a stupid category.
> >
> > OTOH "NFS exporting doesn't actually properly work because someone
> > overloaded export_ops with different semantics" is a valid category.
> >
>
> cgroupfs definitely doesn't behave as expected when exported via NFS.
> The files aren't readable, at least. I'd also be surprised if the
> filehandles were stable across a reboot, which is sort of necessary for
> proper operation. I didn't test writing, but who knows whether that
> might also just not work, crash the box, or do something else entirely.
>
> I imagine this is the case for all sorts of filesystems like /proc,
> /sys, etc. Those aren't exportable today (to my knowledge), but we're
> growing export_operations across a wide range of fs's these days.
>
> I'd prefer that we require someone to take the deliberate step to say
> "yes, allow nfsd to access this type of filesystem".
>
> > > We could have the opt-in/out of NFS export fixes per EXPORT_OP_
> > > flags and we could even think of allowing admin to make this decision
> > > per vfsmount (e.g. for cgroupfs).
> > >
> > > In any case, I fail to see how objecting to the possibility of NFS ex=
port
> > > opt-out serves anyone.
> >
> > You're still think of it the wrong way.  If we do have file systems
> > that break the original exportfs semantics we need to fix that, and
> > something like a "stable handles" flag will work well for that.  But
> > a totally arbitrary "is exportable" flag is total nonsense.
>

Very well then.
How about EXPORT_OP_PERSISTENT_HANDLES?

This terminology is from the NFS protocol spec and it is also used
to describe the same trait in SMB protocol.

> The problem there is that we very much do want to keep tmpfs
> exportable, but it doesn't have stable handles (per-se).

Thinking out loud -
It would be misguided to declare tmpfs as
EXPORT_OP_PERSISTENT_HANDLES
and regressing exports of tmpfs will surely not go unnoticed.

How about adding an exportfs option "persistent_handles",
use it as default IFF neither options fsid=3D, uuid=3D are used,
so that at least when exporting tmpfs, exportfs -v will show
"no_persistent_handles" explicitly?

Thanks,
Amir.

