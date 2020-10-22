Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 434E929658C
	for <lists+samba-technical@lfdr.de>; Thu, 22 Oct 2020 21:55:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=hCv9hbG1OJKhJKyrMvqYAEKt2IpbJWH99fa7cDsH52c=; b=LP1jEPUTIbQmiET4O40P/hRQAb
	gm60jwom294ZJWKiDoFFryzNgxNXCOtPUg8hqrJAvGEEpkpJyM8CQRPrRy1yp+T1N2I2NBs98ps5n
	6ejcujsrSMf1oem6mgGeVxsze0yzIvItLbjHcJ5j8srj7Y8WGmXTz9sgXVmQTcR7ADQbnxJT5C+NM
	R+GMYym9gObkr7DbHwv2kfm3jMQSEFo6AnYraSdr36exSJNHKn6/U3AzhRwemRYlUKGwlq9EGa9P0
	OmF4tfPNdhE/XMJlrLdkbHue1ddqytebTPmr9DUQCuE7v3KeFjIiAzfwQ7uUXa729kP0MXii6pdmU
	Kxj1hJKw==;
Received: from ip6-localhost ([::1]:42680 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kVgff-00DN6r-An; Thu, 22 Oct 2020 19:54:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34864) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVgfZ-00DN6k-Nf
 for samba-technical@lists.samba.org; Thu, 22 Oct 2020 19:54:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=hCv9hbG1OJKhJKyrMvqYAEKt2IpbJWH99fa7cDsH52c=; b=DQ20AXrf1dG86XcEf24AyF2QHm
 g1fD6hcSJOq7Oii2zjN3BO2TwBzOzNRaSzuPq90AZ0SLoGQORlkmMy8Y1l1K4ME85gHl0iskfpeWp
 MX+tOisMe3L60X7qsOKcH7hyYKTC1hWOLZ9H6/hTy+WLHnq5vpW9ViuzIIdyT6m7UoycqpJjgPGeU
 C8zBsj3jm6oBNEieFRtqztAkkRnpzMIkTmVoFHiOkRHtOTo9HKdU6XLIY4owF0SDIjrTcP+bDyTgo
 Tj8yZ6s0O13+DQio6ZXnx6Lbhyp722ZEWNEo9yXysWm8nnk+pXkc765G7kr8jwAQVsFyvhQJSq1PU
 YkekVP9WooLC09xIjXvLHdrHQX+KlfEw0t0KAWEv9c55nRVNt1guInLe6OWfzQzkhfKobxcheDah7
 SDjSSA1Q+MgxhAwlJGVMWLRPEFdm/lssHcjHHgo6tFrcJ7Y2jlICOAPswCW4I+GY92pbU3UmrpjIr
 C5UcUS2xH6cFX0BiHx1nybrK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVgfY-0006M8-1q; Thu, 22 Oct 2020 19:54:40 +0000
Message-ID: <7e07f0c5d6ad7eaf27474d434c4ecd51e1740c72.camel@samba.org>
Subject: size requirements and keeping entropy in the talloc_magic
To: Arran Cudbard-Bell <a.cudbardb@freeradius.org>, Stefan Metzmacher
 <metze@samba.org>
Date: Fri, 23 Oct 2020 08:54:32 +1300
In-Reply-To: <4E820532-3A76-4713-B3C1-0E010F3B354C@freeradius.org>
References: <3A50457D-74F6-4C7B-BC2E-8EA68EE64C61@freeradius.org>
 <20201021001113.GA754426@jeremy-acer>
 <264F0B23-F45D-49F3-A0B7-4E717B129898@freeradius.org>
 <20201021183701.GA809738@jeremy-acer>
 <8E5EC9FB-62C2-4BA7-B809-72F26FEF2CD1@freeradius.org>
 <20201022010855.GA853779@jeremy-acer>
 <dbf19314-7d9e-76d1-cdb7-116148e91c34@samba.org>
 <4E820532-3A76-4713-B3C1-0E010F3B354C@freeradius.org>
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
Cc: samba-technical@lists.samba.org, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2020-10-22 at 12:02 -0500, Arran Cudbard-Bell via samba-
technical wrote:
> 
> Is there any real issue with only having 24bits of magic if 32bit
> 
> size fields were implemented?

Our talloc magic provides some important security properties, which are
decreased by half for every bit lot.

That is, we have in the past had attacks on our talloc
destructor functionality by forging a talloc header.  I changed our
talloc header to be a per-exec random number for this reason, to make
it much harder to forge a talloc chunk.

If we reduce that too much, we loose the protection. 

Everything is a trade off naturally, I just want to be clear what the
reasoning here is for keeping it as long as possible.

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




