Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 579173876DE
	for <lists+samba-technical@lfdr.de>; Tue, 18 May 2021 12:46:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=7jOemCFq2pTBuyo5vsZnutHYoxek21mO200uzrkGYqw=; b=Dg87HG6wDXI2I819EgJ/GjXDPL
	PYtKhSBM3vWQfpXQkjYCqqtZ9TwM319as6OILdOvXLRKCtPRkQAL6MOB00gnLD/OzNiuWqP1iu6+a
	8648MO3dh/ia64aiBrbdExCKH1k7RKq9XPJF8gx8P5uR8drttUQfI3zjUZjL/Dj41uSEk2nEVfPqG
	2hDZ41mUsp/ALS/2gAuGpByBA3N7p986vJEhC/JL51iMheFW/3H6AhPa/2Mjha/v7MCWVT/lvXUC7
	WuMGRuApO2bXEzme96kD9AzEMVrjY9nMCzODaDAqYOXEBrvxY261yS9/mtGrGJLMv15VC3JaZQ/Tw
	I3GzK4qQ==;
Received: from ip6-localhost ([::1]:63908 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lixEX-001FmE-2o; Tue, 18 May 2021 10:45:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40270) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lixES-001Fm5-Eg
 for samba-technical@lists.samba.org; Tue, 18 May 2021 10:45:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=7jOemCFq2pTBuyo5vsZnutHYoxek21mO200uzrkGYqw=; b=nIpuZdWZ9IBaTgC0vPRGYRHqlh
 9uC/OD1lgVfOT8QYtWLnaaq4Mm2LkMY1IbqxwUUAFxFRIexr3t5avmhrBBzitDNQHghg57Q5b4JR9
 SgFGtPq/KaR1izBmU1JFwXGMLTJrWLlqWsydz9VCNdXRL7jhtPB1ALEfw6MRk1nlkbYUFHaryNHMU
 nyK5FQI9g0fbme8BKQD8ByS4+JRkC9Qxry4rORaY3gUvIeiKb/pQZYum+ZEG3P9kG5fziarZbu5oz
 Fz1QMv/YL844gXSAiX17nlOZWVJ8nigW1ZnlYRbH7T1lLgfsK9eD3zPjTx3wQ3jMj44n1G3uYkeZ0
 ZytgWEmKBO+wgjb/UnoUNP9s1vWS8eVm/MezYE1tLSTV/ZYPwdAI5ZlIGY7XHanc+qyWFnYTq+ypt
 S4cRCu0cVFCMyM3g4ltyYwVV0Vs2ossXEgfPqJTDL+l06rrsfwY69Y9hwIGEA3KKh8Vxvnn+PRSiP
 m7U8khELnBKCDeNI4Kp+qQpD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lixEQ-0002at-Up; Tue, 18 May 2021 10:45:47 +0000
Message-ID: <530ded817f79e3cec0561c0bc59868ab193ef1c0.camel@samba.org>
Subject: Re: Offline logon flapping in autobuild?
To: Andreas Schneider <asn@samba.org>
Date: Tue, 18 May 2021 22:45:43 +1200
In-Reply-To: <2444523.AYHQVFttfo@magrathea>
References: <516bd798642997a15016d81f9ae6e17e9250f677.camel@samba.org>
 <1949061.8nGXxLBRy0@magrathea>
 <97407ae87bceb340ed01e5a60f0417810d8ec3f6.camel@samba.org>
 <2444523.AYHQVFttfo@magrathea>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2021-05-18 at 11:36 +0200, Andreas Schneider wrote:
> On Monday, 17 May 2021 21:01:14 CEST Andrew Bartlett wrote:
> > On Mon, 2021-05-17 at 10:38 +0200, Andreas Schneider wrote:
> > > On Thursday, 13 May 2021 10:17:48 CEST Andrew Bartlett wrote:
> > > > My most recent autobuild, with (I hope) unrelated changes,
> > > > fails
> > > > with:
> > > > 
> > > > [141(1068)/143 at 6m5s]
> > > > samba.blackbox.offline_logon(ad_member_offline_logon)
> > > > ERROR:
> > > > Testsuite[samba.blackbox.offline_logon(ad_member_offline_logon)
> > > > ]
> > > > REASON: unable to set up environment ad_member_offline_logon -
> > > > exiting
> > > > could not obtain winbind interface details:
> > > > WBC_ERR_WINBIND_NOT_AVAILABLE
> > > > could not obtain winbind domain name!
> > > > failed to call wbcPingDc: WBC_ERR_WINBIND_NOT_AVAILABLE
> > 
> > I got the same failure again re-pushing today.
> > 
> > > It doesn't really have to do something with the offline logon.
> > > winbindd did
> > > not start and was failing, the error why it didn't start would be
> > > the
> > > interesing one. However for this we need the logs
> > 
> > I tried a --nocleanup build on sn-devel-184 for samba-admem-mit but
> > this passed this time, so I'm trying another with all the jobs.
> 
> I had similar issues with other tests like idmap when running
> locally. I 
> didn't have time to look into it when I discovered it. Checking now
> ...
> 

Thanks.  It happens pretty reliably for me trying to push to autobuild,
but never if I do a job with --tail --nocleanup to actually look for
the issue. :-(

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


