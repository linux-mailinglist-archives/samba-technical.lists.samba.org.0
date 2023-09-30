Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0A17B45DF
	for <lists+samba-technical@lfdr.de>; Sun,  1 Oct 2023 10:04:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=laSU2ptF5dJtGJTOfsu2vTDoKsI4bo31YwsLIpMZHsY=; b=jT79LD9tlGwcA5XPUnxxEWKUUY
	O05SQTH9gPx2GJb80hJj2C3jf29PjDQTprN52SFDTU81fWB/6Hpo1HX5+gLOzUdFSl7oFm1Qvn0u7
	AP8iob3LTHTe+yTe7hJXz/Vpegaiqa+FtVINGOJc6bG6/OZOEwiE8iwZa5yO+9KiW8QzhfRrS/JFf
	cuurRfUCuXfcfpoLeG61eFRJfyedtxm73pDYeCiMhYJ7zk3TTzR/XXJBQZ28DNKw2y9BuOzQ0V9U2
	AEssRkpL4VcG3UHJg1AsJBT3XrH69LMGLhElY3q0//DQDgD/bkINy5+tCGc9se8esebQwUwX/o1cL
	0d7MRJpg==;
Received: from ip6-localhost ([::1]:34424 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qmrQZ-00031d-FB; Sun, 01 Oct 2023 08:03:46 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:51311) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qmlkg-0001Hl-DV
 for samba-technical@lists.samba.org; Sun, 01 Oct 2023 02:00:11 +0000
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-327b7e08456so282071f8f.2
 for <samba-technical@lists.samba.org>; Sat, 30 Sep 2023 19:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696125608; x=1696730408; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=laSU2ptF5dJtGJTOfsu2vTDoKsI4bo31YwsLIpMZHsY=;
 b=mrpkGevdzYyB92SrjMhNSJEIn0DM3kz6LCrejgV7I1nArUNhcapSKTy7P23owJU1No
 eqLenNnQUNoEzkYcyrY2WgHPkW2pBwBH+oVcb65+KrSHvEP8Y+jA+WwLakThWzUMkEFD
 YgOIo/wpyPP//N8nYilk80sTiaQR1nXfSfb1BA9KhW6mwmQlBYyccnBz9bdrEC+iJ3L8
 Ktt2RKzUDLiSAJUsJkLfHqnk1SzoPw8wND8AEQ1l2HpOygxK6rIfsbHVMdGVJRzkczTF
 2U5LzXR4qjn163UMXs2lbI5l5Zg3hzLmNtYFSO9G8j8l3EQ7EAlDni1lPmHNQS2NqCYJ
 fGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696125608; x=1696730408;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=laSU2ptF5dJtGJTOfsu2vTDoKsI4bo31YwsLIpMZHsY=;
 b=cllhKqta4S5vGRso98IXF7mT2rcycJ/puzFxKK46U60EbfE45teTI+RW7mXw6VtO6z
 fhc+plMPOTQYqsBURGL3vg+9IzGrNC8t39TB98px9XwNIhEanlpL0h0rLuJNE2TXfS4T
 a9oX2t/8kSE2eeuZeOuybX4Ioi1WGgC5ITsEbdHg/k6xjkTRz3k+PP00vsPQPuiILt/7
 zjWUbiGpArCRZnvwvUu+9Mk7MoSgpXh+dIne5eYgonLLzNcjMSzWECAgJ1OtGA5OAO+9
 Rz2Ee9xm7SVJnFx4nbNMGNDCtMrzVAj5eIr5ZqBneXbocIQaufe3V5rYf/plKFa+i6eq
 xBUA==
X-Gm-Message-State: AOJu0Yx4B+AdLoKXMYVEpoubJYl9qD/xEhX/pE/MpWikbXLyUauGkBHC
 wYd9lN3HswrQiiUp3IkcfHqGTqgOq44+tuj8Dn4DN8C5MZM=
X-Google-Smtp-Source: AGHT+IFKxuEfsWI2Hoye015VefDxXDDWWovJHhYR0GsRnul5m9+uvo7GWv6zNWozBrWHqGB+PwbJIGFbA8W5CapoIHU=
X-Received: by 2002:a05:6512:124a:b0:503:5cd:998b with SMTP id
 fb10-20020a056512124a00b0050305cd998bmr7557694lfb.28.1696085453195; Sat, 30
 Sep 2023 07:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230928110554.34758-1-jlayton@kernel.org>
 <20230928110554.34758-2-jlayton@kernel.org>
 <6020d6e7-b187-4abb-bf38-dc09d8bd0f6d@app.fastmail.com>
 <af047e4a1c6947c59d4a13d4ae221c784a5386b4.camel@kernel.org>
 <20230928171943.GK11439@frogsfrogsfrogs>
 <6a6f37d16b55a3003af3f3dbb7778a367f68cd8d.camel@kernel.org>
 <636661.1695969129@warthog.procyon.org.uk>
In-Reply-To: <636661.1695969129@warthog.procyon.org.uk>
Date: Sat, 30 Sep 2023 09:50:41 -0500
Message-ID: <CAH2r5ms14hPaz=Ex2a=Dj0Hz3XxYLRKFj_rHHekznTbNJ_wABQ@mail.gmail.com>
Subject: Re: [PATCH 86/87] fs: switch timespec64 fields in inode to discrete
 integers
