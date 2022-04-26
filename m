Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 138C8510A7B
	for <lists+samba-technical@lfdr.de>; Tue, 26 Apr 2022 22:31:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=VuGXG5JgPsjNesQ0qxFhkK7pHnS8wO/nL6i/8JvOdvc=; b=x24pSDvNya2x8jj2qWzyx0ekTH
	enDV1Gj6Wi3J1/AhmbARvLX9fROUhy5v8cAhqPwVTyB1NvT6G281Epc9/gJQ0ZcWV0fLDmaHwYKKF
	+FMzmmn7VjrCA+feo4BMa01+9UjTastvFsxzCLjCT2qWUeHCEeaDL+cki1/0gTf13hNyrgRPrkby4
	ZjEpzkxePuQCZ8UyJursLKVLO5nHwBaohgJTrPFSTxbrLCs8rTgzlJzh5uy1SyS8gnagFZSyTFDLS
	MiBY9ncc8bq2eSG8HFkGZvQecps1Z4sZJ7o6kCPdKJJiWQDg5IEtn2IO8Vb3hh5dEY49eW85BvPYn
	udU0PPHA==;
Received: from ip6-localhost ([::1]:57502 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1njRpR-002Rgo-4D; Tue, 26 Apr 2022 20:30:33 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:42897) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1njRpK-002Rgf-2S
 for samba-technical@lists.samba.org; Tue, 26 Apr 2022 20:30:29 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id A85F040799
 for <samba-technical@lists.samba.org>; Tue, 26 Apr 2022 23:30:23 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 62E4D39C
 for <samba-technical@lists.samba.org>; Tue, 26 Apr 2022 23:25:08 +0300 (MSK)
Message-ID: <a614d5b2-3995-88ae-a5b3-cc8f745959fc@msgid.tls.msk.ru>
Date: Tue, 26 Apr 2022 23:30:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: waf, PYTHONHASHSEED & -I order on other architectures
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
References: <76a4f905-6f2a-18f4-7c9d-f9846681ec01@msgid.tls.msk.ru>
In-Reply-To: <76a4f905-6f2a-18f4-7c9d-f9846681ec01@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

09.04.2022 09:41, Michael Tokarev via samba-technical wrote:
> Hi!
> 
> I'm having a build failure of samba on sparc64.  It fails due to finding
> wrong include for <gssapi/gssapi.h>, as it has already seen before due to
> PYTHONHASHSEED not being set, having python hashes in random order so -I
> includes were unpredictable.
> 
> The good -I order is this:
> 
>   -Ithird_party/heimdal/lib/gssapi
>   -Ithird_party/heimdal/lib
> 
> the bad is:
> 
>   -Ithird_party/heimdal/lib
>   -Ithird_party/heimdal/lib/gssapi
> 
> (I picked up only the -I options for dirs where <gssapi/gssapi.h> exists).
> 
> This is stable on sparc64, all builds of samba-4.16 are failing due to
> this very issue.
> 
> How to work around this?

It turned out this is even more interesting.

The same issue started happening on alpha too now on Debian, after
update of python from 3.9 to 3.10.  Before, with python 3.9, it
worked fine.  Again, this is WITH pythonhashseed=1 set. This is
exactly the case with heimdal includes. The log is here:

https://buildd.debian.org/status/fetch.php?pkg=samba&arch=alpha&ver=2%3A4.16.0%2Bdfsg-7&stamp=1650980011&raw=0

it is exactly the same prob as on sparc64.
Neither sparc64 nor alpha are Debian release architectures,
so it is not a big deal that the build fails there, but it
looks like the thing is quite fragile.

And there's more to this. This time, the built was made
WITHOUT specifying PYTHONHASHSEED=1, - this is before I
become aware of this.  Please see here for the complete thing:

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1009726#10

TL;DR version: successful build sometimes results in broken
binaries due to the link order - the resulting binaries are
segfaulting randomly. This is, again, without setting
PYTHONHASHSEED=1.

But having in mind the hash order is architecture and python
version dependent, how far we are from getting broken builds
even WITH "fixed" hashes?

It looks like this whole thing needs a more real fix, so it
is not dependent on architecture or python version.  It is
not just the wrong include order and the compiler finding the
wrong include file because there are too many of files with
the same name. It is successful build producing broken binaries.

Thanks,

/mjt

