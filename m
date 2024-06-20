Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A45B911667
	for <lists+samba-technical@lfdr.de>; Fri, 21 Jun 2024 01:09:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Nx1JVfIE0FtBS1gFxAFYHwEKLnyUSeMraES0VJsodE4=; b=hpiU16VfgAIEO0DC7EN+shY4Pp
	NmWIuc+J+TnFckWGQ6QnAUf0r+R0LFI/tfm900EfLMM1/lIOwdM3WADGIt8q19y1bm7mHk/70QFDg
	+wd5YArCs6dmtBm09tO3MyyXoK7HvPmQMEjw+F9F5iAv3HcgOC14MDgM2iHsOHca21fEW4mJYKOCH
	z9YQZy24SS2jWgDJnjEKMo8/P7kSf60hZ1gUnpHTl9MyAihbk/jYz2KvwE8Sb0xU0hC5HwuxMdMon
	6cYsBoZ+nkwslKwbQYKA8jL5eVoQAE2QXXO+Vs8+5Fke6I4FTg6hmlns6U4EwF205TwFeruBpyM6l
	iA9Prsqw==;
Received: from ip6-localhost ([::1]:32806 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sKQuH-00Elb2-PX; Thu, 20 Jun 2024 23:09:29 +0000
Received: from cat-hlzsim-prod-mail1.catalyst.net.nz ([103.250.242.12]:36390) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sKQuB-00Elau-JU
 for samba-technical@lists.samba.org; Thu, 20 Jun 2024 23:09:27 +0000
Received: from [192.168.192.96] (wlgwil-nat-office.catalyst.net.nz
 [202.78.240.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-hlzsim-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id D17E23FAEB; 
 Fri, 21 Jun 2024 11:09:16 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1718924956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Nx1JVfIE0FtBS1gFxAFYHwEKLnyUSeMraES0VJsodE4=;
 b=HUeqlW7pojKeIfp/RfND6Crol2AQSq9+3AWYEuo+FPXOXAOqebOD5WBLKkJIXzLiJ2nD1b
 rM70kltExwkPt4JmGOyhTQhvpNDAT+AlfrVRES1oIIQ8oJQNRSDyCQWyr4Ws+y0lO4vGP3
 /h2J0yQ4eogySFoSeBNyoOvKrGP5GvpFygiILRlMqtFlaM2q/vUkHFTyKCN2Qw3yCHLTtE
 d7OBX1qU/q2gDY1sZ8FXzfp87emAVAa55b1erMs5oBRvXF31132sQfnyAUiVshfdVzsgfC
 2P1gRdm38d3xiRpMCt1HNBcocWURwWWvP5HQI6DNjPUpUpwrvFS9e7vRzE+SBg==
Message-ID: <c191d350-1dc1-42b8-a341-26281707e908@catalyst.net.nz>
Date: Fri, 21 Jun 2024 11:09:16 +1200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: vendor version/revision string
To: Andrew Bartlett <abartlet@samba.org>, Michael Tokarev <mjt@tls.msk.ru>,
 samba-technical <samba-technical@lists.samba.org>
References: <7bcfc541-aa5e-4663-a6e0-d21c2b3f3c33@tls.msk.ru>
 <050f14547c398b5d73faf917540f02dc0dee7f74.camel@samba.org>
Content-Language: en-US
In-Reply-To: <050f14547c398b5d73faf917540f02dc0dee7f74.camel@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-30.09 / 15.00];
 LOCAL_WHITELIST_IP(-30.00)[202.78.240.7];
 MIME_GOOD(-0.10)[text/plain]; XM_UA_NO_VERSION(0.01)[];
 MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 GENERIC_REPUTATION(0.00)[-0.99999968200371]; ARC_NA(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 21/06/24 10:52, Andrew Bartlett via samba-technical wrote:
> .TH "NET" "8" "05/06/2024" "Samba 4\&.21\&.0pre1\-DEVELOPE" "System
> Administration tools"
> 
> Is what is emitted.  So some truncation the docbook-xml layers that I
> dare not even look into.

https://docbook.sourceforge.net/release/xsl/current/doc/manpages/man.th.extra2.max.length.html 
perhaps.


Douglas


