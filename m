Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2495C2704C6
	for <lists+samba-technical@lfdr.de>; Fri, 18 Sep 2020 21:12:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=J9YGamQqkR4c8urbFkNwWoIoGLdllbjET1jEH95xl8k=; b=sBnFW9E5MzB101nGx5ZQyLu5SO
	GyK8T2phdmGHAkwWmGrINUlh/4mwxBA+l3yuTPj0gpYj9DeeCMHYmFclVw4Nf+aHrlHBTkFGrYUNi
	qW3pj972g2frx7DE111IXadROGGnd91zx2Yol4upa7yom7GxU0vTQ+0pA4KBQM9psiJa96sA3B08O
	mCArmlcC80PfGH9AS7nfnSHhfvWoJUeddDiVKDb2VGVWIru4f7QlvgotbSNh/cYkVN2NPLNyivCn4
	jQpc0uNgj1jdBPSuWmqjd2KE9t8X0iXqrn28PkqsBfFK+myvzXYRJ6Hl9O3uJUmh1LWGSHM5AaHh0
	hWTl4MLg==;
Received: from localhost ([::1]:53530 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kJLnD-006EmQ-LF; Fri, 18 Sep 2020 19:11:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55440) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kJLn7-006EmJ-US
 for samba-technical@lists.samba.org; Fri, 18 Sep 2020 19:11:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=J9YGamQqkR4c8urbFkNwWoIoGLdllbjET1jEH95xl8k=; b=AG6lmaIz0hQJ4tpIxQjefctij+
 XTAeMXw0icKRogybH2FJiVCCqQUOOTzb458HbvWoaCaJA+mCofWFNDCVpuAljgiV89YLoUNGGaU4c
 SkR3EPUysYDQUq/5qfmFvFXQlDV+VJ77o3y3+XCFWm6gd84FGu0pcEEMpaFC3ehcnt5J+y/57DhZt
 gkOgffKNOug+GeXTDm6nTHCESyRSjFtHIV3n/S3Kmm62QOKbrHKqH1UzI7v6tvLRfGOQxZgxnIYFD
 7XnYhBLPZ7iFoAW4bWIQd4fOb09TXUWLLp20/gXLhcRcKRqTl6Qu/Tge7Z42jcUIzO6iGy6Hv398j
 ty9Zobmpuo9SmpdER9jnLI8fH4nM73qz3Q0CAQuX7R8dm0ahUCotPHoqzmi0wkYw7n9Bej4qrWpkb
 Dr00u/yIxwtLq57DPSOHFsnMlLHaIWvG/6gS/JJ42pT6BNxfqoGteCDxDX/H6ckXNfnqxS8BHJiAV
 d1Xnh20TAHOWp5yEawYVm9Hp;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kJLn6-00060H-Ay; Fri, 18 Sep 2020 19:11:29 +0000
Message-ID: <7f90d24914510df23fe61fcf5ad5c3b8fb7831dd.camel@samba.org>
Subject: Thank-you! (was: Re: [Announce] Samba 4.12.7, 4.11.13 and 4.10.18
 Security Releases Available)
To: kseeger@samba.org, Upstream Samba Technical Mailing list
 <samba-technical@lists.samba.org>
Date: Sat, 19 Sep 2020 07:11:22 +1200
In-Reply-To: <20200918124014.GA3804@carrie2.fritz.box>
References: <20200918124014.GA3804@carrie2.fritz.box>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Fri, 2020-09-18 at 14:40 +0200, Karolin Seeger via samba-technical
wrote:
> Release Announcements
> ---------------------
> 
> These are security releases in order to address the following defect:
> 
> o CVE-2020-1472: Unauthenticated domain takeover via netlogon
> ("ZeroLogon").

I just want to say a big and public thank-you to all those who were
part of the effort to get this patched.  A global operation - follow
the sun in style - as each team did what they could and then handed
over the baton to those in Germany, New Zealand, the USA and I'm sure
other places too.

Thanks one and all, but in particular Karolin Seeger, Stefan
Metzmacher, Gary Lockyer, Douglas Bagnall, Günther Deschner, Jeremy
Allison as well as your families and employers who helped make this all
possible.

As this seems settled down for now I'm looking forward to a quiet
weekend and I hope you all can have the same too.

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




