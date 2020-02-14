Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B9A15D4AC
	for <lists+samba-technical@lfdr.de>; Fri, 14 Feb 2020 10:26:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=oPdR73Vf0ctAs2KLERylrZOs9pNRZrLvAzZmqn76VRg=; b=MSq0O+FoR00g8JqTtKFTW/KssU
	nefSQYuM0dD00PlB76ORHOsoj8+m9a33GI6sxlEyG11PUtlldhjHhZpmWuTQMqOlmCJWaS71Vq8rN
	htpcU6R08Bvqk4+cngfBjgymeCNqXD2MlDoIOHNK77Q1yI5zwvFeNeIeeVvqwTBJ/DQAzIUxUXVmS
	StrKAsd+7ah100OiLVgsvo3/JB78su9jOK5f93TsMGirJlhXc6MeRSbf/Edbvep8zK2aRn+Mwi48w
	QONcem8LgWi7HiB7ZcPlZJ+YYuyoel+0pElAtzer+L07oboIyC2g/GTOheegFbMC0L/ahVRl+857k
	3ptYddKA==;
Received: from localhost ([::1]:60730 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j2XDw-009rf9-N2; Fri, 14 Feb 2020 09:25:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16386) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j2XDq-009rf2-H6
 for samba-technical@lists.samba.org; Fri, 14 Feb 2020 09:25:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=oPdR73Vf0ctAs2KLERylrZOs9pNRZrLvAzZmqn76VRg=; b=1YJAE1myY89vY95XqpyyYHCW8I
 KSw8uDEG61G+l3ZBSMDR4YKOp737Wjcnf6ds8q4ECTKwWZ3ysuHZwTP+AQFeV/28cvSJC6+aZl86l
 dBlmqyEBHffV4xf20W5R10SFFSCupev8WNF/wXCUMsK1w4FhlP86cTsSnvzQvp/GEv4Yx59Otcd5m
 Kb7X9BCMsmIH8qZ+KsN3kzgD1jgqWGLOs/l9n3c9ejxqwjBFt5Vz+j5ZrZRqddj8ra7CIZjm04BvK
 UR7ywHiixsRY29BKpu94jmzYsnz3pS7IhaFD/8I4UYwaw+Bdfb5yGZNkKhOWnYiscm2AkJDe4dvME
 S2560BWgCrRPM2W6sZhPLVd0wQwQCFElI+uEK9/BZEw4GFXZ2h7Wz6VU+M3K7NJRh9ZZ4sADPFLvY
 GET39eweFIS8OQsZ2Roi2JuHPGRxAHIe98ZA+AwNBoHCfcrl7sePPkIf713Y3cO2LJiLEtazRip+X
 6QDcoWvNGKbRTQnreolQpV8q;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j2XDn-00076o-Gd; Fri, 14 Feb 2020 09:25:16 +0000
Message-ID: <37bb1fc80d788e66c253275fba9d90fed258dc36.camel@samba.org>
Subject: Re: GitLab CI back
To: Martin Schwenke <martin@meltin.net>
Date: Fri, 14 Feb 2020 22:25:12 +1300
In-Reply-To: <20200214160926.6a23841d@martins.ozlabs.org>
References: <1f5483b6c7349f261b79990f3daea501d7636ffe.camel@samba.org>
 <20200214160926.6a23841d@martins.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
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

On Fri, 2020-02-14 at 16:09 +1100, Martin Schwenke wrote:
> On Fri, 14 Feb 2020 18:01:16 +1300, Andrew Bartlett via samba-technical
> <samba-technical@lists.samba.org> wrote:
> 
> > A big thank you to everyone for their patience, the GitLab CI private
> > runners are back now.
> > [...]
> > Let me know if you have any further problems, otherwise please just
> > restart the failed jobs.
> > 
> > Finally, I would plea that some other interested team members learn how
> > all this works, so as to avoid having a single point of failure in
> > myself.
> > 
> > Thanks!
> 
> No!  Thank you!  :-D
> 
> peace & happiness,
> martin

Thanks everyone for the kind words. 

I also want to say a big thanks to Joe Guo, who did this work
originally.  It would not be possible to re-build the runner so quickly
without the ansible playbooks he wrote, I just had to:
 - understand them (or more particularly, read the README.md)
 - find where the images were being declared and
 - set up an environment to run them in.  

The entire design here is 'infrastructure as code', and the way we fix
configuration issues like this is to rebuild the runner from scratch,
rather than update the configuration online.

The starting point is: 
https://gitlab.com/catalyst-samba/samba-cloud-autobuild/-/blob/master/ansible-env-setup.sh

https://gitlab.com/catalyst-samba/samba-cloud-autobuild/-/blob/master/ansible-roles-clone-or-update.yml

https://gitlab.com/catalyst-samba/samba-cloud-autobuild/-/blob/master/gitlab-ci/run-rackspace.sh

Andrew Bartlett
-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



