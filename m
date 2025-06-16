Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DC8ADC452
	for <lists+samba-technical@lfdr.de>; Tue, 17 Jun 2025 10:14:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=alq/Pjol9hRHmsoK4W/c2CtmXHL3bnmjTRKmw+CMrtk=; b=DM+bk9IqImMIF8w9EOf+UzDRaH
	hE+c7EVVPVCLCWdlkVWdms8KtNxQddPlZ1nKv4QW5+ISHfVE6lmLI5z1rW0hkw1HOIlznLgBjAaF0
	tyowT6C4nAulHfW96TQlzQuS9rMcidfQxuUfKDuDnaz7xLi3qxoPbQACFT7prdFwoMYm4CqX9wJ1V
	WuI1xUVUTZYw6pOgIL+AVTTunSrau03f10mAxWF/265RU2tDnIAwAXJUUf0rRPuqZsHJniUjfcBDZ
	YYXM0J0IG/ck5t96VOpl4AzGibI/SmYP+b2vlObGrmzXOs7bNafREl/aWKB+wnMGk3ArYHFDuxfxh
	QraJzKeQ==;
Received: from ip6-localhost ([::1]:56396 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uRRSQ-007HGE-JG; Tue, 17 Jun 2025 08:14:14 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff]:36210) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uRGxW-007Fjo-Hl
 for samba-technical@lists.samba.org; Mon, 16 Jun 2025 21:01:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=alq/Pjol9hRHmsoK4W/c2CtmXHL3bnmjTRKmw+CMrtk=; b=A7p+Acvn5uycXyz3kLo38iW9Ad
 D+bYigpKSwXx9Qqj1iM2cauc4vJVM5S4cn4cbXzLSyPr5aCY6CT2OVFHXSo8Ysd1LMe4PIHVof75s
 4ixGU0gXpw9fxNXo/FZ31klq9ihs5qru2SnNaJuY3SsfiDVgdbRXOX9BVI2VDLVAd+vUo1oJFU8Te
 frcwrPbBPewoCrxwD5QpKNqhm3CGjwSVicr7Dykb5NZb2DUD7NyCDlrCYxIHPR3p2qtE9G2el/ykq
 A/AlxzwslpPcDC/i4wy3o5P2e7I9G86mm6pGM50kd8VFzxMarLvEuy3Rg4LaGo1AqBnz7BuHEsWZB
 PDLsSc+w==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat
 Linux)) id 1uRGeL-00000002Qr4-0IjJ; Mon, 16 Jun 2025 20:41:49 +0000
Date: Mon, 16 Jun 2025 21:41:49 +0100
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: Re: [PATCH 00/10] convert the majority of file systems to mmap_prepare
Message-ID: <20250616204149.GK1880847@ZenIV>
References: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
X-Mailman-Approved-At: Tue, 17 Jun 2025 08:13:59 +0000
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
From: Al Viro via samba-technical <samba-technical@lists.samba.org>
Reply-To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Latchesar Ionkov <lucho@ionkov.net>, nvdimm@lists.linux.dev,
 Paulo Alcantara <pc@manguebit.org>, dri-devel@lists.freedesktop.org,
 ceph-devel@vger.kernel.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, Tyler Hicks <code@tyhicks.com>,
 devel@lists.orangefs.org, Shyam Prasad N <sprasad@microsoft.com>,
 Jan Harkes <jaharkes@cs.cmu.edu>, linux-um@lists.infradead.org,
 Joel Becker <jlbec@evilplan.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Eric Van Hensbergen <ericvh@kernel.org>,
 Zhihao Cheng <chengzhihao1@huawei.com>, Christian Brauner <brauner@kernel.org>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Trond Myklebust <trondmy@kernel.org>, Dave Kleikamp <shaggy@kernel.org>,
 Sandeep Dhavale <dhavale@google.com>, Simona Vetter <simona@ffwll.ch>,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, Namjae Jeon <linkinjeon@kernel.org>,
 ecryptfs@vger.kernel.org, Yangtao Li <frank.li@vivo.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, ocfs2-devel@lists.linux.dev,
 Pedro Falcato <pfalcato@suse.de>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 linux-block@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 linux-f2fs-devel@lists.sourceforge.net, Hongbo Li <lihongbo22@huawei.com>,
 Anna Schumaker <anna@kernel.org>, Martin Brandenburg <martin@omnibond.com>,
 Kees Cook <kees@kernel.org>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Carlos Maiolino <cem@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Chris Mason <clm@fb.com>,
 linux-mtd@lists.infradead.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Marc Dionne <marc.dionne@auristor.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 linux-afs@lists.infradead.org, Naohiro Aota <naohiro.aota@wdc.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Matthew Wilcox <willy@infradead.org>,
 coda@cs.cmu.edu, Viacheslav Dubeyko <slava@dubeyko.com>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>, intel-gfx@lists.freedesktop.org,
 Damien Le Moal <dlemoal@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Gao Xiang <xiang@kernel.org>,
 David Howells <dhowells@redhat.com>, linux-nfs@vger.kernel.org,
 linux-mm@kvack.org, samba-technical@lists.samba.org,
 Steve French <sfrench@samba.org>, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, jfs-discussion@lists.sourceforge.net,
 Jan Kara <jack@suse.cz>, linux-aio@kvack.org,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Bob Copeland <me@bobcopeland.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 David Airlie <airlied@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Yue Hu <zbestahu@gmail.com>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 linux-bcachefs@vger.kernel.org, Jann Horn <jannh@google.com>,
 Chao Yu <chao@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Tom Talpey <tom@talpey.com>,
 Hans de Goede <hdegoede@redhat.com>, Bharath SM <bharathsm@microsoft.com>,
 "Tigran A . Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jens Axboe <axboe@kernel.dk>, Sungjong Seo <sj1557.seo@samsung.com>,
 v9fs@lists.linux.dev, Kent Overstreet <kent.overstreet@linux.dev>,
 linux-unionfs@vger.kernel.org, Benjamin LaHaise <bcrl@kvack.org>,
 Jeffle Xu <jefflexu@linux.alibaba.com>,
 Johannes Berg <johannes@sipsolutions.net>, Johannes Thumshirn <jth@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-karma-devel@lists.sourceforge.net,
 linux-btrfs@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Jun 16, 2025 at 08:33:19PM +0100, Lorenzo Stoakes wrote:
> REVIEWER'S NOTES
> ================
> 
> I am basing this on the mm-new branch in Andrew's tree, so let me know if I
> should rebase anything here. Given the mm bits touched I did think perhaps
> we should take it through the mm tree, however it may be more sensible to
> take it through an fs tree - let me know!
> 
> Apologies for the noise/churn, but there are some prerequisite steps here
> that inform an ordering - "fs: consistently use file_has_valid_mmap_hooks()
> helper" being especially critical, and so I put the bulk of the work in the
> same series.
> 
> Let me know if there's anything I can do to make life easier here.

Documentation/filesystems/porting.rst?

