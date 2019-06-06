Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A4A37473
	for <lists+samba-technical@lfdr.de>; Thu,  6 Jun 2019 14:43:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=yANZLzFU1VDh6iLxJVW9SHBBLHfxwfBUgRp3wdRwczQ=; b=GMn0lGQaWnCefwRNvjGQZMKITl
	bSzAAS56wPacmvKZ0UGOkgsULOzSkI/31CQfQJiwQK9iVZGjLuoA33g0PmyKom1IuQHoYWo4/z51w
	E4kLUidd3GWzGYtbAfYuT2NR0oSSItWSgmmPl8iwk+iZnMiBrcdHYSXpx1vdeBMEeHAL55c3nATKp
	nfYoMwI7o/TXWDnvbEUE56LjfZQtG6LI5n7o4tt0A/twBrJlZDsQb3wSPPwIgnAmYa5q3ZYOPvGh1
	099NB4V3qWRQRRTy8emUQ7TCK5Z5mFBlROuSVvcNB0GlLfEARMeUbx++kU2lwXoxze0HdmffJ9Cnl
	uj9KDEIg==;
Received: from localhost ([::1]:20514 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hYrjv-000FPi-PD; Thu, 06 Jun 2019 12:43:31 +0000
Received: from [46.229.238.185] (port=48399 helo=moya.mistotebe.net) 
 by hr1.samba.org with esmtp (Exim) id 1hYrjr-000FPb-II
 for samba-technical@lists.samba.org; Thu, 06 Jun 2019 12:43:29 +0000
Received: from mistotebe.net (215.15.broadband5.iol.cz [88.100.15.215])
 by moya.mistotebe.net (Postfix) with ESMTPA id C56A62A04BD;
 Thu,  6 Jun 2019 12:43:24 +0000 (UTC)
Received: by mistotebe.net (Postfix, from userid 1000)
 id D3B0AE219; Thu,  6 Jun 2019 14:43:12 +0200 (CEST)
Date: Thu, 6 Jun 2019 14:43:12 +0200
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Test failure in 4.10.4+Debian sid?
Message-ID: <20190606124312.5nfv64s4iujrqxxx@mistotebe.net>
References: <20190606113908.dzmuky72fyqk52y7@mistotebe.net>
 <f62e5f179e28759f4d27be5ad65dfadc41eb59a5.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f62e5f179e28759f4d27be5ad65dfadc41eb59a5.camel@samba.org>
User-Agent: NeoMutt/20170113 (1.7.2)
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
From: =?utf-8?q?Ond=C5=99ej_Kuzn=C3=ADk_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?B?T25kxZllaiBLdXpuw61r?= <ondra@mistotebe.net>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Jun 06, 2019 at 02:15:57PM +0200, Andrew Bartlett via samba-technical wrote:
> On Thu, 2019-06-06 at 13:39 +0200, Ondřej Kuzník via samba-technical wrote:
>> Are the two tests known to fail (on Debian)? Am I doing something
>> wrong above? Is there more information I should provide that might be
>> helpful?
> 
> What is the filesystem?  Some tests are very sensitive to the
> underlying FS, eg requiring pure ext4 and not unionfs etc.

Since this is in a chroot, samba cannot examine its mount options
directly through /proc/self/mount*, does this make a difference? Do I
need to create a mount namespace when running the testsuite in a chroot?

What it can see is:
$ /proc/self/mountinfo 
366 116 254:5 /ondra/repos /mnt/repos ro,relatime shared:63 - ext4 /dev/mapper/ixos--vg-home rw,commit=600
379 116 0:4 / /proc rw,relatime shared:208 - proc proc rw

With the chroot being stored in /home:
16 27 254:5 / /home rw,relatime shared:63 - ext4 /dev/mapper/ixos--vg-home rw,commit=600

```
cat /proc/fs/ext4/dm-5/options
rw
bsddf
nogrpid
block_validity
dioread_lock
nodiscard
delalloc
nowarn_on_error
journal_checksum
barrier
auto_da_alloc
user_xattr
acl
noquota
resuid=0
resgid=0
errors=continue
commit=600
min_batch_time=0
max_batch_time=15000
stripe=0
data=ordered
inode_readahead_blks=32
init_itable=10
max_dir_size_kb=0
```

Thanks,

-- 
Ondřej Kuzník
Senior Software Engineer
Symas Corporation                       http://www.symas.com
Packaged, certified, and supported LDAP solutions powered by OpenLDAP

