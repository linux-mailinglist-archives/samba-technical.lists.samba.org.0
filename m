Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1AB2F8915
	for <lists+samba-technical@lfdr.de>; Sat, 16 Jan 2021 00:03:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Um1BfSF3EEqBQ2rXBiRD6kBfzZP1ADOmkeGoFNmvW1U=; b=ZBD3sARBjrmzh5S7j7tKEsNp/3
	QqP573ZeS/1NU+l1iz5SPlByWnF3C97tD3dFt4gJFjWyX+bxiN5BME3OocGftbW4N/My702mXyEQ7
	L/5H5pi0Aw8PVpVg+NuUHArpqyXRUS1TdLFzMvAbj8K0eqIGhYaIqZsYzBHtZgH7CIGe972+4qJbf
	QNHrgEAQ9V5gCfYBidc/wkWQmOQOaCMcYjlnsi1xBk9psGSduCe8b5MVM56S8a4KXT8LJkMMhW+uJ
	McFpJ4l/xOSV+1zmAnBEhECTIFGmpgPENP8oQ+MZ2LUEqmBl/zlA6KgEK7zTftiBL1LyoLlP7rRjq
	FuiFk/aQ==;
Received: from ip6-localhost ([::1]:51712 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l0Y5y-005tIX-E5; Fri, 15 Jan 2021 23:01:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12434) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l0Y5s-005tIQ-4i
 for samba-technical@lists.samba.org; Fri, 15 Jan 2021 23:01:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=Um1BfSF3EEqBQ2rXBiRD6kBfzZP1ADOmkeGoFNmvW1U=; b=MY0HZ9IXBnWixhYukZYKV5Loll
 wojvKmzfLcQaHXF6C/D/dOjOQRAESlunL1jxOxhfqGZpXsaTwS+828FtrYbG9j1vpLnImhRY8211S
 lItpMveMJxNQ9YzpfhA+DBORMEfgg8biUrv0REiu5kE8Fh0r2GmTfSDaBW/2J0reIpZtcvDdSVbXF
 7ufcmmNHDz9EGr+1hUCC9Fdb+Tv0uFGUx/UIpeYhYKVEzV4Jk8zPJi+UKrJtzL0yWSiJEdyqpTan1
 HmS4hVUv6vPe9HS9T1MzaDD876ypwZ5njS4r7GbTSygsLqR1D//HFzTPvVfy7cD3wOupTnA5T3968
 Zn9VCyoISsYA/94VJJSEQaoi7456fSBzDFqH+90RP0E2YwJJhQY4ORHVvPLlVDBLWhEhLkhc/YYq7
 0bSCY+6aypiEFd4CwhKJFAG8HePItpcPaKYfAyJYipdkXfZZ0AWJA0nSdasKxZ11iICZJw4VbvhjV
 a5vE9x0n0oNoR/zHuvwZ1sym;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l0Y5q-0005uP-DJ; Fri, 15 Jan 2021 23:01:22 +0000
Date: Fri, 15 Jan 2021 15:01:18 -0800
To: Ralph Boehme <slow@samba.org>
Subject: Re: The new Samba VFS
Message-ID: <20210115230118.GD1842517@jeremy-acer>
References: <81de97de-0141-7909-d30e-78af32580edd@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <81de97de-0141-7909-d30e-78af32580edd@samba.org>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Jan 15, 2021 at 12:54:35PM +0100, Ralph Boehme via samba-technical wrote:
>Hi,
>
>I've crafted a document that describes the current state of the 
>ongoing effort to modernize our VFS. txt doc is attached, html version 
>can be found here:
>
>  https://www.samba.org/~slow/doc/The_New_VFS.html
>
>The emacs org mode source can be found at
>
>  source3/modules/The_New_VFS.org
>
>and a copy of the txt doc at
>
>  source3/modules/The_New_VFS.txt
>
>I've also added part 1 to our wiki:
>
>  https://wiki.samba.org/index.php/The_New_VFS
>
>Cheerio!

Great work Ralph, thanks ! To anyone writing or
maintaining a Samba VFS module, please feel free
to comment/ask questions here so we can help you
all get ready for the changes.

Cheers,

Jeremy.

