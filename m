Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB764E8819
	for <lists+samba-technical@lfdr.de>; Sun, 27 Mar 2022 16:29:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=LIjGO/AjzlZvq0qCK6keq6dDpiOceLkN00e08oi50Zo=; b=JCSf3B9gjCrrzN76NjGMD+iz+b
	C/BfuIeKZ+X9kIPXPirOGiP5CyGUYzSI+xPyhQwBHyduEeQxtFsnxkXgklDyRRF+l0wMIL5iWE7Ku
	axAruxF6+X4H98c/Q0NQY1pcSlY1NM43gJo7tCwI9ZyguBNGRpZooTrBcXHCaZYghtIx+8B6byCtI
	GjROvFxYVVkPM2gpbAIUG+PApRtl4UHUyeJHcXsHYSMKfGEEKqC5KkuR8i74f+6o6e6f7vfOoFEmR
	cc2jRP6C24rzpKvvZVkhCj7gDC35fUxnqOgo0DNmkjpDmbt9gbIrtzf4N/E2NKiTL/jOU0B4F+gIq
	p9EIcaWg==;
Received: from ip6-localhost ([::1]:64526 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nYTtd-005hC0-0Y; Sun, 27 Mar 2022 14:29:33 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:58591) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nYTtY-005hBr-U0
 for samba-technical@lists.samba.org; Sun, 27 Mar 2022 14:29:30 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 8FF25408C3;
 Sun, 27 Mar 2022 17:29:26 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 142A036F;
 Sun, 27 Mar 2022 17:25:39 +0300 (MSK)
Message-ID: <9d71399f-09fc-87be-66bc-86c1ec5aec19@msgid.tls.msk.ru>
Date: Sun, 27 Mar 2022 17:29:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: building 4.16 for debian (long)
Content-Language: en-US
To: Nico Kadel-Garcia <nkadel@gmail.com>
References: <006ec6d2-39be-80e9-94c5-946dfdd968d9@msgid.tls.msk.ru>
 <CAOCN9rzvTJq6fykhTXmEtkRq+aLRirUAWDFuvUSN1K-M15j9AA@mail.gmail.com>
In-Reply-To: <CAOCN9rzvTJq6fykhTXmEtkRq+aLRirUAWDFuvUSN1K-M15j9AA@mail.gmail.com>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

27.03.2022 17:12, Nico Kadel-Garcia via samba-technical wrote:
..
> The latest release has some critical dependencies, especially of a
> recent version.

I missed this one, please excuse me.

Which dependencies do you consider critical and for which dependencies
a "especially recent version" should be provided?

What's different here compared with 4.13 version for example?

Thanks!

/mjt

