Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AD8A19FB5
	for <lists+samba-technical@lfdr.de>; Thu, 23 Jan 2025 09:20:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=n3dTpHxsUy7mhLHsuelNfPo8tYHbfQgnMoqpds7mWWk=; b=gy2eHFQ9zfk9iuFzmC7HEKQasP
	E38rg9BO5W6+RZ63ixbk+vjI3RZWXh/dNKQBui3o0n27rv+m+dMJoWCyRTMDSG+IOnU/eWrxQszKe
	wxa8IMP9/PMbStvs+TzV1lwV57SoNZkeJ08VaqBmLsJPbR8Se0SSiMG/7iqV5JvJGECYnv+XIsjB2
	c+OzI+5JfCoFx6h+yTv27ABjWFHpZCWJ7BWwse/YzkZ56dBPEPA10E77CfvJLG7JpDjSRxWV2aTUC
	RBSSGLsw2PbyOIIALwkKtG21PBC9Dy7NUXU7SadRbTuQMy9zi8h1Ot3HTNkbSbXh71zSxHXjk5kTZ
	lqJx8CaQ==;
Received: from ip6-localhost ([::1]:61272 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tasRS-009Ife-4Y; Thu, 23 Jan 2025 08:19:58 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:35395) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tasRO-009IfX-8t
 for samba-technical@lists.samba.org; Thu, 23 Jan 2025 08:19:56 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 44689DDA5F;
 Thu, 23 Jan 2025 11:19:33 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id C99551A2659;
 Thu, 23 Jan 2025 11:19:50 +0300 (MSK)
Message-ID: <db1bddd1-4a9d-4f0c-af3d-5f43332be5b0@tls.msk.ru>
Date: Thu, 23 Jan 2025 11:19:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PANIC Bad talloc magic value - unknown value during disconnect.
To: Yogesh Kulkarni <yoknfs@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>
References: <CAOGdD2rEGmhH4rJRsgQbgU7Wu=kg3_poTLUUr7MMjuJkAHM8eg@mail.gmail.com>
Content-Language: en-US, ru-RU
In-Reply-To: <CAOGdD2rEGmhH4rJRsgQbgU7Wu=kg3_poTLUUr7MMjuJkAHM8eg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

23.01.2025 10:22, Yogesh Kulkarni via samba-technical wrote:
> Hi, I am looking for help in getting RCA on this issue.
> 
> A Panic with bad talloc magic value is seen during disconnect.
> 
> Samba version : 4.13.13 ( Debian 11 - 4.13.13+dfsg-1~deb11u5 )

Hi!

You collected an excellent bug report with good data.

However, version 4.13 of samba is completely end-of-line from the
Samba Project point of view.  And on debian, we mostly rely on the
upstream support for all this stuff.

I'd suggest you to upgrade to a current version of samba, which is
available in bookworm-backports.

Note: I'm not a member of the samba project.  Maybe it will be possible
to easily identify a change which is required to fix this particular
issue in 4.13, - in this case I'll be glad to update 4.13 in debian.
I keep samba current in backports.

Thanks,

/mjt

