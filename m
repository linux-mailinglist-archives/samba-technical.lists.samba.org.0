Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B4C4E8E75
	for <lists+samba-technical@lfdr.de>; Mon, 28 Mar 2022 08:52:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=sDJdBQ/JhwQ13gkVheL19AEZm+rpg+XJ7Vw69t5BS9w=; b=GoVp2lhZmCweniQraqTbhk8JPZ
	3yRdlOTpgpLFD+1szF4ZzzFlMHb6oWi1QHV94yS0xRWG0vJRyiDBYvQ6cUsRpODtwImAfH/FGSrkO
	g68E1AtaDiMLQaOz9yzg7BiJ1Qjg/yOeJzV6juLaffHBoC3GAzpViHWh+VJ3gIXrZZUnjWE6NOMHG
	HVK7FvA8l4DDkp2xTcavy/KAq8+4ocT60Jipg0+9dVX4MvVuDUiMQ05y/ivSOXXIk+GAxcG+ELmWO
	7Bb2E9bRFvAXhVlRC/lAjLGdSxu4e5JaBaB+q9ZdD1dacV1Hl/PuFocUWNrMynWbTwHGGnvlFFWJQ
	xzHRXwmg==;
Received: from ip6-localhost ([::1]:33776 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nYjET-005r0o-BK; Mon, 28 Mar 2022 06:52:05 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:57039) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nYjE4-005r0b-1J
 for samba-technical@lists.samba.org; Mon, 28 Mar 2022 06:51:44 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 06A0040A1C;
 Mon, 28 Mar 2022 09:51:37 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 10418352;
 Mon, 28 Mar 2022 09:47:51 +0300 (MSK)
Message-ID: <5a9013c4-6314-55a7-0349-5481bb4717db@msgid.tls.msk.ru>
Date: Mon, 28 Mar 2022 09:51:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: building 4.16 for debian (long)
Content-Language: en-US
To: Andrew Bartlett <abartlet@samba.org>, samba-technical@lists.samba.org
References: <006ec6d2-39be-80e9-94c5-946dfdd968d9@msgid.tls.msk.ru>
 <33910b414a3ab85d0e637b9f6e537cd3c05efdc4.camel@samba.org>
In-Reply-To: <33910b414a3ab85d0e637b9f6e537cd3c05efdc4.camel@samba.org>
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

28.03.2022 01:45, Andrew Bartlett wrote:
[..]
> https://gitlab.com/samba-team/samba/-/merge_requests/2461 has some
> improved documentation.

This is *excellent*. Thank you *very* much Andrew! Well done!

I'm happy now! *G*

>> --------------------------------------------------
>> Third, when linking smbd, I'm getting this error:
>>
>> /usr/bin/ld: source3/smbd/server.c.147.o: in function `notifyd_req':
>> ./bin/default/../../source3/smbd/server.c:366: undefined reference to
>> `messaging_ctdb_connection'
>>
>> apparently source3/lib/messages_ctdb.o is missing somewhere in the
>> link
>> line. Maybe this is related to usage of the bundled-libs above.
> 
> This is probably a missing entry in 'deps=' in whatever subsystem is
> using that.

In order to solve this I added samba-cluster-support into the deps
in smbd definition in source3/wscript.  But the dependency forest
itself is not trivial, I don't have time/energy now to dig there
further to understand where the dep should go.  The missing symbol
(messaging_ctdb_connection) is used in source3/smbd/{process,server}.c
so this suggests it should be added to smbd link line as a direct
dep. Or, it seems, to smbd_base deps since this is where the
mentioned sources are actually listed.  Should be easy to do for
someone who is more familiar with the set of modules/subsystems
and the rules of the deps.

>> --------------------------------------------------
>> And finally (for now), right now I'm stuck at another interesting
>> tidbit from where I can't move on.  Somehow it fails to compile
>> files using gssapi.h, and it fails to build heimdal sources.  I've
>> seen this before already, the prob was intermittent, but now it is
>> always here.
>>
>> First, the includes.  For example, while compiling
>> lib/krb5_wrap/gss_samba.c ,
>> the include-path includes -Ithird_party/heimdal/lib
>> -Ithird_party/heimdal/lib/gssapi .
>>
>> gss_samba.c #includes gss_samba.h which includes
>> lib/replace/system/gssapi.h,
>> which - based on HAVE_GSSAPI_GSSAPI_H, includes
>> <gssapi/gssapi.h>.  The first
>> include path which has gssapi/gssapi.h is third_party/heimdal/lib, so
>> we include
>> third_party/heimdal/lib/gssapi/gssapi.h. But this is a simple
>> dispatcher
>> file, it merely includes <gssapi/gssapi.h>. Which, as we know
>> already, is
>> third_party/heimdal/lib/gssapi/gssapi.h. So we end up without all the
>> gssapi
>> definitions altogether. The correct file to include for
>> <gssapi/gssapi.h>
>> is third_party/heimdal/lib/gssapi/gssapi/gssapi.h (note the double,
>> or even
>> triple, gssapi in there) - so the _second_ -I path should be used
>> from the
>> above.  This is quite messy and not really reliable.
> 
> Again, like symbols, header include paths are dependent on the 'deps='
> of the subsystems.  So a subsystem is missing a dependency.  We have
> had reports (to Heimdal, frustratingly) about this, but someone needs
> to chase it down.

This is an interesting issue by its own, I hit it once again, it
deserves a separate email.

Thank you Andrew!  We're getting close :)

/mjt

