Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6F3D2DF74
	for <lists+samba-technical@lfdr.de>; Fri, 16 Jan 2026 09:24:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=9qNaS/mHG0CWRhBXyo18LMgHGDC++HAHg2FdEUDjFsI=; b=XPXJLAkEh5gkUu0F+Es6JcY2Z5
	agLtJXgsVG+ZFYixlPMb6jblTeZaBOWnjQs/wtoLBRfzXhc59w8lCyqEUIMmgHzbQwqa3TLycBdRW
	BWTgY/k/JOFONFLKYAhwGjTn/R6pR7Z3/CsdE02tUC7OhlynNGP2ogYSfOtzRMbsf1z1rxI9oNzKr
	F7wN2fAIq36CavgfXacaoZNXDRzZzDLK+FVs79m8R4GqErv7PPdcBmRstniZrYFxXMItNrX2v7vX6
	q5c1paGVBtvR5/4VeH/Nc+L9z3HqD+E/GWc3kGzk2hzcRXIFMKP6DTv26RLtpThF6fUSl5O1YJ2t5
	lEuK+rVw==;
Received: from ip6-localhost ([::1]:31880 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vgf7P-000EER-FS; Fri, 16 Jan 2026 08:23:44 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:49451) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vgUb4-000CPd-T4
 for samba-technical@lists.samba.org; Thu, 15 Jan 2026 21:09:42 +0000
Received: by mail-pf1-x442.google.com with SMTP id
 d2e1a72fcca58-81e821c3d4eso1155391b3a.3
 for <samba-technical@lists.samba.org>; Thu, 15 Jan 2026 13:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1768511376; x=1769116176;
 darn=lists.samba.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9qNaS/mHG0CWRhBXyo18LMgHGDC++HAHg2FdEUDjFsI=;
 b=lGYfid4dlFyXPsw8McAa+rIGYhGM55Xd7yegOZN4gzUmgY2aEP4nX5CxxZtss45BXy
 3NAYX7Ejj+dQ/n8Ie8Qv3d+0MtzyPTdWFuAUVFfIdHfnC+PpF+od+ejnXP28O8q1kpP/
 5bZCU4S6MmUK26i4Ce1bDq3eiJJBkLuroLcyJI4Sg4rIA3KjwjEpDPUZcZ3fu7kgr7gf
 Usw1MMS1Z4V/SOKizGhvGfVlZhuNwav2a8KPxcc98YM/MeFJMJehS0FJ/yuO8XSsCjkV
 hIL4xz5sIyqHiL79IWOTfgRI0Yq1ETG/Zj0MRizNIbzx3kC/IM6EPsY7opjtwJVtZive
 CSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768511376; x=1769116176;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9qNaS/mHG0CWRhBXyo18LMgHGDC++HAHg2FdEUDjFsI=;
 b=itwAVP8QMP17ftMLIqmlRNUj8BYztkVwTI+r9HuoKMU12Je766et+ZNCOBf/F/lTEz
 QgTHxS9vmw977QFNi8BpusRcT1MTC+iw5mV+XaTIZb/Zx3aRcRtsQqfp5wvef6m+9Bho
 8KVNUQ/K8ZV87huGqAOJbf72KcXnK2YGnBijWw+tjBnTnVlq59bTbo/Xp0HXtpnlR3Jy
 Mkt4HFOD+YmSWA8QmEYdteLvwVPX8w8L0Ez1Y2QC0RerexQEyMSqFl+L3MpteCeVAE++
 8si78Yw2SJG8lNivvXA9RpF//E7CCpoGbESyF4v1pWFPfWQWEf6heTipVOOQojyJYEk3
 Abxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5C2HVBeY3VFmTnw6b64Z/DZfOGJPnKBfoFigAOXLmvewZobwyrGT6eT/X4iLYQyWxoeAxo2BsflBX4YbzgeA=@lists.samba.org
