Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4339E314B05
	for <lists+samba-technical@lfdr.de>; Tue,  9 Feb 2021 10:02:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=s++5FII8DZbh0eVd4ngEz09ZS8QTHCa7CoTrA/VFGnw=; b=mDQcpuk6bRQYMZLeY4isTZuNJ1
	SIk2/1xfYSh7yZ87HrdqwKyqxhFCqnyuVY2wldJYtJqXzneIO+coZjlWbCh4CghtpZy5Sx6fkCDNn
	/1AGZcw+UiAIUSSG0V+F2QbA8hF6VBDdNxIgbJUGUFJFPwLToeDVjtf3n7nYT8TozG5fTwwCncjAa
	iYFFOuLmQhKBrXxvbwmC1RO2WqaeL133ASC9v79ysn9ma/LngUev6PHq52qL4YjEZW9PJ76ddUsPf
	vRgiyj6rCzVTamn5qPzPsgdjj81Rg3Ios5yuW7Nqd2Ese+tzaO7ebOl1a/crbf50sWlpzXh3qObXR
	LYgZBYDg==;
Received: from ip6-localhost ([::1]:55506 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l9OuK-00BnNO-JO; Tue, 09 Feb 2021 09:02:04 +0000
Received: from mail.tranquil.it ([195.154.18.20]:40548) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l9OuG-00BnNH-2p
 for samba-technical@lists.samba.org; Tue, 09 Feb 2021 09:02:02 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.tranquil.it (Postfix) with ESMTP id DDD218125C;
 Tue,  9 Feb 2021 09:46:40 +0100 (CET)
Received: from mail.tranquil.it ([127.0.0.1])
 by localhost (mail.tranquil.it [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5GcnURt81XXV; Tue,  9 Feb 2021 09:46:40 +0100 (CET)
X-Client-Addr: 193.252.46.185
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tranquil.it; s=mail;
 t=1612860398; bh=kaDsFhOJGCKHtf+YOB/Or6SchA4D6glr75ZBDtblOhs=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=pMVuvvxuKE4ydFGmRENUxrFdj0I+jpwH/6NILb2gwEziwuDDeVZoFnU6JEVgQE08l
 fJ/BNwDTIbSGJsl+GdWMH6KIY7C/4ScpxdzP39uRgIMNGl4pzZu2U5Q5cRJXYyZeFw
 NPjSqfpAa/ZvkmVsTF7EK3t8kAjS5cHODDS5/+xU=
X-Client-Addr: 193.252.46.185
X-Client-Addr: 193.252.46.185
X-Client-Addr: 193.252.46.185
Received: from [172.16.144.45]
 (lstlambert-657-1-15-185.w193-252.abo.wanadoo.fr [193.252.46.185])
 by mail.tranquil.it (Postfix) with ESMTPSA id 12E5B81255;
 Tue,  9 Feb 2021 09:46:37 +0100 (CET)
Subject: Re: Certificate services
To: Andrew Bartlett <abartlet@samba.org>,
 Thomas Epperson <thomas.epperson@gmail.com>, samba-technical@lists.samba.org
References: <CAKHbFk1n9tsr9hwBqLtXQid=zm6BOYbeeNhdcRMdK6pFQFNg-A@mail.gmail.com>
 <ad0f018d814db7f60a4fc3c42431c9cde96c9bd4.camel@samba.org>
Message-ID: <35d275a0-4df3-8c4f-0a74-2fc6a5c7cdc8@tranquil.it>
Date: Tue, 9 Feb 2021 09:46:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <ad0f018d814db7f60a4fc3c42431c9cde96c9bd4.camel@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
From: Denis CARDON via samba-technical <samba-technical@lists.samba.org>
Reply-To: Denis CARDON <dcardon@tranquil.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andrew and Thomas,

Le 09/02/2021 à 09:26, Andrew Bartlett via samba-technical a écrit :
> On Fri, 2021-02-05 at 23:03 -0500, Thomas Epperson via samba-technical
> wrote:
>> Hello,
>>
>> Have there been any efforts or are there any technical boundaries to
>> implementing the certificate services in samba (as would be used with
>> active directory) ? I am looking to implement it and thought adding
>> it to
>> samba would make sense.
> 
> I've not looked into it but are you thinking in terms of what would
> allow a member server to self-issue a certificate in its own name etc?

I have a client who had to setup an ADCS (AD Certificate Service) for 
VMWare Horizon. It has been set up on a member server joined to a 
Samba-AD domain and it does work properly (at least for that use case) 
for auto enrollment.

They have a separate CA for the other stuff (user certificates, https 
server certificates, etc.), so I cannot say for every use cases.

Cheers,

Denis

> A CA manager is a complex beast (once CRLs or OCSP etc start happening)
> so I wonder if we should bridge any interfaces we need to supply to an
> existing project.
> 
> But beyond that have a go I suppose!  I've not heard of any other
> efforts that are Samba-integrated.
> 
> Andrew,
> 

