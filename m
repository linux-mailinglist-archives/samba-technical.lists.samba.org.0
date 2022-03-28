Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 140FC4E9208
	for <lists+samba-technical@lfdr.de>; Mon, 28 Mar 2022 11:54:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=5NnkPv6VEkgaFF2BsM94J5qMPbtvr54Q7FFSLPwD4V4=; b=05ZyVUiJ3jryI0qE/X39IdzEeZ
	xlOK9lqrqdy4Ysfsr9q6b7vw+zLXBUf8+JNnxsILPCF3CSe3dXd9u5o3M/FhRN+r00rMVjnN75MtZ
	32r5GgY+OT9/L4mCh7q/cI47sVJxDyERs5XYkEuySVy5RdzxkCWTQpZCY5tpjofGk+ZV3Tf4lOv7W
	vPGMalfXemFmVmdwG4w05kIDsJDXAvQEiPyy/62DRjGX4FsFzHCImkm5V13hUw1t/Bb7AkdMfqXdo
	NpY7FwRLB+jlDAL03wevYqNYdToWYoB8hlDcKoqrwBGY+2jrA198PhNRgZ7piQy6QOikeZ4CrS8o1
	QV5HaW+Q==;
Received: from ip6-localhost ([::1]:39610 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nYm4E-005v8z-3H; Mon, 28 Mar 2022 09:53:42 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:41259) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nYm49-005v8p-6A
 for samba-technical@lists.samba.org; Mon, 28 Mar 2022 09:53:39 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 61E8D40A1C;
 Mon, 28 Mar 2022 12:53:34 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 4E233352;
 Mon, 28 Mar 2022 12:49:47 +0300 (MSK)
Message-ID: <7980f215-2192-5caf-b436-e5cf781ffb87@msgid.tls.msk.ru>
Date: Mon, 28 Mar 2022 12:53:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: heimdal headers ordering (gssapi/gssapi.h, crypto-headers.h)
Content-Language: en-US
To: Andrew Bartlett <abartlet@samba.org>, Stefan Metzmacher
 <metze@samba.org>, samba-technical <samba-technical@lists.samba.org>
References: <412176a7-bbb3-1937-357d-5325ec4f5d2d@msgid.tls.msk.ru>
 <bffcbec6-8e6c-e076-ff0a-2ce00047fe04@samba.org>
 <9d28aabc-dd1c-d2c9-fb7d-db05ab40a6f1@msgid.tls.msk.ru>
 <4fe2488cc85607e4fa9de85f7ab644b75ce00a84.camel@samba.org>
In-Reply-To: <4fe2488cc85607e4fa9de85f7ab644b75ce00a84.camel@samba.org>
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

28.03.2022 11:21, Andrew Bartlett wrote:
> On Mon, 2022-03-28 at 11:13 +0300, Michael Tokarev wrote:

>> It'd be very nice to have this fixed inside waf too :)

If not fixing it in waf, but at least waf can check if
PYTHONHASHSEED is set and refuse to run if it is not.
This will save a lot of grief like in that bugreport,
like I encountered too, and like another bugreport
against upstream heimdal with proposals to fix their
headers.. :)

> Just so you know how that works, like the other 'third_party'
> components, to do that we would need to work it with upstream, then
> import a new version.

Is waf also an external tool?  Okay... :)  Anyway, it can
be patched in samba locally just to prevent this from
happening. :)  Hopefully there will be less issues now
once we release 4.16 in debian (and I hope to address
this very issue in the next debian stable upload too).

Thanks!

/mjt

