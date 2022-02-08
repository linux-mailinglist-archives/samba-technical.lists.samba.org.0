Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D926F4AE332
	for <lists+samba-technical@lfdr.de>; Tue,  8 Feb 2022 23:15:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=z6fSUZ2c0eNSLVqyS5rA3tqhZZ4AioZrNBboD670uSY=; b=xzj1xIclC668an314LnPyNdB4C
	+C2rSOjYtJrHO2fyIpH+E4ZBKcifXVwJlyfYSDUOplgRgg/e3xoimupgaAwmvRYs3TcZecWfW+P03
	6J+duJxOc7liTRpmPPy6xA3m3MOTL17XpPTpEjLF+nLSuz4RkzDfTd4w9Xm3nMDWD7SchFVhL1DjL
	eNQ7oKwWj/H1s8j7zpzUMRW+LVYNwqUuNtMS68KXXuwJxyNcFKEsJL4ks/PV5ddS6Vgd8JtDbjw4i
	Kmhz4TkHKzYuaQ6KFeyiIY5LmUTTT6f9LYxCfLceb8CIahXVRPtgGMC4EPto98Bs+YDjJabYUGkuV
	qfXa2Xng==;
Received: from ip6-localhost ([::1]:38706 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nHYkm-005mzp-R6; Tue, 08 Feb 2022 22:14:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48790) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nHYkd-005mzH-MT; Tue, 08 Feb 2022 22:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=z6fSUZ2c0eNSLVqyS5rA3tqhZZ4AioZrNBboD670uSY=; b=oZSgNqgs1cikTvCwigiuDrNwKO
 eihGzDY9sSQwqt2SRwVM8rwkSA10BZFpq6gpbMQRBGOkdG3orm93zkjh6FnjpeCsGK3VgAuEbqQXK
 Wbxc7o+4eN0bSTHWxvPtjzFUbe+H4/AxV7xd4LjDyI/rlswPUUEEhJahid1dBusUDx/fwqO/AbnFb
 PqJQSOwS+Q6FCWRDY1E8r7e1jLsdq6lmV/Bv/KuHK/xH6ciFAb415Tu3sYOITjW98MANJEmzVy3ZO
 mxd+k39I4Go83n5RS3zGP/qWTNuZci+v+L5kEzHFCWiEpakQaKQba+wbRpnT90fco6MmAC6l7kwAY
 v6UhqbMCI9uzoYPk6babYF7oeAzSD+ya/EWcEpV53qlCKsQaKM0cSu3o7L6luGQWhEPlaHIpPYB12
 5eqxmA07BuWdC42YutblJehPkE0SaEEuNa80Yp/wt5D5jPcQheZXO7PP9OQ4fWzp72v6rpMUDwjAJ
 3+uiWdqAaPcwH+2yM3jSz+8w;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nHYkW-002mUo-SR; Tue, 08 Feb 2022 22:14:13 +0000
Message-ID: <9366e519039acf37002ab5f99c9038d378550e4b.camel@samba.org>
Subject: Re: [Samba] Remove LanMan auth from the AD DC and possibly file
 server?
To: Jeremy Allison <jra@samba.org>
Date: Wed, 09 Feb 2022 11:14:03 +1300
In-Reply-To: <YgH8F7/VoCe0pUyv@jeremy-acer>
References: <53125588031f8ffad9e7c8a4b16a7f093781a39f.camel@samba.org>
 <28c3b502-7146-4403-b728-4815dafa9110@samba.org>
 <4406c0a37ed78d50bef9d10198fb6e565e633588.camel@samba.org>
 <YgH8F7/VoCe0pUyv@jeremy-acer>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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
Cc: samba@lists.samba.org,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2022-02-07 at 21:13 -0800, Jeremy Allison via samba-technical
wrote:
> On Tue, Feb 08, 2022 at 06:04:01PM +1300, Andrew Bartlett via samba
> wrote:
> > On Mon, 2022-02-07 at 18:38 +0100, Ralph Boehme via samba wrote:
> > > On 1/26/22 04:50, Andrew Bartlett via samba wrote:
> > > > What do folks think?
> > > 
> > > I would vote for removing it and if people still require it to
> > > work
> > > with
> > > old shit they can just continue using the latest Samba version
> > > that
> > > supports it.
> > 
> > Thanks!
> 
> Yes, to be honest I'm more leaning on supporting Ralph
> now than trying to split hairs :-).

Thanks!

> If people want LANMAN auth they can just keep running
> the last version that supports it. It's not like they're
> worried about security anyway :-) :-).

One other benefit is that I have often seen this turned on by folks
where things broke (particularly when we moved to NTLMv2 only by
default) and they just turned everything on, and then left it that way.

This change would therefore secure those sites.

Björn, after reading the discussion here is your position still that we
need to retain LanMan authentication for DOS, OS/2, Win3.11 and Win9X?

I would like to take a crack at the patch but it makes more sense to
know your position up-front to avoid misdirected effort.

Thanks,

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


