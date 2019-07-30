Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C9579D38
	for <lists+samba-technical@lfdr.de>; Tue, 30 Jul 2019 02:11:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=hyX4ZVAQcp3ES02gGopGRvfc4Ily0ejbloaY8Dxr2FU=; b=pq552O9WF/Gq8Az+0xAKq81W4S
	oWhuIc7rtGBAF555jA1wvsLIT6jHeH36dkzMFLufHvCUW4Nfi6d09MNE/yQWtU7xyUU6eFuL05SIc
	Aw8wTcpXxjzKxmQY9ZUVEy54bNfpSAB16yCjrDyf2Cb0fwvJMo0XWymPtlmtBkkrvkGpdms3k5JyT
	Z/hs5CKD5j/oH7Rff3xy93X4+ztZdLphpwoC/+lViiGp7amqOHaJ5tNnAYE38xC9BnOFh9NJ1jtCn
	m234NztbqH2V7tJj39Zoorb/oQ1k/wGeO3TGpwzF4xjQRs6QxdWecltMPgdsuygbr7pGff1JpSqbN
	osAiBEug==;
Received: from localhost ([::1]:58692 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hsFiO-000rsU-1G; Tue, 30 Jul 2019 00:10:04 +0000
Received: from ozlabs.org ([2401:3900:2:1::2]:33315) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hsFiJ-000rsJ-E2
 for samba-technical@lists.samba.org; Tue, 30 Jul 2019 00:10:02 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45yH4F02gNz9s8m;
 Tue, 30 Jul 2019 10:09:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1564445389; bh=b+MCNa63bC+Llb747nG1Bla8HdP2c9TwTXPWbONMQfQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gwBP7cuxiFKxtS/yjAQVtZLv6ot7e6eZD0Xrmd4KblTa+DyJxby4klw037lOzuNvN
 Q2waFeGcrzboOap7UgDFVxH8Tk+jDr5LNtMG6CGCNULBIoimxCGs0h6C86zM2ytfGE
 rTKkINVpmOWGbpEQQ3xekLPnyhirJ9/KoLBZvZ41a6f2fXryWCcmXSrp+vHtCe0z6c
 HUoZvRISFX6Dh9iraxii4yM49LyTOk4MfhQwiYZ6afZuBdYXirQCRE5tnYUCAy7wed
 2H/nt5A5hCsroTARgeoPCSDxqs4d4taPWR55ov8Hs75QyPimYr9CdBhrozudzIfUH/
 UiiiOoxtX5wZQ==
Date: Tue, 30 Jul 2019 10:09:48 +1000
To: Noel Power <NoPower@suse.com>
Subject: Re: RFC --picky-developer (for developer builds)
Message-ID: <20190730100948.3e72f009@martins.ozlabs.org>
In-Reply-To: <82e23c37-0bdc-e35a-373c-71b0591becd9@suse.com>
References: <82e23c37-0bdc-e35a-373c-71b0591becd9@suse.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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

On Mon, 29 Jul 2019 09:48:42 +0000, Noel Power via samba-technical
<samba-technical@lists.samba.org> wrote:

> I had a merge request https://gitlab.com/samba-team/samba/merge_requests/591 (now closed) to enable --picky-developer for developer builds, this was a pretty low impact change to make developer builds build with '---picky-developer' by default.
> 
> note: it modified the configure.developer wrapper script rather than the --developer option itself
> 
> Metze however pointed out that he had an old branch hanging around trying to achieve the same result (but I think at the time too many warning as errors still existed in the codebase)
> 
> Metze's branch:
> 
>   a) removes the '--picky-developer' option but instead make the --developer option use the same flags (in otherwords make --developer do the same a --picky-developer)
> 
>   b) replaces the '--picky-developer' option with '--disable-warnings-as-errors'<https://gitlab.com/samba-team/samba/merge_requests/667/diffs?commit_id=3195e4a57ea74fae2b81536b327c13148b1529fa> to allow to avoid -Werror
> 
> I think Metzes' approach is better and so rebased his branch,  (see https://gitlab.com/samba-team/devel/samba/pipelines/72975003)
> 
> Surely it's better (for developer builds) to be as 'picky' as possible and ensure we keep passing with that)
> 
> what do others think? I'm all for merging this but such a change probably needs some wider discussion/agreement

I like the idea.  Those fancy options sometimes find bugs before the
code gets merged.  ;-)

It would be good if we could even go stronger.  I always try to build
with CFLAGS="-O3" and --picky-developer. However, with those options you
can't build against bundled Heimdal Kerberos, because it is a roaring
dumpster fire... and I don't think anyone has looked at fixing
building against system Heimdal either...  :-(

peace & happiness,
martin

