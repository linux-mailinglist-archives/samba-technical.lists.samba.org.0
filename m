Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 245FC6E8C3
	for <lists+samba-technical@lfdr.de>; Fri, 19 Jul 2019 18:26:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Zk8GGR1LidNOZyQsecs+4xJUlIVdSrYsP/7qq52WOls=; b=6PVRYZ1iTlMI98MVYlBnAcuUJC
	zJ0B/UeX67cByki3Cw+uyG/Q4T+0qoWZg6I57Dl+PqLl1ZutHY4dr+qsCwoMKVdDPp+/c4UG7l6L5
	0YT8j1VPe46MCx1x1uOkioUt9CrqIUk08/Hl39oS1DDwXc+4VGAU5PAjZ8zgufG0P5t5nj9+6ehrS
	88iPgULsUjo17vXuTOU8kEjoYMLZH4/CuBkHVUfQ4YNqWFFZsa7sxPHz/nAfJKocODjMxI0vURQ42
	FV69vlGp/ASKEtXtvk/nsAa29bvEx/F7/vc7hAOlyzC40JBv7wAQ/EzV8ZMa99ExM8rkWSJy6klY1
	mZvUo4pw==;
Received: from localhost ([::1]:34106 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hoViC-001CWC-FM; Fri, 19 Jul 2019 16:26:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36110) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hoVi8-001CW5-8x
 for samba-technical@lists.samba.org; Fri, 19 Jul 2019 16:26:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=Zk8GGR1LidNOZyQsecs+4xJUlIVdSrYsP/7qq52WOls=; b=LFVUDvoV+zZL0ECQf2nJ81pJ1s
 WTsIltZqQudE+Dt/hTs1IDxqj/33dUGuxtvWXUieR9b80hhQxgnpeS2W3Cwg0ufLT4kyBnFdAco5p
 /UjfxHurJc5Kz1XBruH5KYSM/hg2TXAkPW1cJTWJsrqLND0d2ZBEjkqY9cODo2A+PtO4=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hoVi7-0004Pm-Hn; Fri, 19 Jul 2019 16:26:19 +0000
Date: Fri, 19 Jul 2019 09:26:07 -0700
To: Joachim Lindenberg <samba@lindenberg.one>
Subject: Re: [Samba] Turning off SMB1 make slashdot and theregister !
Message-ID: <20190719162607.GF28960@jeremy-acer>
References: <20190710225121.GA142072@jra4>
 <CAN05THQ65himSVSYpzypUwDeJoaV6FPAhQpV4NEeCT3fRaBxFg@mail.gmail.com>
 <20190719160254.GA28960@jeremy-acer>
 <001401d53e4d$d5563be0$8002b3a0$@lindenberg.one>
 <20190719162113.GD28960@jeremy-acer>
 <001601d53e4e$3af47c50$b0dd74f0$@lindenberg.one>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <001601d53e4e$3af47c50$b0dd74f0$@lindenberg.one>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Jul 19, 2019 at 06:22:59PM +0200, Joachim Lindenberg wrote:
> What about backports/security updates for older releases?

We can't change the defaults to releases that are already
out of the door :-).

It's already very easy to turn off SMB1 on older supported releases
- just a config change:

Set "server min protocol = SMB2" in the [global] section
of your smb.conf) so users can do this for themselves.

