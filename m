Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 566297B2D83
	for <lists+samba-technical@lfdr.de>; Fri, 29 Sep 2023 10:06:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=IiAb/i1gc98L6SazD4d4ItKm7HOWY4Sc1dUvsARnIt8=; b=pa0WLcogiU4kqRZxGIaQwwDeRX
	FQHdqDvWiR78nQFJubDGEMJKZfkkMDmpAR8RBGUT5p5ZCAC5iTRQUntW5F3mF1bYxDaqEChZwR0lB
	oHKZuoqObe2bdHc8wA/kiLQQo0nLAktnOjzc29WTKJO8AVkhcTJzex8v5R/UHDojiPPEel4R/IAL4
	Z5gv/77a6JjCiXvbicQubgqa0VJ8IleLT4QDBIqy/4HFKOAqUh4lp1RCokVGr8BV+WZVgVbad8u8P
	fvT1SeGYi//d2mLmuSJQ+/VJ0/BO9Pke+OKUfic5mG1rRfZbzqnS745xLYbKYuVfLR6jp7kTLfvjH
	DySe1xqw==;
Received: from ip6-localhost ([::1]:56096 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qm8WS-0077Kh-1w; Fri, 29 Sep 2023 08:06:52 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931]:50576) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qm4Al-0073DP-KU
 for samba-technical@lists.samba.org; Fri, 29 Sep 2023 03:28:15 +0000
Received: by mail-ua1-x931.google.com with SMTP id
 a1e0cc1a2514c-76d846a4b85so5171105241.1
 for <samba-technical@lists.samba.org>; Thu, 28 Sep 2023 20:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695958089; x=1696562889; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IiAb/i1gc98L6SazD4d4ItKm7HOWY4Sc1dUvsARnIt8=;
 b=G5UmqA6AS2vvY9cKPxJP3SsyyAIfzVpDNjMS2Ab1IGYpfMlD6BmDRLo3LjXWUb0pw6
 NqYhRW/V6gCJ0yUvFPENWOoN4X6rVizUFM1DVCP+Y5dNZbNxW/oNI1Fs0Zm7k/xy9uAm
 aMILFzDWbys5gPk0XCzbAvOE4kSx8kzzxt8tZY4sacRiLhuzFkCwrDc4tknRu2quyME4
 I4PmmaWU3rOhnd3wjP+70sCFJzVoFYWaGYd2mFFCOQVUTQ0UeOW0jyo4xX+PQXsifwog
 wPDruyyq1SYtrUfdvg+nZnW2ZMM/yArc6t0fxtqfpGKyEIpBJCaBfc3bHInswiAFWPHx
 OMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695958089; x=1696562889;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IiAb/i1gc98L6SazD4d4ItKm7HOWY4Sc1dUvsARnIt8=;
 b=o6ku4/wECp7St8F69buvoSGLVsdloFJbjGzq4xz2VYkaskDrryRw9JtB4sFsc38GCR
 rGYMUSKPsdW3B1UBo/Krk5bZxF3klNhYdX34XzcdD7C7W/mK/6ZI0AYiJt5r5J0bFwkN
 h40p8FbTsj5GechHlRYmeIFhMgzKUUmga6yZj4f2CgzeEOfWfC1oHAV0aS40ACszXrJ2
 xcbtlfPD5TJDEMkmgZObYMDVoMJJDuQZkjvOdWMt9jIezzyX/2XijEvGSfvSYVE8jWLY
 +xnKF+54EB84nygF2v/ggrBnSrOEjYLuR6L2S8NxBPsFGpDFMMIXfy2MSbauFrFky051
 d3jA==
X-Gm-Message-State: AOJu0YyySd52nEc441mfQ0UjcBGepARfzepblVtRUdK7wqQgR+yu2AJV
 Ay9pMfiK+eTdLSKQ5Gq0iGhchAn1Uzb8MCqmQOE=
