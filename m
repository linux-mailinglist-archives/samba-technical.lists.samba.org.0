Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0F94E8FD5
	for <lists+samba-technical@lfdr.de>; Mon, 28 Mar 2022 10:13:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=io1xoDC88wXKPJzW5DXlVyQuvhiUxMxd9aYDsw4o4eE=; b=ChyeC46nNg/U+9wATIkNcW4uxQ
	sMBatP7LOKltyFQLH98ITaegM543pp3VUXCTpdFAqMS47EKX8/dA2g0YYgupB1qVAorWadpNe8su3
	5kourWA7vtI0WJkVY7kee/5xVr/EpmNFlQ0UPLq6MKwvgwBGEC+GlTXHCGmuxGnLuMNUbWIyX0RqG
	/EaqXqsBJ8DakB9fvhIm6fckxD8tyO50s+5ZEnKkzHA5hiHPBwSKy9pAbQK/RbOQRnBrHSuCF4rFF
	ttUFWZNQ/ZtFVIeGpROihT7SzmRGECMFsyg9Vq0wIijf5RUegK0n/4jxheilhd+84wKTWkJe/bBEt
	6rY39jDw==;
Received: from ip6-localhost ([::1]:37332 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nYkVK-005tbQ-9e; Mon, 28 Mar 2022 08:13:34 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:50423) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nYkVF-005tbG-Bt
 for samba-technical@lists.samba.org; Mon, 28 Mar 2022 08:13:31 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 6DB6240A1C;
 Mon, 28 Mar 2022 11:13:26 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 57B79352;
 Mon, 28 Mar 2022 11:09:40 +0300 (MSK)
Message-ID: <9d28aabc-dd1c-d2c9-fb7d-db05ab40a6f1@msgid.tls.msk.ru>
Date: Mon, 28 Mar 2022 11:13:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: heimdal headers ordering (gssapi/gssapi.h, crypto-headers.h)
Content-Language: en-US
To: Stefan Metzmacher <metze@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <412176a7-bbb3-1937-357d-5325ec4f5d2d@msgid.tls.msk.ru>
 <bffcbec6-8e6c-e076-ff0a-2ce00047fe04@samba.org>
In-Reply-To: <bffcbec6-8e6c-e076-ff0a-2ce00047fe04@samba.org>
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

28.03.2022 11:04, Stefan Metzmacher via samba-technical wrote:
> Hi,
> 
> are your using 'waf build' directly? This that I saw the same
> problem in the past. Please use 'make' and 'make install',
> the difference is that it passes PYTHONHASHSEED=1, without that
> the order is random.

Oh ma!.. Heh.

I was using ./debian/rules build (et al), - this is what I have
inherited, which was used in Debian for a long time.

Yes indeed, d/rules invokes waf directly without using the
Makefile wrapper and without setting PYTHONHASHSEED.

This should fix my issue.

Thank you!

It'd be very nice to have this fixed inside waf too :)

/mjt

