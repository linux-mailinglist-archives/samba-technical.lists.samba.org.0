Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7400C7B2D7D
	for <lists+samba-technical@lfdr.de>; Fri, 29 Sep 2023 10:06:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=AEM/fDbI9O0BImAELzI+hfXsnObtdXB3nh8ZZCXXqn0=; b=DUgIQGNh1LuawZZo2lYYq+tJa5
	+fmmGcn7/dgKA+KguM3iqzNqkeVnPzBGVK/GpjxpDPxEFQIl8jLrPwnNKf3Ia8NLt2pMl8dAXT2n3
	RHuqfhyr+tBBBXj9FXDwTwN7gm2ZMHqcfDu73JPLLslNApBa4Q1UwNIHBWXbDG74cyaDu06aL7Mx5
	yDuYr2YEsEKuEXJIzWXEmKwFhx0Mejj1WTojAKR1fCEMM/50P9czfMT9yic08OCf/EXUjRT4G4VYO
	btm3ajpQAMFg84I3LoEqb8MJgmBrs7SMR/5Ra8iIo4KLAydNaa/3Y30QcPlLlw49Kpsfv+53uVOiN
	wITceH6g==;
Received: from ip6-localhost ([::1]:43128 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qm8VX-00761V-RA; Fri, 29 Sep 2023 08:05:57 +0000
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:41631) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qltWT-006zBl-PA
 for samba-technical@lists.samba.org; Thu, 28 Sep 2023 16:05:59 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5C6B0581DAC;
 Thu, 28 Sep 2023 11:48:43 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Thu, 28 Sep 2023 11:48:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1695916123; x=1695923323; bh=AE
 M/fDbI9O0BImAELzI+hfXsnObtdXB3nh8ZZCXXqn0=; b=Zb4LJ/iWxs7PYCxfSp
 Mmj7xYkSAgWplciC0+hZqHaIVvkpCb/Wp0lEpODKkSCM40frExHvLz4EZAD1HZJ2
 9ttgDzhZqI1ch1xpfCA8FHvF2/PahtOaTm//TzyXbpTROeAOQjegRsYYeSoWNyYK
 byMO63AHEnUHVIOFCUm+mvxA/KjnXoKo0xnweP/w+dWDOvLPjGksvDhU3ohZT6Yp
 QpiswLlY9kvUQhVEctTQH/u+sDAFDQssEAik0gF+XDqfmAiKXNJoWxztil5xTMTb
 X/lrYQ3vvVFk9wvd6DyfBmvUprhzlzpKTyylDH3eDykTx5H6fgxF/6J3HRQ+0H0e
 vkbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1695916123; x=1695923323; bh=AEM/fDbI9O0BI
 mAELzI+hfXsnObtdXB3nh8ZZCXXqn0=; b=n/Qf6qJXucXyk4LW4CL1tlnrKQD+5
 he13BWxPblPpTww3+/1Dnpdhq7Gwr3a+fNA/QON3ImAoB4q0Q/wz7xwPYTvIh6y4
 pI+Bd8aWYcux+cr2fpJzmkbS+P4O02I2hebi06+hrjnSwnPE23SfqSF4cbFR4hlH
 YaVmK8v0yltudUYq72xKx5sAA01J7qL+ne43uzwAXwT6ryRFwbNVU+Y1mHF2dF66
 agNWj0CMsq4gNWlnonaqngyXaD0pPv6qEhlNb+XbjMdBnMkU2kFvOV0FzP6pW1Jx
 vJR5UdEjaUxDazFxTy4TLY4x736COIBHAoRVIXDZypp4DjDlHgBb2dBag==
X-ME-Sender: <xms:VqAVZehkLTOXwS_xg_6r9_9U7myXUu9Xf4xrZ0lmC-mNKcMCcnNsJw>
 <xme:VqAVZfCC0hBNW-6zWSNUDpimotTv1K_lD4MorQPse5pJgj_jwgOrIpVTd1e1lCsJ4
 CyxiAxCxEI04_Mnbzk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrtddtgdeifecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
 ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
 gvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeufeeh
 udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:VqAVZWG45Rd33BgqA4LgSTkoIL6Ot1dfOvbe8RgsboLNiKSqszWOAg>
 <xmx:VqAVZXQTxuydNZS_enwE9LlRoOhiuGF9gCIhq3TRrDdNwtGtt6FbIQ>
 <xmx:VqAVZbxEBIkR5teHqxhFLdOZo9wRUGgFdkIYaLd2pyKQSq2CtJDzCg>
 <xmx:W6AVZTZKpR7w9NLRl_L1L6zoNyttDC4RXO7dBXqniz-srYv7BlTPTA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id BE4B9B60089; Thu, 28 Sep 2023 11:48:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-958-g1b1b911df8-fm-20230927.002-g1b1b911d