X-Google-Smtp-Source: AGHT+IFwxD5MHwB8nCElH3p97gGzSZFtR6vWTxEs/mssfRQyF6PkJIQiA0uHM4z+FM+M3FEQI561MxdOs0m92SBkdVk=
X-Received: by 2002:a05:6102:d8:b0:452:6da0:678f with SMTP id
 u24-20020a05610200d800b004526da0678fmr2890488vsp.9.1695958089382; Thu, 28 Sep
 2023 20:28:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230928110554.34758-1-jlayton@kernel.org>
 <20230928110554.34758-2-jlayton@kernel.org>
 <6020d6e7-b187-4abb-bf38-dc09d8bd0f6d@app.fastmail.com>
 <af047e4a1c6947c59d4a13d4ae221c784a5386b4.camel@kernel.org>
 <20230928171943.GK11439@frogsfrogsfrogs>
In-Reply-To: <20230928171943.GK11439@frogsfrogsfrogs>
Date: Fri, 29 Sep 2023 06:27:57 +0300
Message-ID: <CAOQ4uxjTpPPUa3VXW+DWKy72JABOZBCXD6pjNk-FhJZWnqvNPA@mail.gmail.com>
Subject: Re: [PATCH 86/87] fs: switch timespec64 fields in inode to discrete
 integers
To: "Darrick J. Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 29 Sep 2023 08:05:15 +0000
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
Cc: Latchesar Ionkov <lucho@ionkov.net>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Hugh Dickins <hughd@google.com>,
 Anders Larsen <al@alarsen.net>, Carlos Llamas <cmllamas@google.com>,
 Andrii Nakryiko <andrii@kernel.org>, Mattia Dongili <malattia@linux.it>,
 John Johansen <john.johansen@canonical.com>,
 Yonghong Song <yonghong.song@linux.dev>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 linux-xfs@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 James Morris <jmorris@namei.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, devel@lists.orangefs.org,
 Shyam Prasad N <sprasad@microsoft.com>, linux-um@lists.infradead.org,
 Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Eric Van Hensbergen <ericvh@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anton Altaparmakov <anton@tuxera.com>, Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Chuck Lever <chuck.lever@oracle.com>, Sven Schnelle <svens@linux.ibm.com>,
 Jiri Olsa <jolsa@kernel.org>, Jan Kara <jack@suse.com>,
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linux-trace-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Kleikamp <shaggy@kernel.org>, samba-technical@lists.samba.org,
 linux-mm@kvack.org, Joel Fernandes <joel@joelfernandes.org>,
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Paul Moore <paul@paul-moore.com>, Leon Romanovsky <leon@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Luis Chamberlain <mcgrof@kernel.org>, codalist@coda.cs.cmu.edu,
 Iurii Zaikin <yzaikin@google.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Todd Kjos <tkjos@android.com>,
 Vasily Gorbik <gor@linux.ibm.com>, selinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, reiserfs-devel@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>, Yue Hu <huyue2@coolpad.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Martijn Coenen <maco@android.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Hao Luo <haoluo@google.com>,
 Tony Luck <tony.luck@intel.com>, Theodore Ts'o <tytso@mit.edu>,
 Nicolas Pitre <nico@fluxnic.net>, linux-ntfs-dev@lists.sourceforge.net,
 Muchun Song <muchun.song@linux.dev>, linux-f2fs-devel@lists.sourceforge.net,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, gfs2@lists.linux.dev,
 "Eric W. Biederman" <ebiederm@xmission.com>, Anna Schumaker <anna@kernel.org>,
 Brad Warrum <bwarrum@linux.ibm.com>, Mike Kravetz <mike.kravetz@oracle.com>,
 linux-efi@vger.kernel.org, Martin Brandenburg <martin@omnibond.com>,
 ocfs2-devel@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>,
 platform-driver-x86@vger.kernel.org, Chris Mason <clm@fb.com>,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org,
 Marc Dionne <marc.dionne@auristor.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-afs@lists.infradead.org, Ian Kent <raven@themaw.net>,
 Naohiro Aota <naohiro.aota@wdc.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, coda@cs.cmu.edu,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Ilya Dryomov <idryomov@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, autofs@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Mark Gross <markgross@kernel.org>,
 Damien Le Moal <dlemoal@kernel.org>, Eric Paris <eparis@parisplace.org>,
 ceph-devel@vger.kernel.org, Gao Xiang <xiang@kernel.org>,
 Jan Harkes <jaharkes@cs.cmu.edu>, linux-nfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, Olga Kornievskaia <kolga@netapp.com>,
 Song Liu <song@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 Steve French <sfrench@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Netdev <netdev@vger.kernel.org>, Bob Peterson <rpeterso@redhat.com>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Chandan Babu R <chandan.babu@oracle.com>, jfs-discussion@lists.sourceforge.net,
 Jan Kara <jack@suse.cz>, Neil Brown <neilb@suse.de>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Bob Copeland <me@bobcopeland.com>, KP Singh <kpsingh@kernel.org>,
 linux-unionfs@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 Ard Biesheuvel <ardb@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, linux-serial@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Salah Triki <salah.triki@gmail.com>,
 Evgeniy Dushistov <dushistov@mail.ru>, linux-cifs@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>, Chao Yu <chao@kernel.org>,
 apparmor@lists.ubuntu.com, Josef Bacik <josef@toxicpanda.com>,
 Tom Talpey <tom@talpey.com>, Hans de Goede <hdegoede@redhat.com>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Johannes Thumshirn <jth@kernel.org>, Ritu Agarwal <rituagar@linux.ibm.com>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, v9fs@lists.linux.dev,
 David Sterba <dsterba@suse.cz>, linux-security-module@vger.kernel.org,
 Jeffle Xu <jefflexu@linux.alibaba.com>,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Johannes Berg <johannes@sipsolutions.net>,
 Sungjong Seo <sj1557.seo@samsung.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-karma-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
 Joel Becker <jlbec@evilplan.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Sep 28, 2023 at 8:19=E2=80=AFPM Darrick J. Wong <djwong@kernel.org>=
 wrote:
