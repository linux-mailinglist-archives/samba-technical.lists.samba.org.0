Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D86191156D5
	for <lists+samba-technical@lfdr.de>; Fri,  6 Dec 2019 18:57:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=6uZQ4kzlA/WGkWxMxbWNVZbubI4gSq9v+BIM3J6P4s0=; b=xCdX6m46wUYSkyQhbNinR0A43p
	XHtf653H33eKRYteoaVPreLSgXdSGhbJkbzYMQDWw+aEOD9PsBWSJhEkdUCuhtjMyA2z4CAAlEqW2
	wfDy2NG3pQRIUEofJMhFzRXtj9oxtfXRPkz01sHfZ+oanqA79BpT+9Wjn+CsEWs5XWS6uMO4V//FD
	tmUcndKQzeIcQBbreYVDxAiogOmeXJjDQkhTE+TLTUuOKU3RD6jvgu9wXenbsCvqunmfAvWjTBcLM
	cUloINU8uP71EWUuFO50A5EK7yRguFCTNGUB/vXaLflvi7RXoggxXHzMIbYBnOS+np7KQcMkfPh8S
	Ud3DszWQ==;
Received: from localhost ([::1]:34022 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1idHqJ-006RoE-51; Fri, 06 Dec 2019 17:56:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13284) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1idHqE-006Ro7-Ay
 for samba-technical@lists.samba.org; Fri, 06 Dec 2019 17:56:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=6uZQ4kzlA/WGkWxMxbWNVZbubI4gSq9v+BIM3J6P4s0=; b=dfx8hf1r3r4DbSinp8C0pLrTkg
 gXZLdNiBvKeAyp79ugqeJy/MUosWkLaRAFkG7RttI2W0oV+gL+yT0i4/Fpw2ZnVXM1rKL/Lw5hPWU
 Ini9GTVZ4whja1MZpC1cR5GHstIj5yqQouu3JoU5X+tJSW+2HxzDu2lPYRsI+Av6g4GkaOdvX0nN0
 Io1az+qbkR4NExI9VTl5P5SzIgKmhcls5oVHJ1iYzot4TwzUhrHEBH+zI2AgTm12AXS1W6JPffSwx
 E/H4p0R9OqXIn4V2L6cgGO2KmrpFh31q56O0RKL5Bltu8A3lLehlg6qk2Hh4SQM/kfW6xXIPufqZd
 oIABWcIOAGA65G2lOohhBWihipQmwZ3ewTwr/UHl6nAMlu0gBBJHc3yS4A+rLC+nI1/OzKX12mCF7
 tUU3yNFuf++Sj6pD+yTVHqjxi/2ziRv9yPJC24UfzJnZSD/wjEqnntY9aNBATgAw006t555N4pF6h
 9YObBKVB1WgIH4901DTwRJVw;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1idHqD-0002MN-7v; Fri, 06 Dec 2019 17:56:33 +0000
Message-ID: <6d3c85cc2b564ab88c0da480d31eb009a3851443.camel@samba.org>
Subject: Re: Do the tests not like documentation changes or ...
To: Richard Sharpe <realrichardsharpe@gmail.com>, samba-technical
 <samba-technical@lists.samba.org>
Date: Sat, 07 Dec 2019 06:56:28 +1300
In-Reply-To: <CACyXjPynemywXYPzdz5eB=gYJawxxU8M+XKCaZAt0CZc8WHnYQ@mail.gmail.com>
References: <CACyXjPynemywXYPzdz5eB=gYJawxxU8M+XKCaZAt0CZc8WHnYQ@mail.gmail.com>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2019-12-06 at 06:31 -0800, Richard Sharpe via samba-technical
wrote:
> Hi folks,
> 
> I created the following change to the documentation:

> 
> I did a build locally to ensure every thing looked OK.
> 
> I then created a PR (merge request) on GitLab, and it failed.
> (https://gitlab.com/samba-team/samba/merge_requests/975)
> 
> Did I do something wrong?

You just need to set a setting.

> Is there something else I should have done?

https://wiki.samba.org/index.php/Samba_CI_on_gitlab#1_hour_Timeout

I notice the GnuTLS project has a similar problem and has this
explicitly mentioned in the default MR template.  We might want to do
that too. 

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




