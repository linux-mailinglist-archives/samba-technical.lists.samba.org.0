Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EA4615D7E
	for <lists+samba-technical@lfdr.de>; Wed,  2 Nov 2022 09:18:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=3DcyoZrQ2NoWYLGRCoM+xjDFtsYQ2Y0nZRNrM2EP8cA=; b=xIWlyRDJ5VZ5o77DNU872+uDEg
	/d1MY9xb6AS4wxfjxP3EJ4P5DIXKIZ9VVJG0Bk1/ZL3tvmO46cOtrEKsrseJPXsZg8pGNIJaPx9Rq
	pWzSEGLftGe7XUh8ISgaAynyDdD9zjP2y5795/pcNTu5wMyILYtW396CdjCCwDsj/lJIXYzk4CEL9
	0jlONsXw1HjjW9OgQtI+xEpCM4RyriXRlQL3S4iNJLZIWKfRT8qlTjCp3tzyt8EQd22abIqOVMfmm
	TZ/Wq6ee/cw1uJ1cmc7pxC9dfH1UeLliiMLg+g/QDeaJV6El79w+ocOzP+qnBR9q8WA/CfsiVCaCf
	LQ2r8I9A==;
Received: from ip6-localhost ([::1]:59018 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oq8wl-00A2fZ-Ap; Wed, 02 Nov 2022 08:18:03 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:53603) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oq8wh-00A2fQ-2S
 for samba-technical@lists.samba.org; Wed, 02 Nov 2022 08:18:01 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 2A88940287;
 Wed,  2 Nov 2022 11:17:56 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 7A10B3D3;
 Wed,  2 Nov 2022 11:18:00 +0300 (MSK)
Message-ID: <82137f01-82fd-e041-e931-21d40f06634c@msgid.tls.msk.ru>
Date: Wed, 2 Nov 2022 11:17:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 2/2] ndr: revert libndr.so.3 soname bump
Content-Language: en-US
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
References: <20221101092113.2691975-1-mjt@tls.msk.ru>
 <20221101092113.2691975-2-mjt@msgid.tls.msk.ru>
 <2262146.ElGaqSPkdT@magrathea>
 <ba935af9-6523-2e90-e69b-bea832119dd2@msgid.tls.msk.ru>
In-Reply-To: <ba935af9-6523-2e90-e69b-bea832119dd2@msgid.tls.msk.ru>
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
Cc: =?UTF-8?Q?Pavel_Filipensk=c3=bd?= <pfilipen@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

02.11.2022 11:12, Michael Tokarev via samba-technical wrote:
> 02.11.2022 11:00, Andreas Schneider via samba-technical wrote:
..
>> Please fix packaging and rebuild packages depending on this library.
>>
>> libndr is not a stable API! We never claimed that and there is not guarantee
>> that the API/ABI will stay the same in future!

What I'm trying to say: the lack of such guarantee is not a reason to
break ABI at will. We already had libndr.so.1 => .2 bump recently, and
that one has at least been reasonable. This one is absolutely not
reasonable, at my opinion anyway. Especially since this symbol in question
was not used at all outside of samba..


/mjt

