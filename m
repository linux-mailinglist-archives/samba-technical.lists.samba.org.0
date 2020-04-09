Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B2D1A3919
	for <lists+samba-technical@lfdr.de>; Thu,  9 Apr 2020 19:45:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=etve0DxBMDcC36ONwTeIcMhsKDSNoGQQa+wy/o45ZvY=; b=IbypxTOsZjnTnlSjI8AT8Ruka2
	TD9RIoC5UmmYYGdz9XK9m+c4soVHBoIjCcUPg7KY+nNsy8KLDqS0E7huqkrEkwkQqnpx+3yZkuGVV
	L444Kt+QkHK+Mu2LQd6ckVsCMODK/txUCXkvuM3qscfmjl5JdtWyYpGStZXxZTLinXdgQBwr0Xq8F
	vR9l0Smv0LNi1OCyRsSlxxSqW0gkNJ4Lno5s6GiJ/lIrb9r1gvu+a6iNY8Z5u/a9CPJzrhEHyRSuM
	F9tfjQ1A/ApAzhm0ALOnMa4s2duVf+jGLXe3jBHgEfBbWUPkWkklmBSrPLjGODgNZAW0WiwtnOIBU
	dfav6ovQ==;
Received: from localhost ([::1]:65214 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jMbEh-000KrN-6i; Thu, 09 Apr 2020 17:45:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44202) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jMbEc-000KrG-0n
 for samba-technical@lists.samba.org; Thu, 09 Apr 2020 17:45:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=etve0DxBMDcC36ONwTeIcMhsKDSNoGQQa+wy/o45ZvY=; b=LNCnv6X9T6JPrHtAoJjF6XI3KP
 ujh05owt/KksQAVafkDOrefiImYyQwy9EhkDQVvhcQP3Hb2nW9wBALeoK74aTsCqx4Bm7SYVQvSUa
 LZ6sMzWIkS2oT97DKX8oggzkJ2/lGWb9FgMLA+Xef3y/i+/8/AYIlQX5EmsQ7VjvWowVFqX6wbTXu
 8eGfKRl615DL0IfrUurD95r2wauWpy1UgjKTc6DUhC0q8K7VupmIgxUq4wKaa5+Wj/iaeBI92vS0F
 GALW9vrSgv/J8IUKBS6RAaC84pbp3PgMMRAZtwkOO3SlNvdoOazuL31AnyZAIWKEGO5+tYUtJLKRT
 nLrJFfPaAP6vuBVydgIwlWamrE5IVH2h/xc5tMGBqfAHd+m7XoMdhH31I1VGelyHF1Cavi25I5ak2
 cpjOOkyqv7UMf0WH+TaPZp046/NBlWSmZbfQEUOW1WaHLtersLZ24XXU9Z7/7ZFGT8zIFEEdGTvU4
 up0L7YKKv1xLYuoJNy7/WFGK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jMbEa-0003U2-8x; Thu, 09 Apr 2020 17:45:00 +0000
Date: Thu, 9 Apr 2020 10:44:53 -0700
To: Christof Schmitt <cs@samba.org>
Subject: Re: tldap search paged
Message-ID: <20200409174453.GD13287@jeremy-acer>
References: <9ee1108dab93f774bb1be3eef0dceb711d2f1221.camel@linux.ibm.com>
 <20200408160707.GA8347@jeremy-acer>
 <697ec73e9ff11f54648f4e2519c3316031b53027.camel@linux.ibm.com>
 <20200408171948.GA13874@jeremy-acer>
 <45c482f7a6047743ba129bbbc585066d01899aaf.camel@linux.ibm.com>
 <20200409172845.GA7638@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409172845.GA7638@samba.org>
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
Cc: samba-technical <samba-technical@lists.samba.org>, metze@samba.org,
 Simo <simo@samba.org>, Volker Lendecke <vl@samba.org>, uri@samba.org,
 swen@linux.ibm.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Apr 09, 2020 at 10:28:45AM -0700, Christof Schmitt via samba-technical wrote:
> 
> Since the proposed merge request is only one piece, it probably does not
> make much sense to just merge this individually. Gitlab has the
> convention of tagging "work in progress" as WIP. What about the idea of
> marking the merge request as "WIP", and you continue working on the MR.
> If more patches are ready for review, you can update the WIP merge
> request, ask for feedback and then adjust. Once individual patches look
> good, they can be tagged with "Reviewed-by". When the rework is complete
> and we see the proposed API changes, the API usage and ideally test
> coverage, we can do a final review and merge. Does that sound like a
> possible way forward?

+1 on this. It's not possible to understand
what the purpose is of the proposed MR without
the seeing the context of the calling code.

