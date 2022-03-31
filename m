Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 065404EE12C
	for <lists+samba-technical@lfdr.de>; Thu, 31 Mar 2022 20:56:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=r88D5DBkB+gla0PnO48iUTGogUJI5U9L4CQmwAHkr3Y=; b=fuZumMha4Pf6qIfYAjXOgZSwR/
	PMBNKBOO4IB8Of/Ps+N96KhZXG3Yv/iqRs9+aeqHzz8mb1kzS60RLnMXlV87zGJSfJpCmJzMNFoLX
	q9bpCFJB1mkUhNxGx6QYIZlwvCbZhUGK/E7j1FWK2OX+VuSjvRluXrcPNNKnx8Cu3P3wlsoKlfdM1
	lMNMskDHtB7qAkMmacpdPhQzHzIscbKveDrk5vVqEODMBqzChVmpYEXhemXN+8Cc+dn3/uRf2ysR9
	Jz8tvst+/3SXE8mxQfF756qOjrGdh4W+eM3PNgCXz1952ayxWwyQKRY2SQG5QL4CLXRjIfI3S9Xwm
	JQpUcIFA==;
Received: from ip6-localhost ([::1]:53492 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nZzxw-007FKu-1R; Thu, 31 Mar 2022 18:56:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38066) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nZzxq-007FKl-5V
 for samba-technical@lists.samba.org; Thu, 31 Mar 2022 18:56:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=r88D5DBkB+gla0PnO48iUTGogUJI5U9L4CQmwAHkr3Y=; b=rSWRqaub9Cbx1fMNnNphRrJyS5
 6LR7ST/JzHETnRbgvQCNRiiqgJbFHDh0s0P0D7IDeD1VYEf95+/8ChInEuohKTecfpltEGlT+qI9q
 RvHOvCBpvUy2ARcyCHDWbk/JCjGNOEPbCWFV9hIRA9c2uBng9i+dKlkYnNdQ3emJy6NVYgxoN7aoO
 pL340PV4iw/S/pfFgoSdf/hmos+Qi218zyPifBDdvuSR+9PpXfXYF6haJFbh+SUfYDtwLMYwp4SSR
 T0AUeoRL68qUxyUsNz0GfFM7SLNWrtQiqqRnkPkVd/orCaB3OCoA0fPK+KTFKhYZMU2tc2sCBan8O
 lDunj6NhxbXjNZXeI5ysKEDuEYsGdJmU0W2HCTXnT1pyZtnEejYUJw/Yf9+p3gykjtsSRbAdxgJTC
 xIHdOaBDeEVbvNuttbLohCtNk+SHczABcyvajMOLpRLiA5l91BmIBT6JR3/rfARMQw/FRnsx1o33U
 y1Ct0d7ew4sUYAi4beYAqbJS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nZzxp-004dqI-6C
 for samba-technical@lists.samba.org; Thu, 31 Mar 2022 18:56:09 +0000
Message-ID: <9417a531-1687-d052-b8cb-bf1be9b1cec1@samba.org>
Date: Thu, 31 Mar 2022 12:56:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Are there Python3 libraries for the net commands and etc?
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <CACyXjPw0iqTm=HE9Neb=J99wZ0+=GRdQ0+13+BAuDvvLvQeWaA@mail.gmail.com>
 <CACyXjPwFhse8VtiuitVco-Q9UtpzUSwk3xxUz020rK7M=gtp4w@mail.gmail.com>
 <926eed4f-2c9b-ac62-a31a-e325d7c09006@samba.org> <2421934.YKUYFuaPT4@edfu>
In-Reply-To: <2421934.YKUYFuaPT4@edfu>
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

On 3/31/22 11:56 AM, John Mulligan via samba-technical wrote:
> 
> I'm interested in contributing patches for this. I've already looked at the
> code needed to be wrapped (lib/smbconf and source3/lib/smbconf). I've even
> started prototyping.  I've done C/Python APIs before, but it's been a while
> and I'm rusty, so I'll probably start by making a draft merge request for a
> subset of these API to get early feedback.
> 

Ping me when you have a draft ready, and I'll be happy to review them.

-- 
*David Mulder*
Labs Software Engineer, Samba
SUSE
1221 Valley Grove Way
Pleasant Grove, UT 84062

dmulder@suse.com
http://www.suse.com

