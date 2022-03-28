Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7A64E8EDE
	for <lists+samba-technical@lfdr.de>; Mon, 28 Mar 2022 09:21:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=6u492aQT7buDTTJm1SYnDHaitVam+FXbfgUiumQ7ALY=; b=AOMCKSQnW3alwyMHQLhPJiJNMB
	9cnA9L0kdpD50vhgSaAHf8g3RITJnJL1CIVHZE38O+3bLWGvoBr7vfTlzc58AlU+7ZtMDSbK6/MVU
	vKHOylui0yv0vIytTRxLhIvunkaJxy0YYTwc1U9uQFGxeTCH9biPboQue17fqrkIUTDBYkGWG+AJA
	OlWFz8puPJ+H++1RF41WRBWnuX0SmoCatxV0L9UD/ONWx9mn2jk8zcWiCpTUSJaXjl2O8mlcYxdKh
	/YC1TTwqAAd2FlP3TlCdoNGLR5C+g7erMQVdNIUkhU1r/udbmLD958jQvR2PTN0ANjE8epw29N+ww
	jo4cIxOg==;
Received: from ip6-localhost ([::1]:35242 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nYjgv-005sEg-Qo; Mon, 28 Mar 2022 07:21:33 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:33819) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nYjgp-005sER-PA
 for samba-technical@lists.samba.org; Mon, 28 Mar 2022 07:21:25 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id D44A740A1C
 for <samba-technical@lists.samba.org>; Mon, 28 Mar 2022 10:21:20 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id C8CC6352
 for <samba-technical@lists.samba.org>; Mon, 28 Mar 2022 10:17:34 +0300 (MSK)
Message-ID: <0c857b0d-469d-7619-25e9-8a2459c60166@msgid.tls.msk.ru>
Date: Mon, 28 Mar 2022 10:21:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: heimdal headers ordering (gssapi/gssapi.h, crypto-headers.h)
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
References: <412176a7-bbb3-1937-357d-5325ec4f5d2d@msgid.tls.msk.ru>
In-Reply-To: <412176a7-bbb3-1937-357d-5325ec4f5d2d@msgid.tls.msk.ru>
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

28.03.2022 10:14, Michael Tokarev via samba-technical wrote:
...
> We should list heimdal_build/include *before* heimdal/include in
> all cases. Yet the order is random, non-deterministic:

The include path is stored in a hash-like structure with
randomness in waf, right?
It is not a set, it is an ordered list...

Now.. I don't know python and have no idea how to answer
this. It is just a finger-pointing somewhere to the air :)

/mjt

