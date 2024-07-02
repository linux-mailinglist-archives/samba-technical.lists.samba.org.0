Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 98ECD9238B8
	for <lists+samba-technical@lfdr.de>; Tue,  2 Jul 2024 10:47:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=B6t+z/w+6kVk3Osdlp5lQ7zYTpA0RXwBcHKYu14QuKo=; b=lpot28nnlveJIz2hBM+dX+jDH2
	BpnOwpJr+glhOTDnGVp5gfHVRvzRVm88XiDMf2ZwCETLTVXNqTIj4U0Szsqvv2yCarloDs5Cas12x
	FJeWLvA7jHnt6IMDJQS9AnavAisz9H2/oMWWAYm5X+fdk1jgGt+u+FO+Vlv9kCE9H2IXL7FetWlyh
	wPfjBU3KBBNBi/URXiwXRKirJUTer6IiIULqdiwuaV6beX5VyJTZHbCOXQM1LtgupoMs4cdPhNEhD
	EYUR41PBpS+3UUCeeLCODv1t09okvdFAg5AADEBkOTjwuWodr9E4rTTm8CDEFR3yTBU4fNPvT/h5H
	wmgX042A==;
Received: from ip6-localhost ([::1]:29928 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sOZAV-0033py-BA; Tue, 02 Jul 2024 08:47:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20716) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sOZAQ-0033pr-Lo
 for samba-technical@lists.samba.org; Tue, 02 Jul 2024 08:47:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=To:From:Date:Message-ID:CC;
 bh=B6t+z/w+6kVk3Osdlp5lQ7zYTpA0RXwBcHKYu14QuKo=; b=kFvosnYNVPbS7OswrHHrwUX2V/
 2Ofc0B4j57eWJPQ1tWwlngA/5V5F+ykLbZWunUI1JECc0lxN/+OQVY0bQLvD+cNjRzon587zTO/8q
 ITcMLOYARbj2XpccHCp4uvYDN2Wxw8hjAMfmgmsqngjJyK93MZ2HgIqvlzCKYk0aOJlMdCEUpC393
 MfYLFoPGyOyUmrphMrzu6sySuUbhft3BlIk43GBWMLg0vuS4TmWX8yiwUw/fv4qI+7VkEqAGOhSSw
 Xgxsla0tinjy3FBYhnmBenRkfVQ5XD96UW1bvnP8PrWcNXL6TuvfbzG1wcrnTQvOXtUyAcMF8LFBJ
 llo1PPeSiwb3+zf4o1sacp64A7Smxj+0wLZLcOXc5Zmt8qagy1wjLuXgsw/6o7VaY+GSre0ldqEYa
 5lQiD3mQ6j7pF85z8tw/sBKlHl4+uApX6PKgcnmzEaR0O3fW+hUuonAaRq0TJ5feYuJ4DolloyQ9a
 GJYVm+doBfFeA8jGnMo0y7So;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sOZAP-0020QX-2k for samba-technical@lists.samba.org;
 Tue, 02 Jul 2024 08:47:13 +0000
Message-ID: <6e72728b-edad-47c2-aeea-7b68358d19a5@samba.org>
Date: Tue, 2 Jul 2024 10:47:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Release Planning 4.19] Samba 4.19.8
To: samba-technical@lists.samba.org
References: <d980bea9-5040-4b8f-97e9-3261f7ed7751@samba.org>
Content-Language: de-DE, en-US
In-Reply-To: <d980bea9-5040-4b8f-97e9-3261f7ed7751@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.19.8 will be rescheduled to Thursday, 15 August.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.19
has been updated accordingly.

Jule


Am 10.06.24 um 17:44 schrieb Jule Anger:
> Hi,
>
> Samba 4.19.8 is scheduled for Monday, August 12 2024.
>
> https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.19
> has been updated accordingly.
>
>
> Jule
>

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


