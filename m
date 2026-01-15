Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CE105D2DF49
	for <lists+samba-technical@lfdr.de>; Fri, 16 Jan 2026 09:23:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=JqDSb07Y8F9mJCkqUS0QQHnJ5q+4REJWbBlGem8BlhI=; b=Ti1x5mc8XRtMwpo+JxuWl3dPcw
	T+P03KA7G95+Zn216GWUTWcB6GfJs9wst1AfaVSsBe3MUuNG1PAjIe/IVshBchmUOmHBLrbzP5U7f
	gs16WlQswvNz3KVXXCgVYcBSXAfthgexXf+Nb1aOKo1/qficuatOyMjJyTu6J7SD59YmFEI1uy19T
	nTWNHX0CSvCFo1ju2hB/QgVmuAGqdiZ2gylucz3V1GEacZOvzxe9ZjNluGBJDrHM3grhf0ZSCt2/n
	lhXGFSfXznyQx+pFif4QkE9k12O0O4ve+PMXW6KREVzWqQdD1GEAIedE46aKmjj0Yx/U0+pstLxwg
	I1l6pAFA==;
Received: from ip6-localhost ([::1]:53636 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vgf6j-000E4K-JG; Fri, 16 Jan 2026 08:23:02 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:51665) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vgT4T-000CHz-3m
 for samba-technical@lists.samba.org; Thu, 15 Jan 2026 19:31:56 +0000
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b8714a52072so217862866b.3
 for <samba-technical@lists.samba.org>; Thu, 15 Jan 2026 11:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768505512; x=1769110312; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JqDSb07Y8F9mJCkqUS0QQHnJ5q+4REJWbBlGem8BlhI=;
 b=OfRE85zdaE/rlm9+CZlFrDW6A/pvoAoRUey7x3ONX6l7FqW8RDqaaX8PMshtX4xqqD
 eLc10uLSu1OX8gd1BsV7n/e7SaePV3qxQzMvQ0WP3CjopCnXQSqECDJuPEySAHaxoAck
 YI0c45P+1rVeR9hj5GKo/vzpVLcFzwe4JtSnTgcQt2h6UZj6HS+Q3dSyPScafg3GoQMd
 YA8dD3Q6Q1LS64LV/2sqhKIQnXFyb4d7nSF5Dumi27NNPo/6HNJNOF7EBdpSWdeBCdU9
 vXhLAybJyUiNapMU+kqY1Ot9UH3vKiQG01w/Il6IcDxfG0dlcMKifQbbgk5uLJCQxt9S
 DXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768505512; x=1769110312;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JqDSb07Y8F9mJCkqUS0QQHnJ5q+4REJWbBlGem8BlhI=;
 b=pgMWIeoqlG1mGaeHsc52kSuFDhAFFWf401T4bGRpDYsubsS1pgMN3zR+M0g+0SSN3W
 fKcIfBIytmHaDD0dr9c29X43TVLNQiJbvVkmt7+jpq4GNh21K/KZdxt5KLXpPG8KMptb
 Ki1AtymhJNxrcCdurzN8ngSg9anHIl6fufWn7GXj4dIjmc0MnmzhsIWFCUBBvFH8+j68
 M+zwvbavRRO3DfVLd853k69jKrzGKxTXHaOwz2TTigw9FAj5wuiuFyi/cSQ9YCiv2zpZ
 LvjFIrrQy2J1SjCSpCQ4ye6CGQyCP0vt+BrEWKqbOKdD6ZidJk9rqoHzN73Fm/H/dmL+
 5GIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXanXGkI3GMuHLgali/t4PDE7KB0iOx8AsYohwY9pD3rJ75+lbskokLq9iiDFmkuAqSiU4EMNLvTZPwpMd6hE8=@lists.samba.org
X-Gm-Message-State: AOJu0YxHF28G7vecJO+cuRrXEh/LHsrrvZpkgY2YMzmJf78FjigLz9Ch
 8vwci7lKObN7ygQ2FQX2iqdnup+RMVtv6gXDS6QEKYBOlYRr92LjA1FHPdrsLi7SMrdBvY53doz
 jmyzeIt7AOOmlhVyXuA4eZ65Utdwwd38=
