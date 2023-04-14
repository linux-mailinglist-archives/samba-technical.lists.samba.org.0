Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACBE6E2B12
	for <lists+samba-technical@lfdr.de>; Fri, 14 Apr 2023 22:25:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Ft1N9QeaH45lQAT7YqYjl5UcBNuKUniGqFxl5vMdG5Y=; b=nfknnL8FD874lkWagUzKW2O7e9
	lEsdGNAvHGJADPHAgbFcrUlIVi+k69ddl3kYSY+ZbghPDlw/RDirW9vLJaW5FNC9rMtt0nGnE1kp6
	5AOFcvLOlL83qyWmX7zHCS0xlRJq5RNgnNHZlISulY8qhkzbsMauqL0D6AdhAqJSPZlwNdDFcLy/A
	7br+iIuDsH9lMYnPMrCDaeOMC3fdoBVGSyUDD3d/J6pRVBU3vOJSmbWQiz3LGvZYNHg0Uyc3TEdLB
	kvcU/ka1E4ynt3AARTnHuxATidtfU4Lg/60ecqXQTcjQeeQ4ZZa2khPIfzLrJsSXkzgyEweZhhl1J
	QwFCsggw==;
Received: from ip6-localhost ([::1]:24566 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pnPz5-001y2J-K9; Fri, 14 Apr 2023 20:25:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16666) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pnPz0-001y2A-TX
 for samba-technical@lists.samba.org; Fri, 14 Apr 2023 20:25:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=Ft1N9QeaH45lQAT7YqYjl5UcBNuKUniGqFxl5vMdG5Y=; b=anlVb03LYV9Jdpv/fBkLC+Mdep
 4gLesYi20Cv9NgajVLeVG4i6Ggow0mRWB/i3/3f+vvImcybqObz1Db3zYl6TQXqx9zW/jVgFSUZwB
 I11WN2/EEkDAeoQp0aXyjsch0QJ4D6Qw7nS/PrwdFs4tqFpKJMyO+8hkhqaySgJ7XPfawOyAVv75M
 KmMW7kwGEk6nKunu7ZNbKJzuuB+AzQPYUMu+rXj0sJsPX6NESQ0eUwLAGa5+P+b5i6YUys7QnHLDp
 fR1wqpCGztmCD1Ej/WiT7vONCPST/PSpWk3GdU8ApCMZJid9drb8F0A9lzOiWdNu3y4a+5UTfucuS
 M42HJ22Yad/5EZ3s9pvoH0Sq+n4ybIXXToRQcsZCGzGZs3oUFQQagNAjtr8uI/nY3N2Zw7JXj6HzN
 7ZFC6oJemiEUQDsDgEOTWDl4fH5RmxGW3ff8lN78CYNDOeABGKYiLRI4SjRshy6OUPU1B4k9ElUhd
 S/NCl03RzA/+knty5FaFdfDG;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pnPyr-001CyV-UM; Fri, 14 Apr 2023 20:25:15 +0000
Date: Fri, 14 Apr 2023 13:25:11 -0700
To: Andreas Schneider <asn@samba.org>
Subject: Re: talloc vs malloc speed
Message-ID: <ZDm2p7Ar4Hz6XqLx@jeremy-acer>
References: <3161922.5fSG56mABF@magrathea>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <3161922.5fSG56mABF@magrathea>
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
Cc: fweimer@redhat.com, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Apr 14, 2023 at 08:11:46PM +0200, Andreas Schneider via samba-technical wrote:
>Hi,
>
>Florian Weimer implemented hwcaps support in glibc. This allows you to drop
>optimized libraries.
>
>The support for this is enabled in openSUSE Tumbleweed right now [1]. I've
>enabled it for libtalloc as you want to to be as fast as possible.
>
>
>Here are the results from my AMD Ryzen 9 3900X 12-Core processor.
>
>talloc x86_64_v1 (testsuite compiled with -O0)
>
>test: speed
># TALLOC VS MALLOC SPEED
>talloc:       46623469 ops/sec
>talloc_pool:  74121933 ops/sec
>malloc:       66443400 ops/sec
>success: speed
>
>=> talloc is 30% slower
>
>
>
>talloc x86_64_v3 (testsuite compiled with -O0)
>
>test: speed
># TALLOC VS MALLOC SPEED
>talloc:       47783809 ops/sec
>talloc_pool:  75068595 ops/sec
>malloc:       68073710 ops/sec
>success: speed
>
>=> talloc is 30% slower
>
>
>
>talloc x86_64_v3 (testsuite compiled with -O2)
>test: speed
># TALLOC VS MALLOC SPEED
>talloc:       50633005 ops/sec
>talloc_pool:  74245533 ops/sec
>malloc:      219259200 ops/sec
>success: speed
>
>=> talloc is 77% slower
>
>
>It looks like the optimizer is able to optimize the code a lot more if malloc
>is used.
>
>I wonder if it would be possible to give the optimizer more hints. Maybe
>Florian has some ideas :-)
>
>
>Best regards
>
>
>	Andreas
>
>
>P.S. The talloc website states it is 4% slower than malloc. This was probably
>a long long time ago ;-)

Really interesting info Andreas, thanks !

Florian, is there something you can point us at to
help us speed up talloc ?

