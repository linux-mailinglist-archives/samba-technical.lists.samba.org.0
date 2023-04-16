Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE216E34B3
	for <lists+samba-technical@lfdr.de>; Sun, 16 Apr 2023 04:18:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=8HaQcOixVfKTnMOkfcvcTAyEY1KWqE/yWpMu0LWfE2g=; b=TSb/0ZjPI1astdONPkmj6TxGtt
	sXP/AgU9vxfsdesfBcebLTLefFRXJ7RHqTyNnVeUDjq39pwIuSB6/5iMYF8b/zEhDV5G7JiJAxr8r
	qQI3+CdgLYxBW0Dp8/b49xIB6rLFLX1RuGstxOp8R2DfkHzyylFKqCQ3sNGX4Zv69hErPBCdyaPPz
	z2UmRpf0PSK4840GA1rAyRv+uvc3JbnO2ZWMayMe1kGJXizeRV9qZl16bj4Bmfj0NpABmgCl58dbq
	XmojSshYr/k+rQzduko8w7i8zyAUv3X+UMWVGvpKlOZv9QZvp95FUMTY/UGctBxgqngB/vv/tnnW0
	8yA1Vmag==;
Received: from ip6-localhost ([::1]:60094 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pnrwc-0027zh-37; Sun, 16 Apr 2023 02:16:46 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:39890) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pnrwT-0027zY-SB
 for samba-technical@lists.samba.org; Sun, 16 Apr 2023 02:16:42 +0000
Received: from [192.168.1.110] (unknown [114.23.142.188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 577A581904; 
 Sun, 16 Apr 2023 14:16:22 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1681611384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8HaQcOixVfKTnMOkfcvcTAyEY1KWqE/yWpMu0LWfE2g=;
 b=tyuAQvEWKFO81fQmCPCfL2HsVGos3D7sy6q4dzYB5DaXI2TCsrHijUxXoGO6dvyi2IipIJ
 Cw4bP+JfdNIOZKwqVFB/wayxS8ebS9wrM6FGneknLIrCRnGLii1ndXp5u6tpSKZu8jY0/3
 S8i0LLXREBa09gv0Ob3I0fHoVt1oCjps4bAsdFbKcF4NRh9SNvaw9Gw/JKFBnGNJwYYDFd
 JfjrF3Qz47IE+LV8Egoy8yXNH5eGRaqbx1DXxPejUvBqdhkXamHPY6vs7kmFJAIOA4Zpto
 nnmBe9oOiODz1kz0rOVXiuXd7gJ3YhggrVH712PxQNDdoKnxWhGJ+xSKNR8/1Q==
Message-ID: <be27d4d7-673e-d1b3-6789-a2e41899ca7d@catalyst.net.nz>
Date: Sun, 16 Apr 2023 14:16:20 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: talloc vs malloc speed
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
References: <3161922.5fSG56mABF@magrathea>
Content-Language: en-GB
In-Reply-To: <3161922.5fSG56mABF@magrathea>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.10 / 15.00]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:56030, ipnet:114.23.0.0/16, country:NZ];
 DCC_FAIL(0.00)[failed to scan and retransmits exceed];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 MID_RHS_MATCH_FROM(0.00)[]
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=douglasb@catalyst.net.nz
 smtp.mailfrom=douglas.bagnall@catalyst.net.nz
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Cc: fweimer@redhat.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 15/04/23 06:11, Andreas Schneider via samba-technical wrote:
> P.S. The talloc website states it is 4% slower than malloc. This was probably
> a long long time ago ;-)

Ha. `man talloc` has almost the same sentence saying "10%".

I thought serious trouble with talloc performance has to do with the 
linked lists getting huge, making talloc_free or reparenting really slow.
And I thought that this talloc-doing-talloc cost outweighs the 
talloc-as-malloc cost, which I guess is what is being measured here?

If that's the case (I have no evidence) then optimising talloc-as-malloc 
might not really help. OTOH, because talloc makes it easier to keep track 
of millions of little allocations, we do that often, so perhaps talloced 
code is *more* sensitive to the primitive alloc cost.

Douglas

