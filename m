Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D22E42920E3
	for <lists+samba-technical@lfdr.de>; Mon, 19 Oct 2020 03:40:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=grl+z+4McrBvwh7nbkE6HsK22Ys0qvsAV8HnORt+IGA=; b=33WRl/HdZvCpujz5Zwfxw8ZZwY
	1lJweiVc5Fay4Qw7IYY40ZUvvohHnV9qq66PMvKQMZEH7c7VefFSqb5K77OOoJhwbX5sEW1nlmNKQ
	5zJLf+r4R6aCPzQjcgDayyVFice8mXrq1XNuhBQA97pWFGq39CJwS3pBTDCi++Ss8b79VTLS6X5zZ
	pr50l2Iu+oamEX0rgfBWWrZFtWfSzi4HIdZrnPj5QEuUr4QiG6EummPnPt5E3m08McswLF2K53IOg
	K/WmqBtjHFLgBwNaXluyCHamxWuwEmNvtpW9hgnPKhYwfZYvER0gR8VFvi9zTtJduJp0p6o/jKVHR
	haTta+4g==;
Received: from ip6-localhost ([::1]:20866 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUK8v-00CeCp-ST; Mon, 19 Oct 2020 01:39:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59828) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUK8g-00CeCh-VU
 for samba-technical@lists.samba.org; Mon, 19 Oct 2020 01:39:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=grl+z+4McrBvwh7nbkE6HsK22Ys0qvsAV8HnORt+IGA=; b=QnW0jUwK9u1P6Gq5i9aHSsuhPe
 GkPtsvtncVZFv50dfEHhST1vBsjXn83qnaG3O9B6rEPVLRtIWTBtONDSdRnu+P1rPxtqafdoYE9/M
 +r92EjHkPj68dFtstjgr8XmgQlDw4+bQM6ZUxlc5PKu6LCd/2IWdRAtyjy3UT/c/wWddU5JQWG59z
 qRBjqfm8j+p0rCJOYam+UUVPhY2JHYpAsjE06lzZyjBd4TIF4k+IvY+herkb+kmzlszjJzpP7p9tn
 7At7+Zaobc0Ud/EAmpVFylD9XmEJ/SxctRnTtmJWJw4yTbVr9OUpvRYdygjbVVTbVT7kKK9Ajr1LU
 4REyrnOJpibtQfzFmO/vb0SXGJiNLH23+9UfbgKzxC2k5UiaMxGcloZhGNfhptV4dwguFpqxT6lJQ
 54cceqVtD4iMERf8aUafcRbHt5Zn/xl3NBvXVZGUJsQg7s2P47+oPPtdvb028hrlvHRIiQGOqLs3f
 w9+4H+3okuQ+anjORUkevqpZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUK8S-00064s-3c; Mon, 19 Oct 2020 01:38:52 +0000
Message-ID: <ae44fa9c9693748b66725fda82d0dcfcb78f9484.camel@samba.org>
Subject: Re: dns.keytab file
To: Stefan Kania <stefan@kania-online.de>, samba-technical@lists.samba.org
Date: Mon, 19 Oct 2020 14:38:43 +1300
In-Reply-To: <402fbc72-ea2d-53c0-d8f1-56512aed4f1d@kania-online.de>
References: <e459994f-01f1-afc6-eb21-7f639f96bf82@kania-online.de>
 <7330647068a853703f694614e3bdef55978d69cd.camel@samba.org>
 <402fbc72-ea2d-53c0-d8f1-56512aed4f1d@kania-online.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, 2020-10-17 at 09:47 +0200, Stefan Kania wrote:
> Hi Andrew,
> 
> Am 16.10.20 um 22:37 schrieb Andrew Bartlett:
> > I just saw this with a customer yesterday.
> 
> I see this every time I setup a new domain, I also wrote it into my
> Samba4 book. If it's a bug should I write bugreport?

Yes.

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




