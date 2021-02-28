Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8E53274B1
	for <lists+samba-technical@lfdr.de>; Sun, 28 Feb 2021 22:56:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=aDivnPVoxlbR4XjNtwdnvVgyAY4f452CQsOGc2zSl0U=; b=bshvH5IKRWtW25EJT8FMXhQ00K
	SXerIqoT3OmbxwCYamil+wroehQrVAe8pUtPCjB7/5ozP298VRqZp9TeedLUkXj6HwkXHEreG5WuC
	fRwvXVHuugJ0uYsMbyJOYJtNjSeQTsWLQdoiMOnRvFKaLrMDe/G0JOVpRYu7siqOCMe4mndfZPscX
	O7vEsLC+enK6KHVIkbqvtFfj/nv/L5Gbkd0MAVjRf4vZf/0eMbfVqQzklL/ez2dVstBOzg8wSUFRy
	js3NWRZl/WAG80N1Juhs7ErjUzPG03j2s9Wjg9Lg3FdR+8zGVpUp2Ogx8bTjQ5KcntYLMmWrg46+h
	cNxvUD1g==;
Received: from ip6-localhost ([::1]:18168 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lGU2g-001nxS-Fw; Sun, 28 Feb 2021 21:55:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24268) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lGU2b-001nxL-Q5
 for samba-technical@lists.samba.org; Sun, 28 Feb 2021 21:55:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=aDivnPVoxlbR4XjNtwdnvVgyAY4f452CQsOGc2zSl0U=; b=2n8jesnopOa91gnT9ZO2SdyJ9x
 uQ7OvQbzR+tyNQu6vjCkKUSVRm2XDbs+94Wo6c59WUbMZE9JJx16uNcjDfPq9Z4Y2jB0WQM8Ad7D6
 pM/eVK+dEozZIr9paLecXnTedwGPl4ElBP7ddMKNXIuO/QuyK7u9mmXxvJwWAFZK7nank5op7Su9t
 FaPpF2bwM/MS0ECuLdtGHX8Jz+x3LFX3otTZP9YNCkTZ2/QlO/qKjT9FiJ0as8ngZOyCIkJkBCvUO
 F9dj0jct2+UD1qQ6knNci88gEmG4JvZvWgF6VvY7LYp5OhwU6xryYEFxm/iSjzwPXPghquLWHzxt5
 NWHADOeXOVvCJ2jvut6c1e2uyrBZRZMqX+ciEbq4oSOShaC0DKOIDzZ5NHR4EZIP/78sGwe2VUX4t
 UPbO5H4xQs3xnc7F1QtbsLXv1JcU/s5HFRM7r6pkX0Qpao+YoHX+Ov5M1rVCq7G5VxyMNyBD5LQYH
 f69BzLgXPjCPcYd+t1x9ZBPH;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lGU2Z-0002fw-TM; Sun, 28 Feb 2021 21:55:52 +0000
Message-ID: <33eb694cec3bfd3c47089a72d79497665a88b8b8.camel@samba.org>
Subject: Re: "make test" of samba master fails in a privileged Linux container
To: Thomas <tgeppert@digitx.de>, "samba-technical@lists.samba.org"
 <samba-technical@lists.samba.org>
Date: Mon, 01 Mar 2021 10:55:48 +1300
In-Reply-To: <AM9PR05MB7636914952B5F2FFB0567C54CF9C9@AM9PR05MB7636.eurprd05.prod.outlook.com>
References: <AM9PR05MB7636914952B5F2FFB0567C54CF9C9@AM9PR05MB7636.eurprd05.prod.outlook.com>
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

On Sat, 2021-02-27 at 15:18 +0000, Thomas via samba-technical wrote:
> I did clone the samba git repo within a privileged Debian 10 LXC.
> "configure" and "make" completed successful but "make test" fails
> with:
> 
> FAILED (183 failures, 0 errors and 2 unexpected successes in 63
> testsuites)
> 
> It is an unmodified build of samba master. What am I missing ?
> Is it not possible to successfully run "make test" in a privileged
> Linux container ?

I think you will find that 'make test' fails also on a full VM, but if
you like you can check if you want to spend the time and CPU cycles.

Untested code is broken code and these days 'make test' is only run in
chunks as part of our autobuild and GitLab CI process, so it is no
shock to learn that it fails as a whole.  

I'm pretty sure it has been like that for a while.

Patches to make 'make test' require a TESTS= parameter might be a good
idea, to set expectations correctly, users wanting to at least run over
the whole testsuite anyway could run with "TESTS=.".

Sorry,

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


