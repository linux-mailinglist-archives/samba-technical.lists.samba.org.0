Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A429E5BF52E
	for <lists+samba-technical@lfdr.de>; Wed, 21 Sep 2022 06:21:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=hC8A91fjRO6Ly/nh7RJxCTmJnyPnjlThnM0GhE/FdCU=; b=4tDKn+RY0pTCixtjLa8j+JB1PX
	AhvLRcuTdys32gflCx7fPCH97qZZcBACJGpMv4TM5zvaaf1XrcW5PBN0FVXQzEu7GMLe0s9b9DKyc
	24DCOt7ihTDaU7wptbIGmPt+jlesfpXJkjGZXnhqIayXlKYvWK4ti3eEZrAeQoePTigOM9aNw5YiP
	YZ+YW1bACToEmU6YCrfh8Q+Te3W9F3JM2V8outcTBANGO+w1ZquVDodz/WhFd85jmN++43gJBfsgS
	GT1tM24Hw4rzK9cGIx0LyEAIE1zSxPBk5bet2tjI/ffpE2F4mmktICGqZT3CDyeMUf/qSa5oAgdNo
	/ZDGJ4yQ==;
Received: from ip6-localhost ([::1]:19226 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oarDo-002P9K-4H; Wed, 21 Sep 2022 04:20:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50212) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oarDd-002P9B-Va
 for samba-technical@lists.samba.org; Wed, 21 Sep 2022 04:20:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=hC8A91fjRO6Ly/nh7RJxCTmJnyPnjlThnM0GhE/FdCU=; b=vBtzLFW8iGRWUSBnRIsLSeaWmt
 Z1Zg/pHeAncJRFETkgsbBarTX/dYtVVs/iQO04sy6mruH+Wwpe6CyKwut5AoQHP+c7aZG6pwv0Sh9
 4eyTYDH/M8pgbw7D7LFBIW+N7yYqyEcwkvozKkScDcOHXh2dlJmR0wJM16FK27OvrjbovD3ezj4o1
 OzwuGZh3qbujR77i2R2Kjecib3PHE3JKoN3mC6iSH72tRJnX4llwDQzrFi+IKKbjaNvjADy/6SEyK
 Fr4FLgc3MlFEPEOKNYHw33PNAUr/XAG7pM2ILSQTklcyAYAhIIOo/h4mO2cUwARqsqW755xFuNhwJ
 QKgjJy1RVT5iT9NyZTnRNO2zwy/Axb1740FAlkDkWrsrk6E7J+C9csMYKPqyU/CsCmmE2yuYMJrYQ
 ib4SOE9hZB6T6VsUZmuoEst68tiy0gLXxuhM9iothlQGnib3f/e2VnwlQw9l9KmDaN5J0mJ17832D
 YeAgkgVkubwBnL8QyHjkJQu+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oarDU-001Hho-TX; Wed, 21 Sep 2022 04:20:09 +0000
Date: Tue, 20 Sep 2022 21:20:04 -0700
To: "Nathaniel W. Turner" <nathanielwyliet@gmail.com>
Subject: Re: IPv6 and commit d882add695bbd5ea03961c08ac2c0380fbf2947b
Message-ID: <YyqQ9HtsTM2lmkQF@jeremy-acer>
References: <CAPw4iV4nxm2F9TeVvaA=M1Ony92eONtu981WzwUADVBdFET0XQ@mail.gmail.com>
 <YyTdlsd2ExgX8U9r@jeremy-acer> <YyToAYaXsfopiTdh@jeremy-acer>
 <CAPw4iV5LFvdoici7f5opBUA5bz86QG2cX9muzQ8GDsMU3RcW3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPw4iV5LFvdoici7f5opBUA5bz86QG2cX9muzQ8GDsMU3RcW3Q@mail.gmail.com>
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

On Tue, Sep 20, 2022 at 10:53:04PM -0400, Nathaniel W. Turner wrote:
>   Hi Jeremy,
>     On Fri, Sep 16, 2022 at 01:33:26PM -0700, Jeremy Allison via
>     This is internal to discover_dc_dns(), so you
>     could probably add an extra flag here to tell
>     discover_dc_dns() to return IPv6-only, and
>     have it skip that DC if it doesn't have an
>     IPv6 address returned.
>
>   Thanks for taking a look at this! I'll work on a patch. 
>   What's the right behavior here? In the case where the local server has no
>   routable IPv6 addresses (e.g. link local IPv6 addresses only), we might
>   infer that we're only interested in IPv4 addresses for the DC, and vice
>   versa.
>   If we don't have easy access to the set of local addresses in this code
>   path, a simpler alternative might be to pick up to 1 IPv4 address and up
>   to 1 IPv6 address, and potentially try them both. If the test connection
>   fails quickly in the case of an unusable address, this might be OK.
>   Thoughts?

Change the API for dsgetdcname() so the caller
can specify if they want IPv6 or IPv4. Don't
return more than one address - we don't want
to double the lookup time for a down-DC.

process_dc_dns() should really be changed
to do ads_cldap_netlogon() pings in parallel
for every address given to it.

