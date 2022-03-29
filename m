Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B8F4EA4C0
	for <lists+samba-technical@lfdr.de>; Tue, 29 Mar 2022 03:48:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=YjOS+Qn5gHF0Z51XaWjwiC7q04dTz6w9s6y3Hw/Mb7Q=; b=AAC3A2zlIxbpk3SooRRxg83S1L
	7hpTjKZ/MFd04JkbHvTFvodWfiB1qRPvZRLh5YmH7ke4TjDr6NAzjq/o2AlwRRDPeR9n4baZQ5ONe
	hurHtcou5nwMjSxMnTXWkgXb4l08GAOoXUlFI4D5RSKpTRbWzrN6qjGJuwmEkzLDMBm/uQXUNauLS
	HskUSUAwhzfaRHzCo6alh4Pt6gsZxxMQBvCxzD0pYIZXNV05HAI2LABJyZRDPeqWlPB5dFT85Atsn
	tS/6KiNhthPcnrd+b87tIe55MeOfCgP8YpAbmskDqrP1O5M7PO1Qtmgo1L4hKJDQLuPEIXQw8eycC
	8xq8g7dg==;
Received: from ip6-localhost ([::1]:23238 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nZ0xl-006As5-Sc; Tue, 29 Mar 2022 01:48:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37978) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nZ0xg-006Arw-S8
 for samba-technical@lists.samba.org; Tue, 29 Mar 2022 01:47:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=YjOS+Qn5gHF0Z51XaWjwiC7q04dTz6w9s6y3Hw/Mb7Q=; b=XzWQtUSIGJz2k8QAFLRkufYkf7
 x7CaIDYUmwje5kNx9Iaar64qVrpivs3Hx9Qr5GDyD1+kQkqxaFsUM7/cSHHuaKn1ESqQ7Iknqibgg
 ykXksswTkNYGzrLHR5gXmxFwieJlaxXdTLfaf1Fhy3AJBXerE1KHyXwKExy5BUyHEfh60iEkzZkxC
 RO+1zBLJQkI7bCOvZ+I5sHW8hKUl28Rpx1XYYlZj53URyGBRiwk58nwB4E7HMx1yhnHJBcR2yn09P
 a3PZ555pUNj/A16yMm/y5BQEngcW8pHJ2fJsYGObR57v/fu6OoDDyth5ByI/4+dchnymyVUp41GB5
 rb6d0nOcI0giM7glCG/b2EZc5Pz3El32b2pmejELMIJk7XvujMWZYObPQUzMFOb3+GtUARVlbsbtT
 lNmh33sy+HuBuApJFnBpciDqsygbcB6P8KaC4cYRxxObzKON1GPXBSBhFBG9Ya1SxIbxAf+kJcQ7w
 C+S2hAimwy1AREHGp2TFLf4M;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nZ0xe-0046II-Nx; Tue, 29 Mar 2022 01:47:55 +0000
Message-ID: <4e41649c9a33540237a4a72563964fdc4dda483a.camel@samba.org>
Subject: Re: Samba 4.16 build failures
To: Matt Grant <matt@mattgrant.net.nz>, samba-technical
 <samba-technical@lists.samba.org>
Date: Tue, 29 Mar 2022 14:47:49 +1300
In-Reply-To: <CAHA-KoOSMkK=CsqE5Z8uaTYpK0tDNPAmXyLiF6yoh7r0hFkiEg@mail.gmail.com>
References: <CAHA-KoOSMkK=CsqE5Z8uaTYpK0tDNPAmXyLiF6yoh7r0hFkiEg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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
Cc: Debian Samba Maintainers <pkg-samba-maint@lists.alioth.debian.org>,
 Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2022-03-29 at 14:41 +1300, Matt Grant via samba-technical
wrote:
> Hi!
> 
> Just trying to compile 4.16.0 for my debian servers as a Debian
> package,
> from debian/rules based on actual Debian packaging.

Kia Ora Matt!

Work is currently ongoing doing a Debian package.  Please join 
Debian Samba Maintainers <pkg-samba-maint@lists.alioth.debian.org> and
assist Michael as he works though the issues.

Significantly we have noticed that Debian's rules did not set 
PYTHONHASHSEED=1 (because it called 'waf' and not 'configure' and
'make' where we set that). 

We now prohibit that with https://gitlab.com/samba-team/samba/-/merge_requests/2463#note_891578528

Debian Samba needs all the help it can get, so please do lend a hand if
you can.

Thanks,

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


