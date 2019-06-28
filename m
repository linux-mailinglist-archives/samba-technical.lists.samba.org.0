Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4296E598CE
	for <lists+samba-technical@lfdr.de>; Fri, 28 Jun 2019 12:52:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=t3Wt9ENTHIPFIew8DjoDfnuYm9TVR8nGGGJF/VpdtKM=; b=ZhfWdyJe8V7VegjsgKx8iXr56F
	zhM4itEMxtDRh1cMnQeKwhB+J21WUsbv9+NmNoRQ29QOXforRivvFSk0OcPgWjELoOfl0+6QY0ASF
	LlFII8Qf+BopoMa9Fvg+UShZpLnQVetXs7KA/Wu+2LbK7dAPayBzicXiSilYxIN/UNPdF9yE88vGf
	5p7k0Jw0x7iKyHKZmk+7MU3rqQ1jyFesK7Ywy9ImdN2zpsOcS4cYUEp036pEhgzCcVnwIsScQa8Qk
	ZIbJZrNj+HflgqMdjYFIdHacMAk6Ujf2O5rq2y6QmWQf8eoiejQ2I6KV4WDWVWRzl96xmpYA84C74
	4jgYkmLQ==;
Received: from localhost ([::1]:39556 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgoUT-002Ke3-8g; Fri, 28 Jun 2019 10:52:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35880) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgoUO-002Kdw-2Z
 for samba-technical@lists.samba.org; Fri, 28 Jun 2019 10:52:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=t3Wt9ENTHIPFIew8DjoDfnuYm9TVR8nGGGJF/VpdtKM=; b=CctCS57XghGBy85zak5aYSpUPW
 EMn/umRx5zsKuKcxk04Cvocgd3+fsEB0xq2eVebPMjo39uMQkNpwfC7d+IRZu/w2vew16irMPKN8L
 BlVZu+hUIZNiV20VF8b3wJzOzzVMONHgd9uOKp+zQaYVlfeBDl/K/TcuCbpS3mCchAkc=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgoUM-0008IF-2e; Fri, 28 Jun 2019 10:52:18 +0000
Message-ID: <62bc808700dca7a08f3a61c6d7e676119c301843.camel@samba.org>
Subject: Re: Document GitLab as the only way to contribute to Samba?
To: Michael Adam <obnox@samba.org>
Date: Fri, 28 Jun 2019 22:52:13 +1200
In-Reply-To: <20190628104624.GF32415@samba.org>
References: <1561079117.28284.21.camel@samba.org>
 <20190628104624.GF32415@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2019-06-28 at 12:46 +0200, Michael Adam wrote:
> On 2019-06-21 at 13:05 +1200, Andrew Bartlett via samba-technical wrote:
> > [...]
> > So, I would like to propose this.  That given the practice of the Samba
> > Team and almost all contributors is to contribute via a merge request
> > against https://gitlab.com/samba-team/samba that we document this, and
> > only this, as how to contribute to new patches to Samba.
> > 
> > [...]
> > 
> > Essentially it would mean a better version of this being prominently
> > placed:
> > 
> > https://wiki.samba.org/index.php/Samba_CI_on_gitlab#Creating_a_merge_request
> 
> There is one thing I find confusing about the above page and that
> needs to be cleared: It creates the impression that the only way
> to file a merge request for samba via gitlab is to get access to
> the CI repository https://gitlab.com/samba-team/devel/samba
> and push to a personal subdir+branch there and create a MR from there.
> 
> In contrast, if I get it right, I think the *normal* way to file a MR,
> would be to create your own personal fork of https://gitlab.com/samba-team/samba
> on gitlab, push your branch there, and create a MR from there.
> Upon filing the MR, the CI is triggered on the proposed patchset.
> 
> My understanding is that the CI repo is intended to give access
> to the CI with*out* requiring to file a MR to the main repo.

Sadly no.  Any repo can do the CI, and a personal fork can file a merge
request.  That is the normal way to use GitLab.

Unfortunately Samba is special, and some of our tests need larger
runners while others need ext4 file systems.  Both of these force us to
maintain our own runners.

However CI runners are attached to the *source* of the merge request,
not the target, so need to come from (this specific) samba-team repo.

Some magic ensures we still do a lot of CI on user private
repositories, so eg a docs fix or new debug message is pretty safe from
a personal fork, but a full check requires that repo. 

I bit of a wrinkle I know, but the best we can mange so far. 

I hope this clarifies, or at least provides some amusement!

Andrew Bartlett 
-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



