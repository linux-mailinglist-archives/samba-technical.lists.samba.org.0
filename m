Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A9ACD2E85DB
	for <lists+samba-technical@lfdr.de>; Fri,  1 Jan 2021 23:58:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=RX2HldXjqMU7UgEisZS3A0J1NSyl17JgPJ7Z5FoQfew=; b=Hit8VwwNe7/fD6EyZXzKklvykU
	eRQlicJqnamPQo0GtENTq0UmAq4TNoW8tCMacS7tUB0hvjF+K6J9ApE+VrKw1DvNQbhZNl7Lv96ft
	yROVWh99VbnKh6tjFjHjVhxRMjqwKiFjVBzexUx6i0T/OYJS902s+dDC/m7H9xn0lYiOM/i4pkTZh
	sW+nso9q5S2v9ADABJdzYxYMJvit8/JQTT9hHNwuKcjlVsmARsGIHQR7Fe5YUNOWsUEIrO9w98LOV
	AHVTEdR5D/TSmE91/K3umtnqj0DZNOhs9d83M+lCV67BU3UyTxwBxxJ3YMRexeR0bNvv4F3WkHUrM
	9LAHx1hw==;
Received: from ip6-localhost ([::1]:39374 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kvTMd-004Uec-I4; Fri, 01 Jan 2021 22:57:43 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:38635) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kvTMY-004UeV-CB
 for samba-technical@lists.samba.org; Fri, 01 Jan 2021 22:57:40 +0000
Received: by mail-lf1-x12f.google.com with SMTP id h205so50909829lfd.5
 for <samba-technical@lists.samba.org>; Fri, 01 Jan 2021 14:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wh5GeYQz6BcrksAEdhx+4LoP89RVEVSOUvCFDs0oJYM=;
 b=RuYrSmRYyE8srv87kauyrMAlisLqa5kC1J43mYN9WRvMid44g9pNuHi4tvTormffQx
 8xm0ssBDJIo4BcENfEjAQHKMfkTcOQKSk8pE2nW0j6antfd9RJ36C8BGxoQervLdu5VN
 uDJu/Pu43XGC5/TiZMA6pJY8z+vlZ7HwWBW/J85sogbkiW4z7f2FgvwLHA8ZCTXN9zRU
 GHPFjYIWJqVIWnoSjf5LwtQRS12KDqJwHek0127V9YUrCbgRBgZIHDUa8VPv/chHGmcQ
 snc3S7MUyn1yTDvXpRctcJN9BW/PCL2Tsi6B5poQKtIo8QNdLKyf/7xEcOWHVtWtj1MX
 erhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wh5GeYQz6BcrksAEdhx+4LoP89RVEVSOUvCFDs0oJYM=;
 b=qlR2x9SHn7GJEZX0vIxKwjZPSybiiBSLuIEg2/aVqy6lU6EuHxeYZS4iq3BWFQfL2z
 W3CPH3qyO/nTSAZ77q6RWcV5UYEkktptjUGy7od6Z8HQ/c8rdsKtDTbfyTD3KTFKfhfb
 KcC02m3YY9XKuPFiEQS0gNRUGnBQuCw6w/HXg0lTxxUqbfyYGXCcrKbnAl2FlsjT2GMw
 UW6E860UHkdhMAWSyFZEWr3Y6Y7gpttXzLCWzopOzgBqE5TNUeAVMxjHu9eDD2wZ93ui
 tgulD80xnSgRM6TUCC4CJdC1uw5zDHVMEPXLw9OcP8AvTStxuMDf4ooe6S5ZPNyqso9O
 K7WA==
X-Gm-Message-State: AOAM532x7WbmlBg/5mDqFkO8TFV9SeQZEvFTrf2ZIdznmNNLH+tCgk1X
 FTQ3Tcr4tOczB2OYEWhrkApOytrr4yGYt7qsDoI=
