Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B33AA4CDA8
	for <lists+samba-technical@lfdr.de>; Mon,  3 Mar 2025 22:48:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=XoAFjXzsMVtP1kxaSqD9k1THmemSEY3FqXMhWpBgFSM=; b=UWDWc8GOHjNmMv47v5odOC2suD
	747IUd8AR+2Zrv1uCycmCq/YFHaZyAAngsUyoWOz9rep0k9Gt324zG3VAhl/+6TQB8nNEuyzzW0Hi
	psFvHgGNfOqtabguBQqR+84xNVQriMtv68HRefHCrvZMEVB3D8jvACK7zqSdk8cnZQkBlU8RpTtOX
	d9Wdad1PEh7QpBlZFqazS8hDEog6CGU7A8TQCy0yGuPLyH02uML+vzLEY+UMbGMeTxMLGvYKmEwS5
	N54w0hWmmZgwYR0nDu2v/U4QpBt4Uo6UwXjwBXOKNIoY4VugI1i1gHuuEZ/U2T4OMF4ciYYLZEyDw
	5l+aRVMg==;
Received: from ip6-localhost ([::1]:41632 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tpDdW-00FW2a-G2; Mon, 03 Mar 2025 21:47:42 +0000
Received: from cat-porwal-prod-mail11.catalyst.net.nz ([202.49.243.52]:39156) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tpDdQ-00FW2R-VK
 for samba-technical@lists.samba.org; Mon, 03 Mar 2025 21:47:40 +0000
Received: from [192.168.1.219] (unknown [114.23.142.188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail11.catalyst.net.nz (Postfix) with ESMTPSA id EAD74363
 for <samba-technical@lists.samba.org>; Tue,  4 Mar 2025 10:47:29 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=catalyst.net.nz;
 s=default; t=1741038450;
 bh=XoAFjXzsMVtP1kxaSqD9k1THmemSEY3FqXMhWpBgFSM=;
 h=Date:To:From:Subject:From;
 b=foYqBNQoHTNOjnsRQbSkdRobFuNDQdjAodAiZt0dbxRE/6H89B+EkXkrEdkvdC/Lo
 17GJHeURsGgU5uInWNCpniLMHfETGFwFVJ8Z83cvV90EmSMmJeUoPx/L6r9SwkFq33
 hUlaxnfjkgmBGkgw8l6l2DUNQ40NwAS56FX9M4kihPiXRxqeGzMthYuVO7j3E52mdI
 IylgGEdqjYCgesNtpXFiYi8PhSJwCMOnDBCWPwIPx0PrT0eeI2NpNjIKFFc9FNAYay
 UFLMjV5Dk7XN4RECp4P3bXSrrvnU7MnM3xb6BWhFEotaJomrmWJ8Y+x6aTbQXMRNDL
 aSHwfDipqqYAg==
Message-ID: <196948d3-d3f1-47b0-9ac8-8c96e3594b28@catalyst.net.nz>
Date: Tue, 4 Mar 2025 10:47:28 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: samba-technical <samba-technical@lists.samba.org>
Content-Language: en-NZ
Subject: removing /lib/ldb/nssldb
Content-Type: text/plain; charset=UTF-8
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

It doesn't look like /lib/ldb/nsslib/* is built.

Maybe it was until we dropped autoconf in 2010 (fc336590dc35f1737ddc74333b959bdd32ee22d3).

It was added in 803a6dbaca408ea424fe6969c31460c3b6c4979c
("r19456: Add an example application for ldb using the tdb backend", 2006).

Maybe it contains the early seeds of FreeIPA.

In any case, I propose we remove it, unless someone objects.

Douglas


