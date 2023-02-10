Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB896917A5
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 05:45:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=0tCVHXe8f8F6G11LlPtTlRNrXgXbYpXdoKqs4d7eeYU=; b=DG02eBylI1L7YF+P4ublTG0NO8
	TlnsybW4y3sWbOI5U6lMUigBw0iPI1J6swDxlb5GgXymWFuTkWRvbhTXeuyFRHYrnh6uOjmyTb7oD
	MpwhBQPFrb5LIgc9OMuFJDKw/FD7ICq5jQQ3f2vPW+BtWzpmqQJV1Cxgp2PSxnpSyfAP2zgFsx3Nt
	wZtmR5h8LxCGQrmpho9Sw2+CS+aBhK5Df7SVLoZ0ug1QHFMrKZJpZqQwHaV7wW7bwU1g6lLwy0d7D
	4n1JjmqdbgIIfUHELJSV0o7J0zD0PhGsBCMWIDSYHQs16QXAhWsOJN6v1II82tg3Gvam4zK8a5Cy6
	1BkGforQ==;
Received: from ip6-localhost ([::1]:41626 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQLHM-00AdSC-Ll; Fri, 10 Feb 2023 04:44:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1]:38318) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQLHI-00AdS3-JX
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 04:44:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0tCVHXe8f8F6G11LlPtTlRNrXgXbYpXdoKqs4d7eeYU=; b=vVQhWqE8+N5tZRyw5ALi5xJuMB
 Op0AEOpA+p5htuG3aw2R/+TJsUZPd/E5aMDL1bU5/67LywoO+UE0Yq00FD+lgtln5H3j+o0cLqC9z
 goP3j0aIA7hqEDWa1xjyYXInKqVOCQP66MObM/ZBXr2sAhp+ReejusDW8arm9RhOZGob5TDeMGEsy
 LOPVuZ9Xn61NhZ8CwuNz6PGIf9ZYYHwY8Cg40oFfhriUy4OjmUIHHc5coFETmANPdo5BLrZ3MFFui
 BZLPMQkw69EMYCGAdud4RacK/JkDS2fNvqgobfiZFwKSUxWFlprFyFwufkMdpScF+gmBlHLNrmFFb
 CTf0eH9w==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pQLH7-002p17-Jw; Fri, 10 Feb 2023 04:44:41 +0000
Date: Fri, 10 Feb 2023 04:44:41 +0000
To: Dave Chinner <david@fromorbit.com>
Subject: Re: copy on write for splice() from file to pipe?
Message-ID: <Y+XLuYh+kC+4wTRi@casper.infradead.org>
References: <0cfd9f02-dea7-90e2-e932-c8129b6013c7@samba.org>
 <CAHk-=wj8rthcQ9gQbvkMzeFt0iymq+CuOzmidx3Pm29Lg+W0gg@mail.gmail.com>
 <20230210021603.GA2825702@dread.disaster.area>
 <20230210040626.GB2825702@dread.disaster.area>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230210040626.GB2825702@dread.disaster.area>
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
From: Matthew Wilcox via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matthew Wilcox <willy@infradead.org>
Cc: Jens Axboe <axboe@kernel.dk>,
 Linux API Mailing List <linux-api@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Stefan Metzmacher <metze@samba.org>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Feb 10, 2023 at 03:06:26PM +1100, Dave Chinner wrote:
> So while I was pondering the complexity of this and watching a great
> big shiny rocket create lots of heat, light and noise, it occurred

That was kind of fun

> to me that we already have a mechanism for preventing page cache
> data from being changed while the folios are under IO:
> SB_I_STABLE_WRITES and folio_wait_stable().

I thought about bringing that up, but it's not quite right.  That works
great for writeback, but it only works for writeback.  We'd need to track
another per-folio counter ... it'd be like the page pinning kerfuffle,
only worse.  And for such a rare thing it seems like a poor use of 32
bits of per-page state.  Not to mention that you can effectively block
all writes to a file for an indefinite time by splicing pages to a pipe
that you then never read from.


