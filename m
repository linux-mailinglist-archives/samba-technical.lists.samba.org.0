Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FD84121D6
	for <lists+samba-technical@lfdr.de>; Mon, 20 Sep 2021 20:09:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=67w7Exexku9ZW4BAqNMq4O4dYPVcSFyvGZ6Po2i3L00=; b=Ku+rOdYy9jPyx0adEcshOV6AbC
	NaoGbccF7o6XtyG577Fvh6Lq/kFvDzCD9CO/X3CGa2gGDztWoVA+bRB33za2sCb20S2sMFX78AuH2
	HK4Gt5z7Zx8SBNS8imoZXhPVtlWLZ/xHxcXZLoktCPgZqAicOzmJeAaTsBecpZa1Wl6jvcfuDPyV0
	WPxowqE7bbWKPH+oNdpg3OvoTEWcMPCf22rn5EoJ2T43r9wCtayvtdDMQ6NaYcMonpHiStNUEabjk
	ngVW7pKFX9DydUp/Eu9HIOqzvPxYLHhtnHyutgTg/VOBHsoeyOBLo1xBMS7GI/P9b1HlVeNM5nzuZ
	Jd5tU2ng==;
Received: from ip6-localhost ([::1]:63994 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mSNiy-00G8di-5I; Mon, 20 Sep 2021 18:09:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38514) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mSNit-00G8dZ-2S
 for samba-technical@lists.samba.org; Mon, 20 Sep 2021 18:09:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=67w7Exexku9ZW4BAqNMq4O4dYPVcSFyvGZ6Po2i3L00=; b=vSh777MSQVB4kBsscVFPeqbY0f
 p3kAG8hZj8K+0vruptActU9MlxXqTyPdlygRUY/lwGm0NlPSDZf/oNVc0XcfAPR427MYl0M3O5J+U
 ZyehkaRLYPit3OZn1o0c0Fv3g9dgfTHD5DfpnXHvsjP5alVaj694S3l5NOxjbLnEmWASAx+RqkNSD
 NMTqpE6dQvSQcxafZEI5ENoXm7HwmMjgw5CH1y0V49PmT1ZdZ+nzLQu49gX9ylQD2E/tBjdp19wl1
 epBxhNZhpYGaOsedrYE9asZVEotqcwtzm81OlW+oPW70oKz4ELbQF+iapHzAjr3F8nGpoZFMi6MNk
 pQfHbt++9Uc0wOWiT5kcee6LvgBIorjFbRkxFe4fvQa9qp/v9G1gEBcDilAPzOZ802UDJGyNXO/Kt
 +1EubnzigbxDUJzi7PeQXxDSNdAxjiCZEOTivzOcDGaYA0O3FUNaaGCQmt0p9bHmSD7WvBo7ef7Yi
 LPDZhnS+K/+IIyyLeiNkwovD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mSNir-0071mx-FR; Mon, 20 Sep 2021 18:08:57 +0000
Date: Mon, 20 Sep 2021 11:08:54 -0700
To: Christof Schmitt <cs@samba.org>
Subject: Re: Linux kernel LOCK_MAND deprecation
Message-ID: <YUjONiieEwjWLHBM@jeremy-acer>
References: <ac56564760f592b3a6fe477b8ce0e65a0759c988.camel@samba.org>
 <YT+NIpgJUq6GX54f@jeremy-acer> <20210913181145.GA13476@samba.org>
 <246ff815-8964-036a-7911-10d59c4e1ed6@samba.org>
 <20210913195901.GA28442@samba.org>
 <16e822776813310d1635efa74be2455d329308a6.camel@samba.org>
 <20210914000750.GA80819@samba.org> <YT/w7hv4WIH9gwK5@jeremy-acer>
 <20210920174450.GA28517@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210920174450.GA28517@samba.org>
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
Cc: Jeff Layton <jlayton@samba.org>, vl@samba.org,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Sep 20, 2021 at 10:44:51AM -0700, Christof Schmitt wrote:
>On Mon, Sep 13, 2021 at 05:46:38PM -0700, Jeremy Allison via samba-technical wrote:
>> On Mon, Sep 13, 2021 at 05:07:50PM -0700, Christof Schmitt wrote:
>> >
>> > https://gitlab.com/samba-team/samba/-/merge_requests/2170
>> > removes the code and does some minor cleanups in related codepath.
>> >
>> > Jeremy, could you take a look? Should we keep the "kernel share modes"
>> > config option? Or just remove it?
>>
>> I think we need to keep it, as on "normal" VFS backends
>> we need a way to turn it off. I'll comment more on the MR:
>> https://gitlab.com/samba-team/samba/-/merge_requests/2170
>
>This has landed now. Would it make sense to rename the VFS flock call to
>something else like "filesystem_sharemode" or "kernel_sharemode". It has
>nothing to do with "flock" at this point, so it looks confusing.

Yep. Now 4.15.0 has shipped it's a good time to make
ABI VFS breaking changes.

