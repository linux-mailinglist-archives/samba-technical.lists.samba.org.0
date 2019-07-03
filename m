Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E775DF9B
	for <lists+samba-technical@lfdr.de>; Wed,  3 Jul 2019 10:19:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=03TI+HjSdbGM/XDJ7N4ybGy2y2xw4kfu3wn0pFI8gsY=; b=STK6EbIOQ+dwEJ5N5rpwqh/Qtj
	7FF4REzwft5tsGi7nXIfKeG65Ici7yLuHRfVvMkw3/tAQli57vOP+YpDR0YjF6kAOYXM2U+fcoqRv
	DWWPTLd/PinyJCdhVvByKOtermkQRYR/kQ2/yoKMpSLUZp1ajB0Cg9A8IYQEzW04vMU9wsm54URfx
	yjFhj6vzdO6D9SpCfvLk5gX75fKulXzpnPOhY8+p3I66BpIP2qbiA7tO/5HtzI8DoKag6P07ZAgTs
	Q+xOHwqzQxBY3KiUN71DWBZy7p7S5o4dTa/ykiu8U1YDehqnY8TdChDLXAB7DihW4zai8/MK6f35N
	LwEYf3vA==;
Received: from localhost ([::1]:42216 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hiaTt-004pYU-3V; Wed, 03 Jul 2019 08:19:09 +0000
Received: from mo6-p05-ob.smtp.rzone.de ([2a01:238:20a:202:5305::2]:32331) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hiaTo-004pYN-LC
 for samba-technical@lists.samba.org; Wed, 03 Jul 2019 08:19:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1562141944;
 s=strato-dkim-0002; d=habacker.de;
 h=In-Reply-To:Date:Message-ID:To:From:References:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=03TI+HjSdbGM/XDJ7N4ybGy2y2xw4kfu3wn0pFI8gsY=;
 b=H7XeE6Km8YGg1tc2zizVaHftjb9SKnMmY88FpqUvQzz24b06qGo17nHUj2UGvF+ZXY
 E0B2C7F2bXhcNoREv3OunLdham8BZymMry52CH2dZF7DSsdKP21fASgwfFvVQ9edxFa1
 j/jlNbrnvvPFEzHOBg5S3pDQHazqLGM84DONnx/uRhSkLRdt4Twr1oQo7MLxRcgIau8O
 z5lQ/66v56nJRvrKJzd3fD/pG+gIxvcw8SzDhiNmdfvzuq78Zs47VAcX9cnmKWlrt6FT
 1ejF+g4Q8RHPgESPihA1jcCqa1HFC6DP5o43St5vwdcuJQCLGZGYaFaB3kf5IDy9AkQe
 e8zg==
X-RZG-AUTH: ":Pm0Ic2Cgev01OMJUmdKKi4d4uwm4tenjFH72zyJC3kFMwckWOLT4go9HRj1ypvI="
X-RZG-CLASS-ID: mo05
Received: from [10.68.28.95] by smtp.strato.de (RZmta 44.24 AUTH)
 with ESMTPSA id w0847cv638J3P7t
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate)
 for <samba-technical@lists.samba.org>;
 Wed, 3 Jul 2019 10:19:03 +0200 (CEST)
Subject: Re: [PATCH] winbind: fix crash in fill_domain_username_talloc() if,
 specified username is NULL
References: <b8d53d4b-0b73-4c70-5bc6-3c5e6f7d8a6a@freenet.de>
 <4843149.z4PxEiurGn@magrathea.fritz.box>
 <2844b045-daeb-c6ca-e05b-3ea16c8dbd8a@freenet.de>
Openpgp: preference=signencrypt
To: samba-technical@lists.samba.org
Message-ID: <1dc81c7a-a2cf-9306-f098-d9a55402f9d9@freenet.de>
Date: Wed, 3 Jul 2019 10:19:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <2844b045-daeb-c6ca-e05b-3ea16c8dbd8a@freenet.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
From: Ralf Habacker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralf Habacker <ralf.habacker@freenet.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 24.06.19 um 12:01 schrieb Ralf Habacker via samba-technical:
> Am 24.06.19 um 11:44 schrieb Andreas Schneider:
> 
>> Hi Ralf,
>>
>> could you please use:
>>
>> if (user == NULL)
>>
> Sure, see updated patch
I did not see this patch applied to samba git repo. Anything I can do to
get this in ?

Ralf


