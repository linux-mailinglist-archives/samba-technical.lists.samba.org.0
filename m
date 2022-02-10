Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 910C44B13DD
	for <lists+samba-technical@lfdr.de>; Thu, 10 Feb 2022 18:06:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=8brjDIbYQ4djsLOYyKSt7Q/V6u6Tz8ex2Sqidgf56EE=; b=n2RlnJGMswGefsTuDROHXotjgs
	ix3ASEqwS2U9KcB6DsJVAOsYmwxbuyd+mfGUM5I7pY5B6mHhSCbKHmv5R471CDP6Gx7K6LRNsUypd
	nGpL8Mq5vAOj2xUF+584694HwBg/8aISXghn4brdWMrnl+5JtMfHk265PZFPyhFpdGFmTcFAC1Gkd
	1vOr12iZeLm/kFyqxq1IF6GCNOUFJkHMQUmB0UXVDzhQgS2ntSrkvHz90+8wEAnejSB94GHcqrjwm
	3bF7U2jeiRx2qaEO5vXF8C7xtFyyc3l73oCjDWrPtPvsAvZxLcqnz3BACN+iQX+V5NssksEO1rKxx
	w44AyMXA==;
Received: from ip6-localhost ([::1]:52404 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nICtY-006IQn-Q7; Thu, 10 Feb 2022 17:06:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48834) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nICtO-006IQD-LJ; Thu, 10 Feb 2022 17:06:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=8brjDIbYQ4djsLOYyKSt7Q/V6u6Tz8ex2Sqidgf56EE=; b=PICBovxGZbaG1E17F+Cjy8/qhk
 argGzzmAfX7JeRYnUYws6nx2UuHiTJkxTvPzh9p6QPVrObzCv9g4XIJFdJwUirnrFtUv+I1PG5uGC
 qRQhkhV9Kj6RPfS3w8Z8HrPmkT7/FRw6zkq6VWEo/IQsSHHpSI9jozaxP3n6/jt2oNbsBHnRq5nI3
 Ft95Qc6rAxHI6OLxGm7ObbG5QXO+/dBTvZIHXiZIP4E3Snzzi6EDBsXN35CC7pRK+RXGD24dr1xuD
 NfZ072tvGkYEFDR6S4lHnyLCTxpyEhi4oc5WYQcQnq7nTm+k3fvOkYKP/cNwCJeY+E3AGRFzfSlON
 W3ouobSUCQeGF/0vOGfeA8VbHTxuHq3HTRvSmiqLViY2RVQwvfDKCAVQNYBaqSuwJPd1/It8OQ9fo
 3QqZWUbSUFJG3D3LWF2dEzXCBBaSbsSc6Z/qRQiF0Lq9tdX7X0UXzs5IMLFV9PRQ2JswCbUi+WAVG
 IRR1S4/ojpbnrDekiuMxbZgh;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nICtN-0037zJ-E3; Thu, 10 Feb 2022 17:06:01 +0000
Date: Thu, 10 Feb 2022 09:05:56 -0800
To: samba@lists.samba.org, samba-technical@lists.samba.org
Subject: Great article on Samba symlink fixes at Linux Weekly News !
Message-ID: <YgVF9NubyuF37CLN@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

https://lwn.net/Articles/884052/

It's a subscriber-only article for now, but
lwn opens them up to general readers after
two weeks. It's worth subscribing to read
(IMHO of course :-). Full disclosure, I
reviewed the article for technical accuracy.

Cheers,

Jeremy.

