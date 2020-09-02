Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D7625A2EB
	for <lists+samba-technical@lfdr.de>; Wed,  2 Sep 2020 04:12:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=lTQzx82DNGjaRRUaGFZ8eWUwvlspBiKyaFhsT5GRV3g=; b=1w5Gj30Rxk6wpHkE3hSe9gw5N2
	kcufYj1ilI9Rap4jEc0LAfzs4RD0+nDK1ilbCLpCr2ihUDi51oJkxnPOS4gWt4fPMSCOjfHWyxA/I
	M3hYA16QH0+LG9M93uu0Z/NtGmA/RiFw2fbJ860DZCs2zMLn4N6uQ19cHbHPLP1TWS36yhOBKrkLv
	XUaDFyKyg+3B4m4utnDZMXTJh2NcJfVX6drgRTXvIxXVLNy0ZA7HJP5gVgRKNiCsSgUSii72JKDut
	VIUqJ0CwtUxnLJ6keCQkvjQ3WyIvSUd58bOn3cKi84bEdnbtLd4VXXRukxEpO1HoRq1HI0PvU6YSt
	010uOnLw==;
Received: from localhost ([::1]:31526 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kDIF4-003S8y-Sh; Wed, 02 Sep 2020 02:11:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57284) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kDIEv-003S8p-CK
 for samba-technical@lists.samba.org; Wed, 02 Sep 2020 02:11:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:From:To:CC;
 bh=lnXIUAti8IoE8DMTT8kU/epQGOlUQRNptNk4xXl6FsE=; b=fRMh93Yx1Uw1HwpyAaNiZDHZ1u
 LDuFrc4UFkR+YiCUL6SZjHb44EpSk0mMT/V7VMkNi1dF4j65tautCvJg81aTtN1IeseVA14brcni/
 ERCWXDxaZdHdRJ33kHSTC9sgq5NAiVLVz1Ugz5EKluSQsE4X2vWbUxUWg063SgcCVPatoyI/uMjRe
 ZaWG+AdYAE7JCgiVDWBPLyawoz3S2/UMr6K4MKf0jDUeRE4Wu+eNmYtgqDj/hzFVN82lRhuSOnj2l
 BOtTIVY9ezzABjAdOqqRj++9Y/nkjin6+moA2cJ8IaQbjz1E/eacW41ixbHXpvx5TVJ8x25qVhIuS
 LD9swN5LiWWAZk17dazTbgfc8nkw2mpoNUMk+gbCLLH06yt7t5HDmBogo27TgjahDjmJo02fdZO2a
 YPyz3MLmOD5Rkbm1fHtE4GHkxUQTWyQyr/7rj2ifxBGr8zW1fidMbf4gSBk/YEWe0mxirriBu1eGo
 9qQaAkGLyBWsv8vipGab6gfn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kDIEu-0005F4-Go
 for samba-technical@lists.samba.org; Wed, 02 Sep 2020 02:11:08 +0000
Received: from localhost ([::1] helo=hr3.samba.org)
 by hr3.samba.org with esmtp (Exim 4.92)
 (envelope-from <github@samba.org>) id 1kDIEu-00DMCR-Ch
 for samba-technical@lists.samba.org; Wed, 02 Sep 2020 02:11:08 +0000
MIME-Version: 1.0
Subject: Re: [PR PATCH] [Closed]: Clarify key info about "wide links" setting
To: samba-technical@lists.samba.org
In-Reply-To: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-141@samba.org>
References: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-141@samba.org>
Date: Wed, 02 Sep 2020 02:11:08 +0000
Message-Id: <E1kDIEu-00DMCR-Ch@hr3.samba.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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
From: Github bot account via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: github@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

VGhlcmUncyBhIGNsb3NlZCBwdWxsIHJlcXVlc3Qgb24gdGhlIFNhbWJhIFNhbWJhIEdpdGh1YiBy
ZXBvc2l0b3J5CgpDbGFyaWZ5IGtleSBpbmZvIGFib3V0ICJ3aWRlIGxpbmtzIiBzZXR0aW5nCmh0
dHBzOi8vZ2l0aHViLmNvbS9zYW1iYS10ZWFtL3NhbWJhL3B1bGwvMTQxCkRlc2NyaXB0aW9uOiBG
b2xsb3dpbmcgYnJpZWYgZW5xdWlyeSArIGNvbW1lbnRzIG9uIHNhbWJhIG1haWxpbmcgbGlzdCBh
IGZldyBkYXlzIGFnbywgdGhpcyBQUiBzZWVrcyB0byB1cGRhdGUgdGhlIGRlc2NyaXB0aW9uIG9m
ICJ3aWRlIGxpbmtzIiBzZXR0aW5nLCBhbmQgY2xhcmlmeSBleGFjdGx5IGhvdyBpdCBmaXRzIGlu
ICh3aGF0IGl0IHBlcm1pdHMvZGVuaWVzKSBjb21wYXJlZCB0byAiZm9sbG93IHN5bWxpbmtzIiBh
bmQgImFsbG93IGluc2VjdXJlIHdpZGUgbGlua3MiIC0gdGhlIGN1cnJlbnQgZXhwbGFuYXRpb24g
ZG9lc24ndCByZWFsbHkgZXhwbGFpbiB0aGVzZSBrZXkgcG9pbnRzLgo=