MIME-Version: 1.0
Message-Id: <6020d6e7-b187-4abb-bf38-dc09d8bd0f6d@app.fastmail.com>
In-Reply-To: <20230928110554.34758-2-jlayton@kernel.org>
References: <20230928110554.34758-1-jlayton@kernel.org>
 <20230928110554.34758-2-jlayton@kernel.org>
Date: Thu, 28 Sep 2023 11:48:16 -0400
To: "Jeff Layton" <jlayton@kernel.org>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christian Brauner" <brauner@kernel.org>,
 "Linus Torvalds" <torvalds@linux-foundation.org>,
 "David Sterba" <dsterba@suse.cz>, "Amir Goldstein" <amir73il@gmail.com>,
 "Theodore Ts'o" <tytso@mit.edu>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "Kees Cook" <keescook@chromium.org>, "Jeremy Kerr" <jk@ozlabs.org>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Heiko Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 "Todd Kjos" <tkjos@android.com>, "Martijn Coenen" <maco@android.com>,
 "Joel Fernandes" <joel@joelfernandes.org>,
 "Carlos Llamas" <cmllamas@google.com>,
 "Suren Baghdasaryan" <surenb@google.com>,
 "Mattia Dongili" <malattia@linux.it>,
 "Dennis Dalessandro" <dennis.dalessandro@cornelisnetworks.com>,
 "Jason Gunthorpe" <jgg@ziepe.ca>, "Leon Romanovsky" <leon@kernel.org>,
 "Brad Warrum" <bwarrum@linux.ibm.com>,
 "Ritu Agarwal" <rituagar@linux.ibm.com>,
 "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Mark Gross" <markgross@kernel.org>, "Jiri Slaby" <jirislaby@kernel.org>,
 "Eric Van Hensbergen" <ericvh@kernel.org>,
 "Latchesar Ionkov" <lucho@ionkov.net>,
 "Dominique Martinet" <asmadeus@codewreck.org>,
 "Christian Schoenebeck" <linux_oss@crudebyte.com>,
 "David Sterba" <dsterba@suse.com>, "David Howells" <dhowells@redhat.com>,
 "Marc Dionne" <marc.dionne@auristor.com>, "Ian Kent" <raven@themaw.net>,
 "Luis de Bethencourt" <luisbg@kernel.org>,
 "Salah Triki" <salah.triki@gmail.com>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 "Chris Mason" <clm@fb.com>, "Josef Bacik" <josef@toxicpanda.com>,
 "Xiubo Li" <xiubli@redhat.com>, "Ilya Dryomov" <idryomov@gmail.com>,
 "Jan Harkes" <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu,
 "Joel Becker" <jlbec@evilplan.org>, "Christoph Hellwig" <hch@lst.de>,
 "Nicolas Pitre" <nico@fluxnic.net>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Ard Biesheuvel" <ardb@kernel.org>, "Gao Xiang" <xiang@kernel.org>,
 "Chao Yu" <chao@kernel.org>, "Yue Hu" <huyue2@coolpad.com>,
 "Jeffle Xu" <jefflexu@linux.alibaba.com>,
 "Namjae Jeon" <linkinjeon@kernel.org>,
 "Sungjong Seo" <sj1557.seo@samsung.com>, "Jan Kara" <jack@suse.com>,
 "Andreas Dilger" <adilger.kernel@dilger.ca>,
 "Jaegeuk Kim" <jaegeuk@kernel.org>,
 "OGAWA Hirofumi" <hirofumi@mail.parknet.co.jp>,
 "Christoph Hellwig" <hch@infradead.org>,
 "Miklos Szeredi" <miklos@szeredi.hu>, "Bob Peterson" <rpeterso@redhat.com>,
 "Andreas Gruenbacher" <agruenba@redhat.com>,
 "Richard Weinberger" <richard@nod.at>,
 "Anton Ivanov" <anton.ivanov@cambridgegreys.com>,
 "Johannes Berg" <johannes@sipsolutions.net>,
 "Mikulas Patocka" <mikulas@artax.karlin.mff.cuni.cz>,
 "Mike Kravetz" <mike.kravetz@oracle.com>,
 "Muchun Song" <muchun.song@linux.dev>, "Jan Kara" <jack@suse.cz>,
 "David Woodhouse" <dwmw2@infradead.org>,
 "Dave Kleikamp" <shaggy@kernel.org>, "Tejun Heo" <tj@kernel.org>,
 "Trond Myklebust" <trond.myklebust@hammerspace.com>,
 "Anna Schumaker" <anna@kernel.org>,
 "Chuck Lever" <chuck.lever@oracle.com>, "Neil Brown" <neilb@suse.de>,
 "Olga Kornievskaia" <kolga@netapp.com>, "Dai Ngo" <Dai.Ngo@oracle.com>,
 "Tom Talpey" <tom@talpey.com>,
 "Ryusuke Konishi" <konishi.ryusuke@gmail.com>,
 "Anton Altaparmakov" <anton@tuxera.com>,
 "Konstantin Komarov" <almaz.alexandrovich@paragon-software.com>,
 "Mark Fasheh" <mark@fasheh.com>, "Joseph Qi" <joseph.qi@linux.alibaba.com>,
 "Bob Copeland" <me@bobcopeland.com>, "Mike Marshall" <hubcap@omnibond.com>,
 "Martin Brandenburg" <martin@omnibond.com>,
 "Luis Chamberlain" <mcgrof@kernel.org>,
 "Iurii Zaikin" <yzaikin@google.com>, "Tony Luck" <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 "Anders Larsen" <al@alarsen.net>, "Steve French" <sfrench@samba.org>,
 "Paulo Alcantara" <pc@manguebit.com>,
 "Ronnie Sahlberg" <lsahlber@redhat.com>,
 "Shyam Prasad N" <sprasad@microsoft.com>,
 "Sergey Senozhatsky" <senozhatsky@chromium.org>,
 "Phillip Lougher" <phillip@squashfs.org.uk>,
 "Steven Rostedt" <rostedt@goodmis.org>,
 "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Evgeniy Dushistov" <dushistov@mail.ru>,
 "Chandan Babu R" <chandan.babu@oracle.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 "Damien Le Moal" <dlemoal@kernel.org>,
 "Naohiro Aota" <naohiro.aota@wdc.com>,
 "Johannes Thumshirn" <jth@kernel.org>,
 "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>,
 "John Fastabend" <john.fastabend@gmail.com>,
 "KP Singh" <kpsingh@kernel.org>, "Stanislav Fomichev" <sdf@google.com>,
 "Hao Luo" <haoluo@google.com>, "Jiri Olsa" <jolsa@kernel.org>,
 "Hugh Dickins" <hughd@google.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>,
 "John Johansen" <john.johansen@canonical.com>,
 "Paul Moore" <paul@paul-moore.com>, "James Morris" <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 "Stephen Smalley" <stephen.smalley.work@gmail.com>,
 "Eric Paris" <eparis@parisplace.org>
