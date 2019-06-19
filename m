Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AEE4B463
	for <lists+samba-technical@lfdr.de>; Wed, 19 Jun 2019 10:53:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=4UwMgYAIsLM6iHQmScJFdLAJ+AiZ7BTvgrznSWtDzmI=; b=rUrhV7KTRUetYz39kq7vGRxqg7
	XZ9K6jPxCc9RWD+A7Vfeu9Uqcca60acPc8Emi+uQmPgfNvayVi6LBBLk5KCKIuSczI2TTraWZdlua
	14HgcJ5qxj7o51cVfCAalvOvrGVsApDTJ3zGC7tBozpGTNjQ7leCBHGMS6ZrNxrJv2V6X44aCMXa/
	IjL2CZenZ8WCghbSNwfgU8wNsgBV8g3+ACPdIvQVy6GtmpCLCPZBihlElK7I71Np/2aD23fgm2UCR
	CZ0R5HYGks0px0wOyAdqADaJYE2zTWWjP7Q9vtjwmFwSzCHrL+hRszwSUCEPwkbUyThTOAHmlAO0K
	+yU8iC6Q==;
Received: from localhost ([::1]:45294 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hdWKZ-000KDy-TI; Wed, 19 Jun 2019 08:52:35 +0000
Received: from mx1.redhat.com ([209.132.183.28]:41964) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hdWKU-000KDr-Kq
 for samba-technical@lists.samba.org; Wed, 19 Jun 2019 08:52:33 +0000
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 86E07308302F;
 Wed, 19 Jun 2019 08:52:18 +0000 (UTC)
Received: from 10.4.128.1 (unknown [10.40.3.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DAD0360A9A;
 Wed, 19 Jun 2019 08:52:17 +0000 (UTC)
Date: Wed, 19 Jun 2019 10:52:15 +0200
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: [PATCH] wafsamba: Use native waf timer
Message-ID: <20190619085215.GB11427@10.4.128.1>
References: <20190612113125.GB8215@10.4.128.1>
 <788c2cbe86cdee5d70a2a5e1db34cb21bd86734f.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <788c2cbe86cdee5d70a2a5e1db34cb21bd86734f.camel@samba.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Wed, 19 Jun 2019 08:52:18 +0000 (UTC)
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
From: Lukas Slebodnik via samba-technical <samba-technical@lists.samba.org>
Reply-To: Lukas Slebodnik <lslebodn@fedoraproject.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On (12/06/19 22:55), Andrew Bartlett via samba-technical wrote:
>On Wed, 2019-06-12 at 13:31 +0200, Lukas Slebodnik via samba-technical
>wrote:
>> ehlo,
>> 
>> it is another blocker to build samba with python 3.8
>
>Can you (sorry) please file a bug (or re-use the existing one), add a
>BUG: tag, push to GitLab and create a merge request please?
>
>https://wiki.samba.org/index.php/Samba_CI_on_gitlab#Creating_a_merge_request
>
>This way we can see that it passes a build before we start review.
>

Andreas was very nice and took care of this bureaucracy

https://gitlab.com/samba-team/samba/merge_requests/546

LS

