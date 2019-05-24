Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 422C829317
	for <lists+samba-technical@lfdr.de>; Fri, 24 May 2019 10:30:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=V7goFAuyjhOYnxLTGAA07VfwfWK1XNvmlZBxBNMXiio=; b=oBkiTW7w6XjNh0EvhDqGD/MH/0
	7nGUfPg8xDgbEHopQzznySn4bECVv+/A47ht314oNoj1wJess17kpm4uGNOc8USds1vHcw7oACy9f
	/DHV146oQylCyE8WUx6IH6iiM3Dm5vHZLPlUn1UZUmI6QY4XYBovW3jS3P9QaBZncPEk/IKItVnx4
	J+0v4yZ4uY3jshnt+zTaA+ZPNF1SMAg3NiuxneRiaOaOm5DJiXRxdOoWCVOrDBJvuDGtCHyOs4fRn
	rK+gPgloU36q5WpJL4OslMyUPkG/qZhfWLfo9NRQr4JitIGz76oB0b8Htf6d7IovRovWgYmz/Mb+R
	HMMgwpzw==;
Received: from localhost ([::1]:40588 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hU5Zu-001YC1-MW; Fri, 24 May 2019 08:29:26 +0000
Received: from [2a01:4f8:192:486::147:1] (port=36408 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hU5Zq-001YBu-Du
 for samba-technical@lists.samba.org; Fri, 24 May 2019 08:29:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=V7goFAuyjhOYnxLTGAA07VfwfWK1XNvmlZBxBNMXiio=; b=pBiZFSMWg0FrozwUlIk2tdZtcb
 mBbFR77hhHVf23H9UaIYxN0wZMaUGcNfc2f9nleMFGGfGJHvAp1NMJZpBegMfkjeLvG34lJtfDJyP
 0DoHsimhi306wmV5xXBUH2YN5DaS1dSx6nwz1TO1q6RdWQA6IZ9p+p97lSMakKK7kNXY=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hU5Zj-0008Ly-Pn
 for samba-technical@lists.samba.org; Fri, 24 May 2019 08:29:15 +0000
Subject: Re: samba-tool fsmo transfer - uncaught exception
To: samba-technical@lists.samba.org
References: <642f86fb-36b6-e647-ec52-e6e93bab2950@linagora.com>
 <b2b6f46b-c819-c917-37f7-ead663bf4cf4@samba.org>
 <1c97651b-c97b-6f38-249b-aff5a091b24e@linagora.com>
Message-ID: <4f70f827-6b7d-ff57-beaa-6519a8d80633@samba.org>
Date: Fri, 24 May 2019 09:29:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1c97651b-c97b-6f38-249b-aff5a091b24e@linagora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 24/05/2019 08:00, Julien Ropé via samba-technical wrote:
> > Can I ask just what is the exact command you are running ?
>
>
> Here they are :
>
> samba-tool fsmo transfer --role= forestedns -U administrator
>
> samba-tool fsmo transfer --role= domaindns -U administrator
>
>
> Transferring other roles doesn't cause an issue, but as I understand, 
> only the DNS-related roles require the drs_utils module.
>
>
> Note that the transfer seems to be effective in the end, as shown with 
> the command "samba-tool fsmo show". But this exception makes me think 
> that something did not complete.
>
>
It seems to be failing whilst trying to replicate the changes, which 
shouldn't be a big problem, because normal replication should do it.

What I am struggling to get my head around is, why does 'import samba' 
fail when 'import samba.drs_utils' doesn't ?

If you run 'pydoc samba', you will find that 'drs_utils' is part of 
'samba', so should be available, especially as the full path is used 
'samba.drs_utils'

Rowland



