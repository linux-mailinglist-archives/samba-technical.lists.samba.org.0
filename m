Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B3723564A
	for <lists+samba-technical@lfdr.de>; Sun,  2 Aug 2020 12:31:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=RbtP0Jzj3yYoeJOHHaiuJzrunoh018wulixPIDXDmIg=; b=j71TfCPUnKr5zqSz3F7n1fiaJV
	0aX8P3Syojpft1qfX+c0R2LtkSLcAlx4S9pv2GEpr3h8kIzQpxTA0iBtt+YSvoS336sFP4kj9S5GI
	BJ6YYCNC2GntVy4g0tK79NWaHf5D7DX6YUAMIsT1XPoNOGaT1B5KfoWUv7X5nHftsuyCEOV8eN8kO
	phf2oKpqoEA4z1QkeGPv+xGt+gcxZqUrhlfiA3uVLr4DrjvS1Kcw/Xg2u2Jwzuh68Xf1Ts68NlycQ
	ZJe3jFdxS1vVf9l2o1wuR7dM6NkvkqBSAE7lZep83fMCwBuZjtQJOhvQdJL74ORq8Bg+6T/lrAPoF
	B7iZ05WA==;
Received: from localhost ([::1]:36216 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k2BGs-00CGKz-44; Sun, 02 Aug 2020 10:31:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60834) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k2BGm-00CGKs-AI
 for samba-technical@lists.samba.org; Sun, 02 Aug 2020 10:31:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=RbtP0Jzj3yYoeJOHHaiuJzrunoh018wulixPIDXDmIg=; b=zQNO9U3lmXUrOAvuYbvCEjZdjB
 EXTzNo4VchOv31fbhY0q9zlSziRNEDXpSxODz079SDu5Lmv+vB5q8h8bZDTZpxsS5wkjL+0jZf5He
 yqDm+IGarXpeWZuTNHs1+gfvWdPBKeaaLjpL5D1rCEyCoKgbD5e02xLi4I3mzrc6UKIL8BV2DJtSv
 UhX7wNe7y4OCxGbpjEnp8JXtu9LJEAEacnqAI7gtm48/RaH+ArlnbODE8yCeANDqAzZWkfpKtMGHc
 uZpfB9hy5T7VdK3+hZHuAbpWjNiRMdyQaVfMyORxmLeaVPEapcB/X2V5Ir8oOuwvawNloOTDRKKbE
 OR/H9J5DeHkK9WG2Sv9H+3D8hXTd67L+Qg08rKdKfNTuKMPPgSLkifycmUtmWy1Xab7ShUnTx95LP
 /sDKFLrtkjbnEAy6SOpfmaGtkxZKpQKlPTvQYD9n7ceI6wjc74C0Kz2AIza5DQM/2TsZ3DKsYIVyM
 I5PzIhqh+VB8PjBhj5/QHHgv;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k2BGl-0006pe-HV
 for samba-technical@lists.samba.org; Sun, 02 Aug 2020 10:31:07 +0000
Subject: Re: GPO Get Inheritance Clarification
To: samba-technical@lists.samba.org
References: <CAH72RCXCJ1ETQNV7Ysxp89jTQtw_ZQg+2HW0x+ouWdwrfsAY_g@mail.gmail.com>
Message-ID: <4104ab8f-0e82-59b4-9f95-b2dc759645dc@samba.org>
Date: Sun, 2 Aug 2020 11:31:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAH72RCXCJ1ETQNV7Ysxp89jTQtw_ZQg+2HW0x+ouWdwrfsAY_g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 02/08/2020 11:07, hezekiah maina via samba-technical wrote:
> I'm working on Group Policy Object management as part of the GSoC project.
> One of the commands I have come across is the samba-tool gpo
> getinheritance <container_dn>.
>
> I have obtained the containers using:
> samba-tool gpo listcontainers {6AC1786C-016F-11D2-945F-00C04FB984F9}
> (the last part being the gpo I'm obtaining containers for)
> and the result was the following:
> Container(s) using GPO 6AC1786C-016F-11D2-945F-00C04FB984F9
>      DN: OU=Domain Controllers,DC=samdom,DC=example,DC=com
>
> What should I pass in as my container in the get inheritance command?

The output of this search:

ldbsearch --cross-ncs -H ldap://dc01 -P -b "CN=Policies,CN=System,$(echo 
"dc=$(hostname -d)" | sed 's/\./,dc=/g')" -s sub 
'(&(objectClass=groupPolicyContainer)(name='{6AC1786C-016F-11D2-945F-00C04FB984F9}'))' 
dn | grep 'dn:' | sed 's/dn: //'

Replace 'dc01' with the short hostname of your DC.

By the way, the policy GUID is for one of the default policies, you 
shouldn't modify the default policies ;-)

Rowland


