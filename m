Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C005B58A1EA
	for <lists+samba-technical@lfdr.de>; Thu,  4 Aug 2022 22:25:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=j3nssgGOsRxAdk5zbSCKB6B+tougXOTHjwPnHNLEXAk=; b=DVK0HQOhazCAjHqxoiLlJDHBXG
	BKJk1Ui9b1E+3aIjAGxomTppVzlDha1C0LQrcSkFnf5ZRQ/pUVrg7/2fRYGEkel5wQLKT0h/rgG8A
	c4yup0Lxr7j2LiSqsUMzmTIBD9Hb6qdNCwFEA/uNQxnmmNydnn8mvXBIE6ITf+G8N+nOcTxsrp7QS
	VqCT+XxGjtAv5CKJtT69gYZn+xrxGb6ZL/5J7hUmNfMXC/nhPspdUyfiX/WnohCtoOULSZgTFghPq
	4Y5t/buqEBRnlJmjnsiS+qB1SZTPKc9gLR8oHPKdlSTTWsjz1O5Z2QEFnozNBft6ihkK9+FEUBSdU
	8ro8JR3w==;
Received: from ip6-localhost ([::1]:53232 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oJhOA-005WsF-Jh; Thu, 04 Aug 2022 20:24:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1]:39702) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oJhO2-005Ws6-HH
 for samba-technical@lists.samba.org; Thu, 04 Aug 2022 20:24:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=j3nssgGOsRxAdk5zbSCKB6B+tougXOTHjwPnHNLEXAk=; b=G0azAtGuDambxjDpzyqDYcBUfZ
 LsxmuVeodWclf/6+9lPostC4quBhOZy7wpNzCSSHCIXZvHn8e9RhsP/3HvX1e48bDLiQjpett1fPp
 Pluw6e21Me890vAC28ORsZSley5oy2+ejXMYxsutAWke8I2DUfCJxFOLkmQ/C1MpTkYww5G58dj+f
 NO2DUstfysuQ+1agReIexwbYTVLFF+uW2H1pIFkKDqaOTXoI/2aTEKvbC4OwgE7gv80kEWFOy3Qa5
 VtKyw22vulMPNecC9f5VPVULECwmXgna4cLqH/j2kOxAValZdhz2wXLSDGWhV5SvOmRTRhm55SF5A
 lyLRwKJg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oJhNi-00Ac9i-R7; Thu, 04 Aug 2022 20:23:46 +0000
Date: Thu, 4 Aug 2022 21:23:46 +0100
To: Jeff Layton <jlayton@kernel.org>
Subject: Re: [RFC PATCH 0/3] Rename "cifs" module to "smbfs"
Message-ID: <Yuwq0kUJMTAX6F4m@casper.infradead.org>
References: <20220801190933.27197-1-ematsumiya@suse.de>
 <c05f4fc668fa97e737758ab03030d7170c0edbd9.camel@kernel.org>
 <20220802193620.dyvt5qiszm2pobsr@cyberdelia>
 <6f3479265b446d180d71832fd0c12650b908ebe2.camel@kernel.org>
 <1c2e8880-3efe-b55d-ee50-87d57efc3130@talpey.com>
 <20220803015655.7u5b6i4eo5sfnryb@cyberdelia>
 <cf24d6b5496598e7717428c6bdcb2366a7d49529.camel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf24d6b5496598e7717428c6bdcb2366a7d49529.camel@kernel.org>
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
From: Matthew Wilcox via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matthew Wilcox <willy@infradead.org>
Cc: nspmangalore@gmail.com, linux-cifs@vger.kernel.org,
 Enzo Matsumiya <ematsumiya@suse.de>, pc@cjr.nz,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 pshilovsky@samba.org, Tom Talpey <tom@talpey.com>, smfrench@gmail.com,
 linux-fsdevel@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Aug 04, 2022 at 03:03:23PM -0400, Jeff Layton wrote:
> On Tue, 2022-08-02 at 22:56 -0300, Enzo Matsumiya wrote:
> > On 08/02, Tom Talpey wrote:
> > > The initial goal is to modularize the SMB1 code, so it can be completely
> > > removed from a running system. The extensive refactoring logically leads
> > > to this directory renaming, but renaming is basically a side effect.
> > > 
> 
> This is a great technical goal. Splitting up cifs.ko into smaller
> modules would be great, in addition to being able to turn off smb1
> support.

I don't know the CIFS module that well.  How do you see it being split
up?  It's #4 in the list of filesystems:

$ size /lib/modules/5.18.0-3-amd64/kernel/fs/*/*.ko |sort -n |tail
 369020	  28460	    132	 397612	  6112c	/lib/modules/5.18.0-3-amd64/kernel/fs/ubifs/ubifs.ko
 395793	  50398	    960	 447151	  6d2af	/lib/modules/5.18.0-3-amd64/kernel/fs/ceph/ceph.ko
 477909	  58883	  10512	 547304	  859e8	/lib/modules/5.18.0-3-amd64/kernel/fs/nfsd/nfsd.ko
 609260	  84848	    640	 694748	  a99dc	/lib/modules/5.18.0-3-amd64/kernel/fs/f2fs/f2fs.ko
 622638	 252078	   1008	 875724	  d5ccc	/lib/modules/5.18.0-3-amd64/kernel/fs/nfs/nfsv4.ko
 717343	 111314	   1176	 829833	  ca989	/lib/modules/5.18.0-3-amd64/kernel/fs/ext4/ext4.ko
 884247	 206051	    504	1090802	 10a4f2	/lib/modules/5.18.0-3-amd64/kernel/fs/cifs/cifs.ko
 890155	 159520	    240	1049915	 10053b	/lib/modules/5.18.0-3-amd64/kernel/fs/ocfs2/ocfs2.ko
1193834	 274148	    456	1468438	 166816	/lib/modules/5.18.0-3-amd64/kernel/fs/xfs/xfs.ko
1393088	 126501	  15072	1534661	 176ac5	/lib/modules/5.18.0-3-amd64/kernel/fs/btrfs/btrfs.ko

... but if you look at how NFS is split up:

 311322	  76200	    392	 387914	  5eb4a	/lib/modules/5.18.0-3-amd64/kernel/fs/nfs/nfs.ko
  25157	   1100	     72	  26329	   66d9	/lib/modules/5.18.0-3-amd64/kernel/fs/nfs/nfsv2.ko
  49332	   1544	    120	  50996	   c734	/lib/modules/5.18.0-3-amd64/kernel/fs/nfs/nfsv3.ko
 622638	 252078	   1008	 875724	  d5ccc	/lib/modules/5.18.0-3-amd64/kernel/fs/nfs/nfsv4.ko

you can save a lot of RAM if you don't need NFSv4 (then there's also
nfs_common, 408kB of sunrpc.ko, etc, etc).

