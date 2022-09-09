Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D36685B3EBC
	for <lists+samba-technical@lfdr.de>; Fri,  9 Sep 2022 20:21:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=MOiigKRFngPvz/vjbB7IRh5dlnH8CCcSKhvG4zeT7sE=; b=D97mHJZxjSvQEIOmTG4VtlbjF/
	lbI4DyJ4X5WRNTS3dYkRyXGfAKFSmxHl51Tec123L/GGqI+FX+ARj+pWUdT0+6NOJsrzfVQrlhh65
	mw6pkLlXPI0GGveGw0Kkp4s7mzCviafStzwZXCpPJnMYwX+JPCMIG/NEVnyp5sLPYBBGCcK+8njm/
	sCz+MNPEHLlV/P9S5wf7c+ZlKcWXuTD1awsUmJ+8WcrhOmylVnzJkJUjNJ97UwM8T8fvr4mHTg6GF
	NXsl+fRO1ZhhkWiHBytsWStPjUhRVP6qdA6TvSyKtDuyZpe4bAGu3U75DZVQHmqvN8wj0aZaDS5FT
	i6UOMazQ==;
Received: from ip6-localhost ([::1]:25048 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oWicb-000Fhc-Gf; Fri, 09 Sep 2022 18:20:57 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:34133) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oWicW-000FhT-DE
 for samba-technical@lists.samba.org; Fri, 09 Sep 2022 18:20:54 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 5F45E408E9
 for <samba-technical@lists.samba.org>; Fri,  9 Sep 2022 21:20:50 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 2B39212D
 for <samba-technical@lists.samba.org>; Fri,  9 Sep 2022 21:20:50 +0300 (MSK)
Message-ID: <33659228-a774-3c68-ade9-f40e54506606@msgid.tls.msk.ru>
Date: Fri, 9 Sep 2022 21:20:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: various spelling fixes (round2)
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <20220909180007.1890214-1-mjt@msgid.tls.msk.ru>
 <314de86f41ab87231457266e376eda06b1b1bbfd.camel@samba.org>
In-Reply-To: <314de86f41ab87231457266e376eda06b1b1bbfd.camel@samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

09.09.2022 21:16, Rowland Penny via samba-technical wrote:
..
>> Do whatever you want with this. Remembering previous
>> attempts to fix something in samba I don't have much
>> hope for this one either.
...
> Well, they all look correct to myself, but, according to protocol, they
> should really be presented via gitlab.

We've been there already. I can't use gitlab because I can't
verify my account because russian banks are banned from swift
and gitlab uses credit card to verify.

So, as I initially said, do whatever you like, including nothing.
I use this patch for the benefit of debian users.

/mjt

