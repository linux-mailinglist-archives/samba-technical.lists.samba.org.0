Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 53517D2DF61
	for <lists+samba-technical@lfdr.de>; Fri, 16 Jan 2026 09:23:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=3/OO8RKyY0YoEvp6ZTLVXNCVFpOv1g0hFAjXGWT4AHc=; b=eODUBHbuMxgPQC5CMP2yt9c+5I
	jmXXsW6U8rcJtwnP3lwu2daLVDXlgcBIFS+uPGAZ7nv3lpSWG74d1Uxgdxz9hkCIzW+2bYmExBrxH
	gfUkLCJM9f8PmSpcmKz4ilClF5JEtYTQqVPjKfvICX6fmX5U6WnZt9W1UXyfj9w7BkRaven4XibXX
	Dh76FUEILmnWwqclG/mp/eYP/lFt6z+1G9bbilXwkTWAcYhCpDjhjlK5FXGTFlpFxmib9/3vzVpYG
	nENWughEb+OMpbEC0qAPlXpo/UhlOjgtbglmjUkQ09BMuutE68xIP25MPWQIkCKTB9UEwoeI1KxzH
	tED3fR9Q==;
Received: from ip6-localhost ([::1]:23388 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vgf75-000E9K-BE; Fri, 16 Jan 2026 08:23:24 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:51246) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vgTJk-000CJ3-92
 for samba-technical@lists.samba.org; Thu, 15 Jan 2026 19:47:43 +0000
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-64d4d8b3ad7so2051712a12.2
 for <samba-technical@lists.samba.org>; Thu, 15 Jan 2026 11:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768506459; x=1769111259; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3/OO8RKyY0YoEvp6ZTLVXNCVFpOv1g0hFAjXGWT4AHc=;
 b=YOKiemJpbt4SWfZUcS5bsXoAHOsGDPYwLb4NiZrdFKcWtNxW8HjKd+S62kXuzy73f8
 KGTR2kEKfNnI00OCiaKPaaKP4IlXYUDz39eeRiTb8o+IOcwHCMQi2nP3c0zwC1xSPy/P
 WTrjUvdrtz43NWinG0vsPH2j/yrqaaJMeYk86srOi3qWOkuE8S3gASolF9LnWEQTFzdI
 /VdE/ghhgVm/EYY8kRwA+EEr9JzboCOYnJtu06UiRrqIO6nOtTyCMGe6tK4ri904RXwS
 3lqxcd2CFlqoAAH4ztkWUYH0PSQc8RnO4U8nNrzkI7mzznX/ihlxUJ4jb1sPiwA0vzUR
 i4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768506459; x=1769111259;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3/OO8RKyY0YoEvp6ZTLVXNCVFpOv1g0hFAjXGWT4AHc=;
 b=Af8QnlZDEyqbdFd9mgA1T8i4oALLdGIrKoDBktq3V0Vnj1naOivbK0ju8PvPLlrY5o
 Gvd1OeFcRRmSL2G6cAmN0x635/Xiq1RxzaRBnGgFkoKT3aRu6QOuCky/wCbSYhmaj8La
 IWZAV8I5V5dILMNDhe5ATuxlb85s9Y9M8wCq3PBr7DcOICUsZH1hYZIkj0IiMBONHMdU
 9wyrXXhxIUuX5pOHTggZU2UxrNdjBLz9A6ZsJeWmvZ37q/pk1GSYOm3eNsPEd3YcVKnN
 eMT6zDHgjUn6dUrHrXO8WB18i+6O1c76r1tqLKzG7OvqzyRw25iAlikMggoV/KFk/EEh
 QJkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJtBgbueGVJzYC2e5oBzA1W8v2yICfCECFDl8ui0jCFFW+Tpx7010nbOZJC62nKscXGFAf6qhjvHIYHsihGKw=@lists.samba.org
X-Gm-Message-State: AOJu0Yz7Umqbj2YUP5OTyaGqH4TXvFJmaTs4jXir2t7O2jD+XWCuNVmT
 NIub/G6jfVHV9thfGdmvpZz3Yju4Z8tWlb/r3VGb/7Tcre05u1rvW6YSiRNHY55z0/s+PnXYo3Q
 YvwfSMj1F6b1bxMr7+UdGoJs5fNAT7X4=
