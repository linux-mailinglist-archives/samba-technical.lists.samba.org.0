Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E264F3D74
	for <lists+samba-technical@lfdr.de>; Tue,  5 Apr 2022 21:57:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=wf8Eo4CGFHLKcXkprclhkyCbV3aR70VttugBC0ghaB4=; b=IGnffoy2CK9osgkG0x7yN5IwMD
	kqQI1yaTqS7hnm/oxZD0KpVzzy3JoGKsT3XSLijZzjaD2CDKHHyIhGH4P0mXaybt9Z9E9/hQPQmod
	SUFjt6APjOu8udCBAa/uqybIWwxaSzn9CLhRb1WGT+w9wsTWkrERcO7HUmmODofZVpvBQ3eW6tIDc
	txZoEo8B95hBYJq96m4xFoQZYRJPF31lXBk8AfE/SF9+8CvdjqQLJLkQBNnY9bPxA+2Cn6e0HVAR7
	hqf4qBPTDH56ybmOoswgCZqiY6d+jw8URLNw9b+nYSbD05o/SJVng7HoXzVrAQDf+AaFp5YRqBTTI
	DsnVzf9Q==;
Received: from ip6-localhost ([::1]:44506 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nbpIq-00AFSz-Qi; Tue, 05 Apr 2022 19:57:24 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:46041) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nbpIm-00AFSq-ET
 for samba-technical@lists.samba.org; Tue, 05 Apr 2022 19:57:22 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 8D7B540150;
 Tue,  5 Apr 2022 22:57:18 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 0A0AF30C;
 Tue,  5 Apr 2022 22:53:32 +0300 (MSK)
Message-ID: <1b3f5415-f263-8b56-c66d-77049719b018@msgid.tls.msk.ru>
Date: Tue, 5 Apr 2022 22:57:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: doing a test build of samba
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <245e18ba-a620-6a19-33d5-8794f010a617@msgid.tls.msk.ru>
 <5f048c2b3b9a93b653f19e2573b2f60ad4688af3.camel@samba.org>
 <30f1d626-f8c4-ca8a-38d0-a2c7eb2ed03a@msgid.tls.msk.ru>
 <9327243.eNJFYEL58v@krikkit>
 <794ca2a4-6d67-ae04-2dec-ca291d633cc8@msgid.tls.msk.ru>
 <0a7f7fb7724efaa78937a1020ffb110eb5e6b75f.camel@samba.org>
In-Reply-To: <0a7f7fb7724efaa78937a1020ffb110eb5e6b75f.camel@samba.org>
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

05.04.2022 22:42, Rowland Penny via samba-technical wrote:
[]
> I am definitely no expert here, but why are you running the tests ?
> The idea (as far as I am aware) for the tests is when the code is
> changed, the change can be tested. When the code is released e.g.
> 4.16.0 , it doesn't require testing.

Take a look at any package for any linux distribution - most likely
you'll find quite some amount of patches for various things.
Most of the important packages do include selftests too.  Note these
are run on different architectures and with different system
components.

Current samba package in debian contains more than 300 patches.
And the tests are disabled entirely.

Before uploading such a monster I'd love to know if it at least
quacks still, instead of relying on my users to report problems.

Thanks,

/mjt

