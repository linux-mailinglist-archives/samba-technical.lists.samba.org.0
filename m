Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E18228F95B
	for <lists+samba-technical@lfdr.de>; Thu, 15 Oct 2020 21:23:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=bmawLRNUex/9rHFPmg6rXCgWtz4Th4o0nnMQcpBIzPo=; b=ILpy8LBKM9EnlpssFYy0oyL7Nk
	3jqVsjbGBj+lSEwASj9OFgRDxsBhNf+3mtY1veMC5P0InBmXDHOEV8nx4YtGNGltFrqihVRD1ozf3
	RkFrPTXOz5aeZZmPQJJcJYCGaBYB/vkSq9Y2B56wFJnFMW6v2+KCYu3nc8IH7X/XifkaE6ImRsWUF
	vklYTnqmGGmsMANWzlCan7lKzKWBkcZgCad6k6iRGwHHGvBo74nLDDyv/EKmdJrD0IbpEESXTlCVf
	UV9oA0iUuskIWasrn/XEG3QwpQnYaueYRm1y+gCLG3wfCdKzCCKPpfswWVIzNrq8Z573BvTZ+mwOC
	SnaTi0Fw==;
Received: from ip6-localhost ([::1]:61670 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kT8qh-00CJTR-Tt; Thu, 15 Oct 2020 19:23:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48456) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT8qc-00CJTK-TW
 for samba-technical@lists.samba.org; Thu, 15 Oct 2020 19:23:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=bmawLRNUex/9rHFPmg6rXCgWtz4Th4o0nnMQcpBIzPo=; b=nzl14HxkJR/3mSkfhyL4eFXSai
 nlzPJuOGIBOb2SEdd1Me7aX00msT1NXionTIx+3O+SsL/Jyr6oK6rKwqNCGWdV8QhytrBXNNPiTHz
 XzzuPdRy1QC+f4okY4OQf7q+t2UB79igCGQyx8CDCI/8oYb7KBouc/t1Hez23GQJOjClScuMk/Ixs
 WXECdUeEna44544CdV+E44ornBHK50CqgJIUHEyy33cywkM/ZvpYYbkOgNi28ekbPzYN89b1hrosf
 tKQVMrky5UX6Lb5taqgG9qzD9X4RwgP8LRrTfemd2s0Jt4ofLo82Vthtu2lmtkPsYReWNZXwtIRC6
 F0Lsw68mpycmAFaPN7+UTb8+SlvjrDedKBCwzLJDkZZ3EoU//lQgsncxdMYQtyAtO2QvxiLjJY4p9
 m8td3UmDrhE22Eq5QRm1V7/GEMMUUkzshLWHn3twMuugWXGb5ch+5Ms4poEQTjADNlVo09AF5+/FX
 5OyzB00aZFj/Bnwo2VKFTCt9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT8qb-0003V3-Rn; Thu, 15 Oct 2020 19:23:34 +0000
Date: Thu, 15 Oct 2020 12:23:30 -0700
To: Simo Sorce <idra@samba.org>
Subject: Re: [PATCH] Documentation: Rename Samba's DCO to Samba Contributor
 Representation
Message-ID: <20201015192330.GI3840862@jeremy-acer>
References: <87mu0nidll.fsf@ebb.org> <20201015180510.GE3769001@jeremy-acer>
 <2231b5de-fa06-db61-feb0-08ad0374673e@samba.org>
 <f70291dc95eb0eae98e23c2897cbcfa9376e90e9.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f70291dc95eb0eae98e23c2897cbcfa9376e90e9.camel@samba.org>
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

On Thu, Oct 15, 2020 at 03:14:13PM -0400, Simo Sorce via samba-technical wrote:
> [Resending as originally sent from wrong address and bounced]
> On Thu, 2020-10-15 at 19:14 +0100, Rowland penny via samba-technical
> wrote:
> > Hang on, what is wrong with calling it a 'DCO' ?
> 
> The original license for DCO 1.0 did not permit it, this[1] is the only
> reference I can still find.
> 
>       If you modify you must use a name or title distinguishable from
>       "Developer's Certificate of Origin" or "DCO" or any confusingly
>       similar name. 
> 
> 
> The current DCO (1.1), in contrast, does not permit modifications at
> all.
> 
> > With 'DCO' (Developer's Certificate of Origin), even I (a total
> > thicko) can understand what it means,
> 
> Maybe you really do, but to me it never meant anything until explained
> anyway. The first time I saw the name I wondered why they want to know
> where *I* am from.
> 
> >  I have no idea what 'Contributor Representation' means.
> 
> That's why you read the text and figure it out, it is just a name and
> is as good as the original in terms of clarity IMO.

Well it's not just Samba that uses DCO. Look here:

https://probot.github.io/apps/dco/
https://www.dita-ot.org/dco
http://www.gearvrf.org/about/certificate/
https://www.docker.com/blog/docker-code-contributions-require-developer-certificate-of-origin/

for just a few of the other projects that use "DCO"
to do exactly what we do.

Right now it looks like the term "DCO" has become
synonymous with what we're doing here.

Even Linux kernel developers use it in this way:

https://blog.hansenpartnership.com/a-modest-proposal-on-the-dco/

"When one of our developers posts a patch to a project under
an OSI approved licence with a DCO Signed-off-by: from our
corporate email domain, we authorise that developer to be our
agent in the minimum set of patent and copyright grants that
are required to satisfy the terms of the OSI approved licence
for the contribution."

Note that the above text doesn't say "to the Linux kernel
project" here - only "to a project".