X-Gm-Gg: AY/fxX5tSX5v2v9PbJUQ+KosCLwY36jy6nYxAT7eOJjXkq0plDXDxbIMu89BvhBsJr7
 9VL8QayPY9jlVyAfwAKQPNqaBH5Hmbn+k1JVKENsrys37FiXmUNX1Al0MeFShZdE4py1m/Mv7hu
 EMGSm0XSQkCo2zRTk23xq+dq0j6vxIM4/vgkcD7iCLAzC0B6FF+3CmS4qVLT88zvl+Hj7CA7A3O
 UVWvxM06ep7x7VznNDX5ftyTzdwZ15rMvgoKiL88Se+u3MFunqWhyDilCSeT6rjMaM6XJPkMM6x
 YEutH95efgi6JPl55W4wNUUqFpG+WQ==
X-Received: by 2002:a05:6402:268e:b0:64b:7231:da3d with SMTP id
 4fb4d7f45d1cf-654b955cf01mr167575a12.9.1768506459177; Thu, 15 Jan 2026
 11:47:39 -0800 (PST)
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <CAOQ4uxjOJMwv_hRVTn3tJHDLMQHbeaCGsdLupiZYcwm7M2rm3g@mail.gmail.com>
 <d486fdb8-686c-4426-9fac-49b7dbc28765@app.fastmail.com>
 <CAOQ4uxhnoTC6KBmRVx2xhvTXYg1hRkCJWrq2eoBQGHKC3sv3Hw@mail.gmail.com>
 <4d9967cc-a454-46cf-909b-b8ab2d18358d@kernel.org>
In-Reply-To: <4d9967cc-a454-46cf-909b-b8ab2d18358d@kernel.org>
Date: Thu, 15 Jan 2026 20:47:27 +0100
X-Gm-Features: AZwV_QhMfL4hQaeUnA-dk4TL1Qjc8lTmxpbV_QcnWyLhkyyZFquuhwL6kPGc4Cw
Message-ID: <CAOQ4uxhtorpd6FVsaGO=NdRD72MxeDyabip84ctQYSNufobS8w@mail.gmail.com>
Subject: Re: [PATCH 00/29] fs: require filesystems to explicitly opt-in to
 nfsd export support
To: Chuck Lever <cel@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 16 Jan 2026 08:22:56 +0000
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

On Thu, Jan 15, 2026 at 8:37=E2=80=AFPM Chuck Lever <cel@kernel.org> wrote:
>
> On 1/15/26 2:14 PM, Amir Goldstein wrote:
> > On Thu, Jan 15, 2026 at 7:32=E2=80=AFPM Chuck Lever <cel@kernel.org> wr=
ote:
> >>
> >>
> >>
> >> On Thu, Jan 15, 2026, at 1:17 PM, Amir Goldstein wrote:
> >>> On Thu, Jan 15, 2026 at 6:48=E2=80=AFPM Jeff Layton <jlayton@kernel.o=
rg> wrote:
> >>>>
> >>>> In recent years, a number of filesystems that can't present stable
> >>>> filehandles have grown struct export_operations. They've mostly done
> >>>> this for local use-cases (enabling open_by_handle_at() and the like)=
.
> >>>> Unfortunately, having export_operations is generally sufficient to m=
ake
> >>>> a filesystem be considered exportable via nfsd, but that requires th=
at
> >>>> the server present stable filehandles.
> >>>
> >>> Where does the term "stable file handles" come from? and what does it=
 mean?
> >>> Why not "persistent handles", which is described in NFS and SMB specs=
?
> >>>
> >>> Not to mention that EXPORT_OP_PERSISTENT_HANDLES was Acked
> >>> by both Christoph and Christian:
> >>>
> >>> https://lore.kernel.org/linux-fsdevel/20260115-rundgang-leihgabe-1201=
8e93c00c@brauner/
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
> has nothing to do with whether the file system is mounted.
>
>
> > But I am confused, because I went looking for where Jeff said that
> > you suggested stable file handles and this is what I found that you wro=
te:
> >
> > "tmpfs filehandles align quite well with the traditional definition
> >  of persistent filehandles. tmpfs filehandles live as long as tmpfs fil=
es do,
> >  and that is all that is required to be considered "persistent".
>
> I changed my mind about the name, and I let Jeff know that privately
> when he asked me to look at these patches this morning.
>
>
> >> The use of "stable" means that the file handle is stable for
> >> the life of the file. This /is/ true of tmpfs.
> >
> > I can live with STABLE_HANDLES I don't mind as much,
> > I understand what it means, but the definition above is invented,
> > whereas the term persistent handles is well known and well defined.
>
> Another reason not to adopt the same terminology as NFS is that
> someone might come along and implement NFSv4's VOLATILE file
> handles in Linux, and then say "OK, /now/ can we export cgroupfs?"
> And then Linux will be stuck with overloaded terminology and we'll
> still want to say "NO, NFS doesn't support cgroupfs".
>
> Just a random thought.

Good argument. I'm fine with stable as well :)

Thanks,
Amir.

