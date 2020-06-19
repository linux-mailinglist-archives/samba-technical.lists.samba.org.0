Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCEB200024
	for <lists+samba-technical@lfdr.de>; Fri, 19 Jun 2020 04:20:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=Etc/h/g+TKQAMmrlOwoWidYj8qQJHVxGpIbfFEZHVO4=; b=i0f+0UcS6SBY+vp00uy/rW5MOl
	SINxJjTCNuTyYyAaNRCbkvVZtrpJEEp/RE9nRCfcTowWopzcr0fVreNKjHg1V60uCHzqDEHeryIJ3
	i8x3+HiitudpqA58QA3XOXbuWCzjncFU3Xu6UgNTAOgNYUj/A/c3fsYYssY7MRWqKqGjPpaJRp0Sg
	VNTca5lw9rCl9Vrz+Th5TEdt2/ENLhEPE36jhXBWne2LJ/FH7vk5fyfVw4kjqRFHwEr3MusMuVFe+
	iJG4nIZeDUvPajP9Y6Ca5DvdJzxhD7Mr1yMWNq++0K+Ns+0Yw5VMvtIg6ACmyVN3CSngtCnpSDZYR
	YqOj2u7w==;
Received: from localhost ([::1]:44036 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jm6dV-001KPv-3I; Fri, 19 Jun 2020 02:20:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22422) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jm6dA-001KPn-NX
 for samba-technical@lists.samba.org; Fri, 19 Jun 2020 02:20:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=Etc/h/g+TKQAMmrlOwoWidYj8qQJHVxGpIbfFEZHVO4=; b=jLSULmR2GHiuJk5a1q9/MX31/p
 q1MBMVp4MkFKNAxGS8w+q6+Ww8+D+2oiY25AKFgJ+oGpwCCylSq93nWar7OqOlZi3VJjIj/XqT1XK
 qRXg9gkGO3sfGXOEy89AVRKVk++w/t2AXXbJmFRcjJlyJRyJ6N5IdX1Rx0HxEJQaL8Bsu8A13akyX
 KRgegOok1E/bzVKy7Zwx6IWsImiEFxQhls1yjXZR6CNVNE7VkwV0sPpGQOe7qGlh1IMf9ijGMWjTL
 xbRDa3W6EjA+1AGmKDAuj52Lsw1FaHVtrkGYGWxgV2VOP0AnRjnZiwl2hHGpFcvMyahVZWh1fuUNQ
 JwlTYN5RBvNOG7PXN7MWs0GnE9OEGDdrdWwRjESGziqp8n7KfaxeRW+/xWVuDsSgVcY5kRrK6Vd9M
 /7eIVUwRjwSY3v28fcD7mVnIWUwVwFCrY9FkUKoBrzYEKpjaS0+R+0Ww95m2pAsSoPsrinSnwgIN8
 AYyFzBtmSbt2EZoRu05cANlK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jm6d9-0006sk-5y; Fri, 19 Jun 2020 02:19:47 +0000
Message-ID: <4fbaeb2cd3880cb2f9d66e1b49a0c9c2d62a79dc.camel@samba.org>
Subject: bisect-ability
To: Martin Schwenke <martin@meltin.net>
Date: Fri, 19 Jun 2020 14:19:43 +1200
In-Reply-To: <20200619111338.2e5deb21@martins.ozlabs.org>
References: <8b444948-cef4-74d8-a455-958446832aaa@suse.com>
 <20200526172611.GG18267@jeremy-acer>
 <9f00da33e7c31f8f6304af90280bdef8f917c7c3.camel@samba.org>
 <20200619111338.2e5deb21@martins.ozlabs.org>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2020-06-19 at 11:13 +1000, Martin Schwenke wrote:
> On Fri, 19 Jun 2020 10:19:41 +1200, Andrew Bartlett via samba-
> technical
> <samba-technical@lists.samba.org> wrote:
> 
> > We hope this describes many of the to-date unwritten rules of Samba
> > development.  We would encourage more of these to be written down.
> 
> This is very nice!

Thanks!

> Just a couple of things...
> 
> I wasn't aware of bisect-ability as a hard and fast rule.  I think
> this
> is an excellent goal.  However, sometimes, very rarely, you end up
> with
> a choice between 10 bizarre commits that maintain bisect-ability
> versus
> one really obvious one that breaks it for a single commit.  I wonder
> if
> we can allow occasional build breaks that are clearly documented in
> their commit messages.  

I'm happy with that.

> That might upset someone who's all-night
> bisection just fell over on my broken commit but when they look at
> the
> commit message they will know it was intended and will know how to
> restart their bisection.  

Our scripts even restart for that! :-)

> I just feel as though sometimes there might
> be a tension between clarity and bisect-ability.  Not sure...

I think all our rules should be +/- a degree of engineering pragmatism.

This is hard to encode in rules (because then it isn't judgement any
more) but is critical because otherwise we gridlock like you suggest.

So tweaks most welcome - what I find hardest is to describe that in a
way that won't just bamboozle the new contributor who just needs a
clear set of rules to make their first patch fly in.

Thanks so much for reading and commenting.  Nothing would be worse than
having a contribution HOWTO that Samba developers hadn't even read.

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




