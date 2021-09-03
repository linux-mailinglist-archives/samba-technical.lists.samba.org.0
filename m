Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE6040062E
	for <lists+samba-technical@lfdr.de>; Fri,  3 Sep 2021 21:52:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=eBOxTYkc0MH/u5U3FSdhZT+C16EbcV8sjDQM8vBC58A=; b=EWo7kAjmd5ZXgLk2jP02kzwcwv
	YSn++8yq+el0j9WUIfnSECYLQbyd/PwUxD9HYQhwnRXcGt2VR8KcvJXR7E9AnmjaUa2CkS+XxgeJ3
	A9n3W4HyTHXDcMNp/H2IxWppykHQck2Av1d+tNJxXarRNCltA2bpeAjv6ienrbuGoQNb0u4C7e4oL
	Rz14INXB3JDruQ5xr0Yz+LVjqY6O1UYeC0kU3mni4S22WcqI7Dqgq1zTRUMox6Z+GC5wd0iKvGxHA
	6wox0+Wl3eZQjloeN3TrtySTd29IHh1XfMSHrPHKP/CXfUZQQ3oj8Oh/5mDIjX1LXRdegNmmo67ab
	UT8gX8tg==;
Received: from ip6-localhost ([::1]:57718 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mMFEs-00DEDY-MK; Fri, 03 Sep 2021 19:52:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25506) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mMFEn-00DEDP-UI
 for samba-technical@lists.samba.org; Fri, 03 Sep 2021 19:52:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=eBOxTYkc0MH/u5U3FSdhZT+C16EbcV8sjDQM8vBC58A=; b=YjeyolRGQkL/8oi/ok8t9tEIcO
 D7SJhZjW+/4SXlYP7SR06XTu5pPIX2fL9Mhy36SixPAJMrY7rD0pEZvR7Q9EFn/m/pIGP/IYYjGMz
 TV3UOrZ3mYoJp72tvHaLjkq5+k9OGBqPqgq54zd9gkxGcVyQ+SA7rAxAIWJOqVpg447FwZN7PTaeD
 D8eu1Rc3VyVJz9QIOVfmByw0MsRD9g5AWvmdOsUY3wu1fWOLCtiv7CMaClw3no0qRqQXaqsC9yRam
 VDZk8slhkPgO/cCIhuIvq0B6jNqo6UIsegpP3nzQxmwPCE/4ahjIM/NXIod1zVqRcHxVAGUt8yEge
 yG4rWT2LTC5wkfTJTzSYkBKV0KDTJq4lEI2sQIej9C5WGMKx5qrzx/asi4a/QJ3rZthj2xOD08rK0
 s6BHv/FUB49yyNQn7iHtX/UzD6/kD3XoAn419JTAUFS0N+4vyt4/NiFETEQjaDMbJV0rQecm1AEkk
 FzZP/oajP5IZBIwHrJlbyrxd;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mMFEm-004Vm6-26; Fri, 03 Sep 2021 19:52:32 +0000
Message-ID: <007822c852b35cac5035eb2651380806b306d151.camel@samba.org>
Subject: Re: HEADS UP: The Joys of Logging, or subtle behaviour change of
 logging in the daemons in 4.15
To: Ralph Boehme <slow@samba.org>, samba-technical
 <samba-technical@lists.samba.org>
Date: Sat, 04 Sep 2021 07:52:25 +1200
In-Reply-To: <f4ce9085-24be-55fe-e71c-ac7c67b845e4@samba.org>
References: <f4ce9085-24be-55fe-e71c-ac7c67b845e4@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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
Cc: Jule Anger <ja@sernet.de>, Stefan Metzmacher <metze@samba.org>,
 Karolin Seeger <ks@sernet.de>,
 =?ISO-8859-1?Q?Bj=F6rn?= Jacke <bjacke@samba.org>,
 Volker Lendecke <vl@samba.org>, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2021-09-03 at 18:22 +0200, Ralph Boehme wrote:
> 1) isn't really problematic, but what shall we do with 2) ? Go for 
> stderr as implemented in the MR or rollback to logging to stdout as
> we 
> did in 4.14?
> 
> I'd vote for stderr, what do others think ?
> 
> Please note that the 4.15 release is handing in limbo until this
> issue 
> is resolved one way or another. :)

A major release is the time to get some consistency, we should log to
stderr, that's where errors should go (compared to stdout).

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


