Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3FD7D5F0C
	for <lists+samba-technical@lfdr.de>; Wed, 25 Oct 2023 02:27:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=W7uLEXvTlR3GxeNpAmClrTahsFoUKdOwr27G4qK9mCc=; b=pZbuvTXxkBxNNmB+g6KRSWh1Ca
	Dmy7oK1tbGjSA/ZgouIzGeFdBmzo2r3Ydvk4Q+odOIRhX1Bo9h5PzV5+AiEq/ut/3QhLhhzMSjSdD
	o8ufSGy9Zm/170e5M03TK4oUMFOIC0plZxDKg3BMPnTErKsk/fhJqHBKDGC+wqiuWBQ70l6VB9P9T
	NzogtHozV1+7uQIZ/gYxOinorSmXgFcxKIDjHQoQ3e45bXysPgY8NFAIRlnW/ovOqHqgLj7KQCxxJ
	Sryqf9AE2TA/1ouS+PrhG0EhDHkyLQnwLVdSpTJVqZAU+25VJ4Y8rSEp3jymJS223a2lYBYdYo355
	epFXy3Ew==;
Received: from ip6-localhost ([::1]:46722 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qvRiz-002DPf-D9; Wed, 25 Oct 2023 00:26:17 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:52544) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qvRiq-002DPW-Nk
 for samba-technical@lists.samba.org; Wed, 25 Oct 2023 00:26:14 +0000
Received: from [IPV6:2404:130:0:1000:2225:64ff:fe75:8a7f] (unknown
 [IPv6:2404:130:0:1000:2225:64ff:fe75:8a7f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id D69798197A; 
 Wed, 25 Oct 2023 13:10:09 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1698192609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=W7uLEXvTlR3GxeNpAmClrTahsFoUKdOwr27G4qK9mCc=;
 b=RKQLmnoogjUu7VrAudJ4PfK9ZIBsFE8oe1MFRR+SOQmjB+MH7RlTsVbIqp43GI5c4yoaWC
 MPR209fP4ReDRVHAgHpTtqY8VJFNXTfup8jdMOXY3iQ8U4HqXae0Csd9GjGZl0AAHOHtL4
 ICK7qobcJQOM62GC9tKEMEZtjrJRQDiNQUjHjKL+MH4fJgBot7R9KTuiseUSjDe2QHHUQN
 NJn23H+UUZ3GaYZuywncoiOHXitZwLY0EwOiuYeiuOvMrD0VHd0/bN6pm1eFeAB6BSHGPK
 5zteeBc0pKo2CJeErgpJiiiyEHeWgAdHwwu9W4j2Vs+FDV8cBjc32G7ALt7trQ==
Message-ID: <08df3bc0-98ba-44e1-93e4-1db6b1c1dbb8@catalyst.net.nz>
Date: Wed, 25 Oct 2023 13:10:06 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ADWS support for Samba
To: Stefan Kania <stefan@kania-online.de>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
References: <c6ef1821-8365-4626-9fae-c3e3a2c765e3@kania-online.de>
Content-Language: en-US
In-Reply-To: <c6ef1821-8365-4626-9fae-c3e3a2c765e3@kania-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.09 / 15.00]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; ARC_NA(0.00)[];
 DCC_FAIL(0.00)[failed to scan and retransmits exceed];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[]
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

hi Stefan,

On 21/10/23 03:00, Stefan Kania via samba-technical wrote:
> With Samba 4.19 it is possible (using FL 2016) to create "authentication 
> policies" and "authentzicationsilos" but to realy work with the policies 
> and silos "Active Directory Administrative Center" must be used. This is 
> not working together with a Samba DC because of the missing ADWS-support. 
> Will this be possible in the future? Or is there a way to use policies and 
> silos without ADAC?

As covered in the samba list thread, the samba-tool interface is a work 
in progress, so I won't go into that other than to say I am glad you are 
trying it.

Regarding ADWS, it is not likely soon, unless someone funds the work.
It needs a new server talking a new protocol (not "web", despite "Active 
Directory Web Services"). As far as I remember, the actual database 
manipulations are unremarkable -- you can do all the same things with 
LDAP and RPCs (samba-tool is using LDAP for silos).

As ADWS is an occasional admin thing, not an N-connections-per-second 
thing, I think it would be a good chance to write the server in Python 
or some other language other than C, though that would put renewed 
scrutiny on our bindings to LDB and so forth.

That is about as far as we got. It's possible but not trivial.

cheers,
Douglas

