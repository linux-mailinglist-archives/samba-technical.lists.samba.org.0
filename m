Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 393FE304F4F
	for <lists+samba-technical@lfdr.de>; Wed, 27 Jan 2021 04:00:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=Qb0BNszl2Zv9xU9dxdOkP8nO3GpEVSWUOhsbV7LJOVw=; b=mGjVwJh7jagzMiMhx3nT41ZrM4
	I39NBMCZGsRZhvDxIgoZJoQJaReuZn9E7P0N6BJ5SM0sAGXEZP8+n9gRJnZrE45KFSgeGTq5f6Xr7
	2nAytR8RyqtU4Rl45Q9FN9uE3LUw9p6K6G0E3CYMzlV5z+tNA50oCgpbohC/iG1Ej1AXvIAduFWlR
	S/el+NhwB2a5I35JodwMkwswsX04wEYBjuRIDgnrmebSMsBr81TyTaVUGDXvvhwZQEe62X6/o0PxV
	l8WZ60SxxYSmnKlXEeQFitASOZABZCmcebvPZwCw9uERk+RuEWHXsrcqOKxzBnM5ADkGcEmmZbbm+
	vjNHxmGw==;
Received: from ip6-localhost ([::1]:53984 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l4b3R-007JGv-Bw; Wed, 27 Jan 2021 02:59:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20506) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l4b3E-007JGm-Ez
 for samba-technical@lists.samba.org; Wed, 27 Jan 2021 02:59:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=Qb0BNszl2Zv9xU9dxdOkP8nO3GpEVSWUOhsbV7LJOVw=; b=Y+HGhYJT1WOdTGUAqs9djx9+X+
 bmBK67xowSN6osn8G0pyNjmU7d45fI1VVM4IXsfjV7wevRy4eQLcL9701Z0DdBo0Y5rf3aBgRY11Z
 D0Y+KszYvBrbmz+uEVCKPl96vVdp/8Dx8rlneLGHksVPUE9laO1xUy6EE+o+Aqu08HvipjEW+qKJ5
 Q21WiJ5CwljtGAeVMs1/w74QGFG8IpEN+ZN0qIQ3A9mxO3iKSt3pAW2tZOn8rEYRRDa6Qi0qlMa6k
 52lDT0VEBOWojEGCbe+fje6Hrf+LkmxYfYGpE1jLBb+xBUjwG7wdrQv0cvcn56PIWvRwBFEtKDXTk
 PxGRmmPUrZGPJn/iMjRQHwsq6jtyIJvCleB8KOXmPFLxgWV/i8MzdTaW3LOPS70FgKjRPhAHARC2B
 8OwqVeKP5fs3PiOX8zd8d0hpGwGrOsIfIQR1wkqWFCKGFCFBjVyIYirdC5fgpqhy1FYuHPwgOuIeR
 p2JCNOSgbQOEtdvsMH36kTHN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l4b2r-0000bc-Sn; Wed, 27 Jan 2021 02:59:02 +0000
Message-ID: <02fae49b32bc297873eeb81426845343772f6b90.camel@samba.org>
Subject: Re: Not sure how this slipped through
To: David Disseldorp <ddiss@samba.org>, "Christopher O Cowan -
 Christopher.O.Cowan--- via samba-technical"
 <samba-technical@lists.samba.org>
Date: Wed, 27 Jan 2021 15:58:55 +1300
In-Reply-To: <20210126195556.2def02cb@samba.org>
References: <B93A6FFE-2D85-4503-BB15-D2AFC270028C@ibm.com>
 <20210126195556.2def02cb@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: "Christopher O Cowan - Christopher.O.Cowan@ibm.com"
 <Christopher.O.Cowan@ibm.com>, Jim McDonough <jmcd@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2021-01-26 at 19:55 +0100, David Disseldorp via samba-technical 
wrote:
> On Tue, 26 Jan 2021 18:15:48 +0000, Christopher O Cowan -
> Christopher.O.Cowan--- via samba-technical wrote:
> 
> > My builds on AIX have been failing because of this obvious
> > error.  Can someone please apply it?
> 
> Looks good, thanks for the patch.
> Reviewed-by: David Disseldorp <ddiss@samba.org>
> 
> @Jim: looks like you wrote this module ~15 years ago :). Can you
> review
> and push?
> 
> > Just wondering, are AIX builds still part of the CI/CD system?
> 
> I'm not aware of any AIX CI jobs.

Yeah, there really isn't any good way currently to do CI on AIX,
because we can only test, currently, things that can boot up under
Docker on a Linux host.

Even FreeBSD is out of reach, which is annoying.  I keep hoping someone
might show up with the boundless energy required to try and get it
going via (say) qemu or some 'FreeBSD-like' userspace for linux, but no
luck so far. 

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba



