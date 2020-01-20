Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 710511432B2
	for <lists+samba-technical@lfdr.de>; Mon, 20 Jan 2020 21:00:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=VLbdSuq0+HLlrDZ73fEgy+Emn+7ClDizD+2TVke+l1o=; b=4opY0k17lK9VSUI8sIm8eGh0GS
	dyK4hzhX6UrNA3COQas9Tkany8s9K4DX+4O1dSe/JhRjRK7ZopLwBJXKFu7Ie3X5WHAPFGKFzNTUv
	Rj9P1dt/ec+hcO7U9es8HnaW7bba18CtXEtFEvHG9wKbbCmUm3+v3Br+ekTYsq7gjLJbKdvs1RS1P
	trZnI8RWX9Hm3IUDSOJB7zq9D4TXIXNR6xHy8dGo2EYR2noF7jrLessubPfNLqgOLtmaHANNCc73H
	p8FPT7jrK6X3h7QZOYM9Ctw6a1yM8YqbghGP+HBoxGLM4Af+6TfFeu2Z7cnTGhAKkXah4QYOTdeJL
	ai3Uy5BQ==;
Received: from localhost ([::1]:29080 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1itdD8-003w6e-3M; Mon, 20 Jan 2020 19:59:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49632) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1itdD3-003w6X-Mf
 for samba-technical@lists.samba.org; Mon, 20 Jan 2020 19:59:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=VLbdSuq0+HLlrDZ73fEgy+Emn+7ClDizD+2TVke+l1o=; b=LkTZBrL94VXc+EiTmIGDKP1ltC
 SVHNKXl2PpqmRo8E8yJ3PVubXU5Lqzm6We0hun1xTTxSsEA1lnmJyMySNjXNdAvjgCw+eFZ4ADwxE
 /dTer8s+1uY5YbqTvT4LczCDmy4J/MEhYvB6bJ2+F8JzgPDUjG6FyUpS92GXeXv9+JPiBgOSEh+rT
 9ApPkepGaUN5a7GE20mO7AAp5OzmobCNsTp/UzXEg3AaYbPWLcKV18jB8iHzA/owtrhls7G+hP/OI
 MELWoT9AgRx47hpnYLPrra1qXaF8pkgVCmWA8zcLe5GYmeTOVKhgAdgQu/RAZYCM7h5lzaKpt1N47
 IIlrcJB5Z3Is+tPE/g/8uirWyHDsJnb/O/CebLmWM42iXcs6PFfW3vjKOMSdFH3Uz1TggWvcKJVyW
 Cj1/tsGHRg2dd5llQfN8Tas7v0cech9NkobWFT8EOoTuXQsBP29ZezIJI05cUPQWP7YrVO+W19aZl
 YJ5ciiUVlLD5RrXgYNQwDvAA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1itdD2-0002P4-Q1; Mon, 20 Jan 2020 19:59:41 +0000
Date: Mon, 20 Jan 2020 11:59:35 -0800
To: Richard Sharpe <realrichardsharpe@gmail.com>
Subject: Re: Weird Windows Server 2012 behavior with compound requests
Message-ID: <20200120195935.GA3372@jeremy-acer>
References: <CACyXjPy3DwDAX9gDZT6FuqWLGMg_yKFObcZcNBfeXX_JtfqyCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACyXjPy3DwDAX9gDZT6FuqWLGMg_yKFObcZcNBfeXX_JtfqyCA@mail.gmail.com>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, Jan 19, 2020 at 08:29:19PM -0800, Richard Sharpe via samba-technical wrote:
> Hi folks,
> 
> I am seeing what looks like weird behavior with Windows Server 2012.
> 
> I am sending it a long series of compound request with:
> 
> 1. CREATE <some-file> with OPEN for backup intent, READ CONTROL.
> 2. GET INFO for the SD.
> 3. CLOSE.
> 
> Early on the server give me lots of credits (around 35) but eventually
> it scales that back to just three credits per request.
> 
> I never send a request unless I have credits, I believe.
> 
> Every now and then the server fails all of the requests in the
> compound with ACCESS_DENIED (which seems wrong, because I would only
> expect the CREATE to get ACCESS_DENIED and the other two to get
> FILE_ALREADY_CLOSED or some such.)
> 
> If I restart the operation where it left off, everything runs to completion.
> 
> I must admit that I was doing reboot testing where I reboot the
> Windows server to ensure that the whole operation picked up where it
> left off. I have ~40,000 files in my test set, and if I don't do any
> reboots, it runs to completion.
> 
> However, if I throw a couple of reboots into the mix I see the above behavior.
> 
> Has anyone seen this sort of behavior. Is there anything I should look for?

Get a wireshark trace, maybe report it to Microsoft doc-help.

