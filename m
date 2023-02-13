Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6339E69410F
	for <lists+samba-technical@lfdr.de>; Mon, 13 Feb 2023 10:27:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=BhGvzkSb+WVPlgRRsamPxmWIxAv+r3hTxUUGq20QY2Y=; b=yAjbgXj1PQLxtmywxoooS/q9pw
	v1wMrrw91WCNttfvpszXqCDjbGhjI3PFdU3Zzp+Vs8bulvHFde24hffI2RxYVEaGGdNaByzph3f0a
	4igkG/YLb/2TdCU0y832q5J8BlQAlbskgQzKszpCQ4IzJm8HP9a74agGDOxHNBRhGRU4PdzAvCvxp
	PhtWaPR/5zwiF0Xl7IDyaOvvAW52WTle06+kgfsoS2J9J/cFVyJUDLEYIU0z29xdXVdCXljxlGhf9
	/r3e13A52pvGFsr7n00Npm8aKsi9g4PKQqi7zn7OsGoRPb1aS8adUxZhY7qGYlUDby8jReMgUkKr/
	rMQWTIpA==;
Received: from ip6-localhost ([::1]:63874 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pRV6G-00BfuK-Ft; Mon, 13 Feb 2023 09:26:16 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net
 ([167.179.156.38]:43716 helo=formenos.hmeau.com) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pRV6B-00BfuA-2y
 for samba-technical@lists.samba.org; Mon, 13 Feb 2023 09:26:13 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1pRV5S-00AXIL-A4; Mon, 13 Feb 2023 17:25:27 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Mon, 13 Feb 2023 17:25:26 +0800
Date: Mon, 13 Feb 2023 17:25:26 +0800
To: Dave Chinner <david@fromorbit.com>
Subject: Re: copy on write for splice() from file to pipe?
Message-ID: <Y+oCBnz2nLtXrz7O@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230210061953.GC2825702@dread.disaster.area>
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
Cc: axboe@kernel.dk, linux-api@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, metze@samba.org, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org,
 io-uring@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Dave Chinner <david@fromorbit.com> wrote:
>
> IOWs, the application does not care if the data changes whilst they
> are in transport attached to the pipe - it only cares that the
> contents are stable once they have been delivered and are now wholly
> owned by the network stack IO path so that the OTW encodings
> (checksum, encryption, whatever) done within the network IO path
> don't get compromised.

Is this even a real problem? The network stack doesn't care at
all if you modify the pages while it's being processed.  All the
things you've mentioned (checksum, encryption, etc.) will be
self-consistent on the wire.

Even when actual hardware offload is involved it's hard to see how
things could possibly go wrong unless the hardware was going out of
its way to do the wrong thing by fetching from memory twice.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

