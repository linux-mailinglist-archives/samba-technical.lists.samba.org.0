Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E3477AB40
	for <lists+samba-technical@lfdr.de>; Sun, 13 Aug 2023 22:44:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=/BVqXbuAjXk5UGuy5WlyhFW54Atl8VlPzGwSw7KEHTM=; b=ZxTdK1CfIaw5MVpCf+J1GSzdev
	mNDvSGqSwnP9IjibHKC7ewCGRGEL3rSl2A2/Fk7VKhf+KX+Lph3q9SDwMvD/WkiymShc8+zXRasJi
	VCq87800tFvLkaiGmzV0yxHozHwBROrU7b2t9AMq3yWVfthjF3I0xauapeFXXoP4vopS/PUIetf65
	PrP50DABD4Y/n6sr91IXcfyNBtdCCEOW3ZStVnOuHmurrsigPwP1QwsiZQgPPA1vEf7ekNMyd/rSO
	a21QoQ5lzs3ytbErNnd6XyeIB9TrfQSucm0mFvYUy33DYoYhPzDjMkG+IaoSmtHfQB7VAxDXgo/4N
	YAgFkhuQ==;
Received: from ip6-localhost ([::1]:56316 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qVHw1-00C7nz-4n; Sun, 13 Aug 2023 20:43:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54420) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qVHvu-00C7nq-Ft
 for samba-technical@lists.samba.org; Sun, 13 Aug 2023 20:43:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=aEVssHsDIW2Vd1kVSXU1pAeG5g0UTgXuucI3dhYgO0c=; b=SHP6T4JLrbw5v0SwzN9lKzi8jA
 flvCRaxcAo5RY6yWjqP1YyOxPtXKHtxE+bSD4oTyy90MZrC3ugl7JGhIjk+d9r2/TSWmvn1yVU0uQ
 7+Gn30b3ftFMkv87GryvdkPetEDfPG1mdDPZlV1KcDF2zztGkthJAEpAiIr9lHuMiwtAFtjcw+nRl
 pu6XNK8ui2aP6mbzVl4MLZA7WV1XPRrqpwUVF09ggK4oMWdjB6rFGVG1jYrOjWfLTx6XHuK53ETto
 RdBmLZHu2x/q17THXrCNSJx4tGJo2qM0L6h2EN3bhCaEC/VviiBqGlJ6ac1uJjGT2SQJpjvPaUIOJ
 mryDGpyQQDN0Y2ZRZpD+1kh8/44KiwWj6iJNGPGy/xxJO4Ra97RTM5I/YxjLVXm8HQ9VpLSBj73NL
 YmyjOATyjmvh/dYqF1TfOUa15bHyxlHUlsOutuP73TjNR3LFj/Ch4odLaf7iGU4jrp2xKYuSqeRqR
 rtKEpdmEicUqCDdJDRYJ4rGc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qVHvs-007pjN-3A; Sun, 13 Aug 2023 20:43:29 +0000
Message-ID: <44cfcdc452be42ee85a277c6ead6c7e06a59263a.camel@samba.org>
Subject: Re: [Release Planning 4.19] Samba 4.19.0rc1
To: Nico Kadel-Garcia <nkadel@gmail.com>, samba-technical@lists.samba.org
Date: Mon, 14 Aug 2023 08:43:23 +1200
In-Reply-To: <CAOCN9rxbcN85rbz4YcP4815-YYLFDAmpsOjxwgspVHtHsjnzsg@mail.gmail.com>
References: <1430d5ec-f2fb-7021-0aa2-2a759a0dbefc@samba.org>
 <CAOCN9rxbcN85rbz4YcP4815-YYLFDAmpsOjxwgspVHtHsjnzsg@mail.gmail.com>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, 2023-08-12 at 17:59 -0400, Nico Kadel-Garcia via samba-
technical wrote:
> On Mon, Jul 24, 2023 at 8:29 AM Jule Anger via samba-technical<
> samba-technical@lists.samba.org> wrote:
> > Hi,
> > Samba 4.19.0rc1 is scheduled for Friday, July 28 2023.
> 
> I've taken a shot at bringing this over to Amazon Linux 2023,
> alongwith my RHEL 8 and 9 tools over at
> https://github.com/nkadel/samba4repo/ . Unfortunately, the bits
> ofmissing dependency get out of hand *really* fast. so I'm going to
> haveto set it aside until and unless Amazon decides to port a *lot*
> moreof the Fedora release they branched from. It's not the first time
> I'verun into the problem. If anyone else wants to take a shot, I'm
> happyto post my notes.

I have greatly appreciated your work here, thanks so much for your
continuing attention to this packaging effort.
Your notes on Amazon Linux 2023 would be very useful.
Thanks!
Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead                https://catalyst.net.nz/services/sambaCatalyst.Net Ltd
Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company
Samba Development and Support: https://catalyst.net.nz/services/samba
Catalyst IT - Expert Open Source Solutions
