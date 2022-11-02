Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E51F8615D64
	for <lists+samba-technical@lfdr.de>; Wed,  2 Nov 2022 09:13:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=EbpTzqBKGY8Ya8LpE47EVU6Ioc5/yh3L6h4t7d3wtnE=; b=4aCn7NnBKV0OUPPXlQakhDMxh1
	USrW0lSgU0FXcT2uPVcf3xs3Pzoz8Dr2pZ/Rj61JLeHLNiHp2rFyn2zI2ika4M8NQGFWoHTx+e467
	RbZwLft34dTiry2HIuWNZqmVpwdN1W5iM27c6Xljnyo7JPhDRNRVOeC3BJCNkWF/qVBBZ+5Mqkgix
	GtGAxNyGUxuM1iw69y6wyyOh4ZORFlNaYOGUg6tzwhQuwYKhrTV4qqW3Dn81/ZgJkHyT8IXb60Qki
	3A4AlTMviCI+6nHifLkQATHyy5zUUA4t7TkNnf15sQGpissBeggQ3Dcs9I6r8toH/+lbc285Uex0S
	lSsv85XQ==;
Received: from ip6-localhost ([::1]:32490 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oq8rn-00A2Na-Mg; Wed, 02 Nov 2022 08:12:55 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:42275) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oq8ri-00A2NR-E0
 for samba-technical@lists.samba.org; Wed, 02 Nov 2022 08:12:52 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 41AD3402B2;
 Wed,  2 Nov 2022 11:12:39 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 280D93D3;
 Wed,  2 Nov 2022 11:12:42 +0300 (MSK)
Message-ID: <ba935af9-6523-2e90-e69b-bea832119dd2@msgid.tls.msk.ru>
Date: Wed, 2 Nov 2022 11:12:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 2/2] ndr: revert libndr.so.3 soname bump
Content-Language: en-US
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
References: <20221101092113.2691975-1-mjt@tls.msk.ru>
 <20221101092113.2691975-2-mjt@msgid.tls.msk.ru>
 <2262146.ElGaqSPkdT@magrathea>
In-Reply-To: <2262146.ElGaqSPkdT@magrathea>
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

02.11.2022 11:00, Andreas Schneider via samba-technical wrote:
..
>> @@ -654,7 +654,7 @@ bld.SAMBA_LIBRARY('ndr',
>>       public_deps='samba-errors talloc samba-util util_str_hex',
>>       public_headers='gen_ndr/misc.h gen_ndr/ndr_misc.h ndr/libndr.h:ndr.h',
>>       header_path= [('*gen_ndr*', 'gen_ndr')],
>> -    vnum='3.0.0',
>> +    vnum='2.0.1',
>>       abi_directory='ABI',
>>       abi_match='!ndr_table_* ndr_* GUID_* _ndr_pull_error*
>> _ndr_push_error*', )
> 
> Please fix packaging and rebuild packages depending on this library.
> 
> libndr is not a stable API! We never claimed that and there is not guarantee
> that the API/ABI will stay the same in future!

I'd *love* to "fix packaging". But I've no way to do this now, and
this is exactly an attempt to do that.

If libndr isn't public, other software should not be using it I guess.
But it does.

It's a bit difficult to explain, there are quite some Debian specifics
involved which are different on Redhat.  But think about this context:
providing a more recent samba packages to older Redhat releases (this
is the context we're talking about right now). Other packages in there
should be rebuilt. I for one can't provide backports of sssd or
evolution-mapi or whatnot just because of a no-op, absolutely unwarranted
soname bump...

Hwell...

/mjt

