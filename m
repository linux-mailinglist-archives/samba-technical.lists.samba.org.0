Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A53A69412B
	for <lists+samba-technical@lfdr.de>; Mon, 13 Feb 2023 10:31:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=XxcSQak/8cz+Vv7Ou03IxFhGx0gsDvHzT9riThN32l0=; b=Ng0kWNhBXazCUqAP+cmHmVQlfT
	8ucCnof5FhJ8RGhPssoB91w7sRXnWDURbZSO92HVY96AxCUHMIOFD6m5QtmQ2QTCW00BvbEF3en4v
	Ioyp6w60dvoKMWcpcHEN21ObgBSeSOv34rThRz+fN/qOt1yoAf2lveAizWwuha27qgA5U4lSzp3PM
	NG7wtUVTbyjEd5oYvtHikqRGNqnnjwXlurGB0Rw7LyFQdB2tou2K1Fqs9y/jDEOMHjdeXdJG2hqH4
	4382KYRpaq8/dIy/F5Ct8ACd4goF0Y86hfFZQFq77pceRg78VKgfSiGDvtjxJ2q2Yuab/MgvNSmnh
	6Q1vWdkA==;
Received: from ip6-localhost ([::1]:34820 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pRVAp-00BgT2-60; Mon, 13 Feb 2023 09:30:59 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net
 ([167.179.156.38]:43720 helo=formenos.hmeau.com) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pRVAh-00BgSs-2A
 for samba-technical@lists.samba.org; Mon, 13 Feb 2023 09:30:56 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1pRVA5-00AXXK-D2; Mon, 13 Feb 2023 17:30:14 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Mon, 13 Feb 2023 17:30:13 +0800
Date: Mon, 13 Feb 2023 17:30:13 +0800
To: David Laight <David.Laight@aculab.com>
Subject: Re: copy on write for splice() from file to pipe?
Message-ID: <Y+oDJR03MjoQJsNJ@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <304d5286b6364da48a2bb1125155b7e5@AcuMS.aculab.com>
X-Newsgroups: apana.lists.os.linux.kernel
X-Warn: EHLO/HELO not verified: Remote host 167.179.156.38
 (167-179-156-38.a7b39c.syd.nbn.aussiebb.net) incorrectly presented itself as
 formenos.hmeau.com
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
From: Herbert Xu via samba-technical <samba-technical@lists.samba.org>
Reply-To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: axboe@kernel.dk, linux-api@vger.kernel.org, david@fromorbit.com,
 linux-kernel@vger.kernel.org, metze@samba.org, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, samba-technical@lists.samba.org,
 torvalds@linux-foundation.org, io-uring@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

David Laight <David.Laight@aculab.com> wrote:
>
> It is also worth remembering that TCP needs to be able
> to retransmit the data and a much later time.
> So the application must not change the data until it has
> been acked by the remote system.

I don't believe changing the data on retransmit violates any
standards.  Correct me if I'm wrong :)
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

