Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D2C7E7467
	for <lists+samba-technical@lfdr.de>; Thu,  9 Nov 2023 23:32:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=lYJwWTdPsU+nXZdFFCt51dPepLeOqHNXohELVNnRynM=; b=ntav4i1eOoOStzAbibVEKzRwdP
	x3ZPae3BoHLywpqjRWvpbcm9tRzwCno0N5X9IbEf12ai0T3ZsJ9fsaFVduNWWhGTjHnP395mATQjB
	Tj8D4sa8cgW0ROtzUH6pRrsBQRhnmNmvwqpLK+o2/QJVD40A8cdEHnEp5qIGmnMn8wvTLoQML9p11
	G7ZusrmWe275Wy3lDHm4dws+DzlgS09QaP44ovHT5abB/+SSOGiRwchjT4Jm75INRIatGd4hIHan+
	ZRtuSI1sFgiPt7RFeZjdQf0VSSn/OaEWGde5bEBTECiBQx5XJLsOi+qGyFWlyhQadPMltpL71CbmF
	Oyj2fBCA==;
Received: from ip6-localhost ([::1]:22248 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r1DZd-007QJI-FH; Thu, 09 Nov 2023 22:32:29 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:35813
 helo=gandalf.ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r1DZW-007QJ9-KT
 for samba-technical@lists.samba.org; Thu, 09 Nov 2023 22:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meltin.net;
 s=202004; t=1699568014;
 bh=lYJwWTdPsU+nXZdFFCt51dPepLeOqHNXohELVNnRynM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KwxHNZe4yK8KbD7vPgNZ4wrIMa++TUn2rxwuU0EhWeFfSWKjlw8OM17IjJ5rQ+QUI
 ixfSVzXdZYEqjXKdrBcMTGu7nFyuChSqrCxRY6oVp5Z7qFcSCtyim6taGDM4yYAbmj
 QY6BKBBqH7tH5UWWuEuinlOf3a70maW+uVH62YBBc1SVuIhqhW9o+/UGFh1owmdqrH
 KUwXLwWmKVc8FIrsPQubs0PWZoYLqxVznN3LLB/LKtMEBPvBm5kSQJB1L8NFaTSluE
 JQsX0Y31o2QhRi7rD5pNitkQJQBubRpJn8yFLrxkznQteaDwE3U4dvFHlRG3+FEvK8
 EKNaCgYse9JPQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SRGSG4lVGz4xR5;
 Fri, 10 Nov 2023 09:13:34 +1100 (AEDT)
Date: Fri, 10 Nov 2023 09:13:33 +1100
To: samba-technical@lists.samba.org
Subject: Re: Can we move Samba to C99 and past
 -Werror=declaration-after-statement ?
Message-ID: <20231110091333.5afa2158@martins.ozlabs.org>
In-Reply-To: <72d8df3ab0c58d2edf7660ad2af79935cb0a48a1.camel@samba.org>
References: <72d8df3ab0c58d2edf7660ad2af79935cb0a48a1.camel@samba.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Warn: EHLO/HELO not verified: Remote host 2404:9400:2221:ea00::3
 (mail.ozlabs.org) incorrectly presented itself as gandalf.ozlabs.org
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 10 Nov 2023 10:58:04 +1300, Andrew Bartlett via samba-technical
<samba-technical@lists.samba.org> wrote:

> Samba chooses to, for it's C style guide, to enforce -
> Werror=declaration-after-statement
> 
> I understand that some prefer the style.
> 
> However C has moved on as a language, and libraries we use (Python 3.12
> in this case) don't compile with it, and we are having to do quite some
> contortions in 
> https://gitlab.com/samba-team/samba/-/merge_requests/3373 to build on
> Fedora 39.
> 
> See also discussion at https://bugzilla.samba.org/show_bug.cgi?id=15513
> 
> Can we agree to just remove this requirement?  
> 
> It will allow us to keep variables closer to their use, which is
> helpful in a lot of ways, particularly in longer functions. 

I think that sounds good.  Yes from me.

Can we also please declare for loop variable in the loop?

peace & happiness,
martin

