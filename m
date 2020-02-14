Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1124F15F82E
	for <lists+samba-technical@lfdr.de>; Fri, 14 Feb 2020 21:51:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=4Ww2WDg6o+1pRoqQLaLauste+g7vWIGduG7CGDVwPp0=; b=lMqitAyfOavcUN93642ha8gpVM
	xrDKCJKdiRQbTWvbWNJAftcHuXw0eJJ1Hjh52kVL82Sr358xMdqkdlsuBd+GfVkEUol+d4bPFWtH0
	Lu/5CMvTdiuQv3orPgUrfsNrVFW4UpFo/ECwH8F8+lzoQE3azwv6oAnCWDw6eo+hT7xq65ZW/xxb4
	WghV9FP8LSF9ddnoNRMZ1SDOdO/Il1CNyQQBRw432bCoLoe+vwYadZk89K7HIYaNCwteyzBM7Zn4k
	vKiGMJEnlmU4/R/SX6d34KdOSxgt19qRZ70GhX5jeI/S6oPN/lkM66N/LZpPDbUMnRO67lEyicg7O
	uRev/hQQ==;
Received: from localhost ([::1]:48270 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j2hvN-009x8m-Mn; Fri, 14 Feb 2020 20:50:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24922) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j2hvI-009x8f-R0
 for samba-technical@lists.samba.org; Fri, 14 Feb 2020 20:50:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=4Ww2WDg6o+1pRoqQLaLauste+g7vWIGduG7CGDVwPp0=; b=0xlgvRxL7ycpaAmJmB7pshRKd5
 nH4BY+WGR5XngtUzfjhPSXl2HRB1AeFP+hHCQVc0XSrBt3uGJgW9/3mLoxzBp5Kj2b6r1hXLC2LJf
 OBv3fmDmNcVgTF3XDhzMPVRPXidOyQrA4vzc/S5HOLf1pruyr9N+tRDsbgK2BWM4a17RdGTvVyGcv
 8t9Jgw0+E8sZuDOkVrG+Jo/1Tp0GeH9uaP+E/8VD3qKiw8ZqcJMAxxe49E+VaGmne4n104dLmz7/4
 n+5wgxIj+eOnXdWPVUqlTUF2Cs+67K4rEovhgvtyLBet3yApitc6eLaKCwxEM/BqcEooWe0Gq9o/m
 2i4o0fp0ENSrsMeW93eYWccO/opNUkpKUvXQEHIWUzTmjXHUbzVSq5HrPWJsUa/xz5W3FHsWJcLNk
 5+77E24F+ZjXq3rv2c4MPB2ItmyZdM35E1qYIhHvxRlcckjWwdTYMNUPCuhWaTnpcdUAOYIP3nzih
 RQSjunyDcBSGIyQa5mLnB+32;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j2hvH-00042Y-Q8; Fri, 14 Feb 2020 20:50:52 +0000
Date: Fri, 14 Feb 2020 12:50:49 -0800
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: GitLab CI back
Message-ID: <20200214205049.GA51881@jra4>
References: <1f5483b6c7349f261b79990f3daea501d7636ffe.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f5483b6c7349f261b79990f3daea501d7636ffe.camel@samba.org>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Feb 14, 2020 at 06:01:16PM +1300, Andrew Bartlett via samba-technical wrote:
> G'Day,
> 
> A big thank you to everyone for their patience, the GitLab CI private
> runners are back now.
> 
> There are still things I would like to do:
>  - ensure the alternate configuration for really old Samba versions
> still works (I think that image ID also changed)
>  - decouple the system from the catalyst_samba key and use an ephemeral
> key instead
>  - provide a top-to-bottom script that pulls a docker image, installs
> the required software and runs ansible that only needs the credentials
> as input
> 
> But for now, it is back, and the bastian host is now running a 2020 set
> of updates, which is a good thing regardless. 
> 
> Let me know if you have any further problems, otherwise please just
> restart the failed jobs.

Thanks a lot for your work Andrew. However I'm still having
problems getting jobs going through.

I re-submitted:

https://gitlab.com/samba-team/devel/samba/-/merge_requests/new?merge_request%5Bsource_branch%5D=jra-add-VFS-READ-DFS-PATHAT-1

and keep getting (for example):

https://gitlab.com/samba-team/devel/samba/-/jobs/438181318

Failed to start up environment 'ad_member' at /tmp/samba-testbase/b21/samba-admem/selftest/target/Samba.pm line 125.
7206 samba can't start up known environment 'ad_member' at /tmp/samba-testbase/b21/samba-admem/selftest/selftest.pl line 840.
7207 ==> /builds/samba-team/devel/samba/samba-admem.stdout <==
7208 [1(0)/138 at 0s] samba.tests.pam_winbind(local+krb5)(ad_member)
7209 ERROR: Testsuite[samba.tests.pam_winbind(local+krb5)(ad_member)]
7210 REASON: unable to set up environment ad_member - exiting

The code changes I'm making (DFS/VFS stuff) aren't anything
to do with this.

Any ideas on what might be going wrong ?

Jeremy.

