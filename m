Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9EB6E897
	for <lists+samba-technical@lfdr.de>; Fri, 19 Jul 2019 18:21:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=+CBSnOypm1HwwjZffAdDlJFuVZoNQrCqRPbxMvvXWro=; b=US0taW6U+3lHPQ5lhDvLMRj5FT
	VQA48mNEBmBQCUQRx8phyhSEmp4V+aGHuLfs1ORZ0xpjM/eeRrfFdTar4SSsna4FinQnXVdlbl5sM
	q35Bj1v2elowc7yjGytYFd2oeGjIvGqCqtqt9Vlp7AeAlBSp69ha++7rm3AdfB0JZo+3LMdJxVQS5
	FSRQYY+wHsKBdMUqPKXa3w4uByLvAg70GZoPOge9KT0fOVuoVnLEWSMEk6ufSGolOpWBVcP1eT7XQ
	c0dihryIM2KnydzNTlcEUa/Gfi6wVawZtVq+oCxPr3x+QMrguuTO4pSugbIJCtkOGiRtbTGay6dow
	UE9EfUBw==;
Received: from localhost ([::1]:30850 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hoVdY-001C5g-Mx; Fri, 19 Jul 2019 16:21:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34030) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hoVdU-001C5W-O0
 for samba-technical@lists.samba.org; Fri, 19 Jul 2019 16:21:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=+CBSnOypm1HwwjZffAdDlJFuVZoNQrCqRPbxMvvXWro=; b=azfjYiOfPoEq/JaX6dZMuhnT3g
 Vd4xHJahfQRuaUz3tvmEyhz7HQyVQbf5ANdzqMll8w9DiUJ6/LLWjf+y9rwLXCVE3WZlq4G0MOM1f
 4pwGctXDcCqRdOXSM/vuyQfmW+L5zdsQy6892lZeANEqQOWV3yiJq3Eq/g1pXtyAG7mU=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hoVdT-0004Jm-Sz; Fri, 19 Jul 2019 16:21:32 +0000
Date: Fri, 19 Jul 2019 09:21:13 -0700
To: Joachim Lindenberg <samba@lindenberg.one>
Subject: Re: [Samba] Turning off SMB1 make slashdot and theregister !
Message-ID: <20190719162113.GD28960@jeremy-acer>
References: <20190710225121.GA142072@jra4>
 <CAN05THQ65himSVSYpzypUwDeJoaV6FPAhQpV4NEeCT3fRaBxFg@mail.gmail.com>
 <20190719160254.GA28960@jeremy-acer>
 <001401d53e4d$d5563be0$8002b3a0$@lindenberg.one>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <001401d53e4d$d5563be0$8002b3a0$@lindenberg.one>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Jul 19, 2019 at 06:20:08PM +0200, Joachim Lindenberg wrote:
> Hi Jeremy,
> not sure why I got this, but anyway...
> imho you should proceed removing or at least disabling SMB1 by default immediately. Still offering SMB1 is asking for trouble.

We already did. 4.11 will ship with SMB1 off by default. Thanks !

