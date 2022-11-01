Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAA46146B1
	for <lists+samba-technical@lfdr.de>; Tue,  1 Nov 2022 10:32:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=yvLhRV8ExzQZyr3LT0LhZgZelJNy1NPoOXF+7G1hJ1M=; b=tAKU0AKtY0EMeZVYRsDWXuQtk2
	WsdS2vfFtoR/GeVkmLI3gckc3MzinsBiGjLoS3rtHEO5sZ8d5BxUjXEWsTHKZozcWYimkuCVSl/7j
	UIK5utrDtY+xHhYkeYWVWBB2Dc3HtFZkonbwxIqajDXmmLOkyWweliPO6eTNwmxIMkfkc9eC4jew9
	IOa4c+Q8mZjjAMoH+d1tEjYL8ZpSa5qgM6CCcLMECpK2IThoybEwMj4Q7aCXQPI63qWQv3THtWbM4
	apvaJN/FzWB3TiUXxAgcmWSkTtu4hN2iTH4L5TrlFalTTAw/VdfdaIiVe5cjnxiAb3GYeRmkKmTlk
	rCbSepIQ==;
Received: from ip6-localhost ([::1]:19674 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1opndY-009mrx-Tz; Tue, 01 Nov 2022 09:32:48 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:40705) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1opndT-009mro-NH
 for samba-technical@lists.samba.org; Tue, 01 Nov 2022 09:32:45 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id C0A8F40175;
 Tue,  1 Nov 2022 12:32:40 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id CA8623D3;
 Tue,  1 Nov 2022 12:32:44 +0300 (MSK)
Message-ID: <52570cdb-769b-5c8a-ff09-c11d87caf729@msgid.tls.msk.ru>
Date: Tue, 1 Nov 2022 12:32:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 1/2] ndr: restore libndr.so.2 ABI compatibility:
 ndr_print_debug
Content-Language: en-US
To: Andrew Bartlett <abartlet@samba.org>, samba-technical@lists.samba.org
References: <20221101092113.2691975-1-mjt@msgid.tls.msk.ru>
 <2e31fd859d3244ca1424c658407e9e32564dbe8b.camel@samba.org>
In-Reply-To: <2e31fd859d3244ca1424c658407e9e32564dbe8b.camel@samba.org>
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Andreas Schneider <asn@samba.org>,
 =?UTF-8?Q?Pavel_Filipensk=c3=bd?= <pfilipen@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

01.11.2022 12:27, Andrew Bartlett wrote:
> Please submit this via GitLab.   In particular git-send-email is specifically called out as not being a suitable way to submit patches to samba, as 
> the From header is munged by the lsit.

Andrew, this is more an RFC, while it is of a best quality:
I don't want to spend more time on this unless this is something
which *might* be accepted. The problem here is that the soname
bump has already happened, and there's a difficult time going
back.

I'll sure submit it whatever you guys like but I really need some
feedback first. The change itself works.

/mjt

