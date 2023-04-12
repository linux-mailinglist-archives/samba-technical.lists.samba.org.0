Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E80636DF66C
	for <lists+samba-technical@lfdr.de>; Wed, 12 Apr 2023 15:04:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=6zDCBkeL9qV7bbd/nOBY9exlfAe+n2Zz8oAEDqaG4Dk=; b=ZsASRYdRTiq995MzLjLJnCN69S
	d8Ba3yE6pMYhUtBuJfsapYi2rR1dUtRsR+kfl5M0YKEOC26jaleBz/XNNSaGOO/wB30WL7VnJEBwi
	LqEv+gcWpStw682kCOBRQruPjh/EhqIIqWq3sz3L5Uv6WgoWpvep7HBiHDtPfIHKkrOljR6YKhbUr
	HbQ9Kjr87Ctp2g3Ma+nD9UFfJfuoBWtF/1V7obwK2KPh+OwajYS9TONQwG/qY+ImgSsY04oB1H72A
	Pdc6UynOVgoww2+/OYYrcuYIiQhD/vupIBGmBZZn5XtK73DDbdtsmF3okLWcPt0pn5W6pvn9OnubW
	/p5i0ZTw==;
Received: from ip6-localhost ([::1]:49126 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pma9Z-000lcQ-6y; Wed, 12 Apr 2023 13:04:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24824) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pma9T-000lbQ-ED
 for samba-technical@lists.samba.org; Wed, 12 Apr 2023 13:04:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=6zDCBkeL9qV7bbd/nOBY9exlfAe+n2Zz8oAEDqaG4Dk=; b=0tKX3C25XNyE9wT/C/7EOCg8vu
 +4HduqP364GU0Ab9L0EGydkGn9micIXOd4v7Rq6SA3kINM8HbLBB9FOHodN2kHYpD6lLmyC+5Y3q3
 gSp1x2v1aLJ6uwbbcpDYrAmRnH+qr/gfUwyhI2sV7faAbF4EB9d9+mr6Z08PBzacUulU5puyeNPu0
 Eyu+m3AdLqxXS4BqCVB6dWZcg0oLMYmizWzSLaboMUf+IkBQ0FhF4Rw74/gl6+QvLBAOQk2PP0gh1
 tVKcLfDj5zwfejMgjlukb30e/Qb3btLu40Xqi2pwBrB2qcY9Fk1z+nKkPbFEhMeDGjlhFrprb/UnH
 zhooENgq599zT/JokI/V/gL3PsH4a3yL1aDnt2J81gIjMVPcwHLSUR/WVsDDxuxR4Vgk0thY3JZbZ
 XI3DMYDJmm0KKXhLEXn9GKexv1gZ+/nSaUyms1frptROwB4BRgyhmAXUoSdKx6OmypQM1JQyJ1+la
 HYMYYH9hAk3XltbgdjR9JpOR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pma9T-000iFo-4a
 for samba-technical@lists.samba.org; Wed, 12 Apr 2023 13:04:43 +0000
Message-ID: <222fb09f-249d-54d6-ad0d-54159c96bbd9@samba.org>
Date: Wed, 12 Apr 2023 14:04:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: How to test samba LDAP parameters with openldap tools, eg
 ldapsearch?
Content-Language: en-GB
References: <a8fdda06-765b-b26e-717a-76b794035cb7@comind.io>
 <19d97578-4936-6197-871a-5996f32cfd54@samba.org>
 <d1cc4ccf-a8a0-0ef5-e418-1e406490fa80@comind.io>
 <0ca6506a-af76-a2ec-626a-5ee11ef7952e@samba.org>
 <04c86436-6665-354f-84b5-479613a81545@comind.io>
 <93859d7c-eaf9-0a93-a236-53a172381782@samba.org>
 <CAB5c7xoHu91S2W6Ux=RfrhJRJ-_FWgPmgPJM7KzwCvuNypYTMQ@mail.gmail.com>
To: samba-technical@lists.samba.org
In-Reply-To: <CAB5c7xoHu91S2W6Ux=RfrhJRJ-_FWgPmgPJM7KzwCvuNypYTMQ@mail.gmail.com>
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



On 12/04/2023 13:58, Andrew Walker wrote:
> On Wed, Apr 12, 2023 at 7:51 AM Rowland Penny via samba-technical
> <samba-technical@lists.samba.org> wrote:
>>
>>
>>
>> On 12/04/2023 13:37, Jan Andersen wrote:
>>> Hi Rowland,
>>>
>>> I noticed something odd about the logs: it seems smbd generates one both
>>> for the workstation's name and one for its IP address - I didn't attach
>>> the latter, so here it is. It seems to have more detail.
>>>
>>> Jan
>>>
>>> On 12/04/2023 12:06, Rowland Penny via samba-technical wrote:
>>>>
>>>>
>>>> On 12/04/2023 11:39, Jan Andersen wrote:
>>>>> Hi Rowland,
>>>>>
>>>>> Thank you for replying. I wiped the existing logs, changed the smbd
>>>>> service to include '-d 10' and restarted, so I would have logs
>>>>> without too much noise - please find them attached along with smb.conf
>>>>>
>>>>>
>>>>
>>>> You appear to be running Samba as a standalone server with an ldap
>>>> backend, are you aware that such a setup is two parameters away from
>>>> being a PDC ? If you comment out 'server role = standalone server' and
>>>> add 'domain logons = yes', it becomes a PDC and a PDC (from 4.8.0)
>>>> requires winbind to be running.
>>>>
>>>> Rowland
>>>>
>>>>
>>
>> Before Samba 4.8.0 , smbd could directly connect to the domain
>> controller, from 4.8.0 smbd now needs to go via winbind.
>> Now I know that you are not strictly running a PDC, but what you are
>> running is the next thing to it, so I presume that you need to run
>> winbind, you do not need to configure anything, just run winbind.
>>
>> Whatever happens, you should be aware that Samba is working to remove
>> SMBv1 and things like PDC's with it.
>>
>> One thing I did notice from that last log, you are not using SMBv1, try
>> adding these lines to the smb.conf:
>>
>> server min protocol = NT1
>> client min protocol = NT1
>>
>> Rowland
>>
> 
> It's probably also worth noting that doing this requires your LDAP
> schema to contain all the fields you need to generate a valid passbd
> entry for users. Do note that using this schema requires storing an
> MD4 of your users passwords _and_ having those accessible to the file
> server (hence discussion of this being a de-facto PDC). My general
> feeling is that this goes beyond my risk tolerance for a production /
> business environment.
> 
> Andrew

Totally agree with you Andrew, I wouldn't use it in production, but from 
my understanding it did work and presumably the OP has upgraded and it 
has stopped working.

If this isn't the case and it is a new setup, then I would suggest the 
OP stops what he is trying and sets up a DC instead.

Rowland

