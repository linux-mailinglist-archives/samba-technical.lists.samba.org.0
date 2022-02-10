Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D3B4B1958
	for <lists+samba-technical@lfdr.de>; Fri, 11 Feb 2022 00:21:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Qt3W6jTUE9EjQe8K7hb74GR0XYQMMJxXLqPlUGYjYcI=; b=ppRwp7IIz6kcJW650jMO7sKXIn
	vQSRLZyo2aUSd7/bAPosfn+7IXDHsiIClhs6ftsUKCigZJzxB64/+1gQyfULhzcwg8CwkTC3rKPMO
	qqrueCtPjWLc+lB3WCgxk0BDbFfKFTazeQqsxnIlPhrDrNEa7ln41xRLu7EfzbaVBO6f508GgjPHS
	ejebehJzfDusf5YZDSpaATGJbkN4yaLvQ16QFUWnsdpv6wBS0dhXdVVG8lIPNiPddB58EOxAI8Fs+
	WycrrWrGYXdXzQZ5pi9jSn9dXs0DjHZrK4J0R+3GteJ6HLeUqSNIG2Epv3XWPxkU3iNkLNmNKM+tz
	jyduKDFQ==;
Received: from ip6-localhost ([::1]:25488 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nIIjn-006S1C-A2; Thu, 10 Feb 2022 23:20:32 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:33849
 helo=gandalf.ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nIIjX-006S13-N1
 for samba-technical@lists.samba.org; Thu, 10 Feb 2022 23:20:21 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JvsX45Yctz4xRB;
 Fri, 11 Feb 2022 09:55:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meltin.net;
 s=202004; t=1644533701;
 bh=Qt3W6jTUE9EjQe8K7hb74GR0XYQMMJxXLqPlUGYjYcI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jK7E4wkjBTmrwJXkFx89322SsrPr8Jxe6hd4o4vXzbLMwKNU9BkEc7IDnHQv+4/DI
 +oABQYdIo9SUHExEWtRYuayLB2d2FMX9wZY78m6NpkFP0xjGM8d6NeaPy0eZKB1HSl
 sa/0At8rYvGYJQYjegIKqPkxRIhoyhuUuNlj2ezRFf2o0ZjT2Ki2VEwxdvo7PR7ux/
 9E4uv70FSEmcJTETzBweqTn+wjFBWbxPZNbhfcjXJ5pDrr4blhXpgli8MN14O2G0i7
 4Rb7HPW+LotYIv+IEVPIPWFnFFXc2WYW37cnYeOs/kwoSkYYCyfc0U1Hr++0cnSsSS
 dpy5efDXtsq/w==
Date: Fri, 11 Feb 2022 09:54:59 +1100
To: samba-technical@lists.samba.org
Subject: Re: Shell script indentation
Message-ID: <20220211095459.5693329d@martins.ozlabs.org>
In-Reply-To: <5431405.rdbgypaU67@krikkit>
References: <5431405.rdbgypaU67@krikkit>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Warn: EHLO/HELO not verified: Remote host 2404:9400:2221:ea00::3
 (mail.ozlabs.org) incorrectly presented itself as gandalf.ozlabs.org
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
Cc: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andreas,

On Thu, 10 Feb 2022 20:27:30 +0100, Andreas Schneider via
samba-technical <samba-technical@lists.samba.org> wrote:

> our shell scripts are a mess and we should try to fix this. So the first 
> questions is what do we want to use for indentation.
> 
> Most of the Samba scripts use 4 spaces.
> CTDB uses tabs (tabwidth: 8).
> 
> We need to settle on one. Should we first collect arguments or directly start 
> a vote?
> 
> 4 spaces or tabs (tw: 8)

A prominent statement near the top of README.Coding.md says:

* Use 8 Space Tabs to Indent

This is in the context of C coding style.  However, I'd suggest that
we attempt to be consistent for languages that have no official coding
style.

When Amitay and I started trying to ensure that CTDB's C code met
Samba's coding guidelines, we also changed the default for shell
scripts... to be consistent.  We have spent a lot of time moving
scripts from 4 spaces to tabs.

Although a small percentage of overall Samba code is shell scripts:

  sh:           65132 (1.72%)

a much more significant percentage of CTDB is shell scripts:

  sh:           28004 (21.72%)

Most of that is test code:

  sh:           23160 (51.79%)

[Above data generated using David A. Wheeler's 'SLOCCount'.]

More than 40% of the shell script in Samba is in CTDB... and, yes, 1/2
of our test code is shell scripts.

Rather than focusing on style, I suggest that we attempt to use
ShellCheck to improve shell scripts.  I realise this is much harder
because it requires functional code changes rather than just formatting
changes.

Currently about 1/3 of CTDB's non-test scripts and a much smaller
percentage of test scripts are checked using ShellCheck (with some
exclusions to avoid churn on some trivial and too-hard things).

A few years ago I added the -S option to ShellCheck to filter the
minimum "error" level (e.g. error, warning, info, style) with the hope
of using ShellCheck in Samba CI testing, starting by switching this on
at error level.

CTDB does quite amazingly on errors:

  $ find -name "*.sh" | xargs shellcheck -s sh -S error
  $ find -name "*.bash" | xargs shellcheck -S error
  $ shellcheck -s sh -S error config/functions 
  $ shellcheck -s sh -S error tools/onnode 
  $ 

Not quite so well on warnings, but fixing most of those should only be a
few hours of work.  I say "most" because the scripts use a lot of
include files, with functions that set globals, so there are a lot
of SC2154 (var is referenced but not assigned) because ShellCheck can't
follow the "non-constant includes".

Sadly, I don't have time to fix the other warnings right now...  :-(

So, I'll vote for tabs and ShellCheck filtering at error level.  :-D

peace & happiness,
martin

