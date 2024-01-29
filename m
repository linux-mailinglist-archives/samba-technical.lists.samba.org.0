Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEFA840870
	for <lists+samba-technical@lfdr.de>; Mon, 29 Jan 2024 15:34:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=3ezf85LXhgUu9qKFaXmbY32i4fBQhVC6+Zj5KnZh58M=; b=Wh7/efnVnOO9l9ToS9Lbc8Dji0
	ibgq7LURkoRpOKT18CFQJ5HENqW32o/+b0Z0BY5ptjAXYxbk/DbLcyXaWRovHk8mlLA89G4ab52De
	7V6H40Ka9zHxAYqfOPoawHHstLUiXiyRX8jCjLdgXsKbZK+9ZqSMo3pRn+n/uxq4vLmEtyTGyFEh/
	U3goIRtrG0He2B/CvkwUjwNdOVLbffLbfJb9mvbPxrmLe9u8Q9mLrW7U5BTTWd9XKmxJ5yaPL73wD
	p0L3kxSkmUz0+k5O6/3gFwuymJ3QfAKSfqU8ZmeOVvmmxlALM5gOrNeOWonCQSCIjjl+h1Wq2ZS5f
	al/PjHnw==;
Received: from ip6-localhost ([::1]:51954 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rUShg-004uat-7l; Mon, 29 Jan 2024 14:33:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23720) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rUShb-004uam-VC
 for samba-technical@lists.samba.org; Mon, 29 Jan 2024 14:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=3ezf85LXhgUu9qKFaXmbY32i4fBQhVC6+Zj5KnZh58M=; b=O2rkS6uU4Xpe3+juB0ERSsf0k6
 nxpMjWZ9LF6Iuwci7qKcQIUooAwsHv2f5ZyMSnz9AUE8KlPt3YODS2EDOc4wD+jDqK4CCyRRDOtH1
 ZFJR8SgLd2ILybz2KsYCvWKxZOWSh4v2E8YXzy/AFv84z7J4v4MrEAr1NpJd9ZiKbsE7Kc9/uSaVw
 R+0pMleS1upMwWicl0HwF4v6tfZlG+u1q8CcxBNg+Ab7TRzPZxlfXn0s9jy3cnPlCKZj2pOAxmb0W
 QP8+nBHgwC+734QZcUFnfpLgZyfynWFb8E3Qv9elM/LpdQ5J4wl94yTC4UqXN4WP+jNm06quXcPhx
 ifDwgCmf1zphqxSkarvDMVSjF++hUNVQ3N0bx3matbLtCwP81IdZ0lipPiRdMtctJ8ygK2wqKqmeE
 lvgmiMAqnnHCZvjfMDyiHYcV1ilIVETIJ3Le8NbX/YnxrDzAVMUtjQRCULvqU9TumAc2RRZNuHocW
 Fcc8XDKJFQbpWqDM+Ft22FIl;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rUShb-00ANVn-0d for samba-technical@lists.samba.org;
 Mon, 29 Jan 2024 14:33:35 +0000
Message-ID: <11422bdd-3c46-0ca3-3431-e2c0e165c4d9@samba.org>
Date: Mon, 29 Jan 2024 07:33:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: Azure AD (Entra ID) join specification
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <c2139c3b-678d-55b7-4ec4-88db5215c487@samba.org>
 <b168d73e-2375-4289-acac-c467c58eb479@tranquil.it>
In-Reply-To: <b168d73e-2375-4289-acac-c467c58eb479@tranquil.it>
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
From: David Mulder via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Mulder <dmulder@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


On 1/29/24 2:37 AM, Denis CARDON via samba-technical wrote:
> I guess you are trying to look for a pure Entra ID join, but if it is 
> for a hybrid join, my colleague Simon at Tranquil IT did implement it 
> in our pure Python AzureAD Connect implementation [1].
Yes, right now I'm working on pure Entra ID join.
>
> We don't use hybrid join much (our clients use WAPT [3], not Intune 
> for device management), so it may not be complete, but it did work 
> when we tried it for basic use case.
I'm planning on working on Intune management.
>
> Be sure to use the python-wcfbin from AndreasLrx, there is a bug in 
> the upstream xml binary library to communicate with Azure.
>
> [1] https://github.com/sfonteneau/AzureADConnect_Samba4/
> [2] 
> https://github.com/sfonteneau/AzureADConnect_Samba4/blob/main/libsync.py#L233
> [3] https://www.wapt.fr/en/doc/index.html
Hey, that's terrific! I'll look into it. I was planning on working on 
hybrid join next.

-- 
David Mulder
Labs Software Engineer, Samba
SUSE
1221 S Valley Grove Way, Suite 500
Pleasant Grove, UT 84062
(P)+1 385.208.2989
dmulder@suse.com
http://www.suse.com


