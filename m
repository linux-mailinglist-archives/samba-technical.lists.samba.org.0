Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DE98DABD8E
	for <lists+samba-technical@lfdr.de>; Fri,  6 Sep 2019 18:19:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=X418f7UbBtQdcYi1+1fN+oQGLcIk9I7YVt3g0A20p6k=; b=IA4Xhcm7WTutos56JqpfPUL2qP
	5hJgUkxf+TYM98LRiKdxGHUJlidh6gihbUvXkddcKtL17kZMAU5osWcJk3NNv8JIPgY6aP+zxTQxc
	ETXUckZ9PQ80ZZ+b1AdG4fzMZXxSaSdwSLIbYPzPgoGFVYw7o8FIHyHtSS2o0aShaE0swlqUqEowN
	GmwwVEyInuJxE+B/6TTzLhyQdApEXeFjJDpxGPKLeJACD1fV5oxcDIuV9z4t3vUnrPusgGFL0pM9x
	nOK7tXok0NPiKveK2PBwLLjwJZRxN9B9t9vBySYJVq2Kf4MbJ2411E464+UHBT/A/dr5QiQmNr580
	HSn0ztcg==;
Received: from localhost ([::1]:62058 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i6Gwp-0043L3-1i; Fri, 06 Sep 2019 16:18:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:65318) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i6Gwk-0043Kw-Sg
 for samba-technical@lists.samba.org; Fri, 06 Sep 2019 16:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=X418f7UbBtQdcYi1+1fN+oQGLcIk9I7YVt3g0A20p6k=; b=gTiAXrMcd2OYLgbMdgTfUFgCsM
 v2JP2p3MwsHv4qpVQBkemCIX7hdZ3kbeDGuP7jPl6F9EvLK798A3hik7HXkqeiyH1vj6Ln/pl+kuq
 XBtx9KFwaBaEq7JGCs98bEYcWBLQDP4HyaC9rWGMlSJCrATN6PonMDS8GZfNcroKDifY=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i6Gwi-00021s-9X; Fri, 06 Sep 2019 16:18:48 +0000
Date: Fri, 6 Sep 2019 09:18:45 -0700
To: Namjae Jeon <namjae.jeon@samsung.com>
Subject: Re: samba performance difference between old and the latest ?
Message-ID: <20190906161845.GA192819@jra4>
References: <CGME20190906020151epcas1p487a64747d0a00c84bc683fe0d07207bd@epcas1p4.samsung.com>
 <006701d56457$0c77fc60$2567f520$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <006701d56457$0c77fc60$2567f520$@samsung.com>
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
Cc: sergey.senozhatsky@gmail.com, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Sep 06, 2019 at 11:01:51AM +0900, Namjae Jeon via samba-technical wrote:
> Hello,
> 
> I found something strange during measuring performance with samba these days.
> I checked the performance of samba 4.7.6 and 4.10.6. 
> There seems to be about 20% performance difference between the two versions.
> 
> Test environment
>  1. use iozone and dd utils
>  2. share is tmpfs
>  3. smb client is kernel cifs client
>  4. oplock disable, oplock = no
>  4. command : ./iozone -s1g -r4 -e -i 0 -t 1 -b 24m.xls -+u
> 
> with samba 4.7.6
> 	Children see throughput for  1 initial writers 	=   11248.48 kB/sec
> 	Parent sees throughput for  1 initial writers 	=   11248.28 kB/sec
> 	Min throughput per process 			=   11248.48 kB/sec 
> 	Max throughput per process 			=   11248.48 kB/sec
> 	Avg throughput per process 			=   11248.48 kB/sec
> 	Min xfer 					= 1048576.00 kB
> 	CPU Utilization: Wall time   93.219    CPU time   29.517    CPU
> utilization  
> 
> with samba 4.10.6 
> Children see throughput for  1 initial writers 	=    9018.82 kB/sec
> 	Parent sees throughput for  1 initial writers 	=    9018.70 kB/sec
> 	Min throughput per process 			=    9018.82 kB/sec 
> 	Max throughput per process 			=    9018.82 kB/sec
> 	Avg throughput per process 			=    9018.82 kB/sec
> 	Min xfer 					= 1048576.00 kB
> 	CPU Utilization: Wall time  116.265    CPU time   33.182    CPU
> utilization  
> 
> 
> ================================================================================
> ========
> dd test result is same with iozone result. 
> 
> samba 4.7.6 : 11.6MB/s
> samba 4.10.6 : 9.5MB/s
> 
> with samba 4.7.6 :
> root@test1234-Samsung-DeskTop-System:/mnt/read# dd if=/dev/zero of=1.txt bs=4096
> count=1024
> 1024+0 records in
> 1024+0 records out
> 4194304 bytes (4.2 MB, 4.0 MiB) copied, 0.360991 s, 11.6 MB/s
> 
> with samba 4.10.6 :
> root@test1234-Samsung-DeskTop-System:/mnt/read# dd if=/dev/zero of=1.txt bs=4096
> count=1024
> 1024+0 records in
> 1024+0 records out
> 4194304 bytes (4.2 MB, 4.0 MiB) copied, 0.442567 s, 9.5 MB/s
> 
> Am I missing something? or real issue ?

Is this on identical kernel versions ?

