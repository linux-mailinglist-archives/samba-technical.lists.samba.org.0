Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD7E7DD52E
	for <lists+samba-technical@lfdr.de>; Tue, 31 Oct 2023 18:48:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=p20BVZ9NtuL50y5jrLaaO2uI+l8kokqpS8d02OQEQ/s=; b=tZMcajlwmuCwytR5B1dunm34N8
	WK3+iC+C25vwT4pAlpYyQuDDMLamWwie3PRK99mgZ1lnIkVCv7yczaN9RD+wkKivGgrvRvzHnrWkl
	3uFZQtB/zxzpvTYAP5GRgeqBMlFlRCxI82HTG5yN6E3B+Oa3eS2SHtIgASEUGqtcupo5nGLoyIdpd
	Re+O2kw9qXVAkmaa4R1m+HcoTdNJbLOLarF7Nis6lwunwuKB9ktap/SCEqywsGbJXSEtTX+aLN+c+
	UvbvvcTyIHRYmgpWG/4N5iCkVbOcLkdSPQ9DYuqry0aRhlQnqkGW23F44sqzT6tKg0ZAGvcQwOhKX
	2L8BbVgw==;
Received: from ip6-localhost ([::1]:39758 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qxsqJ-003j0p-O3; Tue, 31 Oct 2023 17:47:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46962) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qxsqG-003j0g-5B
 for samba-technical@lists.samba.org; Tue, 31 Oct 2023 17:47:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=p20BVZ9NtuL50y5jrLaaO2uI+l8kokqpS8d02OQEQ/s=; b=ts/Cv9mDQbb9XFAYQ8VuAfgOpi
 jaHijPEXBgGoxuHUyfamliKgQxZsOIlnNB+qOa+UXCnuVJ8u6PHkBV7W4J5LraxXqhicfDbvcGsKK
 T6u2scnuKnAIFHLGlwJoagf1Tl+yx3SSx3iugiEOGyNyXMDARa9OhTADaPxhtAbykNa1g4EZdN6JT
 kY7eQoJKacHHopvUSek+wKWJ/H4hcAbia+Hf90kgZA3wU5ehHmrMYM/d1hRK8E3Ii1OD3F7/A0oyS
 CoPEDr/lpqv5ZcUDOr3+e5m6xE6nlsj6BpA+zJKDXw0eoq/IMLR6KKUzQILBVLZlvHRoGSbPi6aTE
 Y4UPZdVMoSJa7QHIaV+EZ3vdZplS2nePwBhXKLLzdqHl1Oty3u2wVJ2zA+DajNcfkyzV3Jaz/vcJ8
 vgY9noTu0gwCj3I61WcjPBlGar4G6Vgb/9lsMHSNCAqOFquxxNwLYORyWfj6dQThNxjoVm1/vIS7S
 r3l21Kj76V0f86/6EO8s1gX1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qxsqF-003Y6d-0h; Tue, 31 Oct 2023 17:47:51 +0000
Date: Tue, 31 Oct 2023 10:47:48 -0700
To: Richard Sharpe <realrichardsharpe@gmail.com>
Subject: Re: How else can I pass params into an smbtorture test?
Message-ID: <ZUE9xMClzNc1EGOd@jeremy-HP-Z840-Workstation>
References: <CACyXjPy58-1pAQ1cOHhGa0M_8XSfpOU-G1HAMwjB6sMj673OEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACyXjPy58-1pAQ1cOHhGa0M_8XSfpOU-G1HAMwjB6sMj673OEA@mail.gmail.com>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Oct 31, 2023 at 10:39:57AM -0700, Richard Sharpe via samba-technical wrote:
>Hi folks,
>
>I have written an smbtorture test to check Windows Previous versions
>behavior.
>
>I used environment variables to pass in the file on the share to access. Is
>there a way to do this via normal smbtorture parameters?

Look at "torture_setting_bool()".

