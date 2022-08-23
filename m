Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2737759E6D4
	for <lists+samba-technical@lfdr.de>; Tue, 23 Aug 2022 18:18:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=dZWB/c4dvkv3o16v1g1/9WAB1iWBXC3+DQUdPOKs3Q4=; b=a3AiWuOyIveWPso9fAyheTIiI7
	6uxZR9nOCjB4dbWxXILv9+ZJYX1hZ0Pr+Quwfx++kzXB3Xy2rGW+qQ0vOjY/mIKTX55nXS7JmBHsu
	v2W8tYHzW8kkWZffVrSKjd5cTrJtB2OLq01Klw9A/IwD1m6cSK9tK7AfpXpvcUzDaskfdQYe0uBRT
	sFD0XlPcDc6npFg5q8ISYM8FBr00OEwh3oeTc359CzxucJZYKYfYiweMA3FSy6RJ+JK/UPHWZSfD6
	cVel1RZVqFKst3Si6w+Sti83JLciyAa1s9clq1IxkM7ktt8AVTtm29VoVHG92TuaEX5R+VdtyXWCS
	mKsrJboQ==;
Received: from ip6-localhost ([::1]:31844 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oQWae-0026ds-A8; Tue, 23 Aug 2022 16:17:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35246) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oQWaZ-0026dj-6x
 for samba-technical@lists.samba.org; Tue, 23 Aug 2022 16:17:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=dZWB/c4dvkv3o16v1g1/9WAB1iWBXC3+DQUdPOKs3Q4=; b=ELoGEksDaYhesMsZndlVbyzBEF
 UWuSO9cc2xhah7FyXosdMkSh4Yygz4Hmwt0F4n9wL7i3fS1VsE2ayDWWM3oYS7b1sEDZPLQ65wO6/
 Odhby30DUip2WC79Va+46FHYt+ZutA3oDEPtyJB45G9OkJqN94rS2krjUCPMpRQP7m3TAxiHMku1r
 9Ju/dKOhusZoBsMXs/Y7X2UCjnnjMy4IfQ3msclyNZsN6Ak2TqRbI+RVY8KPdiREJTm4yceFqIDGq
 AC12EXYVagI1i+lvDC1qMmQhNKjJO0yDZ9bPa2fkfMV48ApVGyh91v40om+jAM+XOTSy9rIZIsmS9
 TbljXKIM68J8nXrvoI9K2oki8/F2HG/mFjRh7uaW3yDh6HFJhak9J0WSfL2TufOAKbLrVsJJqwhoF
 /rJ104XT9k/ORQVXxyBdgilNH06CT2lZzhEQtDrELL9L14iF4t9PTg0w/ikioljoPtupn5KgkH6+5
 /pvKOPrfOeS/fZcygrQjapTX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oQWaY-001RCi-3V; Tue, 23 Aug 2022 16:17:14 +0000
Date: Tue, 23 Aug 2022 09:17:10 -0700
To: Martin Schwenke <martin@meltin.net>
Subject: Re: Samba and ShellCheck
Message-ID: <YwT9hms85GTQIg5k@samba.org>
References: <4766256.31r3eYUQgx@magrathea>
 <20220823180243.565f35e2@martins.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220823180243.565f35e2@martins.ozlabs.org>
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
Cc: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Aug 23, 2022 at 06:02:43PM +1000, Martin Schwenke via samba-technical wrote:
> Hi Andreas,
> 
> On Tue, 23 Aug 2022 07:50:24 +0200, Andreas Schneider via
> samba-technical <samba-technical@lists.samba.org> wrote:
> 
> > for Samba master we have ShellCheck with error level in place now. It will 
> > check that our scripts are error free!
> 
> Yay!
> 
> That probably isn't true for CTDB, but we are gradually improving things.
> 
> > The next step would be to move ShellCheck to warning level and this will be 
> > quite some work.
> 
> Yep!
> 
> > But first we need to discuss something.
> > 
> > If I run ShellCheck in warning level:
> > 
> > ./script/check-shell-scripts.sh $(pwd) warning
> > 
> > The warning I see most of the time is:
> > 
> > warning: In POSIX sh, 'local' is undefined. [SC3043]
> 
> This is why I never use local in /bin/sh scripts.  It has never made it
> into POSIX.  I suspect the reason is that different shells implemented
> different semantics.  For example:
> 
>   local foo=$(example --command)
> 
> I think local in bash eats the exit code of the subshell.  Other shells
> may implement it differently.
> 
> I use an "excellent" convention for local variables in /bin/sh scripts,
> specially designed to reduce readability.  ;-)  I prefix any local
> variable with '_'.  However, it makes no semantic difference, it just
> acts as a hint.
> 
> > Why do do we use POSIX shell (#/bin/sh) for the majority of our tests (we also 
> > have scripts with #!/bin/bash)?
> 
> For portability.  I would encourage anyone writing scripts that do not
> need bash features to use /bin/sh instead.
> 
> In CTDB we have switched our bash scripts (we definitely have some)
> to use
> 
>   #!/usr/bin/env bash
> 
> so they have a chance of working on platforms without /bin/bash.

Would it be worthwhile to capture the outcome of this discussion in
README.Coding and somewhere under
https://wiki.samba.org/index.php/Developer_Documentation ?

Christof

