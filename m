Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B282098E5
	for <lists+samba-technical@lfdr.de>; Thu, 25 Jun 2020 06:10:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=5hex4nzUB6bDXnlaQY0L6zVmNtSU2D3pgMbQVc26aZk=; b=UfXYcC3hUnC/BrVLvHw+M5cjVJ
	GfXUfHIZf3X7lFuQOvC8dcBt/d//RyFnPdB2vL+ns6TSTCrj9MZlRcZmQANHLV+7qVdm0L/+/5ngw
	X+swFFpOKFs0ELrjFYLU693pg3G2vqRvszbMOQDo+LeDSbGjqbFcytYMvthyyGYDIVpYZbcQn8/S0
	xF06YPvZSz4WVl4Pkd9hv7O0knSrK76770S2DxDLk+W48fFX0NGM7uA+aXozCmGdb9VAD9M0gtbeZ
	O2a97YIjurri+1Jv6LYv8Wi9NzVaRZ8SNwp5Mdq2/kSZw4plDAUD8XaU85gbR70I3mLDDOM+ldXD/
	c6XyQ8Xw==;
Received: from localhost ([::1]:61820 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1joJCd-002Eud-PP; Thu, 25 Jun 2020 04:09:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62354) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1joJCX-002EuW-4B
 for samba-technical@lists.samba.org; Thu, 25 Jun 2020 04:09:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=5hex4nzUB6bDXnlaQY0L6zVmNtSU2D3pgMbQVc26aZk=; b=fTE7SCQ2YkKZGZHRKwWG667fHx
 w6p8yqv/XifoSMoZfFWLFuWWOp8nPqJKmIEtOiaZhcwD5pc2XMzzOaut6CpYhYNcrBqZKCqA1gkL4
 VEjY/TrgS1FJqd1t79zNyljzbRxupXSLORuKNb909EgEh9N7tRyjpVOjImKkrmPMTwh9w/NgTo0De
 NJXrP/mBoPx3QhUuic9tUDYIMe8XGTbIDKjsfKNWdwT02mVJb0EfuRqPzO5ATTdiikLraf2sXUUvT
 9AcYIs2GqfvzIVInXokUWctHXwZTMX1jB2vgdn+ItYndb+VqcnL45lyJYuv/nayQuxUjaR+1I4X8w
 CGmjC5Y1UOekaQvuu1VjI0zTw7Kz4cHtrzoiC6vT0hv72DrdcT8GBVHm5ZAG3/qP6h5jw8lXuB9zA
 TqYGJi+FQ4il49R536s6PIWSvYGjCk2nSDdiNMCy5w8PMVAsqCpycOC2ifDhLzQDDm3fosfGa2MTx
 CPzki1h/zxOrKl7UkZ9ziUAb;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1joJCU-0005Sy-TR; Thu, 25 Jun 2020 04:09:23 +0000
Message-ID: <bf7a22a52831fae6829e8b408ce21e05fdc9f722.camel@samba.org>
Subject: Re: Avoiding further (LDAP) stack proliferation in Samba
To: Stefan Metzmacher <metze@samba.org>, Christof Schmitt <cs@samba.org>, 
 Jeremy Allison <jra@samba.org>
Date: Thu, 25 Jun 2020 16:09:17 +1200
In-Reply-To: <9d28a25c-0e2a-3e69-d305-4c886aef84a1@samba.org>
References: <7f08ecb52a4a94d95e39af436e94ab852cf0da55.camel@samba.org>
 <20200521012158.GB10353@jeremy-acer>
 <4ce022a6c65422e40e1a583f95cefbbc7585393c.camel@samba.org>
 <20200521021959.GB12847@jeremy-acer> <20200521214312.GA12586@samba.org>
 <854ac3b5d75279a13ebf3c5a6e9f4fd5b9eb8943.camel@samba.org>
 <437a7ad7-5158-9124-9ba3-939a3bfcee53@samba.org>
 <b20bcf09b119aa0d0585d27b24076bdd17157caa.camel@samba.org>
 <9d28a25c-0e2a-3e69-d305-4c886aef84a1@samba.org>
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
Cc: swen@linux.ibm.com,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2020-06-24 at 12:22 +0200, Stefan Metzmacher wrote:
> 
> Can you agree on that plan?
> 
> If so we can start working on this without running into a deadlock
> again.

Sounds like a plan.

I also agree that touching smbldap itself is quite risky, I had hoped a
way out of smbldap would be via deprecation and removal of the callers,
but it seems we will have these for a while yet.

Splitting ldap_message.c into client and server would be useful for
many good reasons (we decode client messages on the server right now,
before rejecting them). 

I just hope that we can agree to allow (dare I say encourage) AD client
code to use the LDB and LDB-adjacent utility functions for the above-
LDAP parsing (DN, Extended DN, GUID, SID, etc).  This stuff looks so
simple until you read ads_parent_dn() and cry...

Finally, I wanted to say a big thank you to you and everyone else for
taking the time to understand my concerns, I think we are in much more
agreement now.

Thanks,

Andrew Bartlett

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT - Expert Open Source
Solutions
https://catalyst.net.nz/services/samba







