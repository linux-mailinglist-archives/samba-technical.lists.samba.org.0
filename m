Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C125485AA43
	for <lists+samba-technical@lfdr.de>; Mon, 19 Feb 2024 18:47:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Zzmehb8OSHEmWKgvrfkilma+ZN7YHrkgO4VAHXKOWY0=; b=5Wgcg9ev0rHLjC0uc5FpZ8dJ5G
	KPztQG3jfO5+aiLHgGbHpT0JZu7o9YPUZDZwKQdwnR/nL1LoOmLZVUsc0VnOAYa3+pKhrMnJUQ9yv
	4yUL3F+VqvIZz0MwYwj3joPrw0Id8i+01Ye7hExCn7KWZi9oXSAcPivavyoRorz7eXmli7SjGkKvq
	WTbFUHgpdgIYCCXlVUQo+NdYXBF6hpMG74sqSn7N7vuRbSG6bdQocyj0iDovZYXGG9ojEFSRnsLWn
	TngvGICfIaU9n4aQ83SzcqgMqUIeNVfYFsSM0GedKpt3iOKg6H/y1vjAX+CX3Jcxq8LKBmwcCwomA
	9n2XEEEw==;
Received: from ip6-localhost ([::1]:57408 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rc7jX-008vpc-MQ; Mon, 19 Feb 2024 17:47:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23550) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rc7jT-008vpV-Fa
 for samba-technical@lists.samba.org; Mon, 19 Feb 2024 17:47:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=Zzmehb8OSHEmWKgvrfkilma+ZN7YHrkgO4VAHXKOWY0=; b=Yl1kzhDLTTH22c3iWgRRCVWNiJ
 bF5vpNhFZ3UC/ockToqBpgYrky0pmRHHsbetBeNUW1GlygLMkqtHL3EBMRp18s0y9ivsq3pqjt06+
 Nj/B8Te+T+rc5dhPIMkVS9RDw8JwZcSLZmf1OaYilYDqIqw8xC2OOTFhj40myAlQIvuTYpLOncHbA
 ao4XtL3Z8ZVO4hc2u6uEXWySSD9Sqrfv0O4l8jCRaTuDay3SW17oIAXYUzkxt2K8B1HzcoFh++uEE
 jYzR36YgCxBTrztIDgaEzk3gC6tO05Flb1JBVLvApu/iON/hCC1NgXKFWTWTMIosxUyG3tPvTBMu0
 udiOh5uCpA8l1SRfUWoamQtQ3Btq4f93ke3NsXAp4Ojl5WJ3OZONIgaaJ6K6I0MtEicZRCDFuLsQf
 6TxjxHjPwd0z06tuerVmjbcwhJq9tJKcQoXDpJ/SMe1yF13kWNCXl9fw4JgwTHf+5uZfrdY+75paK
 VbFx7QgoEqd76QQhmXE3FsLk;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rc7jR-00DpAi-38 for samba-technical@lists.samba.org;
 Mon, 19 Feb 2024 17:47:10 +0000
Date: Mon, 19 Feb 2024 17:47:08 +0000
To: samba-technical@lists.samba.org
Subject: Re: [MS-GPOL] 3.2.5.1.4 Site Search
Message-ID: <20240219174708.4990e0c1@devstation.samdom.example.com>
In-Reply-To: <4365205.UPlyArG6xL@magrathea>
References: <4365205.UPlyArG6xL@magrathea>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 19 Feb 2024 17:52:59 +0100
Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
wrote:

> Hi,
> 
> "[MS-GPOL] 3.2.5.1.4 Site Search" wants to know the site of the
> client.
> 
> Details:
> 
> https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-gpol/
> c2ce6870-c863-40b0-94c1-73cf53b6e634
> 
> In order to do that, it does a netr_DsRGetSiteName() on the local
> machine to the local rpc_server. If you sniff the network traffic, on
> the DC you can see that the clients rpc_server does a CLAP query:
> 
> bin/ldbsearch --use-kerberos=no -H
> ldap://win-dc01.earth.milkyway.site - UAdministrator%Secret007! -b ''
> --scope=base
> '(&(DnsDomain=EARTH.MILKYWAY.SITE.)(Host=SAMBA1))(NtVer=0x20000016)'
> Netlogon # record 1 dn: 
> Netlogon::
> EwBcAFwAVwBJAE4ALQBEAEMAMAAxAAAAAABFAEEAUgBUAEgAAABsfosaQV2fQrJLMfR
> xuNCLAAAAAAAAAAAAAAAAAAAAAAVlYXJ0aAhtaWxreXdheQRzaXRlAMBGCFdJTi1EQzAxwEYKOKjA
> ffMDAAMAAAD/////

Have you tried adding '--show-binary' to your ldbsearch to see if you
get the result in a readable form ?

Rowland

> 
> # returned 1 records
> # 1 entries
> # 0 referrals
> 
> I think this is actually the same as:
> 
> 
> $ wbinfo --dsgetdcname=earth.milkyway.site
> \\WIN-DC01.earth.milkyway.site
> \\192.168.56.10
> 1
> 1a8b7e6c-5d41-429f-b24b-31f471b8d08b
> earth.milkyway.site
> earth.milkyway.site
> 0xe003f3fd
> Default-First-Site-Name
> Default-First-Site-Name
> 
> 
> As samba-gpupdate is written in Python, the question is how to do a 
> dsgetdcname() from Python? Could someone give some pointers?
> 
> 
> 
> 
> Thanks
> 
> 
> 	Andreas
> 
> 


