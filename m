Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2B14E18C
	for <lists+samba-technical@lfdr.de>; Fri, 21 Jun 2019 10:01:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=BdJTrCBG8YYheltpWZTeaTNgxqfKJGPEFksBmeZF/Dk=; b=MS8shFpTSI7OoRBMOTzpZ8EnyR
	oQ38mfMiUrQ+YGCVakdQhY1zidyylyCzBfGH+DIFj81TCN4WLNlUcebMm5zaYAFwsxgo9ntmFOJzO
	XBlLsnatMv3nRuPKbXGczyazzf8fCaK9QB6tnz2kfh55PSkRtMXqDGTkqsdB51PI64U7FzMSE1t3s
	/epfrDIht7ZmLERdtychmYnV43Iq8LZw2Cks1fajCuk7cgRMCuVOy+NuufdDOYpV/cQwSiTZinTr6
	Mvh7UpHpYs3dL4kFgYDW/X5FvVDjiNC+tIBUpuyMMoyAOgKdrY1nIk6AYyxuTpJ3qwg90+4XVFhXU
	moJq+X8A==;
Received: from localhost ([::1]:61422 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1heEU5-000tid-FN; Fri, 21 Jun 2019 08:01:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54070) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1heETv-000tiW-Mn
 for samba-technical@lists.samba.org; Fri, 21 Jun 2019 08:01:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=BdJTrCBG8YYheltpWZTeaTNgxqfKJGPEFksBmeZF/Dk=; b=R0KztccwIUd7cedvmtCOBpy1fA
 2RtXDjkuOI18UwZWdI83aAjKEkOuYZTao2HkqBPiKCo5BQi8H/vABExb1hbBT4qBvdAn+XZVVy2SV
 NvC1fwchOoxCb5U6JMMHKvEwKlt+foNFL9OYDuGiRkdFR8BovwgPys1YPGA2PSXuCets=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1heETq-0008PY-M2; Fri, 21 Jun 2019 08:01:06 +0000
Subject: Re: Document GitLab as the only way to contribute to Samba?
To: Andrew Bartlett <abartlet@samba.org>
References: <1561079117.28284.21.camel@samba.org>
 <20190621111436.342f713e@martins.ozlabs.org>
 <1561082290.28284.28.camel@samba.org>
 <0278c810-0cd8-5ad8-3a39-ab1e7fc70b8f@samba.org>
 <41b3968e83cfbd74a060b7f51f4c719be4ddab58.camel@samba.org>
Message-ID: <290c2679-895e-9be4-a7d4-03a5ab8bd265@samba.org>
Date: Fri, 21 Jun 2019 09:01:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <41b3968e83cfbd74a060b7f51f4c719be4ddab58.camel@samba.org>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 21/06/2019 08:44, Andrew Bartlett wrote:
> On Fri, 2019-06-21 at 08:13 +0100, Rowland penny via samba-technical
> wrote:
>> Sorry, but I do not think it is 'wrong' to not want to use git-lab.
>> Perhaps we should 'prefer' people to use git-lab, but we definitely
>> shouldn't tell anybody off for sending a patch directly to samba-technical.
>>
> G'Day Rowland,
>
> Can you elaborate a bit more?  Can you explain a bit more why?  Can I
> help you set up your account?
>
> It would be really good to have you on-board.
>
> Thanks,
>
> Andrew Bartlett

I wasn't actually thinking of myself.

I know what you think of my programming skills and I also know the 
direction I think that samba-tool should go (it should be storing the 
next u/gidNumber's in AD) is against the rest of the teams views, so I 
have given up sending patches.

I was thinking of other potential users.

Rowland



