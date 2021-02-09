Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 03320314A37
	for <lists+samba-technical@lfdr.de>; Tue,  9 Feb 2021 09:27:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=bxZGrpVhgqdqg/FJor8OqKCY4BMiSmN/A+HB6vipRxY=; b=oGkyyQgY0czdICLgJU23y7vEzH
	hFt4BIYIsyunTgLqpU6IiiOK0J9805SMVpx9JzrhSKLQ2N7JuYNKb2diO0VyJk4DS6kqMSkoNjt67
	uUwC+iEYqXMDUKC34oYLJDxsoCjI+By7Lk+GiP3saPxjfWVITEB/iP5xu5R+lNWJRcphJp81Hm+UU
	Kk2zqLraOaN04AmIyjYOcgAAdMxnGw4bwYy92v2OjefvDoIG1p/SR/9cIKyOlSVPbKKDzBoxAQZMg
	Taylgllvm8d5gqYQwaKADbxaq2uOZaxZjUQmDPRWkz9duC0/YBGn4icFABFp7SysCmXOf7jGKq+Xp
	SSXgYzIw==;
Received: from ip6-localhost ([::1]:52576 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l9OMZ-00Bmww-8y; Tue, 09 Feb 2021 08:27:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56490) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l9OMS-00Bmwp-FT
 for samba-technical@lists.samba.org; Tue, 09 Feb 2021 08:27:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=bxZGrpVhgqdqg/FJor8OqKCY4BMiSmN/A+HB6vipRxY=; b=GV/SBQLmMQBT4aoZ38coJIZ1U8
 WGo6y4xQw4a+roUznC5dmCPPwFgG30zfvgbwMjsPxEbYB0JJSU5ZCxaftdoFFsSHdD2V/UItx8U/s
 WTMHEtY/iuOpPGKPcgPmy5UgsOFxrNpk33/Y07bUlKBW74MxxF4Pg0yx0sSqTcQ8CJAteZK58WeLB
 6UNEp4Eqopyuh3g2dew7imNYf++y/8k+V99xKbAbg3bRjHHEM4Bi2vYztL750gmKOScccYYcoWWWc
 xlv64Cg5i06UlELrq7cGxv5wl1GZsoutOJB9OMi1xmkOwQygTiHlP/r0i+eERxsk6DHcPq20Jzf/U
 uY867xN4PS9r+i9Zm3jBCAqAlAJItZIMWwKG+hca0OFW4yWuzWc4niLLYisEo+gW5i8RucTGX/CNY
 6UYF5KSqizi8pAHY0YxpK2A1lfUy03ODKW2l/ZqV7ptTMaByNHHdNVLM5rQ7Id5yXwibVn56BCQXE
 OColuslwhE7b3BUxm2GHcts5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l9OMR-0004oo-9E; Tue, 09 Feb 2021 08:27:03 +0000
Message-ID: <ad0f018d814db7f60a4fc3c42431c9cde96c9bd4.camel@samba.org>
Subject: Re: Certificate services
To: Thomas Epperson <thomas.epperson@gmail.com>, 
 samba-technical@lists.samba.org
Date: Tue, 09 Feb 2021 21:26:58 +1300
In-Reply-To: <CAKHbFk1n9tsr9hwBqLtXQid=zm6BOYbeeNhdcRMdK6pFQFNg-A@mail.gmail.com>
References: <CAKHbFk1n9tsr9hwBqLtXQid=zm6BOYbeeNhdcRMdK6pFQFNg-A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2021-02-05 at 23:03 -0500, Thomas Epperson via samba-technical
wrote:
> Hello,
> 
> Have there been any efforts or are there any technical boundaries to
> implementing the certificate services in samba (as would be used with
> active directory) ? I am looking to implement it and thought adding
> it to
> samba would make sense.

I've not looked into it but are you thinking in terms of what would
allow a member server to self-issue a certificate in its own name etc?

A CA manager is a complex beast (once CRLs or OCSP etc start happening)
so I wonder if we should bridge any interfaces we need to supply to an
existing project.

But beyond that have a go I suppose!  I've not heard of any other
efforts that are Samba-integrated.

Andrew,

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba



