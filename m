Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A06E128512
	for <lists+samba-technical@lfdr.de>; Thu, 23 May 2019 19:39:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=ZiiEMs55ze5BLC/Bb1XXieUwv1UPNbSqcT0OWVNC/vc=; b=l+KO7vcGWddX4bHiWgyRDeTF9l
	UTfcpaPsHpRcpVuTVFhLc1ZdDMUbBzuiR63Fl8boDxFZxkcmHMXtDnIKDT64bIUMDVwzZtuIU4XtJ
	gUgSzZ8JOG9cmLi+f0NrZwru6gX+DjfFEzhiXY9WRLdBTTwSCkOrfOwZ7KDvWNxoyb2HtDw6oRlRK
	b0DFRYs+mFvr4W2nzsZiUzxDx56w+2IlF2rBeEc9CC1VX9BSb8VkFvtGKkqxUbg0HX5oeo21agn81
	4ERQqh2LxQM9MP0e3cts6Y7CseZFle+5D6w471rv/vFU5sPhjx05vSl1IiGTfF9Bqo/2uTabvDcB8
	Y3S/RaEg==;
Received: from localhost ([::1]:48070 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hTrgM-001Rp4-FW; Thu, 23 May 2019 17:39:10 +0000
Received: from [2a01:4f8:192:486::147:1] (port=19628 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hTrgI-001Rox-Of
 for samba-technical@lists.samba.org; Thu, 23 May 2019 17:39:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=ZiiEMs55ze5BLC/Bb1XXieUwv1UPNbSqcT0OWVNC/vc=; b=Pf45i+VmiUukR4+5cbg3FpL7YH
 yvJHDP8zmLa/tI0+18jpz5JivD9xX8z+t+XcK7D+Eou5Fk9GZjdSdCUQwl92QMrc9S4EQLQGrkS8N
 2YlFbAxjVAmN1fWuSFqVlVZ5v/pTwaT/0FrksEeMfWeVy8RZ66vwa2t5fPEGbcYLPQxE=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hTrgB-0001xJ-Uz
 for samba-technical@lists.samba.org; Thu, 23 May 2019 17:39:00 +0000
Subject: Re: samba-tool fsmo transfer - uncaught exception
To: samba-technical@lists.samba.org
References: <642f86fb-36b6-e647-ec52-e6e93bab2950@linagora.com>
Message-ID: <b2b6f46b-c819-c917-37f7-ead663bf4cf4@samba.org>
Date: Thu, 23 May 2019 18:38:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <642f86fb-36b6-e647-ec52-e6e93bab2950@linagora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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

On 23/05/2019 14:48, Julien Ropé via samba-technical wrote:
> Hi,
>
> I have been confronted to a problem with role transfers for forestdns 
> and domaindns.
> Using the command "samba-tool fsmo transfer [...]", I get an error :
>
> ERROR(<type 'exceptions.AttributeError'>): uncaught exception - 
> 'module' object has no attribute 'drs_utils'
> File "/usr/lib/python2.7/dist-packages/samba/netcmd/__init__.py", line 
> 177, in _run
> return self.run(*args, **kwargs)
> File "/usr/lib/python2.7/dist-packages/samba/netcmd/fsmo.py", line 
> 528, in run
> transfer_dns_role(self.outf, sambaopts, credopts, role, samdb)
> File "/usr/lib/python2.7/dist-packages/samba/netcmd/fsmo.py", line 
> 133, in transfer_dns_role
> except samba.drs_utils.drsException as e:
>
>
>
> This is using Samba 4.9.
>
> Looking on the net, I found several references of the same, dating as 
> far as 2016 :
>
> https://lists.samba.org/archive/samba/2016-September/203363.html
>
> https://lists.samba.org/archive/samba/2017-August/210120.html
>
> http://samba.2283325.n4.nabble.com/samba-4-7-0-AD-DC-FSMO-roles-transfer-error-td4725099.html 
>
>
>
>
> These show the error was found in 4.5, 4.6 and 4.7.
>
> Each time, the solution was to modify the file 
> "[samba]/lib/python27/site-packages/samba/netcmd/fsmo.py", by adding 
> the line "import samba.drs_utils".
> I have verified that this fixes the issue for me.
>
>
> I understand the problem is not seen in every environment, but it 
> still seems to be there for some users.
> If this issue is known and the fix is so easy, why isn't it applied?
> If this is because there is something wrong with the environments of 
> the people that see it, what should they (we) do to fix it? Is editing 
> the code ourselves a good solution, or does that hide something else 
> we should look at in our environment?
>
Can I ask just what is the exact command you are running ?

Rowland




