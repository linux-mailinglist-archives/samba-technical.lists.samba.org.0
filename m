Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA6A8FD222
	for <lists+samba-technical@lfdr.de>; Wed,  5 Jun 2024 17:54:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=VRpfHZZ4cDUGAtkBaRExXgYTE6vSyCPJIuZCfImHKBA=; b=UUCFFPRAo/r+XN1/sVdO7fXgHU
	II9AUcivnTKs5Ta2psff6yfLh9fj0Pv5o9pwFvPS24W+0tLJm7a8PxmY0sLTvAg5975353DrnmnYQ
	8+6EZ4L57NWQ6a57xQQZkYt6X6KZGzHjdCaPBhOodOQIyDizS9MS7r6Fsg4qeqozdbcpRsixmxecK
	5jy2ElVK87mx9N79nEptKVKHweTMlAQ0Vli1t2mXIcnAVKjD4qxkcVqXxmHU+ylUr6PyRU2Ssn3oR
	AbHbiD9kJmygdbxdCbPSzjAubFtitMmZAPe2EupPVzHt+7zdv/IhXlh76avBHt0p3hsZN6EPGQ80V
	KyLlvMbg==;
Received: from ip6-localhost ([::1]:34254 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sEsy6-00CkEM-3J; Wed, 05 Jun 2024 15:54:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26836) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sEsy1-00CkEF-Kt
 for samba-technical@lists.samba.org; Wed, 05 Jun 2024 15:54:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=VRpfHZZ4cDUGAtkBaRExXgYTE6vSyCPJIuZCfImHKBA=; b=APdKX693rDKl1CS7w1NWqtnDqc
 /V6ye4D60hKPIIJBQf0hdUqVXhZ2+A5gR/luUuPuqZgv0llB7SLZSw1sMgX65qyLmzKP9mPzE1MHl
 SHaBUdsMNQB4AIj3BEOFk0Ww6i8JWbxhCILOuUabY+ZjHnsKkIRRHp9Qct/yBda9kmlrAehWJRUHA
 +HPIrye1BbSJ/Hyn2A80Xh+UHlQAJnjyiatRMl/RAsq2rqBHQqV/vGAEDsjsX+Wtt/dvfQ/suTDgP
 pLxxJtoBJCPUIrWpQrRPMiL0wcVu4b13vNTa5NXHCZHDwbLYTHXcxyZh8dXUsMjcaBOo6a4P9d+OT
 R6URFthGoW5E8TQWhS8E6UZAsnxEUUPuUeM8YWq6UiG3giF1gQbmIQXF02KdE3jM3aaGK2hU0vjj6
 K578xglnhvolIK2Z/CL+GsNTe5NTeES/BWGRKYhsPX3LSf0xgw2PmZeszAvjLj52vX9ZKjAWRY30j
 XCrqarGlWkr7mGUouKs+htyL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sEsy0-00F8FU-2T; Wed, 05 Jun 2024 15:54:24 +0000
Message-ID: <6ce47871-159d-4f4f-9177-064e45afe488@samba.org>
Date: Wed, 5 Jun 2024 17:54:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: missing krb5 dependencies after recent changes in nightly bits
To: Vita Batrla <vitezslav.batrla@oracle.com>, samba-technical@lists.samba.org
References: <Zl4Dh9XZ2XsQWROD@ultra> <ZmCG254bAl-mvxIt@ultra>
 <1ea6c4d8-b062-4619-87b9-ca7c2064aed0@samba.org>
Content-Language: en-US, de-DE
In-Reply-To: <1ea6c4d8-b062-4619-87b9-ca7c2064aed0@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 05.06.24 um 17:50 schrieb Stefan Metzmacher via samba-technical:
> Am 05.06.24 um 17:40 schrieb Vita Batrla via samba-technical:
>> I found the changeset that introduced the regression.
>> The git bisect command says the culprit is:
>>
>> $ git bisect bad
>  >
>> I suspect this change in lib/addns/wscript_build:
>>
>> @@ -11,6 +11,6 @@ bld.SAMBA_LIBRARY('addns',
>>                         error.c
>>                         dnsquery_srv.c
>>                     ''',
>>                     public_deps='samba-util gssapi ndr resolv dns_lookup',
>>                     public_deps='samba-util gensec ndr resolv dns_lookup',
> 
> Sorry for breaking it, I missed this:
> 
>  From 67f686a9495649cc2c201c051aaa35d5d8c64133 Mon Sep 17 00:00:00 2001
> From: Stefan Metzmacher <metze@samba.org>
> Date: Wed, 5 Jun 2024 17:46:53 +0200
> Subject: [PATCH] lib/addns: remove unused kerberos/gssapi includes in dns.h

See also https://gitlab.com/samba-team/samba/-/merge_requests/3660

metze


