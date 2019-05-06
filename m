Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA201521C
	for <lists+samba-technical@lfdr.de>; Mon,  6 May 2019 18:57:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=sIeWRsQrjfl5uiGG2Afv8XyEcWfXKzvrjMXyJwlUSgs=; b=ef+FzPAIEuCNnJ8dr8qzIxFeWA
	q8MQxprYeyO/q9dL9sv3ERGqB+2UbiOs+IEC//HiKB/J+xEqCrk80fN3aBLTQnPD15l2FbmCV/nt9
	OpSLZhBpE/Ap9o/RGNBR0MNeyKZj/zqIBThHFATtbhhsS+/s2tMAD+msK6uuQ6BH5YztZ43TiEYnf
	3V9vC8ta2qgYSqoPbOvrE6LRl4InqXObOxMbgRmMLSE4ISCXS9bkFKLQIBj7iD1zPxCbGPaJxW6ej
	WrYRyHsHVDfrh6BuUGPiQILijOJpPtc3JIKF6mr3RnN1QdDDQI9lRefrgCFJHzeb2DPsxD8lgB6xI
	s5H3Wikg==;
Received: from localhost ([::1]:25020 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hNgvJ-002lvm-TD; Mon, 06 May 2019 16:57:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:22306) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hNgvG-002lvf-38
 for samba-technical@lists.samba.org; Mon, 06 May 2019 16:57:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=sIeWRsQrjfl5uiGG2Afv8XyEcWfXKzvrjMXyJwlUSgs=; b=QotzqNtjAKaav33thlCTI2Hwte
 bjtFIAyRnHZa2j1wF9E4CcF3LQGfrLiNrlrCgiilCXSUgs72o7eyyI5nhqw5thxFGNSVXC925r6cL
 zvTKkzRBoNhCu4M5Q62OQ0EnAORwq4FV820kgcWxrVAlcq7gfht/07poI8M0Aal5ui/s=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hNgvF-0007UB-DL; Mon, 06 May 2019 16:57:01 +0000
Date: Mon, 6 May 2019 09:56:58 -0700
To: Steve French <smfrench@gmail.com>
Subject: Re: [PATCH] cifs: fix strcat buffer overflow in
 smb21_set_oplock_level()
Message-ID: <20190506165658.GA168433@jra4>
References: <1557155792-2703-1-git-send-email-kernel@probst.it>
 <CAH2r5mtdpOvcE25P2UuNFpOwsNyFiBWRQELQFui+FJGVOOBV8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH2r5mtdpOvcE25P2UuNFpOwsNyFiBWRQELQFui+FJGVOOBV8w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Christoph Probst <kernel@probst.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, May 06, 2019 at 11:53:44AM -0500, Steve French via samba-technical wrote:
> I think strcpy is clearer - but I don't think it can overflow since if
> R, W or W were written to "message" then cinode->oplock would be
> non-zero so we would never strcap "None"

Ahem. In Samba we have :

lib/util/safe_string.h:#define strcpy(dest,src) __ERROR__XX__NEVER_USE_STRCPY___;

Maybe you should do likewise :-).

> On Mon, May 6, 2019 at 10:26 AM Christoph Probst <kernel@probst.it> wrote:
> >
> > Change strcat to strcpy in the "None" case as it is never valid to append
> > "None" to any other message. It may also overflow char message[5], in a
> > race condition on cinode if cinode->oplock is unset by another thread
> > after "RHW" or "RH" had been written to message.
> >
> > Signed-off-by: Christoph Probst <kernel@probst.it>
> > ---
> >  fs/cifs/smb2ops.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
> > index c36ff0d..5fd5567 100644
> > --- a/fs/cifs/smb2ops.c
> > +++ b/fs/cifs/smb2ops.c
> > @@ -2936,7 +2936,7 @@ smb21_set_oplock_level(struct cifsInodeInfo *cinode, __u32 oplock,
> >                 strcat(message, "W");
> >         }
> >         if (!cinode->oplock)
> > -               strcat(message, "None");
> > +               strcpy(message, "None");
> >         cifs_dbg(FYI, "%s Lease granted on inode %p\n", message,
> >                  &cinode->vfs_inode);
> >  }
> > --
> > 2.1.4
> >
> 
> 
> -- 
> Thanks,
> 
> Steve
> 

