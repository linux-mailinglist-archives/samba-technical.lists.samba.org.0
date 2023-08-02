Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D968176C6C0
	for <lists+samba-technical@lfdr.de>; Wed,  2 Aug 2023 09:26:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=6unwDu0X/4d86Lp4lYXni+zDD3Lmcsksn10EyZh2fxI=; b=mVvWbaWd8dxbzi88CJ/xgBR6kG
	kPLkri2dgPo0vpag/ynKKklMMqvtkoFLLqGtLKCFsWgwFYJY79lGRCMICX4hQdv1Fao6buX4QBoSB
	1MitfIKt45cOPRHDOZbWuWs9mjPmEWToaomIINidZBg8r4HBaLzuO7XLkDVSp//NxZ3c98aA1Gz5W
	6VhBjkCXCvMhV3INU0cuIj1eKJEuW9fh/hjpvznYBa2wGmok6Qfg78WhASEj+BC/c+uxa3H7YIafE
	UQirk0pmPQ8eIelAgBcBu1rAXG0BnRvxGJPdld08ssm77AoG+/2m/e/ItXAKvEdvI24ahCP2cSLUl
	akBSy+lA==;
Received: from ip6-localhost ([::1]:32684 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qR6FE-008iGm-E2; Wed, 02 Aug 2023 07:26:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57558) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qR6Eq-008iGH-CA
 for samba-technical@lists.samba.org; Wed, 02 Aug 2023 07:25:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=6unwDu0X/4d86Lp4lYXni+zDD3Lmcsksn10EyZh2fxI=; b=39tPbjVtmMQA0CdZffTytY/uuc
 rCYroGvZPOgRhwkSrgjCLxHUm5GVzKB4ETgVU6dKmf0hZGF7jzr5rskTXm4+shl4TPEoYU6IPzvBz
 MpXLI3sqeiMmFTlzRoVDbWWrfJesLdRR9RDfFnN9ruXRJwI2/MlmwSqC3PCAcTNIvyD3ejrivS0uP
 Ln++MucyjO189M2h5NnhriLDJrFFfnbWvTRu5Vnp3sGbRG9Pwzb5N77PHRJoohAOon2vn9RzvMfEs
 8dLZYWGSsnlI0eqyZfvm+6LVR/Uue7ohYRgB24ifZkRFOGQtBc+Y1kKooSQJavgWagDDvRERZLCtW
 J0FAV6zOQOK98YpqqbXwu10qPJqVh2C1GvYiCpAz7L/hMEkclKFjvJGlrB94fC3DKMdSvamH6LtfJ
 zTJImdWhVwJmA6U7hX6po0xPqBnrz9YNyGKx3t+VznmavMdbRhGlOeCbgw+i3GfF/bsG1W9A8HVDv
 NmymA5VLWp5z8o6asRvNgJxg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qR6Ed-005T3l-1Q; Wed, 02 Aug 2023 07:25:32 +0000
To: Andrew Bartlett <abartlet@samba.org>, samba-technical@lists.samba.org
Subject: Re: What is the status of KDC resource group compression support in
 Samba?
Date: Wed, 02 Aug 2023 09:25:30 +0200
Message-ID: <4503211.LvFx2qVVIh@magrathea>
In-Reply-To: <d6fa0a4a-ea12-059a-416a-a254e245b277@inno.tech>
References: <9a11b657-c387-ebe1-389a-3d91c677e8aa@inno.tech>
 <cdd2a4e8f840624395cce796312eeae4500ba4a5.camel@samba.org>
 <d6fa0a4a-ea12-059a-416a-a254e245b277@inno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Pavel Kalugin <PKalugin@inno.tech>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Friday, 28 July 2023 00:07:03 CEST Pavel Kalugin via samba-technical wrote:

Hi Pavel!


> In general, there is much of an interest around me to move away from
> Windows to Linux-only environment, keeping all the AD-based
> infrastructure in the "just working" state. This is perfectly doable
> with Samba, except that support for 2012R2 level is required by the
> customer. One of the features missed was "KDC resource groups
> compression". Now, version 4.19 will hopefully fix it, but the status of
> SID history compression is still unclear to me, so let me ask again:
> will this feature (SID history compression) be supported?

In case you're looking into a first task. We need to replace lp_set_cmdline() 
with lpcfg_set_cmdline() everywhere. The reason is that lp_set_cmdline() leaks 
memory.

First start changing the client tools, which will be easy. The server side 
might be a bit trickier. However it will give you a good first entry point.

Here is an example:
https://git.samba.org/?p=asn/samba.git;a=shortlog;h=refs/heads/asn-lpcfg


Best regards


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