X-Gm-Message-State: AOJu0Ywk+Mn7F4NOjx3utorvCJp872zkGcQ8UJUotgCzbUCFdbaSQO31
 LDCrQLXGOHWivt0WAuOJaJPM3+0awsuTWqWWnT8auiJwPaYvcE3ws7/Yj2LGJgMRoLQ=
X-Gm-Gg: AY/fxX6dI1edDENH+7Fscs7zz4zqQ/n83aS0nV4/IxOqNMbzsIXpMnRkXVezWZHO5yo
 s7HsI6giSTNZ0T7LpzB9ew+B8ZQ66My57+ijaSqOvBRYoHfb/G3sPrdMvMJzIbfnXwCz0LXqKvD
 derSRdKnrZ4zSMdt17oRQ9yRKWu2N/3kKXv8MKswHPwFO8PRfHlZvwFgLfMkjFMGN4v1+YylEIJ
 7DgNDz700Px2bUBOnpz9jncuGlLioU4MucrGo70dHyzjiWoerbSiHxi39RGKWu76sw8SqQTja3G
 F95LnbaLlpQp1sPR5neRSHWFneQpSWrwBx8z3k611IbmvSlhwY5m1rFTsXoJsLkAjfYW4WH9rwf
 IxP7onJ6FXMc2kGVvV5f/YND58BK2rWMvPg3AGWiTAPq1dgRuLDq0tr09F5ygU8rHqWAcIJqx+V
 SPJUYBcELCi+HuJLQqkv7Cnl3fOxQ03QxaXlcw6MHzq8rWjJez3EYjFO3wsMH4EVA=
X-Received: by 2002:a05:6a00:1c99:b0:81e:5d52:53b9 with SMTP id
 d2e1a72fcca58-81f9f7f61bamr693898b3a.8.1768511376156; 
 Thu, 15 Jan 2026 13:09:36 -0800 (PST)