>
> On Thu, Sep 28, 2023 at 01:06:03PM -0400, Jeff Layton wrote:
> > On Thu, 2023-09-28 at 11:48 -0400, Arnd Bergmann wrote:
> > > On Thu, Sep 28, 2023, at 07:05, Jeff Layton wrote:
> > > > This shaves 8 bytes off struct inode, according to pahole.
> > > >
> > > > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > >
> > > FWIW, this is similar to the approach that Deepa suggested
> > > back in 2016:
> > >
> > > https://lore.kernel.org/lkml/1452144972-15802-3-git-send-email-deepa.=
kernel@gmail.com/
> > >
> > > It was NaKed at the time because of the added complexity,
> > > though it would have been much easier to do it then,
> > > as we had to touch all the timespec references anyway.
> > >
> > > The approach still seems ok to me, but I'm not sure it's worth
> > > doing it now if we didn't do it then.
> > >
> >
> > I remember seeing those patches go by. I don't remember that change
> > being NaK'ed, but I wasn't paying close attention at the time
> >
> > Looking at it objectively now, I think it's worth it to recover 8 bytes
> > per inode and open a 4 byte hole that Amir can use to grow the
> > i_fsnotify_mask. We might even able to shave off another 12 bytes
> > eventually if we can move to a single 64-bit word per timestamp.
>
> I don't think you can, since btrfs timestamps utilize s64 seconds
> counting in both directions from the Unix epoch.  They also support ns
> resolution:
>
>         struct btrfs_timespec {
>                 __le64 sec;
>                 __le32 nsec;
>         } __attribute__ ((__packed__));
>
> --D
>

Sure we can.
That's what btrfs_inode is for.
vfs inode also does not store i_otime (birth time) and there is even a
precedent of vfs/btrfs variable size mismatch:

        /* full 64 bit generation number, struct vfs_inode doesn't have a b=
ig
         * enough field for this.
         */
        u64 generation;

If we decide that vfs should use "bigtime", btrfs pre-historic
timestamps are not a show stopper.

Thanks,
Amir.

