Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BE6B1889
	for <lists+samba-technical@lfdr.de>; Fri, 13 Sep 2019 08:58:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=jkNgtvhbASEWZNnE5uufhgbjKBhyqxK1IdaSrESyQiU=; b=aQqwPq1dQ3uePvalY2YxMXTEGW
	iUXnZhLnAMG9Bsvn/qD2krIvbxnIHHGFFzcBVmUYuZ3kXsRjrOYPnSyoGSRyTmHmQRDL0ihHkre5M
	qzne/JvSNB9DSWPwfDZy7qfJl5WicmFvhWcFZHFtPT0Sd3l97MPFcaP/hwTNGhBcrufBC/bzQXlc8
	egI4EQA2IJa56sHW/hPSis+cn36yj0cXSHsUeM3aOp9JVLT5l1Wu/kdiv4OQXqAEjhMF28+EmEmp4
	II2G9a+AKjL1EVt/aQYjyUalSS11mTTbus/7v6YhMTjDdoTx5cs2PECD8bNKKsvjHrl5JetW3P/Gq
	QfBeKXWw==;
Received: from localhost ([::1]:41798 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i8fWL-005B41-28; Fri, 13 Sep 2019 06:57:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42840) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i8fVy-005B3b-49; Fri, 13 Sep 2019 06:57:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=jkNgtvhbASEWZNnE5uufhgbjKBhyqxK1IdaSrESyQiU=; b=RbTpTf5V7hJ+8s83lo2Oa4nfAm
 3JO8J2CkYJOdpDni59mVH0LJ9MXfJS+q2zSUMEZzhgn7qYGXC8ass+8kMzqZAhmieAHGwmOQFaq+j
 pTK/3BnUE0k/+ouo8gRT9LYblG33+FM2s56hcdMjIqbDN3CGJ9KcvzswZcgjV0UjiMmE=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1i8fVx-0006UV-7r; Fri, 13 Sep 2019 06:57:05 +0000
Subject: Re: Use internal DNS to forward zone
To: samba-technical@lists.samba.org
References: <mailman.8.1551441602.2028351.samba-technical@lists.samba.org>
 <5e4207b2-eb1c-2bdf-72df-9d1046028d84@gmail.com>
Message-ID: <3d2e8d77-9ab9-a5f3-825a-e6fa87b8ffa7@samba.org>
Date: Fri, 13 Sep 2019 07:57:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5e4207b2-eb1c-2bdf-72df-9d1046028d84@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Cc: sambalist <samba@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 13/09/2019 01:22, Juan Pablo Lorier via samba-technical wrote:
> As far as I've been able to find, there's no up to date information if 
> the with internal samba 4 DNS I can set a forwarder server for a 
> specific zone.
I think you are miss-understanding the use of a forwarder in Samba DNS.
>
> I've set the dns forwarder option in smb.conf but seems to have no 
> effect as I can dig @ the forward server and get the reply but samba 
> DNS does not get the reply.

I think you mean that you can run a command similar to this: 'dig 
my.AD.dns.domain' and you get a reply and that you can also run a 
command similar to this: 'dig google.com' and also get a reply, if so, 
then everything is correct.

A Samba AD DC is authoritative for its dns domain and will return 
information for everything inside its own dns domain. For anything 
outside its dns domain, it asks its forwarder and returns the result 
from the forwarder.

>
> Is there a way to get this done? Should I see the integration with 
> BIND for real DNS server features?
Samba and Bind9 work in exactly the same way

I have cc'ed the samba mailing list, because this is where you should 
have asked this question, please make any replies to the samba mailing list.

Rowland



