Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C782F3D1397
	for <lists+samba-technical@lfdr.de>; Wed, 21 Jul 2021 18:14:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=D9ps4Q7J3OgJiImUvD9ovLftX36u93ih8cCz/rx5z5Y=; b=Ngt0NqO4DPP/MFYS9CZ/6f1uYj
	zK970cEfUFHNK88VRSMsBqVXiVPuX+p2NQ5M0d+AFaS65uvutdkSwN7dSHoVOLq4FyBZMYXqtqj89
	Pc/3smkmMWd1IA56n5eCSKAlrRZIFTIfEEi8XPqdPGZ9tk8ZvZVDfoSr/mxwi9MeM2lR47UCFCPCD
	f+Fe863jlgD956FwxLBwXUzSI2kyzfCpu2RJsocMlgVphTjmAXleYs2h2qmgAbusw/t5RJUBaArLH
	1DUzCii8r0RpBoOA44jU+fkbeW4vFO0uFlS6cgeshdAuDVais/YKeYZiK9PX4iRQUMqxeStZen5g7
	2Owrq9kQ==;
Received: from ip6-localhost ([::1]:39894 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m6Eqo-0002RZ-DN; Wed, 21 Jul 2021 16:13:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27206) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m6Eqg-0002RP-Bv
 for samba-technical@lists.samba.org; Wed, 21 Jul 2021 16:13:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=D9ps4Q7J3OgJiImUvD9ovLftX36u93ih8cCz/rx5z5Y=; b=k/39gVBkTv6Yh3Ti6YXV7M+Z9t
 /DecKPnmw9QP0JXOHi/N9h6wtrPTVYsP7eBQZaJdZdLg4Q7a3ES31u6NJrdW0p6gqsxiMJn5D5MQY
 eRh2hFxAK13S6XEsffLE/GvhcbZKnjbAhCUqgsHZ/u/e5Z+L2zPeUtc5FfzSE74LHNlPzcrUKyKK7
 df3rQpIAW0Oj4ARteQGP8eRkuzOOoBtZAsQvlJsJJfNm4dQ23n0hxfY+CbDu+Nv6aVXv2JgT7X1l0
 DmcsL6MnRsyrmgpNr0Qrp6EWuOEDS5LC8nwKHjFKkJco05o8MxCR10BBnW/CJwYrkY+rMCcbBXVAO
 nlWYtb0cCoHln0JREpbaHwhTzsCUJ/+lqtN1bMFatpMSLEVKsUNep+UsBLwBLDeBgAJ+JyHQn+DCg
 AwMXMi0ZlmQTl5QRJr0Mnxe6OTgRPatOWMT/5dGqUUBS/twKvKVe5Th4AB5obFcF26Q/5kd0V9l+/
 5UWqRTpExjMwHt5SNspwk709;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m6Eqe-0001Bu-Qf
 for samba-technical@lists.samba.org; Wed, 21 Jul 2021 16:13:28 +0000
Message-ID: <6e310fac87d4dc141e5b34e84e3300f3cbe0701d.camel@samba.org>
Subject: Re: How to create an user with isCriticalSystemObject or/and
 showInAdvancedViewOnly
To: samba-technical@lists.samba.org
Date: Wed, 21 Jul 2021 17:13:28 +0100
In-Reply-To: <PR3PR05MB71463F314D8B5C395CF7F559CBE39@PR3PR05MB7146.eurprd05.prod.outlook.com>
References: <PR3PR05MB71463F314D8B5C395CF7F559CBE39@PR3PR05MB7146.eurprd05.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2021-07-21 at 15:51 +0000, * Neustradamus * via samba-technical 
wrote:
> Hello all,
> 
> I search the solution to create an user with:
> - isCriticalSystemObject
> - showInAdvancedViewOnly
> 
> Possible options are TRUE or FALSE.
> 
> Line code:
> samba-tool user create username
> 

First, you have posted to the wrong list, you should post questions
like this to the samba mailing list.

Second, you don't normally add them, the system adds them if required,
so why do think you require them ?

Rowland



