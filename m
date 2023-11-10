Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 436F97E75CC
	for <lists+samba-technical@lfdr.de>; Fri, 10 Nov 2023 01:17:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=zNkQUji4culea/4xggKrLIr5ACgRrsTZ+C98R+rE2jw=; b=B0GBFP0QLmOzxbr7LflVQJe71M
	jd8eS+WmRBjF82AUwFdSCpQyeFldvSDCNOOVB0htbtU6Lexj/+GaMWrW1zneYD7CSz8rHX5RszLkP
	AZkX9UghQ43aNy/lM7OJA8X6oXYkTsroyRlpujnhUXIlotBkPPoI/y7GZzFNzesNSGM7t2dAjI1xb
	fCrlcRQitVeO0GAQJSNioo7V05Y4/pJQsKAOZmXPwDqkfaQY9nuuy4fD15jk6Z2MptXxg2xWI0shj
	fR0d1ft2tqnhiXPAatW2XV6qCgOrZeK9/lmzuuThNaBD8gh4YvqrmV5asfNL7Q3Sp4eZwtIlTyGAC
	LDOcJ5QQ==;
Received: from ip6-localhost ([::1]:49484 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r1FDR-007Scv-Rc; Fri, 10 Nov 2023 00:17:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30820) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r1FDL-007Scm-59
 for samba-technical@lists.samba.org; Fri, 10 Nov 2023 00:17:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=zNkQUji4culea/4xggKrLIr5ACgRrsTZ+C98R+rE2jw=; b=aLPisr/tlifObTTaBp1OiYiAXw
 Wo9wnXIk3js0kBkU2bm7R8l00Wvh/KIteFedRPPQ2Nxqzv+vFnW46nNo5kHSrwi41ANlBFwbl5nye
 YrqN7sirEZJjUaKMRxXL1Knztf5R5mtd0OonOorv8/DKYjO9laTATu6vSsRuhvBlcqA8qn8/qgSEo
 wn7+H4SWr/RQVCj0YPUJ1jMhHyOkLvUXNAC2IZw7LeDSshbF8GT1nxxa6n3H2in5Eal91aO8hJ9Xl
 2RoepWFtRIT0ncLLikRST760P+F/6pRLjGeoacH9Y0tmrjIMG5ISu5N+lHoh/9Mui1E8Qgby5HeA4
 Ir+J5kOMQfXdoTv4ipAsEmXa7a8H+/9MblF97hzmCxUNUEl5AvN+Hwc2MbQiaRsn0yYz35wSc79EZ
 FRWM2mWuyIm5hAkJar9Ny+5jegj8q08oPOqK46cNa2SXp6Zwo+mvMe7DmTYb1SY0li089eKaIEctB
 Gq9B+wteZLhImj/kBfTvkHXc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r1FDK-005O2i-0N; Fri, 10 Nov 2023 00:17:34 +0000
Date: Thu, 9 Nov 2023 17:17:30 -0700
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Can we move Samba to C99 and past
 -Werror=declaration-after-statement ?
Message-ID: <ZU12mjh8wUqPj5bk@samba.org>
References: <72d8df3ab0c58d2edf7660ad2af79935cb0a48a1.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72d8df3ab0c58d2edf7660ad2af79935cb0a48a1.camel@samba.org>
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Nov 10, 2023 at 10:58:04AM +1300, Andrew Bartlett via samba-technical wrote:
> Samba chooses to, for it's C style guide, to enforce -
> Werror=declaration-after-statement
> 
> I understand that some prefer the style.
> 
> However C has moved on as a language, and libraries we use (Python 3.12
> in this case) don't compile with it, and we are having to do quite some
> contortions in 
> https://gitlab.com/samba-team/samba/-/merge_requests/3373 to build on
> Fedora 39.
> 
> See also discussion at https://bugzilla.samba.org/show_bug.cgi?id=15513
> 
> Can we agree to just remove this requirement?  
> 
> It will allow us to keep variables closer to their use, which is
> helpful in a lot of ways, particularly in longer functions. 

That sounds reasonable, +1

Christof

