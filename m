Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFC560D2E5
	for <lists+samba-technical@lfdr.de>; Tue, 25 Oct 2022 20:01:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=BH1ZymM62nKJx+AXBKScwWMoSlVCPAzz5eoL+D2NXeA=; b=Xf3yjQLivmzWZABIoWUT3wDcf9
	RyloHNUxlFd7NWmjyujjGrJcJYwWL56kyotzOdaKDTGndMkbk6ngQfZ6IfqdPiFfxhVePTuw++Aqi
	hsdMlseyYW0jyMtg0aROL5vficPk5B2AOXR9hKv6bpv942JGtyP1rT/I93oi7Nb4bPKAerUKcux22
	+KVbZFg+tgRzx1xv/Catz8si2WZB3mW81AMR3NK3lErfkaIk6kP9RdNjwewKSv1KijohJSUE3NASo
	5Seq6Zh6hlH0FEc/LjyH9nOllaplHZD+6kDjgT1IHRU93/rfILjLn+jqm7OBcJVqvWaNrsoDe/WxO
	PT4nSC0w==;
Received: from ip6-localhost ([::1]:61486 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1onOEj-0062xK-Vy; Tue, 25 Oct 2022 18:01:14 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:56605) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1onOEe-0062xB-5P
 for samba-technical@lists.samba.org; Tue, 25 Oct 2022 18:01:10 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 50EA340D98;
 Tue, 25 Oct 2022 21:00:58 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id BF8FE13A;
 Tue, 25 Oct 2022 21:01:00 +0300 (MSK)
Message-ID: <2040ec08-ecb3-9181-c46e-e8f9d5e3691f@msgid.tls.msk.ru>
Date: Tue, 25 Oct 2022 21:00:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: smbclient --max-protocol=NT1: why it requres setting MIN protocol
 too?
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <24ff5bf2-8bf0-6a88-a3b1-aab36099c9b3@msgid.tls.msk.ru>
 <91404b18-9bfd-a9c8-dc5a-f18672933b6a@samba.org>
In-Reply-To: <91404b18-9bfd-a9c8-dc5a-f18672933b6a@samba.org>
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

25.10.2022 20:57, Rowland Penny via samba-technical wrote
..
> I am just trying to understand this, from what I thought I knew. SMB is a negotiating protocol, so shouldn't smbclient negotiate the best version of 
> SMB to use ? i.e. You shouldn't have to tell it what version to use.

Well, it does the right thing. NT1 or CORE are insecure protocols,
this is why they've been disabled. A bad m-i-m can force a negotiation
to be agreed upon an insecure protocol. So you have to explicitly
tell smbclient to use known-bad one.

/mjt

