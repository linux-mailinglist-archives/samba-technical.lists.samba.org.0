Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BAABB7EBA97
	for <lists+samba-technical@lfdr.de>; Wed, 15 Nov 2023 01:31:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=pxELcdrW3ZVZF4PK5ueeDzs2zJrkvKn60St1I8R0HOs=; b=BRZBbpNrfsxCqhp1lJELVvRb7h
	eWHaZ0GhzgrDiCkaZ1k6wOu/nL7nv6L7lXhB0Nae7wSxQllJggpsLADM5Et/cAUmJ+E4ypt5TUthQ
	08FcQ87ti+eJiYBR4W2GOaX4OFrVo5N1NbeVhswitWJfn+1Hdf2ix04Jvi89zfpwL1bmOSQvAn9xR
	K0Bgm12byUL5j/AtAa/1DB8SlyxPuwlHtdGbHjxvgkySOon2NBCEEbiU8gYWFYuefJaVHO7KZs0tx
	18LqEFwS71BcwTb2pWBHxv2DDLIRISF1NlZs1PR2NDDEYEC/qz7iPKG49qmsNPVHILmWmHiTMzbtN
	vweoNocQ==;
Received: from ip6-localhost ([::1]:59788 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r33op-008N61-1O; Wed, 15 Nov 2023 00:31:47 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:43377
 helo=gandalf.ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r33oj-008N5s-KK
 for samba-technical@lists.samba.org; Wed, 15 Nov 2023 00:31:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meltin.net;
 s=202004; t=1700008266;
 bh=pxELcdrW3ZVZF4PK5ueeDzs2zJrkvKn60St1I8R0HOs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kBIu8JA2tSNlzs1o69j9NLvY+jv+tPDWbLCPdv/zYI27AQNgwCwMkQwS/JSvMaKsq
 fs2gMffEdx1IbvAn446E1blxmp0UweHOtMyI5XauEoj9RsK2nXgaZQG33Wk3RncfNf
 Tol5tpXqd3zQkEETVsmOYVW6ouavkdI4ihp9pUi5weGXnH/zyBUU4NGprX3Y2qRVLe
 qk29pMjI0lxV1AyOIvFO6domdb5LEi6Xn1A5XxhrSE4konOIU1QEf/kOJHQxK5w7Yp
 yM5sGGaIeOxB7KwzqwSAliahPZ2CsflcBcpe7Umu6trlXDkd21XNkUUca3/E9Qi4J/
 ncpgL+A5OJMCg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SVPGf3SmTz4xWL;
 Wed, 15 Nov 2023 11:31:06 +1100 (AEDT)
Date: Wed, 15 Nov 2023 11:31:05 +1100
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Subject: Re: autobuild, CI broken by unix epoch > 1700000000
Message-ID: <20231115113105.535e2ca3@martins.ozlabs.org>
In-Reply-To: <eca883c1-c232-499c-b290-fec0978401ae@catalyst.net.nz>
References: <eca883c1-c232-499c-b290-fec0978401ae@catalyst.net.nz>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 15 Nov 2023 13:22:14 +1300, Douglas Bagnall via samba-technical
<samba-technical@lists.samba.org> wrote:

> To get a unique OID in a test, we have
> 
> governs_id = f'1.3.6.1.4.1.7165.4.6.2.9.{self.timestamp[-8:]}.{suffix}'
> 
> which would have been fine for most of the last 90000000 seconds, but it 
> turns out that an OID field can't start with zero.
> 
> Today at 11:13:20 NZ time the epoch flipped over to 1700000000, which 
> means `self.timestamp[-8:]` now starts with a number of zeros.
> 
> We will need to backport to 4.19.

Awesomely well found!

For completely unrelated reasons, I noticed this morning that epoch
had rolled past 1700000000 and wondered if that might break
something...  :-)

peace & happiness,
martin

