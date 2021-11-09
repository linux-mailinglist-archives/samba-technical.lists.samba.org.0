Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DA79244B3A9
	for <lists+samba-technical@lfdr.de>; Tue,  9 Nov 2021 21:00:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=mzUpbZzV6GlFdYDuOWJlMNv4AFsHQHs9siTYOu1H22M=; b=pddK89Imf1x6Iew4cO8aRvMk0Y
	f0My4HvPGt9hxwBcRFZH7Sf1pm4sPzQAilE0nuVe5mm1hCccXCJIRS963VLxPaUcDTNN9/Hbp/uo0
	x2ETH5n/nenj8RM+3gq8VDMw9LxnxBQIhqjQVsFJnhiyS9x2G8aSl/t+9RE84B06BoCmzit2uwWkw
	yGsc71gCAfMQmbLfj8Rlmme1pf8e0pydC74zt5ZOMT9L5RBsrKgVXHf4Lmobszv5URcdPZwEvqBpz
	dtA1drfifHRoczjPX6X/vjM/i45NWM/9NxBJRElOgDl9nbPO2Q5plFPGTdwnM9qLOXwHeova2bLVJ
	nx/TI/7g==;
Received: from ip6-localhost ([::1]:48206 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mkXGw-0095bp-EQ; Tue, 09 Nov 2021 19:59:12 +0000
Received: from p3plsmtpa11-01.prod.phx3.secureserver.net
 ([68.178.252.102]:51324) by hr1.samba.org with esmtps
 (TLS1.2:ECDHE_SECP256R1__RSA_SHA512__AES_256_GCM:256) (Exim)
 id 1mkUDm-0090pl-2Y
 for samba-technical@lists.samba.org; Tue, 09 Nov 2021 16:43:44 +0000
Received: from [192.168.0.100] ([98.118.115.249]) by :SMTPAUTH: with ESMTPSA
 id kTWnmwtOV7YfNkTWomEtyT; Tue, 09 Nov 2021 08:59:18 -0700
X-CMAE-Analysis: v=2.4 cv=E/wIGYRl c=1 sm=1 tr=0 ts=618a9ad6
 a=T+zzzuy42cdAS+8Djmhmkg==:117 a=T+zzzuy42cdAS+8Djmhmkg==:17
 a=IkcTkHD0fZMA:10 a=vnREMb7VAAAA:8 a=hNOTfydlAAAA:8 a=YRg_dh6e-o_V8Oi-LqQA:9
 a=QEXdDO2ut3YA:10 a=fZunMKNLB757I4m4HZ3M:22
X-SECURESERVER-ACCT: tom@talpey.com
Message-ID: <a618a531-c72a-ccad-db0e-035ddcd48dc7@talpey.com>
Date: Tue, 9 Nov 2021 10:59:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Storage Developer Conference 2021 Samba Talks available.
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <YYVty5SVXZPXNkVo@jeremy-acer>
In-Reply-To: <YYVty5SVXZPXNkVo@jeremy-acer>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJS8VlOI9DxC9eXI2yRtox+1/8xMRbXhiYrhTYdEJa4nBgHCuMOj2FlunvyWXxEisuxkhb1MS0qWNQT1PHu1uZAnoz2WLacMPpm44WSYOsrLAPcuPp4a
 ByzY312f/qbLiXohj+cb24qMdPwx9LtZc889Q/FJj7C1BMX2wetXegM9ltKvvcvFs3JMG5ncfUFBKyIsWxJiaECn9M2gNJ44lTA=
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
From: Tom Talpey via samba-technical <samba-technical@lists.samba.org>
Reply-To: Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


On 11/5/2021 1:45 PM, Jeremy Allison via samba-technical wrote:
> On youtube !
> 
> Ralph on "The New Samba VFS:
> 
> https://www.youtube.com/watch?v=D9EZO3gkT9U&list=PLH_ag5Km-YUbveQ0cD-JD8xP0F-1R98UF&index=40 
> 
> 
> Metze on "Samba Multi-Channel/io_uring Status Update":
> 
> https://www.youtube.com/watch?v=fnA4imgBsUo&list=PLH_ag5Km-YUbveQ0cD-JD8xP0F-1R98UF&index=56 
> 
> 
> Both great talks, enjoy !
> 
> If I find more Samba talks I'll post them :-).
> 
> Jeremy.
> 
> 

Steven Tran and Wen Xin (Microsoft) on SMB3 Landscape and Directions

https://www.youtube.com/watch?v=PQtPnNPdqLU


Steve French on To the Cloud and Beyond, Accessing Files Remotely from 
Linux: Update on SMB3.1.1

https://www.youtube.com/watch?v=j94pHGyB1z4


The entire SDC2021 playlist is now public:

https://www.youtube.com/playlist?list=PLH_ag5Km-YUbveQ0cD-JD8xP0F-1R98UF

And searchable via SNIA Educational Library!

https://www.snia.org/educational-library?search=&field_edu_content_type_tid=All&field_assoc_event_name_tid=3939&field_release_date_value_2%5Bvalue%5D%5Byear%5D=2021&field_focus_areas_tid=All&field_author_tid=&field_release_date_value=All&items_per_page=20

Enjoy.

Tom.

