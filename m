Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D669B60BD39
	for <lists+samba-technical@lfdr.de>; Tue, 25 Oct 2022 00:16:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=H8VBsBHKyOW0MEt7mFJ3CDm24zxJKIXcxFxXw5gDXtI=; b=xiWrJuy9DIAUN8WA/ai5GwOwhO
	6R1ujFSlaxvkjlmXWny9jyeRR9MlR1nwZsPP1VAz+q35jRRPMtacfwUQaMe70GlvsxtPoB728RywY
	dhRjFX7fL9M1JDXeSlu8mIomhvkAbzrRn9OsbU3yn8rPR6Yl8IwA5SJ96thMUoRiA7CwVTVUgbG9b
	9r43Km1t80ggUgdyS5KMQhWgaD/32+Rw1+SrZuj/DoG56Gp15g6s4eljNgS7SZjZ11ggg+X+YN7fu
	2ymTnS4aWndTCpMvwOHvWvvftyEAFaolo6igbrDmIFPoVb2cdmGkQSfiJ6B1rAsxeZTUE2pDaOuDn
	MOgrqGGQ==;
Received: from ip6-localhost ([::1]:19112 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1on5kK-005csC-5l; Mon, 24 Oct 2022 22:16:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47602) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1on5kF-005cr2-Fh
 for samba-technical@lists.samba.org; Mon, 24 Oct 2022 22:16:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=H8VBsBHKyOW0MEt7mFJ3CDm24zxJKIXcxFxXw5gDXtI=; b=inGSJnVc5EI/ZAVqYPmyqyjEqO
 AsK2DxCUjHNujMyLB8eR8W/o/uynGBCmTjwOASAA+2R3r6Y/vBKisC3eWemU5SlTKMUYrbFlQfhBq
 YYSHqbhi55tjUzRYRcCZdoqnGjTGg/kUh0Rzxuwgj8ZywmK3ACPjknCheAX8W3uaZ5LCNLx8cnsbK
 6KxVBY8Sw3qnG5T4YpvqnvaDofJu+QZ9yXQlAvwBMQlLY9IgkjQ1i98olF3uewRg/Ve3Ikv+s3DCu
 JHvDL2zRh37O92FvCc70i4kZdhAoDTEZaoahv7ioMdZGqLiQdmetc391CeOfS6e9yyJ4xFmUmQNZU
 1IAVbuWBPn2Kpyht5C/54CwVD7bWOPLx3iPZgWClFnXs+K2aMpz6QkE10FV1SvE+DvrX8CXoQsLSe
 HQgJ5KBKxwUzRipKkoIdsLEWC28sSkeKyjgrwuZB+LeqS79HjJEnF2CX87Dk5frd5n/wqEwM5PA2U
 UAJpzrS3wr86D/Xz3eDM9Ww7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1on5kE-005an0-Fg; Mon, 24 Oct 2022 22:16:31 +0000
Date: Mon, 24 Oct 2022 15:16:28 -0700
To: Florian Weimer <fweimer@redhat.com>
Subject: Re: vfswrap_getxattrat_do_async and unshare(CLONE_FS)
Message-ID: <Y1cOvCrfk4QEaE4m@jeremy-acer>
References: <87czag28up.fsf@oldenburg.str.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87czag28up.fsf@oldenburg.str.redhat.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Oct 24, 2022 at 11:46:22PM +0200, Florian Weimer via samba-technical wrote:
>As far as I can tell, vfswrap_getxattrat_do_async relies on
>unshare(CLONE_FS) to do fgetxattrat emulation with a thread-local fchdir
>and getxattr.  There do not seem to be any other uses in the sources.
>
>I think the more usual way to emulate the missing fgetxattrat system
>call is to open the file with openat and O_PATH, and then use getxattr
>on the synthetic path under /proc/self/fd.  While these paths present as
>symbolic links, they actually are not, so there is no race possible.
>(fgetxattr cannot operate on the open file descriptor directly.)
>
>Why wasn't the /proc-based approach chosen for Samba?  It looks a bit
>simpler to implement, and does not do strange things to the process
>state behind glibc's back.

As I recall it was done that way as there are various OEMs with fuse-based
filesystems that are very slow on fetching EA's, which we have to do
on every directory entry returned. Doing this inside a pthread using
unshare(CLONE_FS) to keep a per-thread directory was found to allow
these filesystems to have a decent performance.

This was before the VFS-rewrite to use fd's everywhere as I recall,
so it's possible it may no longer be required. But I'd wait for
Metze to chime in here as he was deeply involved in this I think.

