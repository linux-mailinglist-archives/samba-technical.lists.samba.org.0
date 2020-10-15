Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2679728F81C
	for <lists+samba-technical@lfdr.de>; Thu, 15 Oct 2020 20:05:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=6imJch24h6pVRkrU/TMIIzA9Zs1JpYFzc0ErkxlH0VE=; b=1EmFBMIhdrKEQYsFn7E599nBoa
	133zjx8Ri6Elw5MEqReZ0/aPSqg4ERMDs+FnxSTNLKl3Z9AgmPBzDp5ihJuLhJAl8XxI8+JVOC9TB
	lb/ldb581dS29dbrB572vuUP8n85eQ6zQtvHG9y8UfZGxm743HITwQjd/t5COlC6JhQtmWzJgZVkU
	TL01VcT8vTNf54B1XASpfdoar+3xFBRBu4gpWaQK6TdU4h2j+tI3Qn/jSMHBukudZmse0LLYNR/j8
	mln6OS7KTbcm3+YDK5SoQheNZqMnJmYSYOVEUR4b33q/pX/pZLlTePq8iIgm7zJA6K294O9x7Tb7U
	iV8cWwEA==;
Received: from ip6-localhost ([::1]:53670 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kT7cw-00CIHO-2z; Thu, 15 Oct 2020 18:05:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24914) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT7co-00CIHH-5n
 for samba-technical@lists.samba.org; Thu, 15 Oct 2020 18:05:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=6imJch24h6pVRkrU/TMIIzA9Zs1JpYFzc0ErkxlH0VE=; b=NYJ+H0FyPhsCgMLxMLc5yM0rNq
 Px/StotkLpL4T/dn9AJAowXrWIuPEr0XSCccRE9cNxUgktWkNQBYqBjbMrmCCuIQLLhBvti6ERIXW
 6axtU78iceB6UCs/xV3dGR/K44Za07m9CTSm7IHU+zgm2is5WsOo9kfZtN97fYmsdiaoFWCpVus7S
 AxcOQ6yqCHSa8u9tBrLI6lR4Jmv02HZsQKIMANopI3b+P8/sDIL/8CuJz9uHdvvjpc0t8HIhmGe6H
 U7WWcHyAwVwq0bj0bDtu3pnDtIwGmFgIjRqE78+5/MHbiD/IvTAU6aD5BYLHheYUl1w8r+6UJS9s6
 +fyCkDfGSMHtb11Re2/DCloOpWkwW1nhZead7RPnRCsqX7qyxDuvW/EuoQt+ipBNkPCqYkJKBMbe5
 F0lcAnnsJRRnlnD1/QlCOG58llXqTt/jnl58SYFihlbmnjE9466uoI94gclFELu5A4tYxMPE3VRwJ
 DkpuejxTLUZcgszvE+M0Xw8a;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT7cm-0002Le-KX; Thu, 15 Oct 2020 18:05:13 +0000
Date: Thu, 15 Oct 2020 11:05:10 -0700
To: "Bradley M. Kuhn" <bkuhn@sfconservancy.org>
Subject: Re: [PATCH] Documentation: Rename Samba's DCO to Samba Contributor
 Representation
Message-ID: <20201015180510.GE3769001@jeremy-acer>
References: <87mu0nidll.fsf@ebb.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mu0nidll.fsf@ebb.org>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Oct 15, 2020 at 10:49:26AM -0700, Bradley M. Kuhn via samba-technical wrote:
> Samba Developers,
> 
> As you know, it's rare that Conservancy offers specific patches upstream to
> our projects, but I've submitted a merge request here:
>         https://gitlab.com/samba-team/samba/-/merge_requests/1609
> and I've also attached the patch here.
> 
> As many of you may know, Jeremy Allison originally requested that the
> Samba's Contributor Representation be named DCO as a tribute to Linux and
> its DCO.
> 
> But, for a variety of reasons, I (with this patch) recommend to change the
> name.  Also included is some cleanup work regarding the copyright and
> license on the DCO text itself.

Sorry Bradley,

I guess I screwed up in calling our Samba contributor
agreement a "DCO" as that's what Linux uses, but ours
is different from theirs.

In my defense I just thought that's what such things
were supposed to be called.

Plus I didn't notice the original text was copyrighted
and under a CC-By-SA license, so we should certainly
fix that.

Sorry :-(.

RB+ from me.

Jeremy.

> From 2f011583294626e9919db7d8ddc7961a2f177f4a Mon Sep 17 00:00:00 2001
> From: "Bradley M. Kuhn" <bkuhn@sfconservancy.org>
> Date: Thu, 15 Oct 2020 07:52:21 -0700
> Subject: [PATCH] Rename Samba's DCO to Samba Contributor Representation
> 
> In an effort to reduce perceived confusion about the quite necessary
> differences between the Samba DCO and the Linux DCO, and as a favor
> to the Linux community, rename the Samba DCO to the Samba Contributor
> Representation.
> 
> Additionally, note that the text is copyrighted and add notice for
> compliance with the text's license, CC-By-SA.
> 
> Signed-off-by: Bradley M. Kuhn <bkuhn@sfconservancy.org>
> ---
>  README.contributing | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/README.contributing b/README.contributing
> index 2a44e37f9e8..c4a0c7f4bc9 100644
> --- a/README.contributing
> +++ b/README.contributing
> @@ -48,7 +48,7 @@ your employer, simply email a copy of the following text
>  from your corporate email address to contributing@samba.org
>  
>  ------------------------------------------------------------
> -Samba Developer's Certificate of Origin. Version 1.0
> +Samba Contributor Representation, Version 1.0
>  
>  By making a contribution to this project, I certify that:
>  
> @@ -95,7 +95,7 @@ above, add a line that states:
>  Signed-off-by: Random J Developer <random@developer.example.org>
>  
>  using your real name and the email address you sent the original email
> -you used to send the Samba Developer's Certificate of Origin to us
> +you used to send the Samba Contributor Representation to us
>  (sorry, no pseudonyms or anonymous contributions.)
>  
>  That's it ! Such code can then quite happily contain changes that have
> @@ -113,3 +113,12 @@ Have fun and happy Samba hacking !
>  
>  The Samba Team.
>  
> +
> +The "Samba Contributor Representation, Version 1.0" is:
> +  (C) 2013 Software Freedom Conservancy, Inc.
> +  (C) 2005 Open Source Development Labs, Inc.
> +
> +licensed under Creative Commons Attribution-ShareAlike 4.0 License as found
> +at https://creativecommons.org/licenses/by-sa/4.0/legalcode and based on
> +"Developer's Certificate of Origin 1.1" as found at
> +http://web.archive.org/web/20070306195036/http://osdlab.org/newsroom/press_releases/2004/2004_05_24_dco.html
> -- 
> 2.26.1
> 

> 
> -- 
> Bradley M. Kuhn - he/him
> Policy Fellow & Hacker-in-Residence at Software Freedom Conservancy
> ========================================================================
> Become a Conservancy Supporter today: https://sfconservancy.org/supporter


