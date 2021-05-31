Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5504339554C
	for <lists+samba-technical@lfdr.de>; Mon, 31 May 2021 08:16:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Nxqah5zJ7D9ESCKXlPrmsrcfQO00N+g4ZBkjXHXuZCk=; b=vb1G4Nbi8NQDLh53apt9ZHoEcD
	8KIE4yP+VYZUR6qaeSW9n9JHbKzV4gCREoA7Pxn5OfIyn8T4MlqfiW+7NVcYHpdqE+f5U45GGKxOY
	ZmiOulkGCNcLuWgTNG4BjiedYTYQ5KmO/piJ5GHSvSkX12X3CTP7WIJWvTqX+KJxKvXiafmyV6BNK
	gKH84uUd25JCRrXijqrCbyRkTb6Dast+WvRhFA0E1PI0YOk2pkFbG+2Hg1T7QdNTU0HPmnT6pnSgL
	k1WEI1NmtjVHB2IxuJdntu2NsAgSKI7VQ9iNVj6zA36s84nXDDl70+3A0tJxE9gryaPqbrBaVv0Z/
	i9cA0mEw==;
Received: from ip6-localhost ([::1]:45180 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lnbD4-00031W-01; Mon, 31 May 2021 06:15:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39704) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lnbCz-00031M-6n
 for samba-technical@lists.samba.org; Mon, 31 May 2021 06:15:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=Nxqah5zJ7D9ESCKXlPrmsrcfQO00N+g4ZBkjXHXuZCk=; b=V9mNOavKpk6k5emCNA+GFAfC48
 LtqXU7bgZ32wkc/KJRmVKA2EnE8CUl57U3mCQR7xqBJzMFw8yvn1Lm4GuqXC2MN51XW4chUkOnY+b
 LNK4AjQxGxf5+eoRW67bi446UiANLVEmbV76CjTTzeN1Vi7uybovq5+p08HEDh1d3qVHjzLZIXDoK
 wxtzC4ztrYHJ9d+rr4tzjysEPvH4S3ZnjmBcSP1aRJHF+A4TeMOnAeBcr9jyiGTtQAlrmNOEymi1C
 sVuCccZI12oLa4IYIX3Jd6MisM8x61WhuMEBuikpFQRjLNwApMsWISd8syTwOldgEqlU5R1W3iwe2
 C2kaam89okValdWzqRZPoasQGumXA/50fKc+wh3z8MU7vPAMNRkVnsp48S6P5ZF6vodys8/mIiRfw
 8aKGqH7CKX+tkyjdJ7wmVGWyTpMIpFQ9uZ6GWr6V5eY3cv6YDYlVT11uz/RQEIJHt6q5ePxfSA3Hl
 Liu2Xb1vYIl9NtcN+ut4F3Fz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lnbCw-0007Oq-7G; Mon, 31 May 2021 06:15:26 +0000
Date: Mon, 31 May 2021 09:15:22 +0300
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: JSON input / output for CLI utilities
Message-ID: <YLR++pz/iWJR/ZNJ@pinega.vda.li>
References: <CAB5c7xqUC9mZ8-VFDmM44b=EL49yBiWkMikf8BWgU0FjC+25MA@mail.gmail.com>
 <562c85d7-c1d8-c978-6136-3ca538d12857@samba.org>
 <CAB5c7xqZ3OAB4YJDsU5tj9GAh+j4KiYUz_5wwOG1xeAkFcFH9g@mail.gmail.com>
 <54a0103bb925ebc76a6dd94829349adff7d94863.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54a0103bb925ebc76a6dd94829349adff7d94863.camel@samba.org>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>,
 Andrew Walker <awalker@ixsystems.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ma, 31 touko 2021, Andrew Bartlett via samba-technical wrote:
> On Sun, 2021-05-30 at 21:14 -0400, Andrew Walker via samba-technical
> wrote:
> > On Fri, May 28, 2021 at 11:15 AM Ralph Boehme <slow@samba.org> wrote:
> > 
> > > Am 27.05.21 um 23:42 schrieb Andrew Walker via samba-technical:
> > > > I know we've added JSON output to a few of the CLI utils. Over
> > > > the past
> > > > year or so I've added this to various utils in FreeNAS (using
> > > libjansson).
> > > > Is there an overall strategy for this? I'd be happy to upstream
> > > > what I
> > > have.
> > > 
> > > I guess as what you have worked for FreeNAS/TrueNAS and unless it's
> > > somehow tailored to specific usecases, it should be good as is. :)
> > > 
> > > > Also is there an effort to add support for JSON input to them?
> > > 
> > > Not that I know of, but that sounds like a nice addition for some
> > > tools.
> > > For which tools do you have JSON input support?
> > > 
> > 
> > I'm in the process of adding support for pdbedit, net groupmap, and
> > net
> > conf. I see one of major advantages of JSON input support for some of
> > these
> > is we can trivially add support for batch operations. Libjansson is
> > quite
> > easy to work with for doing json input via json_loads().
> 
> Cool.  I'm really excited to see this expanded.  It is awesome when an
> idea spreads beyond the original developer's narrow use case like this!

+1 to that. Thank you, Andrew W. -- I was looking at something like that
myself but never got enough time to kick it off.

-- 
/ Alexander Bokovoy

