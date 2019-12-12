Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 009E911DA0D
	for <lists+samba-technical@lfdr.de>; Fri, 13 Dec 2019 00:33:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=oBlCCih8itINZ+hI4vGOK4dVVUzxfOS2WabUEOw/Fa4=; b=3lfn9sXKjDed1Qwmf/uafN65kD
	c1ouBk1tOl5ESwUvRfxGu4JQGZ0inqWbaGSzNhzUmHz7CxcfW+22wWu6WtntVrLkhgyYhvkrpTIhj
	KQ70wlVCOtoFZg/lRVpgatTZrVpx0ut6tDStV5g1rUFbBOEUhgRCGooQFjmcb28+WBavCu8vm42It
	jppG8JiVPTXdOpf3ywJJWVt+gyru/K8n+NU5FMfb7/6UT6sYSgc3VwFFJ0y/tSzGeDaMzdT3x+lPm
	g5QkpCkCPllqqYm13mdxmrA+YvkWVaDfeNbWEZOOQ796bhJ0rjv+zSrvfq7AFN0IRwtSXrz0hkCGN
	i/gLP29g==;
Received: from localhost ([::1]:28682 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ifXx5-0075UB-3X; Thu, 12 Dec 2019 23:32:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18280) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ifXwz-0075U4-Vk
 for samba-technical@lists.samba.org; Thu, 12 Dec 2019 23:32:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=oBlCCih8itINZ+hI4vGOK4dVVUzxfOS2WabUEOw/Fa4=; b=MRuISrzcM9m5QpnHRQtIo9xsWx
 vmlfsscw+DZgnZQVCNfmUYf8a1Ir3dnCgPuMZWdAIkH9dIb0eIWmHLJZMEHxMMmx+PofEmJyWEncL
 DZxF0s/uxoO/B3u2LcJx8HQy61sV9utAqfvZ5YQn4yeFNG4oJVNWdItl9DWFjvzVwuTbkY+dfk7fi
 R+KQ0SE5aRozfuXRRej8QpY0aaevCjKlC/xsCDhZYEt9y3pngZjFqurm2yy9cBXfam/oxZvuHVfVE
 w0f3jIiP1OnqU+6k/Vbkkz317VabX1vrlpGBE1RVi0uN+s6zENz7jWodNprMQu0S5tc8dKwHM8LOv
 tKwiFgHmHrkgh8a/A8hAz7ozmYe1ZGGnVPsue5ajXgD5a5VR8JUCLgJGOU4miExkAGWSKZr/xTDLc
 HhjnMAhuDFdluAT3eA0MMxnBp3iqrczL3cTxQqZ5ITY2xF8gzq+7YzO0rFnqiW8s1n+lu39HI1wZ6
 HSDZk7ezXvB9yU5YQxXqEesr;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1ifXwy-0004t0-Fv; Thu, 12 Dec 2019 23:32:53 +0000
Message-ID: <7b03dac06c57cb6c0954861964c9d98a014888ac.camel@samba.org>
Subject: Re: Parse::Yapp::Driver on platforms other than Linux
To: Jeremy Allison <jra@samba.org>, "Christopher O Cowan -
 Christopher.O.Cowan@ibm.com" <Christopher.O.Cowan@ibm.com>
Date: Fri, 13 Dec 2019 12:32:48 +1300
In-Reply-To: <20191212214432.GC228793@jra4>
References: <9ff45788c1634239b78dea68d22e4fad@ibm.com>
 <20191212214432.GC228793@jra4>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2019-12-12 at 13:44 -0800, Jeremy Allison via samba-technical
wrote:
> On Thu, Dec 12, 2019 at 06:43:24PM +0000, Christopher O Cowan -
> Christopher.O.Cowan--- via samba-technical wrote:
> > 
> > Easy enough to fix with a cpan install.   On AIX this is not a
> > default with the freeware perl offering.  I do have to wonder
> > whether this module is in the base packages of other Linux
> > distros?   I use RHEL at work, but I'm not going to check other
> > distros, obviously.
> 
> On ubuntu it's in libparse-yapp-perl. I had
> to scramble to find it also after this commit :-).

We know it can be found on major Linux distributions because we test
with the big 4 during every CI run.  That is were we generate these
package lists from:

https://wiki.samba.org/index.php/Package_Dependencies_Required_to_Build_Samba#Verified_Package_Dependencies

Andrew Bartlett

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba






