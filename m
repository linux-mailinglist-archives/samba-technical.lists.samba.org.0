Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDB2132396
	for <lists+samba-technical@lfdr.de>; Tue,  7 Jan 2020 11:30:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=GTbX5HQe2f3TuXHQTse+i19gI57jaORLxPrCBD00MtY=; b=JG5zfMk+ovJWPPIbXs2bBHTm4B
	s9W+cifvgyshbbEeowg+JsvF18O72FVJY5P33cCWFDfIJQr1pwjf2EcLd43covW4nWHC4ZVEtEXrI
	q1eCyMwhwqVlWBXwiUSyqCM7y/65uJxwVwRXFn7DfOU5M2Xb4yeeLVQOfkyseeooKxmKCKuhBUd6s
	lZx0U2dVLXezv/7d+rM/jcocjkGP4ywzwR04NJLsZkiwKZCuV/PxIT6GdPAQYPbQ8kjGsVY5xGe//
	8t4bRrZj9C1mFQEugSRY3eFeCnE/6sDp/YAboZrTsWasjR4qDu2NzqhtVrST/+NMcHJsVy5oqYvqA
	Ehhvc3IA==;
Received: from localhost ([::1]:55800 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iom83-002bvP-Pe; Tue, 07 Jan 2020 10:30:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58824) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iom80-002bvI-Fk
 for samba-technical@lists.samba.org; Tue, 07 Jan 2020 10:30:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=GTbX5HQe2f3TuXHQTse+i19gI57jaORLxPrCBD00MtY=; b=TuXloDEUZnGv3NmwwuvhcTZ598
 UwWr2lsFQwKZGP9FNnMhqHtGz5tSqfA3zW9Uhmxy98eNehOm9dW0wyk3v9ZlqaOXbGsQdulzGSXCR
 QAf2foMy4BTS/ELBDjGFUTtNKZGqR27oKKgRLiXzLXvMMW63E+O7ZdhxCch9i7BejdKqIDfJryzML
 2L6X7viFYrURG/OaYzSIdX9/zD17UbUJo7QVyg+NIp+qqKjZzHSDishRln9Bs03IubXCHa+0qAZ+m
 9mPIH+7yb+0Vbq8zWjS1hHDcfyAHI6Zp/jvXFp5pVr2b34Ar7ezdqm6vH2q1zH9zD4pgpL74xpldZ
 AVgcXtRX522T+XLEt7kQOjl/MCXFjhd65pabMOhgG/35PJo6hUVvuAuPogUlnXFAvNlQB7eMOX4OS
 wPj6zwYqF9LkMBmvZZDeBgXPmO0KCsndoBtIyQqoZv/40vjrzg58Y/z+/ukfQXfvSsNUQrPY34wPu
 birKgoIOggUETMibg/EkHwgf;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iom7z-0003gP-Qb
 for samba-technical@lists.samba.org; Tue, 07 Jan 2020 10:30:23 +0000
Subject: Re: [PATCH] docs-xml/winbindnssinfo: clarify interaction with
 idmap_ad etc.
To: samba-technical@lists.samba.org
References: <20200107093340.GA7605@sernet.de>
Message-ID: <ad2ab7ff-21b2-92c1-03e7-48698d133363@samba.org>
Date: Tue, 7 Jan 2020 10:30:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200107093340.GA7605@sernet.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 07/01/2020 09:33, Björn JACKE via samba-technical wrote:
> Hi,
>
> review and eventually push appreciated...
>
> Thanks
> Björn
Hi Bjorn,

Just a couple of comments ;-)

Whilst you are making changes, how about:

Domain Controller supports the Microsoft "Services for Unix" (SFU)

instead of:

Domain Controller does support the Microsoft "Services for Unix" (SFU)

Also, you are proposing:

Make sure to consult the documentation of the idmap backend that you are 
using.

As it only works with idmap_ad, wouldn't it be better as:

Make sure to consult the documentation for the idmap_ad backend.

Rowland




