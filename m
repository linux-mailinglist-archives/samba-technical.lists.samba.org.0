Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F544E273
	for <lists+samba-technical@lfdr.de>; Fri, 21 Jun 2019 10:58:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=0XxI0Ib8xjuw95hCY7WkKHST3nuS83Ds4tiLeVK2LDU=; b=5qWMwmTBQ2CKag3rstlHz5jUsM
	Z+s0pRUE5i4Bfp6xqMrT5HZFreNOuNME26eVEyhcZiF2VOkB9iNPUfj4UjYmNuT5tQ9GI4nr6KeQ5
	dxIqyIQAtwmlUNUAVQNxO9Fn6Ul6Po/AzZYcBt+eihjrT4q/s6lq5+cv978V3/R62I20u/tEOY3Bg
	Qx5/oVMkl11vT0HGDBRHfFkZp3Lw7giVMxFAVAR9R2pwGrY9AZqEYCpqPFTv6PpVGKM69AnPTGy2Q
	SvCmZ6ONoYEsP5H38dhxHh362BhwN/OcYE2D6u1lrlCTf+xjP/hP4moW8SviD+Mqxi3yl0LgR6Awe
	Hhq7r8AQ==;
Received: from localhost ([::1]:19802 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1heFMx-000uaC-UW; Fri, 21 Jun 2019 08:58:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39590) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1heFMu-000ua5-1n
 for samba-technical@lists.samba.org; Fri, 21 Jun 2019 08:58:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=0XxI0Ib8xjuw95hCY7WkKHST3nuS83Ds4tiLeVK2LDU=; b=HkD25gXazKnPrn7hFK4N8ylY47
 zd/htPopM1l+PXDQwbXXl65JfYLjCT/BWnSd0fDDCI0qA+9TPfTYhCitbpIfe35n/I5j6OkNZ/ELv
 jvDl7DXoJ+9bDO9i5icOJYcNoVauwOUogECsRX3FDmk1KhaALuJRhK6HUwLfYBfPDgwM=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1heFMs-0001JB-RO; Fri, 21 Jun 2019 08:57:59 +0000
Message-ID: <d008c4c5480bf52c3ae63d39007c002ee2818985.camel@samba.org>
Subject: Re: Document GitLab as the only way to contribute to Samba?
To: Rowland penny <rpenny@samba.org>
Date: Fri, 21 Jun 2019 20:57:54 +1200
In-Reply-To: <841218bf-e99e-b346-5240-2122fa491a24@samba.org>
References: <1561079117.28284.21.camel@samba.org>
 <20190621111436.342f713e@martins.ozlabs.org>
 <1561082290.28284.28.camel@samba.org>
 <0278c810-0cd8-5ad8-3a39-ab1e7fc70b8f@samba.org>
 <41b3968e83cfbd74a060b7f51f4c719be4ddab58.camel@samba.org>
 <290c2679-895e-9be4-a7d4-03a5ab8bd265@samba.org>
 <c313657a3ccb56499bbae330bfd93690764cceea.camel@samba.org>
 <841218bf-e99e-b346-5240-2122fa491a24@samba.org>
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

On Fri, 2019-06-21 at 09:42 +0100, Rowland penny wrote:
> On 21/06/2019 09:30, Andrew Bartlett wrote:
> > 
> > Given that, do you see the advantage in having a single, uniform,
> > 'right' way to submit patches?  Is there anything more I can to to
> > help
> > you support, or at least not object to, my proposal?
> 
> Are you telling me that you do not read patches any more and rely on
> any 
> potential patches passing the git-lab tests ?

I don't review patches sent on the mailing list.  

I look at patches on GitLab, particularly those that have the
reassuring 'tick' indicating they compile and pass the tests, and work 
hard to carefully review those.  As part of that I provide feedback and
work with the submitter to get them ready for inclusion in Samba. 

This has been a very effective strategy in the year so far, and I would
prefer contributors didn't miss out by following the 'wrong'
instructions.  

Hence my proposal.

If you do decide to join GitLab you can be notified of activity there
and see the review work of me and others, it is quite busy these days!

> > Finally, I would encourage you to try out GitLab, it is much easier
> > to
> > support something you have used, and my offer still stands.
> 
> No thanks, being told your programming is crap once, was enough for
> myself.

I'm very sorry you feel that way.

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




