Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 054343561C6
	for <lists+samba-technical@lfdr.de>; Wed,  7 Apr 2021 05:12:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=xrBmuu7qDYHP5iflQ1toy6uYqwgpVlrKH1IMR2giP3o=; b=GQ89hINVraMXtgTmKt2SoGqGD8
	v/YJaoqZtTKUnrHw225aUmLDwSX/7NUWZZFbsuCkFz0owHr+U0kSr3zv7+oMTwcvtzgGDR2bgdn7y
	rgpyk2N9jM3trtfOQaXXlbTBlpfDLIiSe29fZVLzbgo5vkCFlBumMvrIdqKKiKj0y6biCqIUTRFfU
	jJyuSqlQbfUN7EnL5XHCGPz7UBZmynJN8TqaddrpS2oQHTc767TuNwguG36jPX7tTvmKtQ9HE+n3/
	uUJoFz5+EN2E5sf4rxxZ7jjt4KCpRquqmji68aB5nzeOb5pf9G2xc2qjY9tBvKqZFIuiAPff4BKgK
	2wYmQVxg==;
Received: from ip6-localhost ([::1]:28144 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lTybo-00AHYx-VS; Wed, 07 Apr 2021 03:12:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61722) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lTybi-00AHYo-0J
 for samba-technical@lists.samba.org; Wed, 07 Apr 2021 03:11:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=xrBmuu7qDYHP5iflQ1toy6uYqwgpVlrKH1IMR2giP3o=; b=LMK+5tmSpPQBfCmphJf1RWNkD8
 ikxXOsr+go7viUih66pGOP92ymDI92RLbjmGT7R71B0wsS4ZIy3fZ+scihWvE5DZp6m8bDsy6/WBk
 rc3S1A1K8xvZkJZGvA4b/x4yu/cBRSSlClheqtPVaV3ktXlDjIAKJdRDqPG7bMvR+PFMHvU8jezSI
 hYg+NNRa5BaPHjAV8OIj0w9tbl8YcGwTlHH7rUDMd0x5RHpvXr8xyPEi6duHUSKVHJ+ICWr5wz+B1
 f9QfrAePpemD2cSIiv7T3Naot+I6yBzRoyaFP96JA3icVD8KvavoJNSDPp95G3mQBaE4A7G9lYVtH
 KiprBwQEhfrLchUDmdz8b5KQ/2von6R42C5pzlMG2WOBUatz3Xza6re45GgexGRAtljRy3X/7FoR9
 X6tZsiw2Usxvp6tj7MerepC5LC8KPE2mvTfbFBAgT3FN/Iv94u+RezUp+0jt+LYMdYBV4mJxg0vv9
 wdW02vymPuGHMj/ZalZRBheu;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lTybf-0007Rq-VO; Wed, 07 Apr 2021 03:11:52 +0000
Message-ID: <54514b4fbafd8eeab3a96af4f6a76fea92db988f.camel@samba.org>
Subject: Re: Improving LZXpress decompression/compression algorithms
To: Matt Suiche <msuiche@comae.com>, samba-technical@lists.samba.org
Date: Wed, 07 Apr 2021 15:11:49 +1200
In-Reply-To: <CA+NQ6=xa2itZO0oYTPp784jfHqg6uAVYhEGkCuLynhgkd6eKzQ@mail.gmail.com>
References: <CA+NQ6=xa2itZO0oYTPp784jfHqg6uAVYhEGkCuLynhgkd6eKzQ@mail.gmail.com>
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

On Thu, 2021-04-01 at 12:13 +0400, Matt Suiche via samba-technical
wrote:
> First of all, thanks a lot to Douglas Bagnall for the assistance.
> 
> While I was revisiting the LZXpress implementation, I discovered that
> the 2
> official documented cases from MS-XCA were not supported:
> https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-xca/72da4f8d-2ba3-437d-b772-2e4173713a0b?redirectedfrom=MSDN
> 
> The attached implementation includes bug fixes in the decompression
> algorithm, a rewrite of the compression function and additional tests
> as it
> only had a single test.

Thanks Matt for taking care of this, it is really appriciated having
someone look back over this code, and adding tests in particular.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions






