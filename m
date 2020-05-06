Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 299691C6E50
	for <lists+samba-technical@lfdr.de>; Wed,  6 May 2020 12:24:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=0Kq2a8p93zs9xQM9Z6RiyU+4OEROWivFgggXzsmJl1E=; b=F9eCOm1L90LwmVGotBXAJbt6KL
	3f4GGO2qQfebbiE5Rp3lMwpzDakE29iOi69SyB5cdVT+q4QJl9pf+R0DaqKncdtVkFFil3sCBNYiY
	Szm26q+Aw+NIbuQwFMBOJsJG/tFv1U3dWj4T3/l7g20T9faa+X25UMdeSm9/W0lGYdaK330+bjmSg
	iGHpVk3TbLfpGP/5slOuy4DEambYBn3F4ReIi7pB+wEpzWOhgxAhHKtPPGKAhoWttXF8YRFXOklIr
	rQPZkMpWSDcbwe1yVCJ3NAdIJvZz0v8LKG4+txrYHDi1L8fh/KwsP5Nbj42IYkPhO02n/Lr9XjTjk
	/YCIJM5Q==;
Received: from localhost ([::1]:36786 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jWHDY-00301v-P7; Wed, 06 May 2020 10:23:56 +0000
Received: from latitanza.investici.org ([2001:888:2000:56::19]:55767) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWHDS-00301o-9L
 for samba-technical@lists.samba.org; Wed, 06 May 2020 10:23:53 +0000
Received: from mx3.investici.org (unknown [127.0.0.1])
 by latitanza.investici.org (Postfix) with ESMTP id 0D1DE120257;
 Wed,  6 May 2020 10:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cryptolab.net;
 s=stigmate; t=1588760620;
 bh=0Kq2a8p93zs9xQM9Z6RiyU+4OEROWivFgggXzsmJl1E=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=tm1KHmEEcK29Jo5Hkvei0n324/DHb06Hy7dAJwEGZxwGtM8FsCa0EAW4YHrkdh3BM
 Cn4VV8Za8JTNlRI5xZxi2X5nXE2hBPEXhbhgKBZ+v/TfaPgSClG9GFgARtsNjm3wLn
 XuUrfzklLIxWWcmhRenpjmmTUkDjgEVG5DnMQ2qc=
Received: from [82.94.249.234] (mx3.investici.org [82.94.249.234])
 (Authenticated sender: anoopcs@autistici.org) by localhost (Postfix) with
 ESMTPSA id D3F9B1201C7; Wed,  6 May 2020 10:23:37 +0000 (UTC)
Message-ID: <3a3e311c7a4bc4d4df371b95ca0c66a792fab986.camel@cryptolab.net>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
To: Jeremy Allison <jra@samba.org>
Date: Wed, 06 May 2020 15:53:26 +0530
In-Reply-To: <20200505174832.GC7920@jeremy-acer>
References: <0009f6b7-9139-35c7-c0b1-b29df2a67f70@samba.org>
 <102c824b-b2f5-bbb1-02da-d2a78c3ff460@kernel.dk>
 <7ed7267d-a0ae-72ac-2106-2476773f544f@kernel.dk>
 <cd53de09-5f4c-f2f0-41ef-9e0bfca9a37d@kernel.dk>
 <f782fc6d-0f89-dca7-3bb0-58ef8f662392@kernel.dk>
 <20200505174832.GC7920@jeremy-acer>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
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
From: Anoop C S via samba-technical <samba-technical@lists.samba.org>
Reply-To: Anoop C S <anoopcs@cryptolab.net>
Cc: Stefan Metzmacher <metze@samba.org>,
 Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2020-05-05 at 10:48 -0700, Jeremy Allison via samba-technical
wrote:
> On Tue, May 05, 2020 at 11:39:14AM -0600, Jens Axboe wrote:
> > > I'll try and see if I can get an arch binary build that has the
> > > vfs_io_uring module and reproduce.
> > 
> > Got that done, and I can now mount it on Linux. Been trying pretty
> > hard to trigger any corruptions on reads, but it works for me.
> > Checked
> > that we see short reads, and we do, and that it handles it just
> > fine.
> > So pretty blank right now on what this could be.
> > 
> > FWIW, I'm mounting on Linux as:
> > 
> > # mount -t cifs -o ro,guest //arch/data /smb
> 
> The reporter claims this only happens with
> a Windows client, as the Linux and Samba libsmb
> clients don't pipeline the reads in the same
> way for multiple files the same way that Windows
> does.
> 
> Here is the bug report with all the details I've
> managed to get out of the original reporter:
> 
> https://bugzilla.samba.org/show_bug.cgi?id=14361
> 
> I also can't reproduce the data corruption, even
> from a Windows client although I've only tried
> so far on my home Ubuntu 19.04 kernel 5.3.0-51-generic #44-Ubuntu SMP
> box.
> 
> I tried running 2 powershell processes on the
> Windows client and doing a copy in both of them
> to ensure we are opening multiple files simultaneously
> and going through the io_uring module (which I
> saw happening by adding debug statements) but
> I never see corruption.
> 
> I'm planning to try running against a Fedora32
> VM next, as that's case the reporter claims will
> reproduce the issue.

I could reproduce the difference in SHA256 checksum after copying a
directory with 100 copies of test file(provided by reporter) from
io_uring VFS module enabled share using Windows explorer(right-click-
>copy/paste). Only 5 out of 100 files had correct checksum after copy
operation :-/

Issue is *NOT* seen with `Copy-Item` powershell command or with
`smbclient` utility using "mget".

Whereas copy from a share without io_uring VFS module didn't show any
SHA256 checksum difference using Windows explorer or `Copy-Item`
powershell command or `smbclient` utility.

Following is my configuration:
OS: Fedora 32
Kernel: 5.6.8
Samba: master
liburing: 0.5
Client: Win 10, build 1909
testparm_s:
# Global parameters
[global]
	clustering = Yes
	load printers = No
	log file = /usr/local/var/log/samba/log.%I
	netbios name = SMB-CLUSTER
	security = USER
	server string = Samba Server
	idmap config * : backend = tdb


[local-ext4]
	comment = For samba share of local ext4
	path = /mnt/ext4/


[local-ext4-io-uring]
	comment = For samba share of local ext4
	path = /mnt/ext4/
	vfs objects = io_uring


-Anoop C S


