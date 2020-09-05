Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F1E25E725
	for <lists+samba-technical@lfdr.de>; Sat,  5 Sep 2020 13:01:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=XnmAzLXB7DkBDWq+UUMimK05WB7RuFtVclU0J20V5K4=; b=OqmWU9OcMLDqy+pPNipVx0fV/L
	j7aC/2WpMTCVd2Ydcy2Eax9WbwQxWDKBKEfVwSFK/3SScOfrdiDSceDML2btWHG7TUYcYZZlE9Fyq
	pJGS3O5Hab/1AQ7Pg9Back6BzFU5F4sDu8r6zIGolBMQ9QHkZCe+75XbpbXg4XvctpqVTFvhpxy7G
	1ey0Jn/QKQqdXeUnBR9ze8qmt2RzuufHnb+nWLxAQJzz3QOKfSJVfdxEOYNAJd8sJ0PvvLs0i+7ZF
	fw+GrYeGgeDd31340mQ4tZSS1V6C4eTmL2pMoBVJa2i5mitDvJPhVVrxFtwAygLCZfuqUhlgn72Qn
	8wvYV0nw==;
Received: from localhost ([::1]:56810 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kEVwT-0049mX-Dh; Sat, 05 Sep 2020 11:01:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30384) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kEVwO-0049mP-3U
 for samba-technical@lists.samba.org; Sat, 05 Sep 2020 11:01:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=XnmAzLXB7DkBDWq+UUMimK05WB7RuFtVclU0J20V5K4=; b=v67zX/WtZ2iNv3iKJiTEkR7NLJ
 ZQZ9lRJDifrTl91GjypUW4ADYsTKIaAKhLjIuQXPN6IIg+z4h1xAhesYx80RiqSlkjXxrdtmHhtnW
 OIi4rT4+qIP01iGy50xQFCOlq0eFRsOrxlYyfDhXNSYLeVeJPrRQ0Kpx+Aq2NeqqiVPXfEDVQ5ZNi
 bmtHdEJodNt9/rzcUOJvLWFJRZqojxLvr8o0MFcKwUtX/iK+qu/Y/aIuV+App5vb32QuQMDb+AE0K
 InbRJIdqorTrVmvPgaRQLJ1wJboY36Es/U2+HlopOIb/yB/Dx+aDGxt0AmmcVXUGLsXvuJFWnRxLp
 Z7AcGmaXs5gxY4bsNmRXH7QQVxI+HeS1PttxsfTkzI08lf1S7K5vsd5Kd6J78a9LR+OddWnOrCwgk
 7ibxXsC59dHjOu3yLy0KSmhW4sjrZRMJjf9f6tqH6fJKw1mSxjLID+YDSp6q9nmxjAQoaFp4kFIdx
 no+QXpwZ5rFzHZpQlcA9sCKL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kEVwN-000598-45; Sat, 05 Sep 2020 11:01:03 +0000
Date: Sat, 5 Sep 2020 13:01:01 +0200
To: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Subject: Re: Drop Python2 for the build?
Message-ID: <20200905130101.5f7785a6@samba.org>
In-Reply-To: <d3abac97b731ed0d37ea4dec28e2792128f527dd.camel@samba.org>
References: <d3abac97b731ed0d37ea4dec28e2792128f527dd.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, 05 Sep 2020 14:22:34 +1200, Andrew Bartlett via samba-technical wrote:

> As background, the first Samba release with python3 support, 4.10, was
> released in March 2019, so if we did this for 4.14 this would be a two-
> year gap.
> 
> What do folks think?

+1 from me. Given the upstream EOL I think making 4.13 the last release
with python2 support makes sense.

Cheers, David

