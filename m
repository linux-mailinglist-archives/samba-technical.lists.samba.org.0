Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9200952FE01
	for <lists+samba-technical@lfdr.de>; Sat, 21 May 2022 18:01:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:subject:Date:cc;
	bh=j637ml7RM4j9vwOTj3WqxqSdlKfT3e7fGlVqqHc+6mg=; b=gEi2MYXcUtewqa0HKwtAITPvUt
	iZjkK9Gg4M4QXwa1iL7RcNEHsxNyMM1gQT9903pZ/F/qTIuS0g29eN43bTE4G/StsUWhazgAmzjfv
	sdEyAQY/+HB9AZWDQ5gzPPy/FyZihIrMMCdBSIhzaq9TOgNb0Cr0kjVwB5yTaR+fW1g2f9ePdjJ4X
	hf4tPs6vg5H+wDxWG3h1pX8voxHIimAwyefOAHKFs/DnDa4cetnEkRPXsUgCAntmvCG+peapU2nAV
	uDxGgYzISkYFa13BrqG5iBnq2yC2ApnAzzKyFYPpfybIAFZT6vVc1XZRBj499WTh+KXMA2ume8jTB
	w8oPvuxA==;
Received: from ip6-localhost ([::1]:40568 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nsRX0-002NuH-8w; Sat, 21 May 2022 16:00:42 +0000
Received: from mail.itsd.de ([80.153.216.99]:45851) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nsRWq-002Nu8-2Q
 for samba-technical@lists.samba.org; Sat, 21 May 2022 16:00:38 +0000
Received: from mail.itsd.de (mail.itsd.de [192.168.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by securemail.itsd.de (Postfix) with ESMTPS;
 Sat, 21 May 2022 18:00:20 +0200 (CEST)
Received: from [192.168.0.220] (unknown [192.168.0.220])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.itsd.de (Postfix) with ESMTPSA id 06AFE800D9;
 Sat, 21 May 2022 18:00:19 +0200 (CEST)
Message-ID: <a832001c-1c26-ae6e-c9f5-b3cd15605851@itsd.de>
Date: Sat, 21 May 2022 18:00:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
subject: Re: ldap simple bind problem after upgrade from 4.14 to 4.15
Content-Language: de-DE
To: Andrew Bartlett <abartlet@samba.org>,
 "samba-technical@lists.samba.org (samba-technical@lists.samba.org)"
 <samba-technical@lists.samba.org>
References: <e7d2c0a2-ce6c-e5a4-c100-f429acb0cb58@itsd.de>
 <957f6a8362f2643902b839ae1defd02770ded806.camel@samba.org>
Organization: itsystems Deutschland AG
In-Reply-To: <957f6a8362f2643902b839ae1defd02770ded806.camel@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SM-outgoing: yes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=itsd.de; h=message-id
 :date:mime-version:subject:to:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=2wEkSAM0x
 XYesL2PecCQPKsoFc7T0JakbcyZN6HQXes=; b=HihBARHNEovsjY2+o5Gd0tdvx
 aU7AZhfVPsnNFWYK4ThOjH+fuDrLPSDk0v1L29ctx6qQTYGQYLaQZ6cAp8YahgDL
 /6/XEiQw2yoXz2+BfZvp2JUDEBIlq3f4o3QriQAaQjTpSoHk89TV1Fpyy6Yl4dG8
 PzvX9zVYlYi1B0sy6vQmzsKS4sWtUzp9p4BLfbkv4w/ghDszHI+pv1XMslFqxqS5
 mEJhrhwV6vJsb0ovi/GhLcqQCrsUOaq2LVHg6jOFbT5KjOPI+GrO/yN7OFrqcIHJ
 OVuhk0vddGWeLjvMs4NzeTdf1I7i9xBINLcmRCzrJEbSDCTzMI7vTXWTU7YZw==
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
From: =?utf-8?q?Dr=2E_Hansj=C3=B6rg_Maurer_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Dr=2e_Hansj=c3=b6rg_Maurer?= <hansjoerg.maurer@itsd.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andrew


Am 21.05.22 um 00:38 schrieb Andrew Bartlett:
>
>> The domain above is a rather old one, migrated from samba NT DC with
>> openldap backend many years ago
>>
>> I tried to setup a fresh 4.14 AD-DC Testsysstem, migrated it to 4.15 and
>> the problem does not occur.
>>
>> What does the
>> NT_STATUS_INVALID_WORKSTATION mean and could the problem be DNS related?
> Do you have a list of workations set in userWorkstations on this user?
>
> For this version we fixed a bug with a crash in simple binds going to
> winbind (RODC) and filled in a "workstation" for LDAP binds, which may
> have meant this policy started to be enforced.
>
> Andrew Bartlett
>
>

thanks a lot. exactly this was the case.
The bind user we use to connect to ldap service has the workstation 
option set (do not know why :-))

I have upgraded again , deleted this restriction  and simple ldap bind 
works  know

regards

Hansjörg


-- 
Dr. Hansjörg Maurer
itsystems Deutschland AG
Erzgießereistr. 22
80335 München
Tel:   +49-89-52 04 68-41
Fax:   +49-89-52 04 68-59
E-Mail: hansjoerg.maurer@itsd.de
Web:    http://www.itsd.de


Amtsgericht München HRB 132146
USt-IdNr. DE 812991301
Steuer-Nr. 143/100/81575

Aufsichtsratsvorsitzender:
Stefan Adam
Vorstand:
Dr. Michael Krocka
Dr. Hansjörg Maurer


