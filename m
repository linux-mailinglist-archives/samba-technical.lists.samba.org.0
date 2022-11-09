Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A2036623616
	for <lists+samba-technical@lfdr.de>; Wed,  9 Nov 2022 22:51:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=WXKr9NLkPg6usxOHB8GZENHCqGOJc4wZu6ybawvZHtg=; b=dYe3b++c3IPROJOi1Z837thMLd
	wLEX9EPhU7abjctG04skGxPdnPi70bxISVC2hV2Ogz/Pzu24Ydy1P8iiq8YrTr7eKgew2nEYHB7+c
	paeLB39lkIKrtsDPdVAjcty/jQsML2M27r2JhYKZMoPcUmeraENoAdP/TsX4Br34BkuOnYT4ub3Rj
	X6UVWQXLp9ZhXGyCuBKE3JNinl8tNdfuuAGLCAJJPm7DBXxP2qyNEaLrqU4i3ezC2gd+XjiPxVleV
	cfVRzmpXt5ezuOyR2HNwyX6SrHYn42Zo4n0Bqum71JuYfc1lkOXl17dtlUlIqgjJ1d/T7AOolRPGs
	aS9YB8BQ==;
Received: from ip6-localhost ([::1]:19626 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ossxs-00Btyg-DW; Wed, 09 Nov 2022 21:50:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57314) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ossxn-00BtyX-HB
 for samba-technical@lists.samba.org; Wed, 09 Nov 2022 21:50:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=WXKr9NLkPg6usxOHB8GZENHCqGOJc4wZu6ybawvZHtg=; b=EklCiLrSgUinTGOyia0RSAulpy
 Onh4dk3NfbGWEOYUNM6POTxRzPjq8LRFaonZK11CXMtlhLRmyJP6lZWsOlSQKjzkL0cgzKIetbsD2
 XUlOy+817H6ZSWLuzpHwrUjca9cJb7BhtrpaogiJ8owvFsuvVIjRnlGwm9DWc8MU0vJx3gRNznLwd
 MpSyN0AM0sqleOL7BAYTez9KGonq4zG+mYb6rwkdGkFErox36F751Pxgc4E5ESxuTCoY1imaTNTsW
 kdfkpcwLsXNrs0Gw63Y4js+NUKynohYh3Tbc0DzJM3gshUL3X1f31c0c8H6s37BhY0amqmNSb9Xlh
 z5xyl+wvvVpoxAYikLvGXoVJGFM4RRnwuc0XgMsyD8E/4agkPPW5oH/5GrIvWseVUoCLzXJWC21OZ
 /sgD7VxtL0DgWJH5DGMjxMNBkFNumWAlguKCE+1DWfK+lSRoY5fhyLNace8h8LdgXTWS1vv9s39ea
 NLZmINrrOeRBCnBjQfMHA2ut;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ossxk-007u9U-Ig; Wed, 09 Nov 2022 21:50:24 +0000
Date: Wed, 9 Nov 2022 22:50:55 +0100
To: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Subject: Re: reflink support and Samba running over XFS
Message-ID: <20221109225055.0729569b@echidna.suse.de>
In-Reply-To: <Y2v1zQbnPoqg+0aj@jeremy-acer>
References: <CAH2r5mtc6rHC=zfWCjmGMex0qJrYKeuAcryW95-ru0KyZsaqpA@mail.gmail.com>
 <Y2molp4pVGNO+kaw@jeremy-acer> <Y2n7lENy0jrUg7XD@infradead.org>
 <Y2qXLNM5xvxZHuLQ@jeremy-acer>
 <CAOQ4uxgyXtr6DU-eAP+kR1a7NsS-zDhXi5-0BJ7i=-erLa3-kg@mail.gmail.com>
 <Y2vzinRPFEBZyACg@jeremy-acer> <Y2v1zQbnPoqg+0aj@jeremy-acer>
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

On Wed, 9 Nov 2022 10:47:41 -0800, Jeremy Allison via samba-technical wrote:

...
> >So the code change needed is to move the logic in vfs_btrfs.c
> >into vfs_default.c, and change the call in vfs_btrfs.c:btrfs_offload_write_send()
> >to SMB_VFS_NEXT_OFFLOAD_WRITE_SEND() to call the old fallback code
> >inside vfs_default.c (vfswrap_offload_write_send()).  
> 
> Although looking at the current Linux kernel I find inside:
> 
> ssize_t vfs_copy_file_range(struct file *file_in, loff_t pos_in,
> 			    struct file *file_out, loff_t pos_out,
> 			    size_t len, unsigned int flags)
> {
> 
> https://github.com/torvalds/linux/blob/0adc313c4f20639f7e235b8d6719d96a2024cf91/fs/read_write.c#L1506
> 
> 	/*
> 	 * Try cloning first, this is supported by more file systems, and
> 	 * more efficient if both clone and copy are supported (e.g. NFS).
> 	 */
> 	if (file_in->f_op->remap_file_range &&
> 	    file_inode(file_in)->i_sb == file_inode(file_out)->i_sb) {
> 		loff_t cloned;
> 
> 		cloned = file_in->f_op->remap_file_range(file_in, pos_in,
> 				file_out, pos_out,
> 				min_t(loff_t, MAX_RW_COUNT, len),
> 				REMAP_FILE_CAN_SHORTEN);
> 		if (cloned > 0) {
> 			ret = cloned;
> 
> and looking at the code supporting int ioctl(int dest_fd, FICLONERANGE, struct file_clone_range *arg);
> we have:
> 
> loff_t do_clone_file_range(struct file *file_in, loff_t pos_in,
> 			   struct file *file_out, loff_t pos_out,
> 			   loff_t len, unsigned int remap_flags)
> ...
> 	ret = file_in->f_op->remap_file_range(file_in, pos_in,
> 			file_out, pos_out, len, remap_flags);
> 
> So it *looks* like the copy_file_range() syscall will internally
> call the equivalent of FICLONERANGE if the underlying file
> system supports it.
> 
> So maybe the right fix is to remove the FICLONERANGE specific
> code from our vfs_btrfs.c and just always use copy_file_range().

copy_file_range() should be okay for FSCTL_SRV_COPYCHUNK, but I don't
think it's an option for FSCTL_DUP_EXTENTS_TO_FILE, as (IIRC) the latter
explicitly requires block cloning so can't fallback to regular copy.

Cheers, David

