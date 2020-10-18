Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7583C291FE0
	for <lists+samba-technical@lfdr.de>; Sun, 18 Oct 2020 22:40:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=lLusyL0Rqsb0Moh9tRoetpRfCzolrH2wQFiDbsqetjQ=; b=X0YEgllY561G5vqQmNQNl8tn3b
	TyKPpQXJgkWEO+Pw9OaKfkv2p0G5QnNfAkPBYOlS/AA/4u00MOvy45jFJNYHWw8eFu2FCWs+/270f
	2D4LJf8dFibLCK8HysMFBEjiP4yh1367wXo7/Om4yvs0CqWmExH26fAuKs06JpSrLhNnQVyioo+RD
	bBP0HYBHqBuYSWmJHlyK8hL3F9BtuKlOaSchWKVwP+aIQKzUZhYpXzjAu7bWBRKKKX3ANc/SbpVzX
	7M+kuH3fDYfl4NmPhNkp2AEdMs1SvkKqOu9f1f7FFy/m/lEAOiGAB3LULGzmf1u4wRBgNSTnipHWr
	N5TJ41Xw==;
Received: from ip6-localhost ([::1]:52324 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUFSA-00Cbf7-3v; Sun, 18 Oct 2020 20:38:54 +0000
Received: from bedivere.hansenpartnership.com ([96.44.175.130]:35932) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUFS3-00Cbf0-Nr
 for samba-technical@lists.samba.org; Sun, 18 Oct 2020 20:38:52 +0000
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id 0BEF41280DE8;
 Sun, 18 Oct 2020 13:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1603053510;
 bh=0Cx0b5OzhMJt1ZbCqpYY4qw69qSXvot1y70gFOx1Wyc=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=XDN2IOEpyBYlH1oFeghfwUOfUKorSZqwLut/HLqTiVn1RIJT8YreJLj5H38TSlJsx
 ZTdH+dWaRTghrR0f6jwI5iPfIGq8EGS8UmYHrYJHUSaWDxhhiZU+2AQ3YtkB5SAOY9
 O1muYBwTkS++LqVYr+4jNq0tae8vRRzRb/3fk99Q=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id Lfn6ubCoyCXM; Sun, 18 Oct 2020 13:38:29 -0700 (PDT)
Received: from jarvis.int.hansenpartnership.com (unknown
 [IPv6:2601:600:8280:66d1::c447])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id A9CBE1280DDE;
 Sun, 18 Oct 2020 13:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1603053509;
 bh=0Cx0b5OzhMJt1ZbCqpYY4qw69qSXvot1y70gFOx1Wyc=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=QQNpNyySUbuMmPd4WzznU80hAuQK1mDD05N+iwtL5A00+ajbDaKlWmXAZW67jVMUL
 mzRwzjtuqzNN6F+r3/TmWX4pNzn47xBEoDQ1SzIolqvQ6GCUkBt+uNj+8XwGLkWtqy
 jO1lXZHeiNvhi+hh0K6zHC95yE7WBg+4M+lWJbv0=
Message-ID: <5e8a6736aafa2e4a593af2ee79451cc62a283818.camel@HansenPartnership.com>
Subject: Re: Clarification around the DCO
To: "Bradley M. Kuhn" <bkuhn@sfconservancy.org>, 
 samba-technical@lists.samba.org
Date: Sun, 18 Oct 2020 13:38:28 -0700
In-Reply-To: <20201017023840.GA344206@ebb.org>
References: <a4f34abf8b943b01e0f982e21fe1518009fcc556.camel@HansenPartnership.com>
 <20201017004357.GA360279@jeremy-acer> <20201017005611.GB360279@jeremy-acer>
 <20201017023840.GA344206@ebb.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
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
From: James Bottomley via samba-technical <samba-technical@lists.samba.org>
Reply-To: James Bottomley <James.Bottomley@HansenPartnership.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2020-10-16 at 19:38 -0700, Bradley M. Kuhn via samba-technical
wrote:
> Jeremy Allison via samba-technical wrote:
> > Ah, I've just remembered *why* we have a difference from your
> > "standard" DCO text.
> 
> Yes, a tremendous amount of time and effort went into figuring out
> the right policy for Samba with regard to contributor
> licensing.  Some of those details were reported publicly, and some
> were reported privately to the key folks in Samba.  I myself put in
> many hours of work on this, as did many other Conservancy staff,
> lawyers and Samba volunteers.  Nothing has changed with regard to the
> analysis.  We also had a private discussion at a developers' meeting
> at a Samba XP about the reasoning, IIRC.

In legal terms you usually really, really don't want to be special
because it causes all sorts of complications if there's any litigation.
This reasoning lies at the heart of our desire to move the DCO beyond
the kernel, because if we keep it to the kernel it becomes our legal
specialness problem in the same way.

> Obviously, if Samba wants to redo that analysis at this time, we'll
> do what needs to be done to help Samba as a member project.  But I
> don't see any reason given here to redo that work.

In 2013 there was only one other of these LGPL/GPL migrating
permissions under DCO solutions, but even then I don't think your
analysis found it?  Now with the expansion of the DCO system there are
several, all still using unmodified DCOs and seven years later also
with a reasonable history of operation.  Since none of this was
included in the original analysis, isn't it worth considering now?

> I already made a merge request days ago about changing the name and
> there is a thread discussing that (but consensus hasn't been
> reached).  The name really doesn't matter, but the content of the
> terms certainly do.  What works for Linux as a project doesn't work
> for everyone.  One size doesn't fit all.

In some ways the DCO is still an experiment that we're gathering data
on, but the data do seem to say that apart from Samba it does actually
work for everyone else.

> James has every right to his stated agenda of getting the whole world
> to use the unmodified DCO, but the statement that Samba is "outside
> the fold" for failing to use the specific terms is just rhetoric.

It's more a statement of the current facts.  However the logic
underlying it is that by doing something different Samba places itself
in some legal uncertainty and having a counter example to the standard
DCO adds a scintilla of legal uncertainty to the rest of the DCO
ecosystem.  Samba not calling it a DCO removes our side of the
uncertainty.  Samba adopting the DCO, if the community chooses to do so
, would remove all uncertainty.

> Samba doesn't use Linux's license (GPLv2-only) either, and is
> unlikely to want to switch to GPLv2-only.

That's a bit of a red herring: the DCO was deliberately made licence
agnostic.  It's currently used unmodified in projects using LGPLv2
GPLv2 only, v2+, v3, Apache and a whole host of other licences.

> But changing your contributor licensing terms is as big a change as
> changing the license of the project itself.  It's not usually
> considered particularly friendly for folks outside a project to come
> by and ask for the project to change its license details.

I can assure you there's no sinister motive.  It's purely what I said
above: reduction of legal uncertainty for everyone.

> Finally, changing the *name* of your developer representation
> statement and its *contents* are very different discussions and
> should not be conflated.  The former is an easy change and purely
> cosmetic.  The latter is hard and will change policy and legal
> outcomes for Samba.  IANAL and I'd want Samba to get confidential
> legal advice from a lawyer that represents Samba's interest (as
> it received back in 2013) before making the latter change.

Our expectation is that Samba can update the licence in some files (so
there would be some file patching to be done) and slide in a standard
DCO without any change in effect on the current or prior project
contributions, but obviously everyone needs to be comfortable that this
is the net effect.

> I suggest the community first consider the name change and execute
> it, and then only after that's done consider whether the contents
> need to change.

As I said to Jeremy, mature consideration is definitely required and
we're not trying to rush anybody into this.

James



