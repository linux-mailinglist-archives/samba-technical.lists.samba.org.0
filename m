Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B63D08074
	for <lists+samba-technical@lfdr.de>; Fri, 09 Jan 2026 09:59:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=o8ABr/DNoRVjWLpEG3gYzt78FrDlsrlJ7hUxCqSBKIw=; b=IevBZ3rUvASgLFmT2d4rvR6ESl
	dyonkp8533RhQYkK/76/A6TNg7eNBU9IUrIqU++UqOvX/JzZtrIRTu7dxhEflTVyLYsiLguvOiaD8
	etLgaHupOkLCyTyJzbJsZw2YGxEtbvSevDxz2weFFiVmxW0zpQwv0Emw2hvo7mRsY4aYz3+EIR4Qv
	+NYhuBq6413ZKIJznCcKXOe07W8GVEq5eIKZ6jnDN5oH086fKL8db47P7GoRgXWxwgQlOhhLbBN4r
	8Faq0l51agwplx+IK2o831VCo3uGKEvqYBre7/yjS7/j/J9K2BYiqO4Ns7DvI449I75oBxbDOAB0x
	FKMWTRSw==;
Received: from ip6-localhost ([::1]:50812 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ve8IH-001ijM-7e; Fri, 09 Jan 2026 08:56:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31]:33662) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vdyn5-001hGi-JR
 for samba-technical@lists.samba.org; Thu, 08 Jan 2026 22:47:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 13CFE44461
 for <samba-technical@lists.samba.org>; Thu,  8 Jan 2026 22:47:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9652C19423
 for <samba-technical@lists.samba.org>; Thu,  8 Jan 2026 22:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767912444;
 bh=bpLucB2OVlqnpdSgR5fVsT/9lEifzVxq4+Kg3z371KE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kNZ/y6ld9T/Ac6XqHUpuWQ8PCKoHqDZK4KRIN0fR0qhZUAZgmdbhls/DOYhiAGX7z
 lKJXMbj5kAIa3yPHcJzWdDqHLZWZUws36K4s8WUtTHBy0kZ1G+0Jbjoh7BgoGMTVB0
 EHN+7t2qxXK5Wg9JwteHTuHVEx86cGwPSYmACkxAaR6cPMp9ZisNCP6MINj41SffBs
 rGpQYrIDRH61Pi646aQVZ+ZmxyNbNF5rChS8TKq0svn+ns7GoUEV1FIGJpWNhiL7jz
 wNVHZ83G97Pf5PZFUJN8TAkCmyWsi/CmvHe4Mf70Y4ziokGk5SSSZrPhqGGZMeQCS4
 YWE8KQUzoe6Nw==
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b8010b8f078so592893666b.0
 for <samba-technical@lists.samba.org>; Thu, 08 Jan 2026 14:47:24 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXdQDUji19dQD11KGgMg7bOB8Tew8Dt4ObfkU6IxAUbSTtOdRkTx4v4yiljxbbT5NSevR+QogmLasn5G7kp/XE=@lists.samba.org
X-Gm-Message-State: AOJu0Yzp3caZNof/63z7YE6onrGCmQiXjOifasvo+Yx8LmQWNGpuiOoc
 z9L0jHR7zzngVmoO9/UwRwOmp7wXF6opSXVYj7YuoxbmffK4nLpYwQtsUwdhAt7fCgnxP8d/kur
 esVEdFyFrOlTQifyNl84P/UoCA5p6CZs=
X-Google-Smtp-Source: AGHT+IHRRvrZk+LJHsAd5/mP4TyTtkU5XrZgqXx3MfUuP0vWFtvlehE6tE5BFAh0/XFz8o1ILqvfmo203M6g5zkxlKk=
X-Received: by 2002:a17:907:c1e:b0:b72:c261:3ad2 with SMTP id
 a640c23a62f3a-b84451dab67mr854015966b.50.1767912442100; Thu, 08 Jan 2026
 14:47:22 -0800 (PST)
MIME-Version: 1.0
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
 <20260108-setlease-6-20-v1-7-ea4dec9b67fa@kernel.org>
In-Reply-To: <20260108-setlease-6-20-v1-7-ea4dec9b67fa@kernel.org>
Date: Fri, 9 Jan 2026 07:47:09 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-JTE+233AwpvrXTsbfrbY+U_pvyUTQQSwz0mXh43jt=A@mail.gmail.com>
X-Gm-Features: AQt7F2q41Fu16p_9dWtEjvrFao8uwKCSAe9mKCbLxMeS3Ih2bsPKkzatUTosKic
Message-ID: <CAKYAXd-JTE+233AwpvrXTsbfrbY+U_pvyUTQQSwz0mXh43jt=A@mail.gmail.com>
Subject: Re: [PATCH 07/24] exfat: add setlease file operation
To: Jeff Layton <jlayton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 09 Jan 2026 08:55:52 +0000
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
From: Namjae Jeon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>,
 Alexander Aring <alex.aring@gmail.com>, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Sandeep Dhavale <dhavale@google.com>,
 Martin Brandenburg <martin@omnibond.com>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Anders Larsen <al@alarsen.net>, Amir Goldstein <amir73il@gmail.com>,
 jfs-discussion@lists.sourceforge.net, linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, Ilya Dryomov <idryomov@gmail.com>,
 linux-mtd@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Yue Hu <zbestahu@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 samba-technical@lists.samba.org, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, devel@lists.orangefs.org,
 Hugh Dickins <hughd@google.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, linux-mm@kvack.org,
 Viacheslav Dubeyko <slava@dubeyko.com>, linux-btrfs@vger.kernel.org,
 Gao Xiang <xiang@kernel.org>, linux-ext4@vger.kernel.org,
 Salah Triki <salah.triki@gmail.com>, Carlos Maiolino <cem@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Shyam Prasad N <sprasad@microsoft.com>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, linux-cifs@vger.kernel.org,
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
 ntfs3@lists.linux.dev, Theodore Ts'o <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 linux-erofs@lists.ozlabs.org, v9fs@lists.linux.dev,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>, Chuck Lever <chuck.lever@oracle.com>,
 Hongbo Li <lihongbo22@huawei.com>, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, David Woodhouse <dwmw2@infradead.org>,
 Trond Myklebust <trondmy@kernel.org>, Joel Becker <jlbec@evilplan.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Jan 9, 2026 at 2:14=E2=80=AFAM Jeff Layton <jlayton@kernel.org> wro=
te:
>
> Add the setlease file_operation to exfat_file_operations and
> exfat_dir_operations, pointing to generic_setlease.  A future patch
> will change the default behavior to reject lease attempts with -EINVAL
> when there is no setlease file operation defined. Add generic_setlease
> to retain the ability to set leases on this filesystem.
>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
Acked-by: Namjae Jeon <linkinjeon@kernel.org>
Thanks!

