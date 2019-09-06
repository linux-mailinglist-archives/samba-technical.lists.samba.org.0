Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D6777AC2CB
	for <lists+samba-technical@lfdr.de>; Sat,  7 Sep 2019 01:06:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=dx+jxcZKkLPDhiSac0IMbbGWjwrVG0ATl/IHqM8oRGA=; b=RoucQswhcAwHYCD7LA4x7kHeKq
	Gd/ckHt0CZR9OsTR80GI+waLETu8Uddww8QjxGWObDEcXx+XBBhLJbdjAZt6Fh5D1h6Wz8xLMTd7p
	saGkVUGmmm8l8TBzgk9nW3Nve5fmhH0t8MA7nu/28D8x6DsqtF1S9ywMtXGILGHDqPAEHBCvN+w+8
	COvzI6VEBwaVN/5BaJv0q0uRo4GoIHVP+W2sb0ktRsh3XwQOGYYIcqQJ7zJT3GBhIN92MiJ02aBGU
	rsZy1vHUMQAsGu9v2lwizpBSB0eA+peT4fUvEq3o8GdBA4mreF1cp9B9AV2D1UbYelx/rxFQy8q/B
	mP3Ff0Xg==;
Received: from localhost ([::1]:39348 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i6NIn-0047cj-3v; Fri, 06 Sep 2019 23:06:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20260) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i6NIj-0047cc-5H
 for samba-technical@lists.samba.org; Fri, 06 Sep 2019 23:05:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=dx+jxcZKkLPDhiSac0IMbbGWjwrVG0ATl/IHqM8oRGA=; b=Isma0TInATE2lIjKlTQA0YufSh
 p1mH38HZ8DLNi986eGPSjPSr44jSbHSAkFtxGuru7S6oVN9oDnN1FerjysRGnHu2XZ+JfhkXHvfNa
 DSa+K+2m1j/+OFYJDejMkPzwZz94/yrBdzwq5dS+HrLSxbYVUkObogTB21rHUocqlmgk=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i6NIh-0005OE-Bw; Fri, 06 Sep 2019 23:05:55 +0000
Date: Fri, 6 Sep 2019 16:05:52 -0700
To: Namjae Jeon <linkinjeon@gmail.com>
Subject: Re: samba performance difference between old and the latest ?
Message-ID: <20190906230552.GA37629@jra4>
References: <CGME20190906020151epcas1p487a64747d0a00c84bc683fe0d07207bd@epcas1p4.samsung.com>
 <006701d56457$0c77fc60$2567f520$@samsung.com>
 <20190906161845.GA192819@jra4>
 <CAKYAXd-uR9RCQeVKsfREAvegP7J06nHDZ4nfeo1M+5KnkZ4VjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKYAXd-uR9RCQeVKsfREAvegP7J06nHDZ4nfeo1M+5KnkZ4VjQ@mail.gmail.com>
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
Cc: Namjae Jeon <namjae.jeon@samsung.com>, sergey.senozhatsky@gmail.com,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, Sep 07, 2019 at 07:57:24AM +0900, Namjae Jeon wrote:
> 2019-09-07 1:18 GMT+09:00, Jeremy Allison via samba-technical
> <samba-technical@lists.samba.org>:
> > On Fri, Sep 06, 2019 at 11:01:51AM +0900, Namjae Jeon via samba-technical
> > wrote:
> >> Hello,
> >>
> >> I found something strange during measuring performance with samba these
> >> days.
> >> I checked the performance of samba 4.7.6 and 4.10.6.
> >> There seems to be about 20% performance difference between the two
> >> versions.
> >>
> >> Test environment
> >>  1. use iozone and dd utils
> >>  2. share is tmpfs
> >>  3. smb client is kernel cifs client
> >>  4. oplock disable, oplock = no
> >>  4. command : ./iozone -s1g -r4 -e -i 0 -t 1 -b 24m.xls -+u
> >>
> >> with samba 4.7.6
> >> 	Children see throughput for  1 initial writers 	=   11248.48 kB/sec
> >> 	Parent sees throughput for  1 initial writers 	=   11248.28 kB/sec
> >> 	Min throughput per process 			=   11248.48 kB/sec
> >> 	Max throughput per process 			=   11248.48 kB/sec
> >> 	Avg throughput per process 			=   11248.48 kB/sec
> >> 	Min xfer 					= 1048576.00 kB
> >> 	CPU Utilization: Wall time   93.219    CPU time   29.517    CPU
> >> utilization
> >>
> >> with samba 4.10.6
> >> Children see throughput for  1 initial writers 	=    9018.82 kB/sec
> >> 	Parent sees throughput for  1 initial writers 	=    9018.70 kB/sec
> >> 	Min throughput per process 			=    9018.82 kB/sec
> >> 	Max throughput per process 			=    9018.82 kB/sec
> >> 	Avg throughput per process 			=    9018.82 kB/sec
> >> 	Min xfer 					= 1048576.00 kB
> >> 	CPU Utilization: Wall time  116.265    CPU time   33.182    CPU
> >> utilization
> >>
> >>
> >> ================================================================================
> >> ========
> >> dd test result is same with iozone result.
> >>
> >> samba 4.7.6 : 11.6MB/s
> >> samba 4.10.6 : 9.5MB/s
> >>
> >> with samba 4.7.6 :
> >> root@test1234-Samsung-DeskTop-System:/mnt/read# dd if=/dev/zero of=1.txt
> >> bs=4096
> >> count=1024
> >> 1024+0 records in
> >> 1024+0 records out
> >> 4194304 bytes (4.2 MB, 4.0 MiB) copied, 0.360991 s, 11.6 MB/s
> >>
> >> with samba 4.10.6 :
> >> root@test1234-Samsung-DeskTop-System:/mnt/read# dd if=/dev/zero of=1.txt
> >> bs=4096
> >> count=1024
> >> 1024+0 records in
> >> 1024+0 records out
> >> 4194304 bytes (4.2 MB, 4.0 MiB) copied, 0.442567 s, 9.5 MB/s
> >>
> >> Am I missing something? or real issue ?
> >
> > Is this on identical kernel versions ?
> Yes, I compared two versions in the same test environment.

Just checking :-). In that case doing a cachegrind run
on each of the two different versions might show where
the issue is. 

