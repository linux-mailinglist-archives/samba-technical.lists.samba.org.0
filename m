Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C515960E230
	for <lists+samba-technical@lfdr.de>; Wed, 26 Oct 2022 15:33:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=oXzyS/k3q2CtEkMNcC7ci+JiABHeirCPHHmYVsX9Xy8=; b=kdgGXcx3QdYkIFiKaZ0t52vJzK
	mD+Muliz651DZQ14S6wotz486Pjn4G3slpsrfpcv9XAIuLL1d+M0htXQjZQD9XprpR2AdJUgirI9W
	9CYfRM1v12F1DBo19+P2hV9qLS2O1eBgZmXnS6kBq23pbH8m8l5DQrQ56HOgXRDlRN0Gkih3HrHbW
	T9Q0F21ZB8Eqh3ofd3bY5tLlrtWcEe02AQ8kmVq4CJIg1IlDMoSmCYgS9xqhSpyWlTT6mAuJnxJ24
	qeQlB924W6KuF70lkdwJVZn+NqyBJq8GxQSzBtoYSfpURC3YCZO6U3jt8lu8h0RPVgbPcMTYiDYu/
	gIDUwUbA==;
Received: from ip6-localhost ([::1]:48064 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ongVy-006Fap-Nl; Wed, 26 Oct 2022 13:32:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28646) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ongVt-006Fag-RH
 for samba-technical@lists.samba.org; Wed, 26 Oct 2022 13:32:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=oXzyS/k3q2CtEkMNcC7ci+JiABHeirCPHHmYVsX9Xy8=; b=DwKzQ5LGtnl1mPAcjpzJhWnbuM
 8XdulPO7OgWPAD9NxWq8iAXthVAdk5SMvLbBWLIeYRrr2X8M5qKcK6Mx8LxmG7fEqZ8d+oJrwXUgh
 /Yh/+QJKin7KJak09tLsCLVBwTWGg1v00L63I1WbcMH7wckc4Gzp0nk0u/hrsW6l2zVGpwoPckof2
 Gmg6bfhGC9nicfwHGMs9P3aqQlMgJKXMGvtJK9q4oN0AphIi/G7ocyBEBz0i5PkoMS6xJjig8TvPI
 nccIh428jP3D+cAPdy1j+0NtxRWdknzyuQYiDhbsqP9GWj2dT7Zvz97LM+DoKsCKcQ+lNVhlet4Yb
 84u1hB5Pm9b4DzI5Nxe2XTkBLzRpIVGr1dDpcyr4hr0/etUzJmaqZClT2HjZjJ2s+M//wCQO4qu8X
 7Jf+/v3U77Q065FSpEW26FzujxsBOMhtBsKXp9QygbI5yNanbnUGaszrI6XQH/txQuFrh2zlIMk1D
 +b9A17qf5UCJ/tROABUFMYOk;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ongVs-005tDl-RD; Wed, 26 Oct 2022 13:32:08 +0000
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Subject: Re: Could we move to GnuTLS 3.6.13 minimum and Ubuntu 22.04 as our
 primary testing distribution?
Date: Wed, 26 Oct 2022 15:32:07 +0200
Message-ID: <3206570.44csPzL39Z@magrathea>
In-Reply-To: <db0531ab8158841c10ddbc9d6b9ff031c88f8860.camel@samba.org>
References: <fb434777e5cf9c369de54b4c47b894c162ce91b6.camel@samba.org>
 <db0531ab8158841c10ddbc9d6b9ff031c88f8860.camel@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Monday, 24 October 2022 23:27:44 CEST Andrew Bartlett via samba-technical 
wrote:
> (Corrected subject, I realised we couldn't go GnuTLS 3.7 and don't need
> to so far)

I think you have to ask metze when he has the time to update sn-devel :-)

 
> On Tue, 2022-10-25 at 10:24 +1300, Andrew Bartlett via samba-technical
> 
> wrote:
> > It is a bit of work, but I think it would be very worthwhile to
> > upgrade
> > to Ubuntu 22.04 (replacing Ubuntu 18.04) and GnuTLS 3.6.13 as our
> > minimum requirements.
> > 
> > We would also need to update OpenSUSE Leap 15.3 to OpenSUSE Leap 15.4
> > as like Ubuntu 18.04 it doesn't have the package.
> > 
> > For CentOS 7, we are already pulling GnutTLS 3.6.16 from an appstream
> > repo it seems.
> > 
> > This would allow us to remove the last of the in-tree AES code,  as
> > well as automatically test the new PBKDF2 based password change code
> > in
> > SAMR.
> > 
> > This came up because this MR:
> > https://gitlab.com/samba-team/samba/-/merge_requests/2753
> > 
> > is not automatically tested as it is behind an #ifdef not triggered
> > on
> > Ubuntu 18.04
> > 
> > What do folks think?
> > 
> > Andrew Bartlett
> > --
> > Andrew Bartlett (he/him)
> > https://samba.org/~abartlet/
> > 
> > Samba Team Member (since 2001)
> > https://samba.org
> > 
> > Samba Team Lead, Catalyst IT
> > https://catalyst.net.nz/services/samba
> > 
> > 
> > Samba Development and Support, Catalyst IT - Expert Open Source
> > Solutions


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