X-Gm-Gg: AY/fxX71BE2zQfqZ7hdPNqacqId9vZygRZ1cC2JUI6WGG8oFqzL3PdR9EDyjOvF7LnG
 t/aIJGJEXiuWLiGCwfj8ZiVslhi/eQMLQk9gWxxDvI2nqSKNgrF41kp+wUFd8WwNOOOBm4KTdLY
 YP8avO5oz3IrTvCSGbCwz/uXmsu31SW5t6GlCPs32DiIDTtp2VsDYXuswJtZwdUdxPLNNBv3z1Y
 7IaaqiLqUFBvoX2M5wTlWyjIZdRA9hq3+phSLLBqlo5pJhHSO42+D5rnFutHzyRqv/5HZHcLR61
 knV3U2qNyjAS73H729zFiUA3vP+F4w==
X-Received: by 2002:a17:907:3c87:b0:b87:442:e9b6 with SMTP id
 a640c23a62f3a-b879690c54amr11543766b.17.1768505511676; Thu, 15 Jan 2026
 11:31:51 -0800 (PST)
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>
 <d486fdb8-686c-4426-9fac-49b7dbc28765@app.fastmail.com>
 <CAOQ4uxhnoTC6KBmRVx2xhvTXYg1hRkCJWrq2eoBQGHKC3sv3Hw@mail.gmail.com>
In-Reply-To: <CAOQ4uxhnoTC6KBmRVx2xhvTXYg1hRkCJWrq2eoBQGHKC3sv3Hw@mail.gmail.com>
Date: Thu, 15 Jan 2026 20:31:40 +0100
X-Gm-Features: AZwV_QhvHAFd_rX2K5lnQvHY5zGWrCY2L2ECA3-jgjFMNT8gFVUBrqM9bcPeRhY
Message-ID: <CAOQ4uxhnSPoqwws7XW4JU=jjgZJoFgCjcWwbfPaprDCZq=wnKQ@mail.gmail.com>
Subject: Re: [PATCH 00/29] fs: require filesystems to explicitly opt-in to
 nfsd export support
To: Chuck Lever <cel@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 16 Jan 2026 08:22:28 +0000
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
Cc: Martin Brandenburg <martin@omnibond.com>,
 jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Alex Markuze <amarkuze@redhat.com>,
 Sandeep Dhavale <dhavale@google.com>, linux-btrfs@vger.kernel.org,
 Carlos Maiolino <cem@kernel.org>, linux-unionfs@vger.kernel.org,
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

On Thu, Jan 15, 2026 at 8:14=E2=80=AFPM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Thu, Jan 15, 2026 at 7:32=E2=80=AFPM Chuck Lever <cel@kernel.org> wrot=
e:
> >
> >
> >
> > On Thu, Jan 15, 2026, at 1:17 PM, Amir Goldstein wrote:
> > > On Thu, Jan 15, 2026 at 6:48=E2=80=AFPM Jeff Layton <jlayton@kernel.o=
rg> wrote:
> > >>
> > >> In recent years, a number of filesystems that can't present stable
> > >> filehandles have grown struct export_operations. They've mostly done
> > >> this for local use-cases (enabling open_by_handle_at() and the like)=
.
> > >> Unfortunately, having export_operations is generally sufficient to m=
ake
> > >> a filesystem be considered exportable via nfsd, but that requires th=
at
> > >> the server present stable filehandles.
> > >
> > > Where does the term "stable file handles" come from? and what does it=
 mean?
> > > Why not "persistent handles", which is described in NFS and SMB specs=
?
> > >
> > > Not to mention that EXPORT_OP_PERSISTENT_HANDLES was Acked
> > > by both Christoph and Christian:
> > >
> > > https://lore.kernel.org/linux-fsdevel/20260115-rundgang-leihgabe-1201=
8e93c00c@brauner/
> > >
> > > Am I missing anything?
> >
> > PERSISTENT generally implies that the file handle is saved on
> > persistent storage. This is not true of tmpfs.
>
> That's one way of interpreting "persistent".
> Another way is "continuing to exist or occur over a prolonged period."
> which works well for tmpfs that is mounted for a long time.
>
> But I am confused, because I went looking for where Jeff said that
> you suggested stable file handles and this is what I found that you wrote=
:
>
> "tmpfs filehandles align quite well with the traditional definition
>  of persistent filehandles. tmpfs filehandles live as long as tmpfs files=
 do,
>  and that is all that is required to be considered "persistent".
>
> >
> > The use of "stable" means that the file handle is stable for
> > the life of the file. This /is/ true of tmpfs.
>
> I can live with STABLE_HANDLES I don't mind as much,
> I understand what it means, but the definition above is invented,
> whereas the term persistent handles is well known and well defined.
>

And also forgot to mention - STABLE HANDLES is very lexicographically
close to STALE HANDLES :-/

Thanks,
Amir.

