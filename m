Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 897891EC583
	for <lists+samba-technical@lfdr.de>; Wed,  3 Jun 2020 01:13:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=CsW0jPeTHAlZ7dvk+vwZEFwFKkIxlmftTAPAvSse8Tc=; b=UVCUP5fNdvINL0MEb923tO2tbw
	VjA4e3ty1hJHG/+6sVWm3jucCRbFCP9TKAKOteQrOfoYPN5hFJbwlhDOJTjzoq2rXObiMewBlPWmH
	al6p8IXHL9Tta+S9DLa+HstxKn2T5BaS8iowPMWqhKGYSX8ZqOm6FcGNGYy7ghWmH8BPyh8Frn2dX
	i0x5R4LULu7LgOVwAU5k7evZIsmIOR7zVkd6yCQi+JaoN1l6g/gK1EWPrNoEI8iIPeAhYdZYKkYQh
	vM9KG5ByvNKKLnA1xINajrVYwxxvWEfpuJ4du8xbu97IjB3IBgGwYKlG3IybCHYIfcYJ3fCAZj9lg
	9qR3YKQA==;
Received: from localhost ([::1]:39216 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jgG5l-008XYn-Gv; Tue, 02 Jun 2020 23:13:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63612) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jgG5f-008XYg-4z
 for samba-technical@lists.samba.org; Tue, 02 Jun 2020 23:13:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=CsW0jPeTHAlZ7dvk+vwZEFwFKkIxlmftTAPAvSse8Tc=; b=FP0/TLUc7jYDNGRVyNdO3YTEyk
 kWZvoFLEduAUEouscnSpuVrzHYud1ks90uN8VfoRJzXsdqtG46cQXPng7PFxpKPlj8hKOgynMFUAD
 B6SPOLuwWLwxnHYmUShAy4bUxPtMU/785EvlpJ7+o3mOfM9iJTo3Jaj3h/eGNmmFb31sWxqNlG2CW
 kPkpye0mkmiuqGX6OnB+IC+O6L+9QIR1SzhvSn7nto0tQkMBjr3vCtY0fWuW/lJB//3RF5gaQJYBN
 ATmlbYOnSe2ipph8nTVcb1lryjURIfmC62tpJzdocheNvsr/LrY9l38x9V65EX4MBV9POqbrrHt0E
 q+ku25GnR1FkZQZSg49SRTb35/s3PIiwLqWWO0abrux3xlY8BOIzE4rmgpJuudmd84Mhby0CDxwJY
 eJoDVlokVeIKhpmgQgJZPMEMmOBPmgdAIq8SrZSuDIAs6XKiKzDqoIcB437CpPo8utyaKxNrl7ouL
 TgAUtLeeI/h1ExTWwI9eR01l;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jgG5c-0004Rf-8o; Tue, 02 Jun 2020 23:13:00 +0000
Message-ID: <2d72acc4c3d842bfd37894d048f134b7ef67d5bb.camel@samba.org>
Subject: Re: Gitlab and Sign-Off trailers
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Date: Wed, 03 Jun 2020 11:12:54 +1200
In-Reply-To: <612d83f8d6a2bc0f725cc3a61d22f6b49eb4b01d.camel@samba.org>
References: <2494384.Zab67dHBYY@magrathea>
 <612d83f8d6a2bc0f725cc3a61d22f6b49eb4b01d.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
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

On Fri, 2020-05-08 at 23:46 +1200, Andrew Bartlett via samba-technical
wrote:
> On Tue, 2020-05-05 at 17:41 +0200, Andreas Schneider via samba-
> technical wrote:
> > Hi,
> > 
> > I've looked into different solutions for checking sign-off
> > trailers:
> > 
> > 
https://gitlab.com/libssh/libssh-mirror/-/merge_requests/104/commits
> > 
> > I've found one working solution so far.
> 
> Thanks for looking into this.

Again, thank-you.  It is annoying to chase up contributors for a
Signed-off-by long after they have lost interest, when we could
otherwise accept their patch.

> We should also use the merge request checklist feature (as seen on
> GnuTLS), in particular to make new contributors consider that they
> need
> to up the 1h timeout on their private forks.

I looked into this.  

That feature is on GitLab.com, but not in their Open Source community
edition.  If we are happy to use (as we frankly do by accident
regardless, like the approval thing) that feature, we could add such a
checklist.

> But while I don't want to block this, we really need to pair it with
> a
> single, really good "Contribute" page on the wiki, with a single set
> of
> clear top-to-bottom instructions on how to make a great merge
> request,
> including Signed-off-by, DCO, patch style (mostly the clean, no
> reverts) and pointers to our other stuff like coding style.

I said I didn't want to block this, but clearly this was needed, so we
now have a much better Contibute page in the wiki:

https://wiki.samba.org/index.php/Contribute

How can we progress this?

On the actual tool, my only thought is that currently some developers
don't sign their commits until they are finished, but still use the CI
extensively.  

We might want to clarify what Signed-off-by means for Samba, separating
the 'this patch is finished' from 'this patch is legit to submit or
base a better patch on' so those work in progress trees don't just
instantly fail CI (without manual pipeline runs).

(We could encourage a prefix of WIP/TODO for the legitimately my code
but not ready yet status).

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




