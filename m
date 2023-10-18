Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9977CD47D
	for <lists+samba-technical@lfdr.de>; Wed, 18 Oct 2023 08:29:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=d2y49uo7d7SxkX/kZ1ig/xJlexuamTKeb9Uz+KjSWfE=; b=lHcezuoXceo33nSX1SpAyfCyZL
	KIZKuFu8enUbCUzOX/ET/b6oeCSgoJbQalAFwkFEFWNzT4FWIStRFrXQWi2HoK5rll79P/A4oDb9b
	cachOt5ZEN0skC6DRd5TFH7kYiWWsQCekAbvQIRFWgtHF9IQIITKzRZ/08y6rWI4aDG+lnVpL+TAe
	dcHUocNh3b//5I+K950o1UXeI/Kf/VW5A9FKZVh1XgdlzUXiHdZg9s6XWKCU2/+pKoEnn8UB5Wilq
	HPmdlwvS3FHi1rJo54bNvPBmc5cSIpAyZECXUS4pUwa7+aRVxnauH3+bRbXuqADAOBVLvMC+iTFEB
	DqJfGZSg==;
Received: from ip6-localhost ([::1]:21946 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qt03I-000uQl-1A; Wed, 18 Oct 2023 06:29:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44482) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qt035-000uQc-TS
 for samba-technical@lists.samba.org; Wed, 18 Oct 2023 06:29:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=d2y49uo7d7SxkX/kZ1ig/xJlexuamTKeb9Uz+KjSWfE=; b=ClzoQ8EYSoI/jek/gRTiUINwql
 3T3tQhvYJ7I79S22z7S+XRY2xtgfd/l34VaVbfMN6YCUf9Yqvkrajxq+rN8AUF9OHXJ9J/4koEX9Q
 V5/Kne5szTrX+/scRtkWivma/2S79g7ftKz05TLDZFmg9jHiZDcEIQkJFP1kSxGErlGUg2VBjTNVB
 9NKCgB+fGGHaZt7LoUQ5OoPFUgsjEq+BYgbDDp+fgjmnVk79ntYZOS7u6AwmH8UAmuRlTILoM69YR
 hIiHuvkP0HumcB7f1u7LkAD7uSv7VSJUrqKWPzdye8Z2B5IciEveHNWwGEitjh66rkkIDMvfO5Uj5
 Xz/UBy0bwp8tGtJpUDmHS/Zv2k6AKm6t/caJI9ZMdN0GhwYI47IVOpRycg+SI1UejII8b2kzeayKr
 Fq/N5tXkSe1JBfdBO0mTejy6+YDI5zqaD09Wya/Lj8M+lsVOVhpESGIWHTYWaIFQMHc45w3gwZNg7
 1eF9b1mmRWmdHHxecu2xFoem;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qt034-001EG4-1w for samba-technical@lists.samba.org;
 Wed, 18 Oct 2023 06:28:54 +0000
To: samba-technical@lists.samba.org
Subject: Re: s4:torture: Increase multichannel timeout (was: [SCM] Samba Shared
 Repository - branch master updated)
Date: Wed, 18 Oct 2023 08:28:53 +0200
Message-ID: <5999563.lOV4Wx5bFT@magrathea>
In-Reply-To: <E1qsqak-005Ezi-2G@hrx0.samba.org>
References: <E1qsqak-005Ezi-2G@hrx0.samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 17 October 2023 22:23:02 CEST Andrew Bartlett wrote:
> The branch, master has been updated
>        via  f392fdfd47f shadow_copy2: Add missing TALLOC_FREE
>        via  c6d0df787a1 s4:torture: Increase multichannel timeout

Hi,

I've increased the timeout which worked for me and the test didn't run into 
timeouts anymore. However Joseph run into the issue again with

https://gitlab.com/samba-team/devel/samba/-/jobs/5316200327

Does it make sense to further increase the timeout or could there be another 
issue. I'm not an expert in this area of the code.

https://gitlab.com/samba-team/samba/-/commit/
c6d0df787a1f6007e1f4594f68ff1f75a46bd293


Best regards


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



