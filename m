Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D499B873F
	for <lists+samba-technical@lfdr.de>; Fri,  1 Nov 2024 00:49:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=tnLkxVejbfaAjpm38L6txAf0jromIjlNiLngJNgUqXQ=; b=o9JKU96QN0Rw9/pECg+TwxLgen
	sBFgHib3+n/PmLpeZrxs8wSwv3ST9Pm2/+eMVBtpGuinwLCxQSPq/uGWzgMKmOC3NqXYji/pP+UtT
	ZroYIhjou0QedDnpyQBWk5d3/aTW/M9t+lIR+8jjAaTmEwdJyW2mLNF5fsLiZDR0sV0aKgV1MJIW4
	4RLQsV1Vny9lSqBQ/UKWW/M8Ylc8syWuHWmA+YUOeAHdP9K7e0nfiv5CJbvETVI2cophxntPWOsjw
	WjFG94Q0qfmv8rUiCXuw458iZeSVPJWxtsV68vvwrZuBbqTiJh22K411WVXO6rs2ZGMVvXIv3m4Bo
	ttPQtdRg==;
Received: from ip6-localhost ([::1]:27116 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t6euK-005kao-AB; Thu, 31 Oct 2024 23:48:52 +0000
Received: from cat-hlzsim-prod-mail21.catalyst.net.nz
 ([103.250.241.204]:36478) by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t6euF-005kah-Ok
 for samba-technical@lists.samba.org; Thu, 31 Oct 2024 23:48:51 +0000
Received: from [192.168.1.219] (unknown [114.23.142.188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-hlzsim-prod-mail21.catalyst.net.nz (Postfix) with ESMTPSA id 57398C2;
 Fri,  1 Nov 2024 12:48:38 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=catalyst.net.nz;
 s=default; t=1730418518;
 bh=tnLkxVejbfaAjpm38L6txAf0jromIjlNiLngJNgUqXQ=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=m9+uBqw/aHZT35Z34ikDn3QOq8IggkLak3GOjdbIEPrQ4dIY7YlWpXwTza8Q6D2Rk
 stV9yRHafhDPuWh2Qz+WP3YK83ZcH0UxFEzINXaiBsFesQ5F6CsWC8+kJzmDnZ3C5g
 f/0BnGcjQ13yS1t5u5WUgd61LO02FIFZ2VxIhuvnklo6T9TvJzJpBpDWOo/U7e36NT
 uG29g5LVXdKm8r6jaRAtIWjeSLefepi5lFL8XxXk7D6A4nBuyePmS80seXV5y7Ru2Y
 zgIiFB/1THs8W6wg9FGcQezalL2D5u0CqWAY8e7pktw1wwTEuyxiqN+wGQVO36CSxw
 AxpXHQcQmDonQ==
Message-ID: <8f95a168-82fd-4076-b8db-3685808626f4@catalyst.net.nz>
Date: Fri, 1 Nov 2024 12:48:36 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: authentication policies in Samba 4.21
To: Stefan Kania <stefan@kania-online.de>,
 samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
 <297faa9c-6788-436b-bfb3-8d2107b8596d@catalyst.net.nz>
 <48c2847c-7d05-4e1a-9e85-52b1ba5d0b30@catalyst.net.nz>
 <ef60d0ef-25df-4081-9764-5dbc05bfc655@kania-online.de>
 <1eb80efc-4bb2-4b7c-b339-5b92277e782e@samba.org>
 <49b4b9af-033a-4534-90e3-ac633ff8bfd8@kania-online.de>
 <7bf96a40-7472-47ca-b81c-7e9121c598b4@samba.org>
 <68fe1182-281f-42ea-ac18-b0a2bf49961d@samba.org>
 <afa75a49-2ae4-4e14-9363-d5c31d7ef2a9@kania-online.de>
 <b5f3c39b-43c8-4b43-943d-cd851128173c@kania-online.de>
 <5d10619f-c4ed-4190-a4d1-1cec480ee108@catalyst.net.nz>
 <c420e24b-562d-4592-a9df-d0dddd069e22@kania-online.de>
 <ab589c2f-f13b-4560-bd18-7a1e88634a0d@catalyst.net.nz>
 <1a14a7d4-3d56-4212-9420-0affed9ffd18@kania-online.de>
 <0f4e2d3b-12b2-4dfc-88ef-0b52c12bf6db@catalyst.net.nz>
 <70db5ba2-8cfc-42f4-a493-0228954debdb@kania-online.de>
Content-Language: en-NZ
In-Reply-To: <70db5ba2-8cfc-42f4-a493-0228954debdb@kania-online.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Circling back to this old one, which I was reminded of by the video linked in
https://lists.samba.org/archive/samba-technical/2024-October/139208.html

On 29/10/24 23:06, Stefan Kania wrote:
>>> Creating the two GPO
>>> 1. default domain controller policy
>>> Setting  KDC for claims
>>
>> I'm not actually sure what this part does (which is normal for me and GPOs).
> Without the GPOs claims will not work and so auth-policies won't work.

Those GPOs won't affect the Samba KDC, which chooses whether to
use claims based on those functional levels and smb.conf things
which I won't repeat because I can't remember exactly.

>>> 2. default domain policy
>>> Setting Kerberos for claims

This one might be necessary for Windows members of a Samba domain.
I suspect it does no harm.

Douglas


