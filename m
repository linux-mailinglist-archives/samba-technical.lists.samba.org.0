Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4341F36EF0C
	for <lists+samba-technical@lfdr.de>; Thu, 29 Apr 2021 19:40:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=ZLcD07dnHxqVsUlJglFHe4JuKdJOljAkheQPsvxE1gY=; b=5udmQ4BEj/SEy4SjzLXqCEJwEa
	T5CS8JNOYwGDLMRa2fcYjDDkhV72oT53ny0qw3KubAbsZJBfRNZawX+/axBpM2INOomh2mfPiJZTs
	spu5dkWBippASF27ilkuW/BXFP6KkqvaxagdnImBWVCAq8r1Zs64p0RB8zbU4V0VqkHHHyV5lYzrZ
	cFUKLzZTmdyN281YdQkigtqWK8KPQo0xWe98bbOHwLY+7cJD9jVtSNbzVL/xmy0RWK1tvYpYqOkjP
	Hv6vsf6W3WhG2H5v9QzLKcvccoKah1e0kFgrSKV355qiw1+xYf5Zjg0IMfhbC8YdGAW4fbstOfa7P
	TbaHBHWw==;
Received: from ip6-localhost ([::1]:31796 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lcAdW-00DFP8-3J; Thu, 29 Apr 2021 17:39:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47802) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lcAdQ-00DFP1-VF
 for samba-technical@lists.samba.org; Thu, 29 Apr 2021 17:39:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=ZLcD07dnHxqVsUlJglFHe4JuKdJOljAkheQPsvxE1gY=; b=AEHiXtSe6/KffNQjUKeprB8bLc
 AVVwQH1Pk8S/usXwGxUBpd+nro/qNz2zPqIdheuSJbdPhhjOpoDlGRBINxmkF/aTtXJEj5OyPabaJ
 LuAnQCQLbPc9xcFV7ogFXnbLUKNUKQNgU7qaygoJpwghxECDDyegciRi5FGWF5otTbToPKRuHMhou
 pkbK5fPGGAnP/uZcwGALU4+I27BANmSv/FHA3fNPhvUn9KBqV7mKTfTYvtAn8u4mxWvyAQBoMkzRw
 pRMNZEEqRiyEMWcB321ODYYtAzA3KvK06k1WPTF8fIxPVrNaqrqQbbBpzynUKCYTEfYtYjv9CAT0h
 xsuRVLNynryP99XR8qbaN7/1Y4fm6tBc43i9HIlTkV5yYjqGxdhwnHd/OOt3pNBCw5pHCDsLwT/7X
 36EjNV3PEQH7/0r7JzfXgOovXKdsihZVwAmgFsC5LSeo+j6yLhEkBi8Z4cKLe9OM5tHiObIpZoy+U
 L7iK7bQS8BYwv1WhhnqFEE8d;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lcAdP-0007qI-26; Thu, 29 Apr 2021 17:39:32 +0000
Date: Thu, 29 Apr 2021 10:39:27 -0700
To: Shilpa K <shilpa.krishnareddy@gmail.com>
Subject: Re: domain join stuck at krb5_get_init_creds_password
Message-ID: <20210429173927.GK838134@jeremy-acer>
References: <CAHbM3qio_0K45DZbK5aYXPE_QAkku8K_XBpFxHQWksf=iK65uA@mail.gmail.com>
 <20210429034446.GC808221@jeremy-acer>
 <CAHbM3qgQctYp2sYdpvt3NbtiJ+Dhv4h1KMsMgjnic4jLdONW4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHbM3qgQctYp2sYdpvt3NbtiJ+Dhv4h1KMsMgjnic4jLdONW4w@mail.gmail.com>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Apr 29, 2021 at 06:07:12PM +0530, Shilpa K wrote:
>Hi Jeremy,
>
>Thanks for the response. I do not have the network traces. In this case, we
>were using 'net ads join -k' and 'net ads testuser -k'. But what I got to
>know was that there was a firewall for one of the KDCs and Samba tried to
>connect to it and the function krb5_sendto() got blocked in connect(). It
>appears like the timeout value for connect() was 60seconds. As there were
>multiple attempts to connect(), it added to the delay. I tested a fix from
>heimdal which uses non blocking connect with timeout and this seems to help.

Can you point me at the upstream heimdal fix so I can look into
adding this to our version ?

Thanks,

Jeremy.

