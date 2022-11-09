Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3E362369B
	for <lists+samba-technical@lfdr.de>; Wed,  9 Nov 2022 23:31:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=vfZwatwHDOkbPo04E2ExpvhOVqIrdLyWdTDhK+EaoKI=; b=Rf23iriMjIPx9fJ1v8FU84C9gQ
	GDzAXFdFKn7QDyuPTFoMUamf0bDgTtOIz0gsz6di5Ajx+nIKUj6ZUymJtbpgR4aTCbuc40QIkKXb8
	y59Tp/AZ3zJYqpBOv/DbpNhKeqtB6inM2iOHjkVqojM9CA/xxYDCIZYsBVaQTiwv6HdVNBMFQ4DDv
	p7ZNgQdIWF+gH3DYSOVX02UTfB4c689lvn7MnNgwc17nm1qnTcu+RWXVdmxNBv29xj+seLHclDACe
	gOfgp5+SHdQP1kODThNpfK1gYwZqScLHouEtRdeHJw1x74Gj6ueoRJnJOwMXADS/CK9ZVQwEWy/Re
	EAkloh4A==;
Received: from ip6-localhost ([::1]:52592 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ostaf-00BuOU-CS; Wed, 09 Nov 2022 22:30:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63450) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ostaY-00BuOK-6Q
 for samba-technical@lists.samba.org; Wed, 09 Nov 2022 22:30:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=vfZwatwHDOkbPo04E2ExpvhOVqIrdLyWdTDhK+EaoKI=; b=gyuPxDgvYyUqSWAvzJygy3K/X6
 3FvL7u/0NlxlUHq1arujl0fNs5O8tMMzn/5DkUPpl1anyUSScwo3zYo8Q7srdqd0Z8je81VvfnOIY
 6RwB1l4uvvCt5xKudOpdPelUqlEy3Mze2T3+AI56GN/fMFBbWQoRtfGAm7vieTBA/v+MCJxNa352u
 SVJWU4UWdspaLjEGuiyl8Z4QPDpjt6SBSL3vgYgKpHfw80fReXcYRCKQ1++87z6lSX3OTABa5mK7E
 /3eauMNY2XU3W0nREgQrPeRBtE2TkuKfnE+BZiL/3mXSmD25dLrMRftxGHatnY/F8ZNdWjqd0vDnq
 /++TF8W+LWls97+cnolS62yUCFw5k7fQ3gpqOOAwFbSmOtoJHDp854109OicMIxdUWxJ1MS11vDgM
 7Y1/s1s+m4KkxI1VjK5TxqzG0qgG4PI1NdWKv3+mHDfCX19fdbcHXCx2YXDdTBrDbmXhXPYsjo50S
 5IPZpcsujvni2Uz8yrrgbBWz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ostaN-007uNt-Ii; Wed, 09 Nov 2022 22:30:19 +0000
Date: Wed, 9 Nov 2022 23:30:55 +0100
To: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Subject: Re: reflink support and Samba running over XFS
Message-ID: <20221109233055.43b26632@echidna.suse.de>
In-Reply-To: <Y2v+au3rvWOUOr1t@jeremy-acer>
References: <CAH2r5mtc6rHC=zfWCjmGMex0qJrYKeuAcryW95-ru0KyZsaqpA@mail.gmail.com>
 <Y2molp4pVGNO+kaw@jeremy-acer> <Y2n7lENy0jrUg7XD@infradead.org>
 <Y2qXLNM5xvxZHuLQ@jeremy-acer>
 <CAOQ4uxgyXtr6DU-eAP+kR1a7NsS-zDhXi5-0BJ7i=-erLa3-kg@mail.gmail.com>
 <Y2vzinRPFEBZyACg@jeremy-acer> <Y2v1zQbnPoqg+0aj@jeremy-acer>
 <Y2v+au3rvWOUOr1t@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: CIFS <linux-cifs@vger.kernel.org>, Amir Goldstein <amir73il@gmail.com>,
 metze@samba.org, Steve French <smfrench@gmail.com>, vl@samba.org,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Jeremy,

On Wed, 9 Nov 2022 11:24:26 -0800, Jeremy Allison via samba-technical wrote:

> On Wed, Nov 09, 2022 at 10:47:41AM -0800, Jeremy Allison wrote:
> >
> >So it *looks* like the copy_file_range() syscall will internally
> >call the equivalent of FICLONERANGE if the underlying file
> >system supports it.
> >
> >So maybe the right fix is to remove the FICLONERANGE specific
> >code from our vfs_btrfs.c and just always use copy_file_range().
> >
> >Any comments from other Samba Team members ?  
> 
> So right now Steve what is preventing FSCTL_DUP_EXTENTS_TO_FILE
> from working against anything other then btrfs on Samba is the
> following code:
> 
> source3/smbd/smb2_ioctl_filesys.c:fsctl_dup_extents_send()
> 
> 180         if ((dst_fsp->conn->fs_capabilities
> 181                                 & FILE_SUPPORTS_BLOCK_REFCOUNTING) == 0) {
> 182                 DBG_INFO("FS does not advertise block refcounting support\n");
> 183                 tevent_req_nterror(req, NT_STATUS_INVALID_DEVICE_REQUEST);
> 184                 return tevent_req_post(req, ev);
> 185         }
> 
> because currently only the vfs_btrfs module reports FILE_SUPPORTS_BLOCK_REFCOUNTING,
> not vfs_default.
> 
> and also in:
> 
> source3/modules/vfs_default.c:vfswrap_offload_write_send()
> 
> 2194         case FSCTL_DUP_EXTENTS_TO_FILE:
> 2195                 DBG_DEBUG("COW clones not supported by vfs_default\n");
> 2196                 tevent_req_nterror(req, NT_STATUS_INVALID_PARAMETER);
> 2197                 return tevent_req_post(req, ev);
> 
> but looking at vfs_btrfs it looks like that code should
> probably also be in vfswrap_offload_read_send() as well
> and the error code should be NT_STATUS_INVALID_DEVICE_REQUEST.
> 
> We also need to duplicate the logic in vfs_btrfs for
> handling FSCTL_DUP_EXTENTS_TO_FILE into VFS default,
> gated on support for the copy_file_range() system
> call (which would set FILE_SUPPORTS_BLOCK_REFCOUNTING
> in the fs_capabilities return from vfs_default).
> 
> I think this is doable with some work...

I think it's doable too :-). As indicated in my other mail, I think
FICLONERANGE will need to be used for FSCTL_DUP_EXTENTS_TO_FILE instead
of copy_file_range().
I'm not sure how to best handle FILE_SUPPORTS_BLOCK_REFCOUNTING -
ideally we'd set it for Btrfs and XFS(reflink=1) backed shares only.
Another option might be to advertise FILE_SUPPORTS_BLOCK_REFCOUNTING and
then propagate errors up to the client if FICLONERANGE fails for
FSCTL_DUP_EXTENTS_TO_FILE. Client copy fallback would work, but the
extra request overhead would be ugly.

Cheers, David