To: David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 01 Oct 2023 08:03:38 +0000
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
Cc: Latchesar Ionkov <lucho@ionkov.net>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>, Anders Larsen <al@alarsen.net>,
 Carlos Llamas <cmllamas@google.com>, Sven Schnelle <svens@linux.ibm.com>,
 Mattia Dongili <malattia@linux.it>, Yonghong Song <yonghong.song@linux.dev>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Michael Ellerman <mpe@ellerman.id.au>,
 James Morris <jmorris@namei.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, devel@lists.orangefs.org,
 Shyam Prasad N <sprasad@microsoft.com>, Jan Harkes <jaharkes@cs.cmu.edu>,
 linux-um@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Eric Van Hensbergen <ericvh@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anton Altaparmakov <anton@tuxera.com>, Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Jan Kara <jack@suse.com>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Kleikamp <shaggy@kernel.org>, samba-technical@lists.samba.org,
 Marc Dionne <marc.dionne@auristor.com>, Eric Dumazet <edumazet@google.com>,
 Stanislav Fomichev <sdf@google.com>, linux-s390@vger.kernel.org,
 linux-nilfs@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 Leon Romanovsky <leon@kernel.org>, Hugh Dickins <hughd@google.com>,
 Andrii Nakryiko <andrii@kernel.org>, codalist@coda.cs.cmu.edu,
 Iurii Zaikin <yzaikin@google.com>, Namjae Jeon <linkinjeon@kernel.org>,
 linux-trace-kernel@vger.kernel.org, Todd Kjos <tkjos@android.com>,
 Vasily Gorbik <gor@linux.ibm.com>, selinux@vger.kernel.org,
 reiserfs-devel@vger.kernel.org, Sungjong Seo <sj1557.seo@samsung.com>,
 ocfs2-devel@lists.linux.dev, Yue Hu <huyue2@coolpad.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Martijn Coenen <maco@android.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Hao Luo <haoluo@google.com>,
 Tony Luck <tony.luck@intel.com>, Theodore Ts'o <tytso@mit.edu>,
 Nicolas Pitre <nico@fluxnic.net>, linux-ntfs-dev@lists.sourceforge.net,
 Muchun Song <muchun.song@linux.dev>, linux-f2fs-devel@lists.sourceforge.net,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>, Anna Schumaker <anna@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Brad Warrum <bwarrum@linux.ibm.com>,
 Mike Kravetz <mike.kravetz@oracle.com>, linux-efi@vger.kernel.org,
 Martin Brandenburg <martin@omnibond.com>, Alexei Starovoitov <ast@kernel.org>,
 platform-driver-x86@vger.kernel.org, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Chris Mason <clm@fb.com>, linux-mtd@lists.infradead.org,
 linux-hardening@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 Jiri Slaby <jirislaby@kernel.org>, linux-afs@lists.infradead.org,
 Ian Kent <raven@themaw.net>, Naohiro Aota <naohiro.aota@wdc.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Miklos Szeredi <miklos@szeredi.hu>,
 linux-rdma@vger.kernel.org, coda@cs.cmu.edu,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Ilya Dryomov <idryomov@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Amir Goldstein <amir73il@gmail.com>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 autofs@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Mark Gross <markgross@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 Eric Paris <eparis@parisplace.org>, ceph-devel@vger.kernel.org,
 Gao Xiang <xiang@kernel.org>, gfs2@lists.linux.dev, linux-nfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, Olga Kornievskaia <kolga@netapp.com>,
 Song Liu <song@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, linux-xfs@vger.kernel.org,
 Jeremy Kerr <jk@ozlabs.org>, Bob Peterson <rpeterso@redhat.com>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Chandan Babu R <chandan.babu@oracle.com>, jfs-discussion@lists.sourceforge.net,
 Jan Kara <jack@suse.cz>, Neil Brown <neilb@suse.de>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Bob Copeland <me@bobcopeland.com>, KP Singh <kpsingh@kernel.org>,
 David Sterba <dsterba@suse.cz>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 linux-mm@kvack.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 Ard Biesheuvel <ardb@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Steve French <sfrench@samba.org>, linux-serial@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Salah Triki <salah.triki@gmail.com>,
 John Fastabend <john.fastabend@gmail.com>,
 Evgeniy Dushistov <dushistov@mail.ru>, linux-cifs@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>, Chao Yu <chao@kernel.org>,
 apparmor@lists.ubuntu.com, Josef Bacik <josef@toxicpanda.com>,
 Tom Talpey <tom@talpey.com>, Hans de Goede <hdegoede@redhat.com>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 John Johansen <john.johansen@canonical.com>,
 Ritu Agarwal <rituagar@linux.ibm.com>, Luis de Bethencourt <luisbg@kernel.org>,
 Netdev <netdev@vger.kernel.org>, v9fs@lists.linux.dev,
 linux-unionfs@vger.kernel.org, linux-security-module@vger.kernel.org,
 Jeffle Xu <jefflexu@linux.alibaba.com>,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Johannes Berg <johannes@sipsolutions.net>, Johannes Thumshirn <jth@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-karma-devel@lists.sourceforge.net,
 linux-btrfs@vger.kernel.org, Joel Becker <jlbec@evilplan.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Sep 29, 2023 at 3:06=E2=80=AFAM David Howells via samba-technical
<samba-technical@lists.samba.org> wrote:
>
>
> Jeff Layton <jlayton@kernel.org> wrote:
>
> > Correct. We'd lose some fidelity in currently stored timestamps, but as
> > Linus and Ted pointed out, anything below ~100ns granularity is
> > effectively just noise, as that's the floor overhead for calling into
> > the kernel. It's hard to argue that any application needs that sort of
> > timestamp resolution, at least with contemporary hardware.
>
> Albeit with the danger of making Steve French very happy;-), would it mak=
e
> sense to switch internally to Microsoft-style 64-bit timestamps with thei=
r
> 100ns granularity?

100ns granularity does seem to make sense and IIRC was used by various
DCE standards in the 90s and 2000s (not just used for SMB2/SMB3 protocol an=
d
various Windows filesystems)


--=20
Thanks,

Steve

