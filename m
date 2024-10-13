Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7888899BCC4
	for <lists+samba-technical@lfdr.de>; Mon, 14 Oct 2024 01:39:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=ZhU8hBrM550kPfaKCwuhIfizbo3TdqSSJe48jXbCaAM=; b=nrSuYreBkzbhFXdp/4p6q0KP20
	fHr23TFlm1Cy6ToiuQ6bctDnu51XMBG1Fuo9SBmn5gg+BylMbSlXGfb+oUpA3bTONdAm+ekwo+wEa
	ctKLV90W8z3ZXw1IZHnK/UaOCpmzElW9mMt+vNQMJ7E+3tDELwClle6gjHj7gWSvY3PuoPbPehvwH
	fgi8HDq3qCDEeLV/bPHgEvrHGfUvjuVySF1JTVD6CvYSPPLWdCe8qa2yqZethntm3EhSmGtuyxfmk
	XWm9+qXB8DYVanKc8mjIwiUV59rXvNsq+/7O3gcBkdjFM4xePNSqzbgYvQynx0T3F4/dMPIOrnWz1
	4xDeAdjQ==;
Received: from ip6-localhost ([::1]:34800 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t08BV-003pTC-On; Sun, 13 Oct 2024 23:39:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39256) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t08BR-003pT5-DG
 for samba-technical@lists.samba.org; Sun, 13 Oct 2024 23:39:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=ZhU8hBrM550kPfaKCwuhIfizbo3TdqSSJe48jXbCaAM=; b=MEkNEiA8230c5fjtslAbZk+Lp2
 cOBbXVlsuviojgL9cHrmQcAbMWPj02D7e4H6jk5Z6iXQe5zaMPx/KclhDm/qnhvhVhhA6WyLXgt8i
 hN9CFnhNeMhm03kkgjCrXrSYIIDwNwRrgiR2dnJrw5LzK8jLT8WK9XbdGO46Pq2UcwjE50jFai6Kp
 5gV9sz9J8JJnZ75gSBrKoayOLCIRQ89edr3VHVpWfJ3exz+bV9R8hI1OeIrJlfcO2pncA0uiON4Xk
 6FfN9M1ZVpWF7OoxeSb9+VIYgZbrwdOu4VzUQOhF4tv/WAM/ZdDSWkmu31aKTKQY5XHPi45S2LQca
 7gSpxfLc1RQaMuqRyN5rF68aDUJVWl93rzSpZKzVwKBtX2fUtor9NvKbu+Zgkf+3jds6/FJk/herg
 qR3OLNufSSflSPd/qDpuFEF/5HyzI/oxm55waxtjL5zcBwYY3UlYSkAIuUWhHXypla2BSBa8I3aak
 wPBg1xwyA0AV/pgpOGpkukBa;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t08BQ-004ffU-1z for samba-technical@lists.samba.org;
 Sun, 13 Oct 2024 23:39:32 +0000
Message-ID: <68fe1182-281f-42ea-ac18-b0a2bf49961d@samba.org>
Date: Mon, 14 Oct 2024 12:39:25 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: authentication policies in Samba 4.21
To: samba-technical@lists.samba.org
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
 <297faa9c-6788-436b-bfb3-8d2107b8596d@catalyst.net.nz>
 <48c2847c-7d05-4e1a-9e85-52b1ba5d0b30@catalyst.net.nz>
 <ef60d0ef-25df-4081-9764-5dbc05bfc655@kania-online.de>
 <1eb80efc-4bb2-4b7c-b339-5b92277e782e@samba.org>
 <49b4b9af-033a-4534-90e3-ac633ff8bfd8@kania-online.de>
 <7bf96a40-7472-47ca-b81c-7e9121c598b4@samba.org>
Content-Language: en-GB
In-Reply-To: <7bf96a40-7472-47ca-b81c-7e9121c598b4@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Jennifer Sutton via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jennifer Sutton <jsutton@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 14/10/24 12:33 pm, Jennifer Sutton via samba-technical wrote:
> samba-tool domain auth policy modify --name win11 
> --computer-allowed-to-authenticate-to=O:SYG:SYD:(XA;OICI;CR;;;WD;(@USER.example://ext/AuthenticationSilo != \"winclient-silo\"))"

Oh, pretend there was a double quote after 
‘--computer-allowed-to-authenticate-to’.

Cheers,
Jennifer (she/her)

