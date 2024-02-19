Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B1785A8B7
	for <lists+samba-technical@lfdr.de>; Mon, 19 Feb 2024 17:20:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=HTH5qlQuUNDiFIBl87renRTwdYv1E3szlJzUVVbiAg0=; b=pSV6ropY3x0MTK/OKwVlPT9qZz
	PtOz15qhpQOX8yWPpBSbLBHY8d40XBLKrz7ZAAR+HJxaa0iOHzN4qa6LhaZhP/pN8O22LtOW2GI0Y
	jr37kRD5Cc2VdbuGGEWOKjGDMnOj/szQBph7nnNh0hTOMGSIFLAeFYg6XUxy89QpiEAorfO6BKvxL
	P2uaZpbhQXINNTcYYt3KJ2V2WKlQYOOYWoKwccMhJQ7Z+1MIyO01Is5vQb6HCpGly4szCo/Iun5HH
	sCpqiue3RDDgpC6dLmgD7EPQr5J6nRNzGLEyvvMcRa6nvVAAUXQCwVCbXZ9lzMT1UT8UUYP+kbj/0
	l8vSJvsQ==;
Received: from ip6-localhost ([::1]:60048 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rc6Nt-008v4s-F3; Mon, 19 Feb 2024 16:20:49 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:60793) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rc6Np-008v4g-LO
 for samba-technical@lists.samba.org; Mon, 19 Feb 2024 16:20:48 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id E65834E992;
 Mon, 19 Feb 2024 19:20:59 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 99D8384328;
 Mon, 19 Feb 2024 19:20:41 +0300 (MSK)
Message-ID: <00cb5b3d-572a-4ebd-9c1c-50df9fafc129@tls.msk.ru>
Date: Mon, 19 Feb 2024 19:20:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: smbd: Broken access to share
Content-Language: en-US
To: =?UTF-8?B?0JrRg9C/0YfRg9C6INCc0LjRhdCw0LjQuyDQk9C10L7RgNCz0LjQtdCy0Lg=?=
 =?UTF-8?B?0Yc=?= <MKupchuk@inno.tech>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
References: <c4ef9c77c4784a1898abdd266e5dccb5@inno.tech>
 <ec8cb899-c1e7-45bd-97c9-a8d57f2c2fa9@sernet.de>
 <4b79869d3da4448096bc54491dcb4bec@inno.tech>
 <e75610fe-7479-4057-b48f-f207711f6c0a@sernet.de>
 <1e58ff293a634a2594f9ac6a7fdbb470@inno.tech>
In-Reply-To: <1e58ff293a634a2594f9ac6a7fdbb470@inno.tech>
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

19.02.2024 19:14, Купчук Михаил Георгиевич via samba-technical :
> Hello Björn,
> 
>> Seems that there are several related issues. Yesterday I've filed this bug, which is also related:
>> https://bugzilla.samba.org/show_bug.cgi?id=15583
> 
> Selectively reverting commits, found out that to solve our problem, in addition to reverting commit you proposed in mentioned bug, we also need to revert this one https://gitlab.inno.tech/ds/sc/samba/-/commit/ecfcdce02c53e71bb69830f74b040ef925506b6a

gitlab.inno.tech: domain name does not exist
and there's no such commit in the official samba git repository, either.

FWIW.

/mjt

