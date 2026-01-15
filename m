Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C05D2DEFD
	for <lists+samba-technical@lfdr.de>; Fri, 16 Jan 2026 09:21:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=bpVL1RB5I8PR85y4mxEedr9T/Q0DYVA2jeDelSaqSc8=; b=ly+T+Acr13orsi6E18HDLL6GPe
	oX42pNkMKPbLTKiT9t4lmgBEqbhvdrdZxlCuvs42QB4uFRhXoCk1CLDH1MGnxHpJMj4sCow3yCEdd
	GLz3PHJTUT5wxK3Br7fISEzaZHy0nrGHBZA0kyEKwCHq6rWVdBxHBQ8ruoTEWXBzpDcMPc02Slxau
	mqbWuvpAwvB2pRktlr+re1zFa2jPpFFRRnByQKNLl+PdPgpzf+kGc9LZN7t6FLooopNdGBP0Y1h9X
	HvtPD1pxedBT+SCa4eW/ynY16UXLvXdsuH3OOdeCr/MuyL8XT12P0QQ4Zf+U3jVyc9NmE87ztRbAT
	M1oEScUA==;
Received: from ip6-localhost ([::1]:50196 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vgf5A-000Dks-Ba; Fri, 16 Jan 2026 08:21:24 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:58375) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vgSnW-000CFe-3e
 for samba-technical@lists.samba.org; Thu, 15 Jan 2026 19:14:25 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47f3b7ef761so7306665e9.0
 for <samba-technical@lists.samba.org>; Thu, 15 Jan 2026 11:14:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768504461; cv=none;
 d=google.com; s=arc-20240605;
 b=ZN79jRVhRT1ncZe75YKaxooG0/fhrZpfvYgLBn/uUy2qnL4v7/PBJ6bW6VHuEDv7co
 o6uyHAswkITRarAWFuUwWxGWFMy8GWOspJr9uKdYu+EmW/bdkP3+1TS6YduOnwIkWTC/
 ++xccQmtFFpBZ8u+cgwFIdm5pyfzHLQcXJgooCJUG4m+YqDVZg/rI3SwISIWYF0ZmjPQ
 uyeTs+145gl6x1rzsvGw2PEce1Kgsd3bvSeI+YeRwwAyhUx0NwU258TIq7jD4+NZk0NO
 WOu2yv/jUh9TbpOfaSU7jNYn9Isftpj7ZaF69DAPVooIWDgcoIIr7WtcenkrUTKeb4A9
 /KCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=bpVL1RB5I8PR85y4mxEedr9T/Q0DYVA2jeDelSaqSc8=;
 fh=sWaIPS0xSqdkEydDBjdTkNYsO+Nr10kT+6nbeiLmb3c=;
 b=TBKADdgSWtEwIJWEhfIPoZ23l+4Rmv3vJmrcN736MPFNwwGg8eWnoBC4TvtikAgD4W
 pOOx98oSGq7f1ZZrd6pA9qoWfmqqKsPxVcCor+K1RlfxaAu7qEKwsm5IvTo9vPrLz5HE
 qg0GiszQjfWHv2Xke8IM7m+Q9Aj70CsqiMCtFcBbJo9+fpC3RpeLuWglxLG90j4JPiEU
 N+QDhbY9HCnr4uFtFbo1fLRUMr5587NK79WvFZDVbhNk+D6vZ9YwhUN0LZCPES3sSuO2
 00+YbJyFnr77VGYh/ziUKFolmDCLbmJOBf9HuVhbesbW0JV1Yp8961Pr6NA4dFt1VCm7
 cl0g==; darn=lists.samba.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768504461; x=1769109261; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bpVL1RB5I8PR85y4mxEedr9T/Q0DYVA2jeDelSaqSc8=;
 b=JDC2AHV8TAa0BvuEeSQqizvQ06qUaVN38TDXdebV9blMq32c+e3KrOvm6KliDcn6GY
 /nW33cDdeHCgzubPx4uupHjF8HeXZn5K+b3OogGUXXIpSVj66JFL85/2GxfUvTiupeWv
 7+qN7NhlL3pAA3XuSHqKpXXFtzv+Zp/TO8DqiuEaqxJF7bxNUZvEZRCZsXzE8KfVugWD
 h90eyMV/ct/rqsuMHw3OU27ZhFrtZ/EsECKIsEA1eaV6EhzUQAUKM9Q8ih7o2Fbg20PA
 DU6RevHPAhYg3nQE/sDyEFYPpZoi5prA2EriKiwJGo5PHITwrOizEhC/TdG2SEthv85B
 hWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768504461; x=1769109261;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bpVL1RB5I8PR85y4mxEedr9T/Q0DYVA2jeDelSaqSc8=;
 b=LM/q17Q55oTivvUqkmiIVhusZn9D6mMWEwWgumft3HnalEtUzd+EFn2HH5CS3CyMMV
 SrtnzTMCd1QBosueLay1yGpnZDyZZ407Q2OPF3530A6xPtVmYR1AqhO8ZYqEkc4xCZuB
 WaSAnru6zd+b9/IETar3qiHgemIBlI7MnbkOR/AqiAWUW6KH+XXV89KFvGfdlu5lZovo
 jYMS8kv1h0JleO+7e9Si+TigfZnH2r+vKYKfseZXPipA6KbrgA/7oFdcvKbXjvddYmfU
 PhXRdDhanbhLGnz7ikIw8LZ8Sp89SbQJmS5OvrtTnVPIZFZKohvSQ+a+ukSv0vuUm6cI
 oNwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhGPNXjwtVyL/lF09VA8sTrDXVv8tUyNYVnNpS7HrRZW4Dje8uHfI6oruRwB8148MJ4ejtIiFFPvNQQyQzYHc=@lists.samba.org
