Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2B95BB3DB
	for <lists+samba-technical@lfdr.de>; Fri, 16 Sep 2022 23:18:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=F/5mhxyD6BMCzGWfx5rQcC39+v6uSHBWCw0gvSmguKw=; b=m6irdN1E9k5tSOiCbVCgTtfud1
	5+ZmXT7qbwN0uN8FeMzmMAomWZMAyllLFFvOnhTEhbqm3RxMeV2YUpHtzjhuKJWaR3j6+wDhsD5X1
	dQnhkpt4C+yYjlOw3zKqi4/EjEwKssSaHtNb9EwZVFro1NmYccuWqKrelDkSFhthTV7x/+DIcGH79
	9z5037MMH55xF3ur1LzS7Jup0I9e3QscUgug1L0J/pVOH2bE1QfBhB4UgWFDauhcM1XHI+10KVXFy
	l38+NaC2IR/jpR8xETHFy54Vx/cOfI01FjFWctHzCsl0vYmnyRl13RSysmciOrVCkmfwHHHfVsprp
	z318ukMw==;
Received: from ip6-localhost ([::1]:37476 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oZIip-0014qn-5X; Fri, 16 Sep 2022 21:18:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36364) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oZIik-0014qe-Ee
 for samba-technical@lists.samba.org; Fri, 16 Sep 2022 21:18:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=F/5mhxyD6BMCzGWfx5rQcC39+v6uSHBWCw0gvSmguKw=; b=XB0+jzwdE9+850iSePfPmusVmy
 7QBPIafyOONdOD7DqST1ESboXAWo2FgpO1jRqLj7CvhYqE0P1MA4kH8HOc65Q81zu4FwTpQBas5cs
 NzFdbyqkTcCHcWa8tsdX8x9MBS/OphKHrG3ST2fCL6EFrC3Cb0MU2AECHGF3UzBRAABe8PP3ketDZ
 eJ3Amz3/o8oN24NKhl0NNha/ARkCtZaXQCt5HMbTFErFF80Ju2hJI3pZ4ppbqEQQh8s30KdWHfTL/
 wlHbLuPCCGk3KwLFJVLoNXKazj+aU0gLplcALaoGz49A5mDbQY6pyXEvfzOZX6GYbrvd0fvezMeY3
 KgB4Eo+Jr7OcgBiBTbEqiUgIZflR3DE/qLPBbsvmFXlnIbozvO3AzwvlfsfNePY1bT66z4BrDG338
 vBjwyBjYMl9KvEro1Q1R8ZJ84mLeP+c+UC7nQUMxEnC3GAGkITEqSVnd38NbI/U4sxgKv92CceUTJ
 XL+88YfUlZUVRTSdlKQGN99b;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oZIii-000izK-Vq; Fri, 16 Sep 2022 21:17:57 +0000
Date: Fri, 16 Sep 2022 14:17:53 -0700
To: "Nathaniel W. Turner" <nathanielwyliet@gmail.com>,
 samba-technical@lists.samba.org
Subject: Re: IPv6 and commit d882add695bbd5ea03961c08ac2c0380fbf2947b
Message-ID: <YyToAYaXsfopiTdh@jeremy-acer>
References: <CAPw4iV4nxm2F9TeVvaA=M1Ony92eONtu981WzwUADVBdFET0XQ@mail.gmail.com>
 <YyTdlsd2ExgX8U9r@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YyTdlsd2ExgX8U9r@jeremy-acer>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Sep 16, 2022 at 01:33:26PM -0700, Jeremy Allison via samba-technical wrote:
>On Fri, Sep 16, 2022 at 04:17:46PM -0400, Nathaniel W. Turner via samba-technical wrote:
>>Hi folks,
>>
>>I'm investigating an apparent regression in IPv6 support in the "net"
>>command, and I have some questions about commit
>>d882add695bbd5ea03961c08ac2c0380fbf2947b.
>>
>>It looks like it was intended to improve and simplify DNS lookups, but
>>unless I'm reading it wrong, it seems to have introduced the assumption
>>that if a DC has IPv4 addresses, all clients will too.
>>
>>If a DC is configured to support both IPv4 and IPv6, and a client in that
>>environment is configured IPv6-only (e.g. as part of a transition to
>>all-IPv6), it looks like the logic will pick one of the DC's IPv4 addresses
>>and ignore it's IPv6 addresses.
>>
>>Am I missing something?
>
>No that's probably correct. I didn't think I'd
>changed the logic here, but it seems I did.
>
>If you'd like to log a bug and send a fix for this
>to gitlab, I'm happy to review and get it into
>the supported trees.

This is internal to discover_dc_dns(), so you
could probably add an extra flag here to tell
discover_dc_dns() to return IPv6-only, and
have it skip that DC if it doesn't have an
IPv6 address returned.

