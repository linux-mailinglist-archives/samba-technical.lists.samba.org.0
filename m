Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1FE4EBDB4
	for <lists+samba-technical@lfdr.de>; Wed, 30 Mar 2022 11:33:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ku/IoWMqjDE1Z9W3ng5Ezl6EBw+auda0M2K5/NpMjdQ=; b=qYJ1v8CfjPXo+Y7OU+ofdCdcYW
	+V50iiDtHVaTHtZg6iNNF+jashY8J/R2OsmMAy/Pmwuh2vnrQCJstkY8qwxuEKuMX+owVX++DyWF5
	WnZJwNF2+SFOG8b2gHDOo2GDc7qt55CfINHQBhH7lUBVDkpy7YVDfUJabCn1JbNW7Ke96f0MpQprB
	A6WHD/plp7c1ALsLAZ2B4KilllnYMF5gzaUoisdVSy0Z9xb0mC2EhyXc/V+lPROCsHXeF5uhtRvuo
	NDYEeKOldNdPCs8z1xBLwrSwi0E8FsS0hGXbFTRpQ/MgNwWXJTVLRq645CybrtYS+Zn5VLxrkGqHF
	eCZ4jKIA==;
Received: from ip6-localhost ([::1]:40608 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nZUhn-006iIx-N2; Wed, 30 Mar 2022 09:33:31 +0000
Received: from mail.tranquil.it ([195.154.18.20]:47756) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nZUhg-006iIo-8G
 for samba-technical@lists.samba.org; Wed, 30 Mar 2022 09:33:29 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.tranquil.it (Postfix) with ESMTP id 69A8980E31;
 Wed, 30 Mar 2022 11:08:41 +0200 (CEST)
Received: from mail.tranquil.it ([127.0.0.1])
 by localhost (mail.tranquil.it [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ySKJwZ71kTFK; Wed, 30 Mar 2022 11:08:37 +0200 (CEST)
X-Client-Addr: 193.252.46.185
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tranquil.it; s=mail;
 t=1648631317; bh=rUyl5BZ4U8DUuimbLw/xNfP4XkD0fkFxBYGS5xpA010=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=QbGB9k3VnFRWOmioAKA3zO1AEEnzSDhZr8DLEE7DD8xc5+VeC3W6AefVx1qd6Y43/
 x6TlLe2uqXeDpJs5XEiTZupQRrgcGJUnB+eE6joO482MyZoRVicXYqDcGEGIs4L0JT
 cv05zo/Kvk11ZHDbJSJ1HnAPyVR0zaGoeTLJ+GY2HA4OH5Bt8CvIb68yM+jg1U0A7w
 l8Eldd3ZzW15DxOm4fxmKM/19qkljItNeu/ugu3lYizEzEipaKtKL97LHYhlmFSRKX
 QhBkGwk+3PAfSLA7Z0pPU3hg524lK70BzaPcGo0G5KHJzkM5Sq/OYRFy4XfG/+6xaC
 RCloiktpy9JFA==
X-Client-Addr: 193.252.46.185
X-Client-Addr: 193.252.46.185
Received: from [172.16.144.45]
 (lstlambert-657-1-15-185.w193-252.abo.wanadoo.fr [193.252.46.185])
 by mail.tranquil.it (Postfix) with ESMTPSA id CB6F880C4D;
 Wed, 30 Mar 2022 11:08:36 +0200 (CEST)
Message-ID: <f255591a-ecb0-b860-5ac7-582678caff86@tranquil.it>
Date: Wed, 30 Mar 2022 11:08:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Regarding Mac os behaviour in samba domain
Content-Language: fr
To: Prince Chaudhary <chaudharyprince64@gmail.com>
References: <CAM61p33mA2Oc7v_+iQj8-uuowyJJh2WTfbLGWQHUxiZdAmbLcg@mail.gmail.com>
 <6b999085-4639-ec62-0026-e99d26c5d6f6@samba.org>
 <CAM61p315WDPO0ZKzw2s4z7VPyJw5fV+9pgsesTmLjgo1uBT3tA@mail.gmail.com>
In-Reply-To: <CAM61p315WDPO0ZKzw2s4z7VPyJw5fV+9pgsesTmLjgo1uBT3tA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Denis CARDON via samba-technical <samba-technical@lists.samba.org>
Reply-To: Denis CARDON <dcardon@tranquil.it>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Prince,

Le 30/03/2022 à 03:46, Prince Chaudhary via samba-technical a écrit :
> Hi,
> Thanks for your reply, i have checked this issue on apple forums but there
> is no exact solution on it.

can you reproduce the issue by joining that computer to a Microsoft-AD?

Cheers,

Denis


> 
> 
> Btw thanks
> 
> 
> On Wed, Mar 30, 2022, 12:32 AM David Mulder via samba-technical <
> samba-technical@lists.samba.org> wrote:
> 
>> On 3/27/22 10:36 AM, Prince Chaudhary via samba-technical <
>> samba-technical@lists.samba.org> wrote:
>>> Hello team,
>>>    I am writing this mail after spending two three months on understanding
>>> samba and implementing on mixed os environment (window,mac,linux).
>>>
>>> Samba domain works fine in case of linux and windows system,
>>> But in case of mac when i am joining a mac machine to samba domain it
>> join
>>> properly and shows all domain users as well, all ok, but when i restart
>> my
>>> machine "other users" option which allow domain users to login won't
>> appear.
>>> I have to relogin in local user and then i have to logout then other user
>>> options appear and then i am able to login with domain users.
>>>
>>> Can you help me with this?,
>>> Why this is happening and what should i do? To make it happen all i want
>>> that other users option on login screen of mac os machine should always
>> be
>>> there whenever i restart my machine
>>>
>>
>> It sounds like the MacOS client is having a problem. You should contact
>> Apple Support.
>>
>>

