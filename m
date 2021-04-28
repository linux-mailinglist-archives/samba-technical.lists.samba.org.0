Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7D936DF90
	for <lists+samba-technical@lfdr.de>; Wed, 28 Apr 2021 21:33:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=C8bbv7vgMax6k6ui52S4dw8Flbib3CuAvuiKRNLh2uI=; b=RALTo9VelA7cZx7lmJuiEEw7/a
	iMu/7hg0zmdd7jeq+fi9xoLKY02AUFAcbYE8Z2n1Tf8AIPabT5iGrALYzLoPDAGTT4233TiJaQR/+
	8ttuYt5bjvj8X+EmyO42fNkAWUodJyxUOb6/zPrWq/J6i6nb5WM04Uc6QgXVaORMwzX51qQJ1EJTd
	uivg9Zyn3DbJJACcho3AqSsbjD6VtqpMRbrKNh0H9S4IsP/Wmu3mvkVHVB8jDj4XoqkIHmtINhzg5
	fcDCzoFTuFMQ9JHf/gKkG3s0erUjQ34fjbYd7TJuNHVBCYG+sL0jGHFFdjRzQkkHD0yJw4VS2q+c6
	cifwDTrQ==;
Received: from ip6-localhost ([::1]:53638 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lbpw5-00CwFN-Kz; Wed, 28 Apr 2021 19:33:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17806) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lbpw0-00CwFG-Fo
 for samba-technical@lists.samba.org; Wed, 28 Apr 2021 19:33:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=C8bbv7vgMax6k6ui52S4dw8Flbib3CuAvuiKRNLh2uI=; b=1xHunuHDnMM68AHk8BpiyxaE21
 izkPvxgzUkEVS8ESxTOZ9jmaCfQH0Z+Jucw91C9PCWzcVW2SXMauyejmOY6y7Je8dfn/cqfoPzr8r
 2l4nMHFeVg5NJFMgskUeL2HhWRvmfiaXQtSR5hxON9LAnXmHbyaIMekwlCL9jzgGSjh44oI3OU0WP
 C4Pjcgic37y/mTE7CJWZeU2YvIna9nD3ALRFVvidytu+DjVjb10j+5kf39Yzou858cwtMzV/dUZwk
 70obNimA+OLM9C5XbDhk3867MOp0k9it2WzoXuhjFFdQWWG738LZhWNg8KdDKxLYW3OgVZWiMvkww
 /EXHXxcjBfHoMbF07mGqknwqCA4PUWvuKnx5dqYKFUCFvYw4sVD6vS4A42vvO4DXVihYgKGslAIDv
 nU+h+nGufCm8LzsBwbYR7MapwxB18wbpxt/4dwvoMXO6TBoJ+ZZdL9jsLV92dOChulJanyh76b4cL
 zyINu0ZUD0dx/2KHDKrOHwln;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lbpvz-0003E8-2Z
 for samba-technical@lists.samba.org; Wed, 28 Apr 2021 19:33:19 +0000
Message-ID: <f81fe5d1268e58b20a0e77d739327f9f858c5a11.camel@samba.org>
Subject: Code coverage
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Thu, 29 Apr 2021 07:33:15 +1200
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

Just a note to say that I've fixed up our code coverage generation, and
we are now at 42% by line and 43% by functions.

This seems to be down over some of the historic numbers I recall, but
we haven't been watching it for some time.

What I wanted to encoruage is folks to look at the areas in red on this
page:
https://samba-team.gitlab.io/samba/index-sort-f.html

If you can find code we can delete or PIDL code we can stop generating,
then everybody wins, as we ship that un-used code as well.

Or of course adding tests for code we use by shows up as unused here.

A long time a go I used to have "callcatcher" running on Samba, but
some effort would be needed to get it going again - Jospeh gave it a go
and it wasn't trivial due to some of the tricky ways we use the
compiler in Samba's build system.

(callcatcher finds globally unused functions)

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


