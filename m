Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B41B81C9A0F
	for <lists+samba-technical@lfdr.de>; Thu,  7 May 2020 20:56:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=bIxTrZTW0nE3kGTTU7WkR2Xccon09LthkePYWDjm5gc=; b=UN2AD+W+rNR5mulmPtXhYhb2jl
	jqmL1ColQbqGSXrApnqK0nS/PRWV3BPbYmNI6i6sKZ7r1EJ9UQCVXucCz9srRsg9RYzhAVqORiRgb
	u2LcykkEpTgsAa0fX4x6p+vKIRUmNEcIApSlNZNXK5bouqXtlCuSVrunSKhde+WIj7jTYUSJ+Blt2
	MaFsnnK3wYKzwfKOe5tf96KHDOz3OYGs1VKh5DmE8TgeeZ8VAqdRZPFd+ikF2oEHxEblN/6/NwRgV
	dqKsayAVl57aSCqpjUqz5O9lrK0oF/HoWzAWtEIA82Yv27sx2loxMJOybtN1FwLqahTiZ5QeFaHf8
	ZKQy5QXw==;
Received: from localhost ([::1]:42262 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jWlg7-003ARS-RB; Thu, 07 May 2020 18:55:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63002) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWlfw-003ARL-EG
 for samba-technical@lists.samba.org; Thu, 07 May 2020 18:55:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=bIxTrZTW0nE3kGTTU7WkR2Xccon09LthkePYWDjm5gc=; b=X1LtjIf7+xY1EjopMTGyZ1PWD/
 xrjz5bY3AmoUW+umXn0lIhnS8Khk7mtHXIQhUeF1VRSNxhSyonnjjMOVMPhdEgGbTUzv7V/fMpM2F
 QyXqHHND8wBXm0A7sQdFXPtKkIejlI6yTuKXjSs3/V7/B3WiRLQTo43qiC1ImR7tP0mTpY54mxqnm
 srQbsa7zbtjLp3J35TrLpQxtxc47kYtbq6m5CzSzSNkgZ8aMVXMmnbQZp7Jmk757HN1lGIPzyUnyW
 3uKCXezbDmOOzzmdF+FC0rkSKkF1MTPVXTrjOTyTPXh19Iy0CPgF7lPRaGCJOebOtW25soXAYn4CY
 QmU2e91yg3Y/BxZBwChiDptp3VPM6bwcW4OPRoCQ9FpEj43Lkmg9c8ZVmv73giMPPg7xMp9sLg9nf
 hULBl6VbpNJsZswNeA/1X03Le50z9bz30an5URH56Uw3pskkeA+BUtAggT122VthWnQ0TpfLyaoJT
 /JXZcd7ATdeZJlrJEGezvJvO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWlfu-0003k7-J9; Thu, 07 May 2020 18:55:14 +0000
Date: Thu, 7 May 2020 11:55:07 -0700
To: Jens Axboe <axboe@kernel.dk>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
Message-ID: <20200507185507.GF25085@jeremy-acer>
References: <cd53de09-5f4c-f2f0-41ef-9e0bfca9a37d@kernel.dk>
 <a8152d38-8ad4-ee4c-0e69-400b503358f3@samba.org>
 <6fb9286a-db89-9d97-9ae3-d3cc08ef9039@gmail.com>
 <9c99b692-7812-96d7-5e88-67912cef6547@samba.org>
 <117f19ce-e2ef-9c99-93a4-31f9fff9e132@gmail.com>
 <97508d5f-77a0-e154-3da0-466aad2905e8@kernel.dk>
 <20200507164802.GB25085@jeremy-acer>
 <01778c43-866f-6974-aa4a-7dc364301764@kernel.dk>
 <20200507183140.GD25085@jeremy-acer>
 <3130bca5-a2fb-a703-4387-65348fe1bdc8@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3130bca5-a2fb-a703-4387-65348fe1bdc8@kernel.dk>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Stefan Metzmacher <metze@samba.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 Pavel Begunkov <asml.silence@gmail.com>, jra@samba.org,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, May 07, 2020 at 12:35:42PM -0600, Jens Axboe wrote:
> On 5/7/20 12:31 PM, Jeremy Allison wrote:
> > 
> > Look at how quickly someone spotted disk corruption
> > because of the change in userspace-visible behavior
> > of the io_uring interface. We only shipped that code
> > 03 March 2020 and someone *already* found it.
> 
> I _think_ that will only happen on regular files if you use RWF_NOWAIT
> or similar, for regular blocking it should not happen. So I don't think
> you're at risk there, though I do think that anyone should write
> applications with short IOs in mind or they will run into surprises down
> the line. Should have been more clear!

Well we definitely considered short IOs writing the
server code, but as the protocol allows that to be
visible to the clients (in fact it has explicit
fields meant to deal with it) it wasn't considered
vital to hide them from clients.

We'll certainly fix up short reads for the iouring
module, but it's less clear we should mess with
our existing blocking threaded pread/pwrite code
to deal with them. Possibly goes into the bucket
of "belt and braces, couldn't possibly hurt" :-).

Thanks for the clarification !

