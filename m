Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE644E8D8A
	for <lists+samba-technical@lfdr.de>; Mon, 28 Mar 2022 07:42:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=+BwwWv6qEo1oGQa9RSGA9PvmA2LAoyNIZN++W687VWY=; b=4LDztvzRjtU09T7cwTx7WkvQ/Z
	hL0ucsvmciWhWiRyiGLLss3Fj8FcQzdJQ9yt0Ax1NOOleMVH6ZXDH5rgJBMen73Ls//v8w6MfA9xr
	Dq/h9fdkSDHOIoptLTzWchNBtg/ldaqUbYalS/yyXtMSFFDIphY0efCFVub9PkPceyZYrkUYnUAWn
	owiKGS+/eegFrnXsKjmiLpjfAin26BJ71wakmf8J6D467+MGAMP629tKNg/ERrC+cDLGCV53pq/Ig
	OFB8BicWqUAROBlwnRMEBJ+cQLiQySILUaX5w44Ao4L5Ira6l6E3am798Bxz3jOG1vxK09kVpMhlY
	N4Q1xXtA==;
Received: from ip6-localhost ([::1]:33014 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nYi8Z-005qLr-11; Mon, 28 Mar 2022 05:41:55 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:41083) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nYi8U-005qLi-0W
 for samba-technical@lists.samba.org; Mon, 28 Mar 2022 05:41:52 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 1E19D40A15;
 Mon, 28 Mar 2022 08:41:46 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 2D72D352;
 Mon, 28 Mar 2022 08:38:00 +0300 (MSK)
Message-ID: <c9c0720a-0ff3-b623-b5ca-76080a7f1d93@msgid.tls.msk.ru>
Date: Mon, 28 Mar 2022 08:41:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: _PUBLIC_ in installed tdb/talloc headers used by Samba build
Content-Language: en-US
To: Andrew Bartlett <abartlet@samba.org>,
 Debian Samba Maintainers <pkg-samba-maint@lists.alioth.debian.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <d46fcec0-1ed1-bafe-9506-518f53c6ff06@msgid.tls.msk.ru>
 <02f1ba57-9c70-bc3e-c294-cf25ae0e0d1e@msgid.tls.msk.ru>
 <7aae8b97cedd704ebc9d6355f4fa2f814753f385.camel@samba.org>
In-Reply-To: <7aae8b97cedd704ebc9d6355f4fa2f814753f385.camel@samba.org>
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

28.03.2022 02:57, Andrew Bartlett via samba-technical wrote:

Thank you Andrew for stepping in!

> On Sat, 2022-03-26 at 18:22 +0300, Michael Tokarev wrote:
>> I got it finally. 3 days (but with only minor work ;) )
>>
>> tdb.h, talloc.h etc now has _PUBLIC_ definition near every
>> symbol they declare.  By default it defines to something
>> reasonable. But samba defines it to attribute(visibility(hidden)).
>> Which does not work when *importing* these symbols from a
>> shared library..
>>
>> I think we'll have to patch tdb.h to remove these _PUBLIC_
>> marks. Or else it will be difficult to deal with.
>>
>> This happened in the few latest versions of samba.
> 
> I think this might mean we need to extend the work to pre-process these
> files before we install them.  See
> buildtools/wafsamba/samba_headers.py.

I'm not sure this will be entirely sufficient.
It might be fine right now though.

Where it might be bad is when we'll try to build any
additional library, say libldb, from samba sources.
If that lib needs these _PUBLIC_ defines too, _that_
"PUBLIC" needs to be different from PUBLIC used in
the headers of _internal_ libs.

This is why I used GSSAPI_PUBLIC markers as an example.
There should be not just _PUBLIC_ (which must be stripped
out at install time), but something like LIBTDB_PUBLIC,
which is defined differently if we're building libtdb
as a shared library or internal static lib.

> The original work was justified as:
> 
> commit aacd3ecb45ab04cb2f8a38a385a45bdca6d88cd2
> commit 3c1013caf4b57c6af5a5d210df232c08a1227a17

Yeah I've seen these commits. After realizing where
the puzzling ld behavior comes from, I grepped the
history for this _PUBLIC_ definition and come across
these patches and the rationale. We're lucky that
gcc does not impose the same restrictions as the
Solaris Studio compiler so we can hack our way
at install time :)

Thanks!

/mjt

