Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A1012AC3B4
	for <lists+samba-technical@lfdr.de>; Sat,  7 Sep 2019 02:38:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=VAUTa59j3suJUK39X4SaMGvnS3BMNNIRy6reT8i5AhU=; b=JFoNylqzp4Dv5HBmxWPvIK5a0S
	BHJVSf7LD7tGLOsfGp7y0iVT4jwsTRyttd3DVQ4O2pMG/SMelRftigx5YS1Mfei5xlta7hmmiN39t
	CfVzg8aMFFZ1iZ7YmEb1DHeCROdt3jbnVm1EDcTBb98rj1Ajk2a8oK/aXATzd2H+OYsqanlDypjJn
	GVKs8fS364V+K2aWwEnDo25XkZerpczxI7rR6vQkgnJIwcFeS+gULXWaRmr3c3S9k23yrxKKzh5jN
	GOk2ZcHBlcyAtq2WQAfYA1fw//JEy4owj8/M5R4le02H1bg6UZjOwdMKcqTQfXQ/kALsSQd9Ggh5g
	jrXr28Rg==;
Received: from localhost ([::1]:40236 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i6Oj2-004837-2z; Sat, 07 Sep 2019 00:37:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44722) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i6Oix-004830-RT
 for samba-technical@lists.samba.org; Sat, 07 Sep 2019 00:37:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=VAUTa59j3suJUK39X4SaMGvnS3BMNNIRy6reT8i5AhU=; b=oCg7Og+m7eyZC42aFXVBqTQXHK
 J+EbZgV4nVUxBjrgwqft1bLZEeaseznFW0kbX3DOiVip1FbP5nViGPHaCXtKGgxSj+4aQFetB8jmR
 M5d3skNbIRWm2pkCBbxhVY738lNzm0Nu67ck/SBpOwSqNU2cNIKwwNUuGb1AHUT0p19Y=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1i6Oiv-0005w1-Rr; Sat, 07 Sep 2019 00:37:06 +0000
Message-ID: <67731bdad1bd3dda0d25a9ba1a8aebe8f7d17d92.camel@samba.org>
Subject: Re: samba performance difference between old and the latest ?
To: Jeremy Allison <jra@samba.org>, Namjae Jeon <linkinjeon@gmail.com>
Date: Sat, 07 Sep 2019 12:37:00 +1200
In-Reply-To: <20190906230552.GA37629@jra4>
References: <CGME20190906020151epcas1p487a64747d0a00c84bc683fe0d07207bd@epcas1p4.samsung.com>
 <006701d56457$0c77fc60$2567f520$@samsung.com>
 <20190906161845.GA192819@jra4>
 <CAKYAXd-uR9RCQeVKsfREAvegP7J06nHDZ4nfeo1M+5KnkZ4VjQ@mail.gmail.com>
 <20190906230552.GA37629@jra4>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: Namjae Jeon <namjae.jeon@samsung.com>, sergey.senozhatsky@gmail.com,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2019-09-06 at 16:05 -0700, Jeremy Allison via samba-technical
wrote:
> On Sat, Sep 07, 2019 at 07:57:24AM +0900, Namjae Jeon wrote:
> > 2019-09-07 1:18 GMT+09:00, Jeremy Allison via samba-technical
> > <samba-technical@lists.samba.org>:
> > > On Fri, Sep 06, 2019 at 11:01:51AM +0900, Namjae Jeon via samba-
> > > technical
> > > wrote:
> > > > Hello,
> > > > 
> > > > I found something strange during measuring performance with
> > > > samba these
> > > > days.

> > > > dd test result is same with iozone result.
> > > > 
> > > > samba 4.7.6 : 11.6MB/s
> > > > samba 4.10.6 : 9.5MB/s
> > > > 
> > > > with samba 4.7.6 :
> > > > root@test1234-Samsung-DeskTop-System:/mnt/read# dd if=/dev/zero
> > > > of=1.txt
> > > > bs=4096
> > > > count=1024
> > > > 1024+0 records in
> > > > 1024+0 records out
> > > > 4194304 bytes (4.2 MB, 4.0 MiB) copied, 0.360991 s, 11.6 MB/s
> > > > 
> > > > with samba 4.10.6 :
> > > > root@test1234-Samsung-DeskTop-System:/mnt/read# dd if=/dev/zero
> > > > of=1.txt
> > > > bs=4096
> > > > count=1024
> > > > 1024+0 records in
> > > > 1024+0 records out
> > > > 4194304 bytes (4.2 MB, 4.0 MiB) copied, 0.442567 s, 9.5 MB/s
> > > > 
> > > > Am I missing something? or real issue ?
> > > 
> > > Is this on identical kernel versions ?
> > 
> > Yes, I compared two versions in the same test environment.
> 
> Just checking :-). In that case doing a cachegrind run
> on each of the two different versions might show where
> the issue is. 

Perhaps it negotiated different protocol versions or encryption
settings?

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