Received: from dread.disaster.area (pa49-180-164-75.pa.nsw.optusnet.com.au.
 [49.180.164.75]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-81fa10bda5csm259171b3a.19.2026.01.15.13.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 13:09:35 -0800 (PST)
Received: from dave by dread.disaster.area with local (Exim 4.99.1)
 (envelope-from <david@fromorbit.com>) id 1vgUai-00000003vHn-2AU2;
 Fri, 16 Jan 2026 08:09:16 +1100
Date: Fri, 16 Jan 2026 08:09:16 +1100
To: Chuck Lever <cel@kernel.org>
Subject: Re: [PATCH 00/29] fs: require filesystems to explicitly opt-in to
 nfsd export support
Message-ID: <aWlXfBImnC_jhTw4@dread.disaster.area>
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>
 <d486fdb8-686c-4426-9fac-49b7dbc28765@app.fastmail.com>
 <CAOQ4uxhnoTC6KBmRVx2xhvTXYg1hRkCJWrq2eoBQGHKC3sv3Hw@mail.gmail.com>
 <4d9967cc-a454-46cf-909b-b8ab2d18358d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d9967cc-a454-46cf-909b-b8ab2d18358d@kernel.org>
X-Mailman-Approved-At: Fri, 16 Jan 2026 08:23:23 +0000
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
From: Dave Chinner via samba-technical <samba-technical@lists.samba.org>
Reply-To: Dave Chinner <david@fromorbit.com>
Cc: Martin Brandenburg <martin@omnibond.com>,
 jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Alex Markuze <amarkuze@redhat.com>,
 Sandeep Dhavale <dhavale@google.com>, linux-btrfs@vger.kernel.org,
 Carlos Maiolino <cem@kernel.org>, Amir Goldstein <amir73il@gmail.com>,
 linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, linux-mtd@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, Yue Hu <zbestahu@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>, samba-technical@lists.samba.org,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Hugh Dickins <hughd@google.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Viacheslav Dubeyko <slava@dubeyko.com>, NeilBrown <neil@brown.name>,
 Gao Xiang <xiang@kernel.org>, linux-ext4@vger.kernel.org,
 Salah Triki <salah.triki@gmail.com>, linux-mm@kvack.org,
 devel@lists.orangefs.org, Shyam Prasad N <sprasad@microsoft.com>,
 Olga Kornievskaia <okorniev@redhat.com>, linux-cifs@vger.kernel.org,
 Dave Kleikamp <shaggy@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-nfs@vger.kernel.org, Tom Talpey <tom@talpey.com>,
 ocfs2-devel@lists.linux.dev, Bharath SM <bharathsm@microsoft.com>,
 David Sterba <dsterba@suse.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, gfs2@lists.linux.dev,
 Christian Brauner <brauner@kernel.org>, Theodore Tso <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, linux-erofs@lists.ozlabs.org,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 Chuck Lever <chuck.lever@oracle.com>, Hongbo Li <lihongbo22@huawei.com>,
 Anna Schumaker <anna@kernel.org>, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
 David Woodhouse <dwmw2@infradead.org>, Trond Myklebust <trondmy@kernel.org>,
 Joel Becker <jlbec@evilplan.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Jan 15, 2026 at 02:37:09PM -0500, Chuck Lever wrote:
> On 1/15/26 2:14 PM, Amir Goldstein wrote:
> > On Thu, Jan 15, 2026 at 7:32 PM Chuck Lever <cel@kernel.org> wrote:
> >>
> >>
> >>
> >> On Thu, Jan 15, 2026, at 1:17 PM, Amir Goldstein wrote:
> >>> On Thu, Jan 15, 2026 at 6:48 PM Jeff Layton <jlayton@kernel.org> wrote:
> >>>>
> >>>> In recent years, a number of filesystems that can't present stable
> >>>> filehandles have grown struct export_operations. They've mostly done
> >>>> this for local use-cases (enabling open_by_handle_at() and the like).
> >>>> Unfortunately, having export_operations is generally sufficient to make
> >>>> a filesystem be considered exportable via nfsd, but that requires that
> >>>> the server present stable filehandles.
> >>>
> >>> Where does the term "stable file handles" come from? and what does it mean?
> >>> Why not "persistent handles", which is described in NFS and SMB specs?
> >>>
> >>> Not to mention that EXPORT_OP_PERSISTENT_HANDLES was Acked
> >>> by both Christoph and Christian:
> >>>
> >>> https://lore.kernel.org/linux-fsdevel/20260115-rundgang-leihgabe-12018e93c00c@brauner/
> >>>
> >>> Am I missing anything?
> >>
> >> PERSISTENT generally implies that the file handle is saved on
> >> persistent storage. This is not true of tmpfs.
> > 
> > That's one way of interpreting "persistent".
> > Another way is "continuing to exist or occur over a prolonged period."
> > which works well for tmpfs that is mounted for a long time.
> 
> I think we can be a lot more precise about the guarantee: The file
> handle does not change for the life of the inode it represents. It

<pedantic mode engaged>

File handles most definitely change over the life of a /physical/
inode. Unlinking a file does not require ending the life of the
physical object that provides the persistent data store for the
file.

e.g. XFS dynamically allocates physical inodes might in a life cycle
that looks somewhat life this:

	allocate physical inode
	insert record into allocated inode index
	mark inode as free

	while (don't need to free physical inode) {
		...
		allocate inode for a new file
		update persistent inode metadata to generate new filehandle
		mark inode in use
		...
		unlink file
		mark inode free
	}

	remove inode from allocated inode index
	free physical inode

i.e. a free inode is still an -allocated, indexed inode- in the
filesystem, and until we physically remove it from the filesystem
the inode life cycle has not ended.

IOWs, the physical (persistent) inode lifetime can span the lifetime
of -many- files. However, the filesystem guarantees that the handle
generated for that inode is different for each file it represents
over the whole inode life time.

Hence I think that file handle stability/persistence needs to be
defined in terms of -file lifetimes-, not the lifetimes of the
filesystem objects implement the file's persistent data store.

-Dave.
-- 
Dave Chinner
david@fromorbit.com