Subject: Re: [PATCH 86/87] fs: switch timespec64 fields in inode to discrete
 integers
Content-Type: text/plain
X-Mailman-Approved-At: Fri, 29 Sep 2023 08:05:16 +0000
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
From: Arnd Bergmann via samba-technical <samba-technical@lists.samba.org>
Reply-To: Arnd Bergmann <arnd@arndb.de>
Cc: jfs-discussion@lists.sourceforge.net, linux-efi@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, gfs2@lists.linux.dev, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-unionfs@vger.kernel.org, codalist@coda.cs.cmu.edu,
 linux-serial@vger.kernel.org, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org, linux-trace-kernel@vger.kernel.org,
 linux-cifs@vger.kernel.org, selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 autofs@vger.kernel.org, linux-um@lists.infradead.org,
 reiserfs-devel@vger.kernel.org, ocfs2-devel@lists.linux.dev,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org,
 v9fs@lists.linux.dev, linux-usb@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-security-module@vger.kernel.org, Netdev <netdev@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-karma-devel@lists.sourceforge.net,
 linux-btrfs@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Sep 28, 2023, at 07:05, Jeff Layton wrote:
> This shaves 8 bytes off struct inode, according to pahole.
>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

FWIW, this is similar to the approach that Deepa suggested
back in 2016:

https://lore.kernel.org/lkml/1452144972-15802-3-git-send-email-deepa.kernel@gmail.com/

It was NaKed at the time because of the added complexity,
though it would have been much easier to do it then,
as we had to touch all the timespec references anyway.

The approach still seems ok to me, but I'm not sure it's worth
doing it now if we didn't do it then.

     Arnd

