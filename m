Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BA36367FB23
	for <lists+samba-technical@lfdr.de>; Sat, 28 Jan 2023 22:28:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=duM2DIyUp+O9HeNvOFWA7RfoAhzvQwUdj1qG5O73OkY=; b=NT3NT68pvGjeKTSGX8jgxqQt1n
	lx49lOc3a/qtjM4YoAV9UHOzGgXPemp2+WnLmmdeb4mEe72IJ+1TWTqMOBOFP4Q1bBQmnA8as+xGi
	HtHW9AxV5pXiFtlmkYmE369b07B3tzH61oirozW2cMAJNOrRJIQhaWD7hNvtaIO9R+fWKlaeoIUq+
	Z68zwTtR1t18NfldOYjdS4W9U35ZEcmFVSHETz/RZBFXPH6AJX8K+xqyIT2BB5gNXAQp7iR+cKBTA
	BuQhcgkploF53lbnQtOwRKFRfBgYPvvwdzoN2vWynT0CE5ESFgS66zRf2er+FDoKz0R3peKj2GgZQ
	DG3XxinQ==;
Received: from ip6-localhost ([::1]:28338 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pLsjv-00458r-Un; Sat, 28 Jan 2023 21:28:00 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:35881) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pLsjr-00458i-Hf
 for samba-technical@lists.samba.org; Sat, 28 Jan 2023 21:27:57 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id A1AEA40186;
 Sun, 29 Jan 2023 00:27:53 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 0B42BDD;
 Sun, 29 Jan 2023 00:27:52 +0300 (MSK)
Message-ID: <855e0874-92d8-3d41-3477-615fabd98e9b@msgid.tls.msk.ru>
Date: Sun, 29 Jan 2023 00:27:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] pidl: actually allow "include" directive usage
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <20230128210031.759949-1-mjt@msgid.tls.msk.ru>
In-Reply-To: <20230128210031.759949-1-mjt@msgid.tls.msk.ru>
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?Q?Jelmer_Vernoo=c4=b3?= <jelmer@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

29.01.2023 00:00, Michael Tokarev via samba-technical wrote:
> pidl used to have non-standard helper() and depends()
> attributes. Commit d8ecabe452f36302105c6412ae5ab93cabfe5cf2
> (in Nov 2006) implemented the standard include and import
> directives, but it had a tiny omission: the "include" has
> never been actually pushed to the list to be processed
> later.  This commit adds implementation of type-IMPORT
> typle and type-INCLUDE typle into a few places, and it
> adds type-IMPORT typle to the list to process, but it
> does not add the type-INCLUDE tuple to that list to be
> processed later by the type-INCLUDE implementations.
> 
> This one-line omission lasted for 18+ years together with
> the ton of warnings telling that helpe() is deprecated
> and include should be used instead.
> 
> This tiny fix finally allows to convert helper() to the
> standard include and get rid of this warning finally.

The grammar is bad, and I'm sending this to the list instead
of doing an MR, - because this is an RFC for now.

I can convert all (or most) helper()s into include together
with this change and create an MR with that.

The resulting thing (together with quite some helper()=>include
conversins) builds fine (and without those annoying deprecation
warnings)

Does it make sense?

/mjt

