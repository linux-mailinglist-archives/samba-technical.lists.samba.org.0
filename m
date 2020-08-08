Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A611B23F8B9
	for <lists+samba-technical@lfdr.de>; Sat,  8 Aug 2020 22:10:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=bVjqCBo5oU5IfEIcWI6PZ69rPMOF/BYICA683DsKAw4=; b=CfF9YWp4bu8PgbpymGOWGEjS67
	jBHmX4jTXR7Khn2DFuuLjJPquUDkSINfv5j/9yt2Z0DzoYGL33QEOMlN/emtT0P/+twCYkgeAQzMI
	J/mqzJccBMz20XLbdMMP5rqPi2AcNo/XWI/koJpAq8VPb3wE1ofgGbsS7aEbhswZExNMcXqSCG4ox
	VZg3NizMtHuueLqN4F5s7TNmSrMM6ygYjC+M/wiaoE/jFo48YQd9n6Nxp8exMhjKyaw+ENcT9mumg
	KsFhijk86A4ABpZIJfLoW8DwYr0XGXFquaKxvUQIsYaUVabNDR2Mms/K16phJlE91hdPeS5CqgDcF
	6SLotvfg==;
Received: from localhost ([::1]:19416 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k4V9v-00CxyY-Dk; Sat, 08 Aug 2020 20:09:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17178) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k4V9n-00CxyR-Rq
 for samba-technical@lists.samba.org; Sat, 08 Aug 2020 20:09:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=bVjqCBo5oU5IfEIcWI6PZ69rPMOF/BYICA683DsKAw4=; b=0a5MnzQbUAa8nnOcYGl+YZ5G1Q
 PdJCGk+eMOTkZ5R1BSak1AtgnmxuP6Bkls/ala48v8f6oMqWjRjstMRfCWEOU6IbDnCk+Mnos6OxJ
 /2YantDgUQprRDLKO1GDd6e5H3EJIzF2lT/vMlJfRGR6uXkzove8u7DgBr3RzlhRCK7ofJwEwoYJn
 T1VdY/ZkITIGJz3rYNChGKEncdbJDqkVmkY8n8NBbICFFRe9cB/E9fxXJ2mXyhayz26P9J3gWl1Ck
 zQCEOSOo7hvSo4ODI6iNsODYIUx4nhw46ZL5DvXbppFcNiNbWMlcjesjxHMM5HFU+Zkdl4KS3ofs/
 w8nBuQAZv/QjwBkPAac3LiLkAWDepBJBaKJQFiPAa2thgvo/kHjzeVHrP2BTbD/RKR08Fspruz3LU
 pTWkvLzNmxtqzBxAzZU7n9j/W33P4VPu3wMFrmYDHJxkCsKQQ+NIGVLAgwDqw1IrtwZDdmgwTkZ3n
 dERih+3VSU7Jfc7r07j0JtvZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k4V9j-0008Su-TB; Sat, 08 Aug 2020 20:09:28 +0000
Message-ID: <60c80bb6bf17678284e5b6b8603a226d8b4f2d83.camel@samba.org>
Subject: Re: Deprecate SMBv1 options and NT4-like domains for Samba 4.13?
To: Alexander Bokovoy <ab@samba.org>
Date: Sun, 09 Aug 2020 08:09:23 +1200
In-Reply-To: <20200808125700.GA1200244@pinega.vda.li>
References: <efd53968d989fa5b909d5b23df58b171410970db.camel@samba.org>
 <20200808125700.GA1200244@pinega.vda.li>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4 (3.36.4-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Sat, 2020-08-08 at 15:57 +0300, Alexander Bokovoy wrote:
> On ke, 01 heinä 2020, Andrew Bartlett via samba-technical wrote:
> > Samba 4.13 freezes soon, so I wanted to again propose adding things to
> > the deprecated list.
> > 
> > Yes, we add things to this list far faster then we remove the options,
> > but the job for anyone wishing to remove features starts with this
> > point, marking and announcing to our users that we are not going to
> > keep every Samba option and feature forever.
> > 
> > So I present to you this MR:
> > 
> > https://gitlab.com/samba-team/samba/-/merge_requests/1398
> > 
> > No code is removed of course, and of course we are not going to remove
> > code that FreeIPA needs, but even in between all that I think this is
> > worth doing.
> > 
> > (pdb_ldap is not impacted, I've dropped those references compared to my
> > earlier MR)
> > 
> > Parameter Name                     Description                Default
> > --------------                     -----------                ------
> > domain logons                      Deprecated                 no
> 
> Removing this setting affects FreeIPA. The logic for 'security = <user|auto>'
> triggers PDC definition only in case 'domain logons = yes'. FreeIPA
> depends on NT4 domains mode functionality to provide its hybrid AD
> forest setup.
> 
> I guess, looking at lp_find_server_role() and
> lp_is_security_and_server_role_valid(), I'd need to define 
> 
>  server role = CLASSIC PRIMARY DOMAIN CONTROLLER
>  security = user
> 
> explicitly. Right now we have 
> 
>  security = user
>  domain master = yes
>  domain logons = yes
> 
> and no 'server role', so it defaults to AUTO and will require an update
> of the configuration to set server role explicitly.

Thanks for mentioning how your use case works.  That workaround sounds
fine for now.  Perhaps we should split out your use case into a
distinct 'server role = freeipa' eventually.  

To be consistent 'server role = classic primary domain controller'
should also be deprecated, but our tooling doesn't allow specific enum
values to be deprecated trivially, so I'll just add a documentation
note explaining that this is deprecated except where used by FreeIPA. 

> Given we are deprecating not removing it altogether, it is more of a
> task to me rather than a blocker. I filed
> https://pagure.io/freeipa/issue/8452 to update FreeIPA configuration.

Thanks,

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



