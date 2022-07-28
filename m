Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 81528584015
	for <lists+samba-technical@lfdr.de>; Thu, 28 Jul 2022 15:36:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=kxtwZ/Q9gO0s2lXATdqM05fI5CR3FOkESmzsPRxUNO4=; b=KxTZDUYXBbWnJBwiw1oOfJ9iHq
	GLoFz7QCENht1fovWFNYHORu5Wj6LeegE8AS3tR/w6mgGwL+D2PmyRem0y7UuwKw9IGUWthex0SYi
	ChPxct4faF5OQwgv7IGm9AyFBso2yryaHYSKBE1j7qTdpIIp/DxGLwgB5MaNbLB0mMWN91/qIxwvB
	LJZKnDsDGL19XVXcA9x24zoVokL9+WcuHmBlDhV6TD4wposJNOQI+oa+knJ4I9jv4WpyAzZVaZErF
	AktTefnBQq03f/9eN2mLp7HrnlDtDjWLdyiuOW5vlPBEUGwOpDBszZJTD+APhmP3clXwZMu/s56dJ
	iWJPdkIQ==;
Received: from ip6-localhost ([::1]:18690 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oH3fN-002UVo-9k; Thu, 28 Jul 2022 13:35:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16070) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oH3fI-002UVc-7D
 for samba-technical@lists.samba.org; Thu, 28 Jul 2022 13:35:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=To:From:Date:Message-ID:CC;
 bh=/OtMUL6SPHJnSOE5Wf5ydYxRMOCCodhfgA8jmfhA6ZE=; b=mceWRuwSqRmVzV91rX4H8WQlb7
 7rC5Qlj2BKSHW8z+ybKAde5CBuxZXO+YU6cNKVmBB5vZQfKBI3k+kUtvW0MnyMpv0hqQyoqEwx8mq
 x8WUucUGnFdCyf+twmCOIveprTtFEY3cq1LhcGp1dY6BSXICFHE7j/pny+dGAsdyGeQRKU62//4pI
 wDIedPzmO586SwSC/ZnU9Zi/kPimCT11gheTt/WCHYPUYAU9zZmoe19yleOHBtD6UB+QJr1M507SS
 LFx0Xa/PiGHbT8xNpO174ynLPvGKJ1VqyjDHyqLS34Z0WlLuFNCF8Z4i0oWp6l2bxdd6PCBofK5e7
 e2wYvcRLTm6X+R7PD0t/RJ81hCoPlv9reEmjFd6UAQtbmSIQn6LAfMf4noKvQz7VJv2AM/Re8C8RO
 P/C5foWh1AGczdQ4CV9ofVwB5TD2Qc8BdkJ0YeAp1l1iXwq0ehEYIG9p7B79sJE8hEjYAonvpGyYt
 8Xx1973EVL/Pj6BsEoL+mf2F;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oH3fH-0072C9-K6
 for samba-technical@lists.samba.org; Thu, 28 Jul 2022 13:34:59 +0000
Message-ID: <c1ae02a0-a7bd-52de-718b-4f3da5f958fb@samba.org>
Date: Thu, 28 Jul 2022 15:34:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Release Planning 4.17] Samba 4.17.0rc1
Content-Language: de-DE
To: samba-technical@lists.samba.org
References: <c11c0282-b41b-f3e7-92c5-7171c9f13d5f@samba.org>
In-Reply-To: <c11c0282-b41b-f3e7-92c5-7171c9f13d5f@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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

there are still some open tasks, so the 4.17.0rc1 release has to be 
postponed.

It's now scheduled for Monday, August 8.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.17
has been updated accordingly.


Best,
Jule

Am 11.07.22 um 12:17 schrieb Jule Anger:
> Samba 4.17.0rc1 is scheduled for Thursday, July 28 2022.
>
>
> https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.17
> has been updated accordingly.



-- 
Jule Anger
Release Manager Samba Teamhttps://samba.org  
SerNet Samba Teamhttps://sernet.de
