Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7F022B5A0
	for <lists+samba-technical@lfdr.de>; Thu, 23 Jul 2020 20:26:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=+8TNSlJuJxxevlz957LmIg2NNbXDJcaGdndihdx4YFk=; b=FlWWAO0WgQFSYib6e9v5hTdRoQ
	q6God2JMlAJNnLN6V7kx7dyIPjnMzSB9Ka/TfMtMRTnbzdpraYhrhh6qOBg2WS4nnPyvXXvxm+7o8
	1ZPvG18vps6TTpv15BDoWf0rOc+WJ60iIORyov0foNPBvwg1hAK3kB1g+uXsvA9AiHYPjpbL4NPW2
	kdeipOViBJB20y+XAvOPyo5fZBzRrsNOUam48cJBlb2B7rza+fxuVKz5yrqydWbNvGyeDH7o9QK32
	UBYvSoywrGfsMfSoL/ku0Zk+Tw3ntABBrnIh4FCkplGfa1EGo+IuT41b/gjdHQ6kxZI3oiaY/Hrzw
	yjOKYzmA==;
Received: from localhost ([::1]:25264 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jyfv9-009Vkf-5A; Thu, 23 Jul 2020 18:26:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33534) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jyfv2-009VkY-Rk
 for samba-technical@lists.samba.org; Thu, 23 Jul 2020 18:26:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=+8TNSlJuJxxevlz957LmIg2NNbXDJcaGdndihdx4YFk=; b=xU1UbZTst4Bz8vloAC6r04Cwls
 M0Hm/y/LJzkns19C7hyDMz9qbiRtoytf8mhcRnoYb9k/DNWbn2zgfoywjKtu0Ye3cQGrWGVARniPF
 fPYIJoXcMmtGnNigSCb7/jweELHHVd1yzgV47VswmBAJRfxu/k2S+M9kea4jrdwLD2QF9//kmaQwm
 RXJ8GFrMoqY+afHoimdQPBG+05f5xJg4IuVRUQcC/p36nNML8QZ+NU+TbLYjMmlHSYk0qO6eCHAFI
 ntN/MRvbqB1ffp+7yK6DdHuEatmkNC7RxL05cuOp9EXDCC0njhxyo/PrqV0/zlD4dF/Z6as5Lxqdj
 M6xSqjVrHGMFKdGPCDKIiIPbDqqqPRPaT4TpUpIpXiyYWQzc3VZRRCN/LkyrRpxpqkweyvolHiJnU
 ZDQaecn45x/muVl7LmrXloZxo2x+h3+2WLpgY1DPHwVzwriBh2l6laS3SckUXdwgJxPmPVSY0lJC+
 7YmpzeS7FZiYQOmCsGJh3jIN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jyfv2-0007mR-FY
 for samba-technical@lists.samba.org; Thu, 23 Jul 2020 18:26:12 +0000
Subject: Re: Samba 4.12.5 Windows AD 2012R2 integration
To: samba-technical@lists.samba.org
References: <678caa77-97af-6c71-b4cd-258160ae78b0@pardus.org.tr>
 <dbf1b31f-1b53-0dfa-9975-a077753280f1@pardus.org.tr>
Message-ID: <e68f55de-ac33-a298-cdb7-31e673440b30@samba.org>
Date: Thu, 23 Jul 2020 19:26:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <dbf1b31f-1b53-0dfa-9975-a077753280f1@pardus.org.tr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 23/07/2020 18:47, Izzet Aydın via samba-technical wrote:
> We are neither owner, nor admin of the Windows AD.
>
> Is lowering level, the only way to overcome this issue ?

If you are not the owner or admin of the Windows AD, why are you trying 
to join Samba as a DC to it ?

Thinking about it, your problem is most likely a lack of WMI on Samba.

Rowland