X-Gm-Message-State: AOJu0Yw8FW9xGYQy7PFSUvc++9wdqtxIHOhxk4YkEWr9Y2/5qNH0H/VN
 6MOVBNgJdDl5MsyZSNeU/HsgydDfNMHZqk90cqIc++OtkF6IfISVqes4cxKqzZGY+WsJV6LHWk2
 opL8y3fHW4orDJLdOpQbsfdvqR/xMNeg=
X-Gm-Gg: AY/fxX6qnfjk/erKUWt5EspCDIJll4A1JqgHNw8x6Ye4IMsdGiEzbktRtsS7tJU7zly
 C8H4Ut0qsMsLJVooaetkygaLMF9IN13EbfEfv4wVPbcd/JfRDiThxf58PhZwEHtrDSeRUrgE9Rx
 xzrEgRt2t9HKJyngYVW93R4DP7AcO79mVwu7u3B5cBYDc+eTk5WPjzKcAYQWUeFjgIoWwvt3Rol
 EfcCbB0KXYIlqHD2P5box0O3LJlvQOIBXPrlwW0bCmN+elHwILdHULBzf3UMVPIF2h/xAc6xpf6
 SOvcjhH0OQdTHS2MWlxyPSl+8mFKtA==
X-Received: by 2002:a05:600c:5487:b0:46f:d682:3c3d with SMTP id
 5b1f17b1804b1-4801e30d482mr9929055e9.13.1768504460920; Thu, 15 Jan 2026
 11:14:20 -0800 (PST)
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>
 <d486fdb8-686c-4426-9fac-49b7dbc28765@app.fastmail.com>
In-Reply-To: <d486fdb8-686c-4426-9fac-49b7dbc28765@app.fastmail.com>
Date: Thu, 15 Jan 2026 20:14:09 +0100
X-Gm-Features: AZwV_QgZJLcC_-bQ-_VIrtnGFnLgmiVjy_ytBB44u2cGVyBOwKNqVyWt_Jfm7Ds
Message-ID: <CAOQ4uxhnoTC6KBmRVx2xhvTXYg1hRkCJWrq2eoBQGHKC3sv3Hw@mail.gmail.com>
Subject: Re: [PATCH 00/29] fs: require filesystems to explicitly opt-in to
 nfsd export support
To: Chuck Lever <cel@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 16 Jan 2026 08:21:15 +0000
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

On Thu, Jan 15, 2026 at 7:32=E2=80=AFPM Chuck Lever <cel@kernel.org> wrote:
>
>
>
> On Thu, Jan 15, 2026, at 1:17 PM, Amir Goldstein wrote:
> > On Thu, Jan 15, 2026 at 6:48=E2=80=AFPM Jeff Layton <jlayton@kernel.org=
> wrote:
> >>
> >> In recent years, a number of filesystems that can't present stable
> >> filehandles have grown struct export_operations. They've mostly done
> >> this for local use-cases (enabling open_by_handle_at() and the like).
> >> Unfortunately, having export_operations is generally sufficient to mak=
e
> >> a filesystem be considered exportable via nfsd, but that requires that
> >> the server present stable filehandles.
> >
> > Where does the term "stable file handles" come from? and what does it m=
ean?
> > Why not "persistent handles", which is described in NFS and SMB specs?
> >
> > Not to mention that EXPORT_OP_PERSISTENT_HANDLES was Acked
> > by both Christoph and Christian:
> >
> > https://lore.kernel.org/linux-fsdevel/20260115-rundgang-leihgabe-12018e=
93c00c@brauner/
> >
> > Am I missing anything?
>
> PERSISTENT generally implies that the file handle is saved on
> persistent storage. This is not true of tmpfs.

That's one way of interpreting "persistent".
Another way is "continuing to exist or occur over a prolonged period."
which works well for tmpfs that is mounted for a long time.

But I am confused, because I went looking for where Jeff said that
you suggested stable file handles and this is what I found that you wrote:

"tmpfs filehandles align quite well with the traditional definition
 of persistent filehandles. tmpfs filehandles live as long as tmpfs files d=
o,
 and that is all that is required to be considered "persistent".

>
> The use of "stable" means that the file handle is stable for
> the life of the file. This /is/ true of tmpfs.

I can live with STABLE_HANDLES I don't mind as much,
I understand what it means, but the definition above is invented,
whereas the term persistent handles is well known and well defined.

Thanks,
Amir.

