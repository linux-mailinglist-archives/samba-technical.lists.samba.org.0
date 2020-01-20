Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E4A142D84
	for <lists+samba-technical@lfdr.de>; Mon, 20 Jan 2020 15:28:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=quxo4FKc9i67fqlm1KPQGWY1Ds8Axy5hdw93lYnygxE=; b=45/WdD+F7pD4aOXHokH4lAkBuf
	JnWk24HzS12RGTdAYiWtlYDaPtVtgFbT50G8xBIUSVhGU+x6fNgzz1D0aR4R9pTiikIec7OZ5uaX1
	pW4UYcTQkf77tPmxwOH9fcxJQczkoiqtSuQ+I2DJh4uGVaMxvpGmCU//BNKzTGAvy3IVCL0L7hOuf
	PtRj/1kvMhabOakD80cSdt+D6tr6BWLxBZk7Lsrn49OCLuMUG/xue0yh0OUSkOtS76FvWyfnQlDbj
	KV6bnq1YsSZHe6bEcEqtkI/SplegVHZ6DsYxc8jJ7N642dtCjT8hpGaZOHQ68GAKiKGJK4vMjZ04Y
	oDVBP2KA==;
Received: from localhost ([::1]:20076 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1itY0y-003uhL-28; Mon, 20 Jan 2020 14:26:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58116) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1itY0q-003uhD-AH
 for samba-technical@lists.samba.org; Mon, 20 Jan 2020 14:26:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=quxo4FKc9i67fqlm1KPQGWY1Ds8Axy5hdw93lYnygxE=; b=vCBZDkqtGHpmrlR8ugPSq6AMHw
 1X2AR8S7jv3XWyaFrM5XyFuxlN6FSiSefKBJd9TkRdua+uxoc0JR5Z2sSO2zHZBFJNMhlPg/mOV6A
 Nk0fKwo8qC/qyFkvuIY4liFUpbRq2kFO0uiGhpbfcf46xMHu4xI2sPtUX7zOdBPhIX7rK92UDJgB7
 jfeS0cW3JfTYroQKVGBYuLX3xcNUPWpfgVedV7evSDaqq8wZja4qE5s6sEKYJOfZlsaDm4745PuLt
 ivJOQHRDT+3GyeFZTBoMy67DXMlo2Z0nGNJoZHDSUiRuzqSuh0PNxe3+H/dW+gRTymANqKBn8H746
 BGaCO0ihaJfJuwC616+MTG3jgifwU/Akt0LIO0tiNdl0EL6CIEACY8yHo6uPgXRalBog4QRbiolkV
 Me3T5e3U7i1ow2e1QX+Y792GgeVkjnn1uEOiCBsScM6SiJgxP77I/SC4VroYWwjssN+Wiux0+fT0E
 TlCfqGsKFvIrJRjgURbxvA/a;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1itY0n-0007tL-Ne; Mon, 20 Jan 2020 14:26:41 +0000
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Subject: Re: fuzzers
Date: Mon, 20 Jan 2020 15:26:40 +0100
Message-ID: <5581293.AJOmeAHnFV@krikkit>
In-Reply-To: <0f82d428-6115-a26a-dfd1-02e79e573c8a@catalyst.net.nz>
References: <2546695.cijFyKqbAK@magrathea>
 <0f82d428-6115-a26a-dfd1-02e79e573c8a@catalyst.net.nz>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Monday, 20 January 2020 03:00:47 CET Douglas Bagnall wrote:
> On 16/01/20 10:58 pm, Andreas Schneider via samba-technical wrote:
> > However before we add *more* fuzzers, it might be a good idea to first fix
> > the bugs found by the fuzzers ;-)
> 
> Should we adopt a convention similar to our BUG: links?
> That is, add lines like this in our commits:
> 
> OSS-Fuzz: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=19395

:+1:


:-)

	Andreas