X-Google-Smtp-Source: ABdhPJy3bRS7s61vJjRWMsRPnJX6CCJtRjGrr/eyw355TIUYQJ8M1ldldBDApDdizpg5roATTx45cTIJgYLihBpFulc=
X-Received: by 2002:ac2:5d65:: with SMTP id h5mr21555787lft.307.1609541841782; 
 Fri, 01 Jan 2021 14:57:21 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5msH3LZuF69UFcfgtG7XXurMDc=-Ab7Ct4XwfARR8d+wRA@mail.gmail.com>
 <20210101060050.GA1892237@jeremy-acer>
 <CAH2r5mt+5LQB59w0SPEp2Q-9ZZ2PV=XDMtGpy2pedhF8eKif0A@mail.gmail.com>
 <20210101195821.GA41555@jeremy-acer>
In-Reply-To: <20210101195821.GA41555@jeremy-acer>
Date: Fri, 1 Jan 2021 17:57:08 -0500
Message-ID: <CAH2r5mvt_cHDbT0xaeLNQn=5cQ0T2-wPgpMkYEGQNdtDZ3kP=A@mail.gmail.com>
Subject: Re: [PATCH][SMB3] allow files to be created with backslash in file
 name
To: Jeremy Allison <jra@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Xiaoli Feng <xifeng@redhat.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

4.12.4 Ubuntu

On Fri, Jan 1, 2021, 14:58 Jeremy Allison <jra@samba.org> wrote:

> On Fri, Jan 01, 2021 at 09:12:14AM -0600, Steve French wrote:
> >On Fri, Jan 1, 2021 at 12:00 AM Jeremy Allison <jra@samba.org> wrote:
> >>
> >> On Thu, Dec 31, 2020 at 09:35:23PM -0600, Steve French via
> samba-technical wrote:
> >> >
> >> >This patch may be even more important to Samba, as alternative ways of
> >> >storing these files can create more problems. Interestingly Samba
> >> >server reports local files with backslashes in them over the wire
> >> >without remapping, even though these are illegal in SMB3 which would
> >> >cause confusion on the client(s).  Has anyone tried Windows mounting
> >>
> >> Samba should mangle names containing '\' to 8.3 names.
> >
> >You were right mangled names was enabled.  But that is also
> >interesting - it does expose a bug in smbclient.
> >
> >When you connect smbclient - doing a ls of a subdirectory with
> >reserved characters worked, but doing an ls of the parent (root
> >directory of share) caused smbclient to disconnect.  See below
> >
> >smb: \> ls rsvd-chars
> >  rsvd-chars                          D        0  Fri Jan  1 08:55:49 2021
> >
> >556368460 blocks of size 1024. 296010296 blocks available
> >smb: \> ls
> >  .                                   D        0  Fri Jan  1 08:54:28 2021
> >  ..                                  D        0  Thu Dec 31 21:42:28 2020
> >  topdir                              D        0  Mon Dec 14 16:01:25 2020
> >  lock1.txt                           A      200  Fri Dec 18 12:28:18 2020
> >  lock_rw_shared.dat                  A      200  Fri Dec 18 12:28:18 2020
> >  lock_rw_exclusive.dat               A      200  Fri Dec 18 12:28:18 2020
> >  autounlock.txt                      A      200  Fri Dec 18 12:28:18 2020
> >is_bad_finfo_name: bad finfo->name
> >NT_STATUS_INVALID_NETWORK_RESPONSE listing \*
> >smb: \> SMBecho failed (NT_STATUS_CONNECTION_DISCONNECTED). The
> >connection is disconnected now
>
> Can you log a bug please and give full setup instructions
> to reproduce. This isn't enough to show me what the bug is.
> I need a directory listing from the Server side to show
> me what files are in the root of the share.
>
> Also, you neglect to tell me what Samba version you are
> using (which is a pre-requisite for a bug report Steve,
> you know this :-).
>
