Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 144DE1FFFB0
	for <lists+samba-technical@lfdr.de>; Fri, 19 Jun 2020 03:33:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=hl5I2sruo3qlboY8fFSrzkUxx3FKZmVtiAxRbR5PsXw=; b=KERim34yH2C3n05A1jK0nJBSZJ
	cY0z9rItjG+DhyG63ywRsvfSfpCePR6734xUEvMjGVSTJVhpEMhUqVQpG5BYxRG0jMzodVMt2wYkk
	iwElhSItzUlUoC6XirUmk3VQI/042ua7CaifWhTgJ6sOmrW0T/1np6ZZLx9CMRWD1jD4TM8BDnPma
	3soJk24LHYx2fFOPFO82RskFXJmtTEBrQV01D9jcz4t+qm4/rDxRK3tnf7JunSTMgReDIaIG6N2kE
	aGfDhKn3E9Hfct32FtTfAWL+gijk0wsntk3aOScVrv90MKKs/R1Lm7Nqat9htCXePOuHHFeMkrHqX
	MaKmaANA==;
Received: from localhost ([::1]:41518 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jm5tU-001Jyt-3l; Fri, 19 Jun 2020 01:32:36 +0000
Received: from bilbo.ozlabs.org ([203.11.71.1]:52169 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jm5tN-001Jym-6N
 for samba-technical@lists.samba.org; Fri, 19 Jun 2020 01:32:32 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49p15w1pyGz9sRR;
 Fri, 19 Jun 2020 11:13:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=202004;
 t=1592529220; bh=4MdJQr+VpUIFCbju7j5GGuQ9LDpd+Y9LNUOo/9OU/X4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dS/tdKDU8K5qQ+RGUHE6MwDQ5JaaO0qOQKzPKKKWPEmQbPlP53o1azSFOLokvqO8+
 Z8KoCTDV7NlkIIP3rOwZApx/9lR9izhsEP3eUZTXNMsbdUuwAYmdtxLXiqIfufhUHe
 FJ0CBQKfWPOYxQtuPUO3ue28OG3VZ0lNG9MgnVf9squIx41D8U+w+Docv1pisMJ/dL
 4cg/i8+Kh9TnAaq32X/ir4WFJZBVjN+Zl/1KAG9VcJwCEbmZadMmOUpA7qYIQ38cwC
 rueSUsgD7AJeDuYHS2lnNYvpvIL9hs9d6ZiP0xdehLHsDiBI0fqXLflM4Kvh4F0C/e
 wPFJ9Mkmu8jcg==
Date: Fri, 19 Jun 2020 11:13:38 +1000
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: New Contribute page on the wiki
Message-ID: <20200619111338.2e5deb21@martins.ozlabs.org>
In-Reply-To: <9f00da33e7c31f8f6304af90280bdef8f917c7c3.camel@samba.org>
References: <8b444948-cef4-74d8-a455-958446832aaa@suse.com>
 <20200526172611.GG18267@jeremy-acer>
 <9f00da33e7c31f8f6304af90280bdef8f917c7c3.camel@samba.org>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 19 Jun 2020 10:19:41 +1200, Andrew Bartlett via samba-technical
<samba-technical@lists.samba.org> wrote:

> On Tue, 2020-05-26 at 10:26 -0700, Jeremy Allison via samba-technical
> wrote:
> > On Tue, May 26, 2020 at 08:13:09AM -0600, David Mulder via samba-
> > technical wrote:  
> > > We've started hashing out a new Contribute page for the samba wiki.
> > > You can view it here: 
> > > https://wiki.samba.org/index.php/Contribute_New
> > > 
> > > The old Contribute page doesn't match the current process, so it
> > > seemed
> > > writing a new page from scratch was in order.
> > > 
> > > I want to start a discussion here so we can hopefully improve the
> > > page.
> > > Please comment and also contribute to the Contribute page!  
> > 
> > David, this is really good ! Thanks a lot for this one.  
> 
> David and I have also been working on 
> https://wiki.samba.org/index.php/Creating_a_Samba_patch_series
> 
> We hope this describes many of the to-date unwritten rules of Samba
> development.  We would encourage more of these to be written down.

This is very nice!

Just a couple of things...

I wasn't aware of bisect-ability as a hard and fast rule.  I think this
is an excellent goal.  However, sometimes, very rarely, you end up with
a choice between 10 bizarre commits that maintain bisect-ability versus
one really obvious one that breaks it for a single commit.  I wonder if
we can allow occasional build breaks that are clearly documented in
their commit messages.  That might upset someone who's all-night
bisection just fell over on my broken commit but when they look at the
commit message they will know it was intended and will know how to
restart their bisection.  I just feel as though sometimes there might
be a tension between clarity and bisect-ability.  Not sure...

Also, although the page goes close, I feel it is missing the beauty of
this statement:

  Finally remember that Samba is Git patches as performance art.  Each
  is to be carefully prepared, polished and presented with love, as a hand-
  crafted gift to the future.  The beauty is in the stream of individual
  gems.  It often feels overkill, but here today we see why we have the
  emphasis, because it means that anybody - even someone outside CTDB
  expertise, can say 'sure, that makes sense', and review it. 

  https://lists.samba.org/archive/samba-technical/2018-July/129353.html

I feel that the author of this statement really captured something that
day and it would be a shame if it were lost to only the mailing list
archive...  ;-)

If not, then I think the next in-person SambaXP, or perhaps just team
members, should have a t-shirt that says "Samba is Git patches as
performance art".

peace & happiness,
martin

