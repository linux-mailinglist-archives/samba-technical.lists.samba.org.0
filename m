Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FF53243C1
	for <lists+samba-technical@lfdr.de>; Wed, 24 Feb 2021 19:30:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=iZsFftaly24vAjYcfvYpFuRojBYGtGEsf+B38iLBBK0=; b=mQuJOMrsaylLLFuyc0nPSnWFF1
	td/BDzY5Cxua1gO3MIB9dpO6KsgA1bmksw3k3H+Fo2sWXZs4sMZVrj97eskrzsAUorGGiadzlrvFe
	TvaAYkV4hYqSs377GuoVgzIisnAJ946rsj+y9oSPzCgWRVAYqqCs8ezN+4uOeB8wZi4UbbpRGaTMt
	ppearwZ6B/s5rKzmN+x7+Sr2UGJAW1VYWYnNJIpA1JXAIAizjrh+XuIUYnJtjVROB4T43nu/t4oDz
	zn4wNsbuZVm1BhNYYxLtCqL7sx6giC3lTjIN+K35pBOhklsU38kuCz/26W1nRgir4HqIJlT/1r/kT
	zT0+jmOg==;
Received: from ip6-localhost ([::1]:47626 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lEyvK-001D98-1n; Wed, 24 Feb 2021 18:30:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62470) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lEyvD-001D8z-Go
 for samba-technical@lists.samba.org; Wed, 24 Feb 2021 18:30:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=iZsFftaly24vAjYcfvYpFuRojBYGtGEsf+B38iLBBK0=; b=Y1ASt8XZO2JnmCKJkiIFzr1QDA
 M1P9wt1g8FmunL1reah9dDA06EyBBVkNVso3Nnz5ZxVoRAsqSkDdF6J64eR52FhO8UVYk6BjuhAko
 6UMLDBX0hFvF4/Sx1kILy9wRst3EjHPiuovRQ2zCuvZvnc5Lp08X95/6DqQhdWK/nyS8T4Qf4xDU+
 afJpFcGfrRCqomuV9pZ5Sz4R5VVOWSbgSBpLzGs3LYTfYa9CQ2IJpo6se3RXAUiMNeRIL+emobBlM
 E8ojhXPNZuQ9DB42DdT0PdBfiRAzjTPgZmjVMY/7suvKOg8GhjbYpIVQL33BC7yDJziBxcJqGevGj
 OcoICtHfJQd1KV+CnXQHjq/2oE+eZxyqjlHHVoIaqLG2Y2DJs3XDC57hu+qwuwz1eyiUb2NFO5m+3
 n9zVspqsgxB30OT+1hRrJPtpMZaHvb6S3CWAPn/zZmJHVHOJZUy+VqYquslbmt7PdjKwZ3U8Bzrzy
 SkMYN0zgGZtBKAQi0wmSMcjz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lEyv9-0001rm-Lu; Wed, 24 Feb 2021 18:30:00 +0000
Date: Wed, 24 Feb 2021 10:29:56 -0800
To: Vikram Bharti <vikrambharti33@gmail.com>
Subject: Re: Kerberos Constrained Delegation in libsmbclient
Message-ID: <20210224182956.GC1333267@jeremy-acer>
References: <CAH_vq2Hx+RzJoudmxcECe0PXG7uGvydzJceWm2nMEX0C5naV6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAH_vq2Hx+RzJoudmxcECe0PXG7uGvydzJceWm2nMEX0C5naV6w@mail.gmail.com>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Feb 24, 2021 at 05:29:37PM +0530, Vikram Bharti via samba-technical wrote:
>Hi ,
>
>I was exploring a way to get KCD work with libsmbclient APIs and i see
>libsmbclient supports Kerberos auth but can't find any API for
>impersonation and delegation.
>Pls let me know if there is a way to get it done.

No, this is not currently available in the libsmbclient API's.

Can you give an example of what you'd like this to look like,
so we can assess how hard it would be to implement ?

