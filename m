Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CB97934D4
	for <lists+samba-technical@lfdr.de>; Wed,  6 Sep 2023 07:22:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=acnbWnnVIy3WC/eVppFBAcafRRHWKCaVwLqe4oq9Uv8=; b=V+QyG/gkVQPfgBa2RKuxcBAdBp
	Wrbxo0WeqZpyzqsVcXhV+hLfJY6+H/GnYBZ5IG40t+uxC6AMCj0p8RVo8NI9WjLiDcnMmytFqp929
	jhmwbIjenvJz3sRaCQuwDnalac5+cclDnsqTO/CkqO5qLfzA36OTo0RHKUflCpQE3Zya9gnYiy4Zs
	jzRF2Ezk6UvadRyIZIA/JXj5VvHGUgg3E6J0hYHQjHMrQhq+oerXXTgzSjik63gucSPhIr82p6w/u
	JYoeQK6DmPfGs5da+cGBa2OdhlhH/YwX371AtUHB8wPLAqW6O82nVodW894BbIRiG3JerdRmZ+0nk
	fgsyUlrA==;
Received: from ip6-localhost ([::1]:63708 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qdl03-0016Zl-S3; Wed, 06 Sep 2023 05:22:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44614) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qdkzx-0016Zc-FU
 for samba-technical@lists.samba.org; Wed, 06 Sep 2023 05:22:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=acnbWnnVIy3WC/eVppFBAcafRRHWKCaVwLqe4oq9Uv8=; b=blrvqkeLxAorrHYzJVDolStYFw
 YXq1iAdp43SC6KzvZ7/niwUQiGTHhxUheuZasflDRxLELnL11BfmmWENuo1CnCVLS6MNEV7KlfPWN
 79EFVXSu1PIYxNtSclhrT7pIAW2Lk1oilnWdtOfVJFKcyggAkW6gaT7dJUl7+bZ1tT617OgtLgEvg
 LDacgYlBHDf1WBLmqLkJPCw71YFYVPqIbkRwxQ0T8EFvprWYJYXmpB5oQft5NWKL8rXqQ+I3TCU6y
 36Gc2WfNn0aeYxMtkLU0g1zcmQSsBgnhsDtPCQR+7czad4AIkAmAltM3BzibiSoqvqsYXOCpBl9K0
 USipeorF3MMukzB8TKPOKDXxLocHIO20o8ek6wyjOiA+D1/I4RW671i+4neCqXI9Z0PTMwVSSWHPH
 slE9dys9OYG8a5+PqOKi2Iib+X9oddcO1bV+S+rQ7GzztC4WJpOem4yMfUCiNA4f3jtP454eSU0lL
 ozLzOo+WPI9Zl9ZgYPKQ0Ox3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qdkzu-00C0UR-2M; Wed, 06 Sep 2023 05:22:38 +0000
Message-ID: <c0720edb-84da-6493-1b39-00ae6e51d031@samba.org>
Date: Wed, 6 Sep 2023 07:22:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: GitLab runner update - fix samba-fips on Rackspace runners
Content-Language: en-US, de-DE
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <38e471b78bcb1e2584adb304bafa7090c18616b2.camel@samba.org>
 <6ba496d3-05b2-3fdc-fcc0-782e6b452db2@samba.org>
 <285a87bc5f7d2377d8aedbe296e21bfd82536f9a.camel@samba.org>
In-Reply-To: <285a87bc5f7d2377d8aedbe296e21bfd82536f9a.camel@samba.org>
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 06.09.23 um 07:18 schrieb Andrew Bartlett:
> On Wed, 2023-09-06 at 07:09 +0200, Stefan Metzmacher wrote:
>> Hi Andrew,
>>> The old kernels were  4.15.0-159-generic from Ubuntu 18.04
>>> The Kernel under our CI images is now 5.15.0-41-generic from
>>> Ubuntu22.04
>>
>> Can we use the hwe kernels there (linux-generic-hwe-22.04),it would
>> mean we would get 6.2.0-31-generic, and even morerecent ones once
>> ubuntu 23.10 get stable.
>> It would mean we could do io_uring tests with the latestzero copy
>> features available with kernels >= 6.1
> 
> To do that we would need to build a new CI image, eg with packer from a
> Ubuntu minimal image.  We can't at runtime change the kernel image as
> (of course) we need to reboot.
> A new minimal CI image would be a really good thing, because currently
> it spends way to long upgrading all the packages that we don't use, and
> installing docker before the CI can start.
> The ideal would be to build and upload that each time we rebuild the
> bastion host, and have that process automatically remember the image
> ID.
> But currently, no, we can't, sorry!

Ok, at least 5.15 has most of the io_uring features we need,
so it's much better than 5.4.

Also note the autobuilds use 6.2.0-31-generic.

metze

