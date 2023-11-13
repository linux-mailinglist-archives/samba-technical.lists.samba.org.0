Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5F07EA267
	for <lists+samba-technical@lfdr.de>; Mon, 13 Nov 2023 18:51:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=bucW0gpLDSNoaVWz4dQtDZUKz0CH+JyEKg571/3Vkhc=; b=CrBGmxIgcA3MibkfW8EweFRmZE
	quxLwYvwGTJrZy4aaDjvCwmKQ2+FR/bLZNie/JijMD/jYh+C6KLOmrVmCeGKBf4UToKp7AvpfqG0N
	s7ydk/drz0UxhwXhn/Kz7BpvDu3+a7tq3j0p4X0DMoexFLSzhi8nzlBZ4TJ8SfPd7WqiMQ2TPzpOQ
	2Gh4+TyHp4Z0ESJSvupyDymags2VeSNMYKsiqmqI9cc/bQWfIicn89819FlWJB64Cpzcsg9lqiC2o
	WFUc39T2ggJc60NizxXzDE1Bd6ZeuhmAR5ownHv5YRZ5NapzEA7qmXs0S9nyhbj+uz5BOxrdWlZmE
	/HftxEog==;
Received: from ip6-localhost ([::1]:44388 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r2b54-0087V1-8W; Mon, 13 Nov 2023 17:50:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49036) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r2b4v-0087Us-Su
 for samba-technical@lists.samba.org; Mon, 13 Nov 2023 17:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=bucW0gpLDSNoaVWz4dQtDZUKz0CH+JyEKg571/3Vkhc=; b=T1A5G7q41dXPnTkix9/qvYIUUv
 35JOmp9h1siSJtTvUMA2HWvgpWeT56O+s442qnqMuAwiSkzjNfDHJ64encQtntf91QeQ1VEYMkvVd
 WaI2bJzuJGB/xtH1/0JuMxTgpYxtpbvHuwCW8qOztO+vHUMq1h6ttlw1/Spooq9KV2awBeNYXCZ90
 C88Fe76f5BqWfL72rKtVmfF8YUSAeCQ3+yuJPs5ZRPbLjnRU89dzO5Ocl4eA+QPLZ1Lj60ZVOP4qW
 CV3r+S2BstyDZ/1uT2qRN63yABBuOIYkAxMxpoGpPd7ft+i5ZuHQFk9dypnPfAuothx8KegF6U3cW
 yHlsld8whJvYnQ19KF8vsCkuxfcGa+Rc3OAPocq6dRTmtn9yC65kdb86EA8P8moHr8qyVPds5tvtE
 /XK/Iy6ZfYcDC2DOjyfV7W7cbakePeSa3PUW5TRujxuDD270jRmodC5Y133nQof5f6Z6sDiZhGeoP
 D9kaMVhr3/gJi1FU/wp4SI5o;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r2b4p-005xlg-2p; Mon, 13 Nov 2023 17:50:24 +0000
Date: Mon, 13 Nov 2023 09:50:21 -0800
To: Ralph Boehme <slow@samba.org>
Subject: Re: [SMB3POSIX] File attributes
Message-ID: <ZVJh3X9GQ5L9mLS0@jeremy-HP-Z840-Workstation>
References: <e916bdea-4197-4372-a15b-cea41c8ebe03@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <e916bdea-4197-4372-a15b-cea41c8ebe03@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, Volker Lendecke <vl@samba.org>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Nov 13, 2023 at 12:28:18PM +0100, Ralph Boehme wrote:
>Hi!
>
>We had support for file atttributes in the CIFS UNIX extensions, this 
>is currently not in the spec (or code) for SMB3 POSIX.
>
>Is this intentional? What is the reason?

Do you mean the attributes listed by:

man chattr.

chattr - change file attributes on a Linux file system

This was at the insitence of Steve as I recall.
We never implemented this.

Might be done via a tunnelling ioctl ? Other thoughts ?

