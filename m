Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8634D290C4F
	for <lists+samba-technical@lfdr.de>; Fri, 16 Oct 2020 21:32:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=HMTU5CAueOrV5TQmZfHv3qgyLgcHY+uR5rm7cESJdSE=; b=MI0tTdOIiA7RfhJvzVCfkm4U9D
	cHTr255m2bEWRIzhV/dNtqZFFkxU9OvuV1CDsl2TETbFPkqKF26sx5Qv4WT7hFY5uFkjG3WnxN/KD
	h3/o6vAn58sE49OEJRErc9LVYTgEsfSGKiua9loLipaKH6qnviH5DjZFGluFw1VUKiGTsKs5MLeey
	bn2w3WRYUa7VB+egDn0dPuWOSPsGHp5E/kt7kmvsvE85Xmv7AoGQrmcekhFN31TySeJ97usqUmfJN
	09++IK3yfbI4ZFp9rI/iaYt6U1idDN6g9Cqywy5pK9jmgU0yJlFsoi0iCseASngzhaIRglqxZTfu4
	f+e+QMcQ==;
Received: from ip6-localhost ([::1]:56316 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTVS6-00CRHG-09; Fri, 16 Oct 2020 19:31:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29118) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTVS0-00CRH9-QP
 for samba-technical@lists.samba.org; Fri, 16 Oct 2020 19:31:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=HMTU5CAueOrV5TQmZfHv3qgyLgcHY+uR5rm7cESJdSE=; b=eTUxVgywMctBQom8LdXMNha1EX
 GXEfY0TXLC0xqkdoI8NGaQFap0pCQYCUuElCFX2D1z7zAOYduAKwdv+RqGKOeqPB9BpDIMhh9A1fx
 facwp69+FZNW/yqWX/fO1JrKaHEo3jsNsrfxZknlpjusDpLW9HXWUminlO52PXM6JhLMfj/QffsR7
 hZezZ3LhX55aAjl8G5P/19yqjCZvMC/kv9gIsIEKwoKf+seepRA9XwqvRgJGsehESKvQOE48Uh8/0
 j1bDONB8I89JbVV4BI9+Mq0gGmsuRo06TvQV+jcdGmK1XXMNrlmr2dM27kniFOXpZQeSD4XrSGTUX
 6HXUM6FDe+geX8Bf2ItxJhMKGO82HzMbiK7Ddz4Q4P8SPgCu+f/bBrnL7Qn78C1UY2bR1HTy6nXtZ
 CknFCKQhRKv9IuAy9Q+BUi9n0f039hCLkfaWoZOPDw+cvaZ5sM9a1acLiZ0iYOUEP2vtcrHmB1PfT
 QM25uUkVdlmBgOHyQsYbknrL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTVRz-0005xs-J4; Fri, 16 Oct 2020 19:31:40 +0000
Date: Fri, 16 Oct 2020 12:31:36 -0700
To: Arran Cudbard-Bell <a.cudbardb@freeradius.org>
Subject: Re: talloc: talloc_set_memlimit causes all reallocs to fail when
 used on pools.   talloc_set_memlimit not enforced correctly on pools.
Message-ID: <20201016193136.GA67086@jeremy-acer>
References: <DA0D6B87-BA18-41EA-8ACE-E431841902FE@freeradius.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA0D6B87-BA18-41EA-8ACE-E431841902FE@freeradius.org>
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

On Fri, Oct 16, 2020 at 01:59:11PM -0500, Arran Cudbard-Bell via samba-technical wrote:
> Apologies if this is a repost.  The original message didn't make it into the archives, so I'm assuming it also didn't make it to mailing list subscribers.
> 
> First I'd like to thank the contributors to the Samba project.  We've been using talloc since ~2013 and it has made an immeasurably large contribution to code clarity and the general stability of FreeRADIUS.
> 
> -
> 
> Reviewing the talloc code shows provisions (and test cases) for applying memlimits to pools, unfortunately in practice, memlimit functionality on pools seems fairly broken.
> 
> 1. Calling talloc_set_memlimit on a pool results in a limit structure being created with limit->cur_size being set to the size of the pool + chunk header + pool header.  This seems to effectively mark the entire pool as already in use.
> 
> 2. Because of 1. calling talloc_realloc on a chunk allocated inside a pool always fails (unless the operation would be a noop).  Even if the chunk size is well within the pool limits.
> 
> 3. Chunks allocated within a pool are never checked against the memlimit set on the pool.  This is actually the only reason why allocations within a pool work at all.  If the code path included a call to talloc_memlimit_check, normal allocations would fail the same as calls to talloc_realloc.
> 
> I've tried modifying the code so that only the children of the pool ctx are included in the the cur_size calculation, but this causes a "logic error in talloc_memlimit_shrink" error.
> 
> Happy to keep poking, but I figured someone more familiar with the spirit of the code would probably be able to make more rapid progress.
> 
> I've included some simple test cases at  the bottom of this email.

Thanks. Arghhh. I really hate the talloc_memlimit code :-).

Not sure how popular/used it is.

I would love to just strip it out, but as it's part of the
ABI that's too hard. Can you log a bug at bugzilla.samba.org
so we can track this ?

Thanks,

Jeremy.

