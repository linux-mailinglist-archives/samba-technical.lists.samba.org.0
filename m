Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B44724E1ED
	for <lists+samba-technical@lfdr.de>; Fri, 21 Jun 2019 10:30:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=gYkO67CGgJ85j9wU04gtQYSmehlw2tSx1g0i6rYFwh4=; b=WLLoROQg7RVKopKabff7gnYuZH
	iEuApvOCyJT1vVuh8xbm89WolYmUedWfow/2j8eF+3HBgpPZBbg6Khn6oH2rnVPhMlAIOxx0n7scL
	wMgqdHrvYOpwApkGJE83mbEWQPUXtmQKhT5OIoPory3de2nxxHIdTpnuIa1xC12EsCksSdpLB6TZt
	2r4djvV7SxwWEFN1fmymxlldc3DETI4+RkSpLUzzbgTiVGg0mLH9T5sjwhsjOIL6YDpK+ViKtarhn
	C6cDY3WdhTkxNUcgRibStc6u9LgOdUfm9QGWHFTYK0/atF2AcMN1Qgce4L78DYxVhyM0gPkguCfWH
	ySejg2Bw==;
Received: from localhost ([::1]:63784 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1heEwN-000u6Q-4l; Fri, 21 Jun 2019 08:30:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19552) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1heEwH-000u4p-MP
 for samba-technical@lists.samba.org; Fri, 21 Jun 2019 08:30:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=gYkO67CGgJ85j9wU04gtQYSmehlw2tSx1g0i6rYFwh4=; b=KlV6Asz65Dtu/TlaMvZ5hqnlku
 lj8h2TiO1uudHW1wM0Yq9XNSO3c/PEG/NGz7ubreBJIeYeCxJRTSWWO6RYzeUb+Yz32zgSNN2U7CG
 ivrsso0P713186VMsi+w+EI+ahQX3W9gC20639L1tEao/SavnPZ8WhgMkJDSZ+1o5Law=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1heEwG-0000gx-87; Fri, 21 Jun 2019 08:30:29 +0000
Message-ID: <c313657a3ccb56499bbae330bfd93690764cceea.camel@samba.org>
Subject: Re: Document GitLab as the only way to contribute to Samba?
To: Rowland penny <rpenny@samba.org>
Date: Fri, 21 Jun 2019 20:30:24 +1200
In-Reply-To: <290c2679-895e-9be4-a7d4-03a5ab8bd265@samba.org>
References: <1561079117.28284.21.camel@samba.org>
 <20190621111436.342f713e@martins.ozlabs.org>
 <1561082290.28284.28.camel@samba.org>
 <0278c810-0cd8-5ad8-3a39-ab1e7fc70b8f@samba.org>
 <41b3968e83cfbd74a060b7f51f4c719be4ddab58.camel@samba.org>
 <290c2679-895e-9be4-a7d4-03a5ab8bd265@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
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

On Fri, 2019-06-21 at 09:01 +0100, Rowland penny via samba-technical
wrote:
> On 21/06/2019 08:44, Andrew Bartlett wrote:
> > On Fri, 2019-06-21 at 08:13 +0100, Rowland penny via samba-technical
> > wrote:
> > > Sorry, but I do not think it is 'wrong' to not want to use git-lab.
> > > Perhaps we should 'prefer' people to use git-lab, but we definitely
> > > shouldn't tell anybody off for sending a patch directly to samba-technical.
> > > 
> > G'Day Rowland,
> > 
> > Can you elaborate a bit more?  Can you explain a bit more why?  Can I
> > help you set up your account?
> > 
> > It would be really good to have you on-board.
> > 
> > Thanks,
> > 
> > Andrew Bartlett
> 
> I wasn't actually thinking of myself.
..
> I was thinking of other potential users.
> 
> Rowland

Thanks Rowland.

I would say that is the same for me.  

So, for those other potential users, I think we both want to guide
users to the path of most likely success, right?

The problem as I see it is that sending the patches to samba-technical
risks them simply being lost, particularly if folks are not 'told off'
and re-directed to GitLab.  

Quite bluntly, I don't review patches sent here.  I simply don't have
the time to spend on it, and on the flip side the merge requests
page[1] is a great TODO list for me.

Now, thankfully, I'm not the only reviewer, but it makes me feel sad if
we document methods with a lower chance of success alongside the way
that works better for both reviewer and submitter.  

If the submitter doesn't send the patch to GitLab CI, someone else
needs to, and then be the human messenger when it fails etc.  (This
leaves less time to review patches, which is why I don't do that any
more.)

It makes me sad because I feel for our contributors, and I want them to
feel that if they follow our advise, their patches will be well
considered.

Given that, do you see the advantage in having a single, uniform,
'right' way to submit patches?  Is there anything more I can to to help
you support, or at least not object to, my proposal?

Finally, I would encourage you to try out GitLab, it is much easier to
support something you have used, and my offer still stands. 

Thanks,

Andrew Bartlett

[1] https://gitlab.com/samba-team/samba/merge_requests
-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba




