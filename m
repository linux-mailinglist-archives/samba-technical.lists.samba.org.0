Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BA69E217A99
	for <lists+samba-technical@lfdr.de>; Tue,  7 Jul 2020 23:40:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=B9XHg7I+A0GzGegYKEKtpB3jr8UhLSzBmta5hyIHWHo=; b=ChLgJlO3fWl+tSZfN7JRzkdroD
	pNnWULlQeb/qIxBnnFynXn4189YIOsbXYjc7ccmIF0uK04aRbCjiL/PbODRI2/T8/Xa9JMOp6lSsq
	6zVpKhBixDtzPn+nP1SL0WwKpX7ztcmTLsqAHnKS3XTfQarqypOjR2CCeGC0jl767KqFk72epnJkU
	IRyoSCHCiOeV7nfO/W55wVOUFYXcpoShFktg9lN1DYBbQ3o9EDA2IFi6VUewZYs3UfhZtHoACMX4o
	3RH4XlkScq90kyUlJM73xCwRG+Qlxw6yYoyeeXwLZZlMIApGyMShDDCCUp7MjiZzfL6AwmgFhDzno
	CJ6f6kKA==;
Received: from localhost ([::1]:35486 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jsvJv-005zHI-4l; Tue, 07 Jul 2020 21:40:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14048) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jsvJp-005zHB-G2
 for samba-technical@lists.samba.org; Tue, 07 Jul 2020 21:40:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=B9XHg7I+A0GzGegYKEKtpB3jr8UhLSzBmta5hyIHWHo=; b=2+GM5793ba33YuV6sWparuQG1X
 FcZhm8LIDMEteot4cN9trcS6T29dF/CBAdtOveKosF1IoI9ynvSe6+Nl6VKStlSYifKzZV8hqpeJ8
 CMy+vEFVH3ANX0n4Ua8rWwDB51iVa5+TNLtWwkc77IAOMkePmYlz1t5qAs7KRfgvvVsEjZR6YMN79
 p8gXiirqPPgg9mt2CSR21Cg81/bJI6B+93Oi9vxgapip4oY0/OiYKqrZBgNc8R+UpWhi0G+irYgzj
 rPVU+bZiG0qUrQwTQ3bePtayP/eDIWvUo5MLOc7yxZPIQ7/pO9dWxuZjOS+fsHVk9O5rjWpkzgxG9
 VMSaMp7HFKGNaJWSXtnv+FaoYNFflauBguKz7RE5IewF2wpgayIHtD2YHsT07z+xkU8kALsDnI1vh
 DFGXe+FKTdaSA1dYO7vcxk7z+CQPo7h39HN/v6ynjMGjfEY35u7lSqPmj2y0H6BJXusra8k7u9bgM
 m8uqom2bGs5W/kXpgU1mnXG2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jsvJo-00089x-Jg; Tue, 07 Jul 2020 21:40:00 +0000
Date: Tue, 7 Jul 2020 14:39:54 -0700
To: Richard Sharpe <realrichardsharpe@gmail.com>
Subject: Re: What is the difference between a 64-bit fileid and a 128-bit
 fileid in Windows?
Message-ID: <20200707213954.GB9755@jeremy-acer>
References: <CACyXjPwXQe5xPrtzYRNTsfjA0e_P2WBGoAuiKpFypxXtoZg=_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACyXjPwXQe5xPrtzYRNTsfjA0e_P2WBGoAuiKpFypxXtoZg=_A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jul 07, 2020 at 01:32:05PM -0700, Richard Sharpe via samba-technical wrote:
> Hi folks,
> 
> I have just become aware that Windows has both a 64-bit fileid and a
> 128-bit fileid.
> 
> https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-fscc/2d3333fe-fc98-4a6f-98a2-4bb805aff407
> https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-fscc/98860416-1caf-4c80-a9ab-8d61e1ccf5a5
> 
> Are they always equal if the fileid fits in 64 bits or are they different?

Hmmm. From these docs:

"NTFS computes the 64-bit file ID as follows: 48 bits are the index
of the file's primary record in the master file table (MFT), and the
other 16 bits are a sequence number. Therefore, it is possible that
a different file can have the same 64-bit file ID as a file on that
volume had in the past."

There is no info on how NTFS computes the 128-bit file ID.

