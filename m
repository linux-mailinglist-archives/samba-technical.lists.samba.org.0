Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F344B6BD8EB
	for <lists+samba-technical@lfdr.de>; Thu, 16 Mar 2023 20:22:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=SLFjX9QakWAxIoq+qZPShiNHdnk1lrcjZMR7TJ7GpkY=; b=EI20FBp56oBEt8aVJ9JJSDoehU
	4hqw2KWJvNuEkiI/AVuJnpH0kWeUZFUrfKJ6wuKmaLGS23Mp160pKDgO/5VLf9Yy3Jbiwo9XC4D3m
	lnNE5vOI7DCgzAz1qE/XgT0ax82qVQancVx0bsejzzTgZ+yC+Ch2JyGDFytOaUHAUL9+OWgebW5Wv
	adypw7MP36lnJ//uFtUU1ssc/HU/y7vQHnFEHqwUqFfVjzZ+aWK5k0c5lcpgw9jtrkmf7mjHiEvcj
	J9XcuLho5suSb89Ted5k9L/ixBu1QQR30Yh9vN9h7eC48WAT7Ju8Sc32BDBoVhEXMM6bDJp9HXIBa
	FkpnX69g==;
Received: from ip6-localhost ([::1]:40018 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pctA2-002sfD-Hy; Thu, 16 Mar 2023 19:21:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29792) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pct9w-002sf4-V7
 for samba-technical@lists.samba.org; Thu, 16 Mar 2023 19:21:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=RQR0Bv0RZNDPWUqnm+U0YuYknOWyDDiYUGiB1wvpQn8=; b=e+JlmTu0hC9jsb1zkr3pWalAA2
 TUMw7Bntu+yuCP4Krov/6sqIDGlgyi4PFpYZT9bvIS26AnzShGDM53jt4Lor+cH3yI61N+HrsOtvf
 hLtQ2IXzc4sgYN5fMiZhx8bt/+idjdSNUlkOZjrQNWo/SWH2d0tvjZdjoeDfeZ0Fh5BnJ9KCHBFkT
 q2k6MoGCkKo5ejIe9c184/sUwL5H06dRqIuqv00Z10/tooeQaug0luRP5I/nFQVJlpEPbLQ3DSNZw
 fg2azLj7cSHPhJgryg9jqT7QSpM5EsP/jDppOyRKIKfK6ZSo9tQcVcW/qMAIgw16v4gFwvmW5mZa/
 hAaTOqUS4E5/0Us29alhaAHf//Vrh1bL1ZSi7xUqMTvX4r7PxMozss0+KdTXNWb+J6f6JKXXFIljl
 NJod9b3eJSoRrrEuP2HQNEOn9XMJKNzKfQSb4Nm10dq3tkIL7HTBGkbegmyq+4C13A1hScYbXTipb
 Fau44Nzp75DI47Cn6s/zynT4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pct9v-003flh-Pi
 for samba-technical@lists.samba.org; Thu, 16 Mar 2023 19:21:08 +0000
Message-ID: <c730b289-ff34-aef0-be61-ebd5973ccb03@samba.org>
Date: Thu, 16 Mar 2023 20:20:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To: samba-technical@lists.samba.org
Subject: Nesting of local groups (SID_NAME_ALIAS)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: =?utf-8?q?Pavel_Filipensk=C3=BD_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Pavel_Filipensk=c3=bd?= <pfilipensky@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

windbind does not correctly display members for e.g. BUILTIN/users. It 
shows nothing:

./bin/wbinfo --group-info BUILTIN/users
BUILTIN/users:x:100001:


Given that "BUILTIN\Users" has 1 member "ADDOMAIN\Domain Users", it 
should instead show:

./bin/wbinfo --group-info "ADDOMAIN/domain users"
ADDOMAIN/domain 
users:x:100006:ADDOMAIN/joe,ADDOMAIN/jane,ADDOMAIN/samba2008r2$,ADDOMAIN/samba2003$,ADDOMAIN/administrator,ADDOMAIN/krbtgt,ADDOMAIN/testallowed 
account,ADDOMAIN/testupnspn,ADDOMAIN/testdenied,ADDOMAIN/alice,ADDOMAIN/srv_account,ADDOMAIN/bob


I am working on the fix. One part is to call 
dcerpc_samr_GetMembersInAlias() instead of the wrong 
dcerpc_samr_GetAliasMembership() in source3/winbindd/winbindd_rpc.c.
Another part is to change the code dealing with nested groups / aliases. 
For that, I need to understand if aliases (SID_NAME_ALIAS) can be 
nested, like groups (SID_NAME_DOM_GRP).
Reading the Microsoft documentation 
https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-authsod/597504d8-5408-4629-9d81-aab661e6c953:

/A local group can contain user accounts that are local to the computer 
and user accounts and global groups from their own domain./

It looks that "Local groups" which I believe is BUILTIN/users 
(SID_NAME_ALIAS) cannot contain another "Local group". I have tested 
that also on Windows server using lusrmgr.msc and such nesting was not 
possible.

However, samba server allows such nesting:

bin/net sam createlocalgroup TestGroup1
bin/net sam createlocalgroup TestGroup2
bin/net sam addmem TestGroup1 TestGroup2


Can I assume that SID_NAME_ALIAS cannot be nested?


Best regards,
Pavel
