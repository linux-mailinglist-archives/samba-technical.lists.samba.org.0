Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E1A25505C
	for <lists+samba-technical@lfdr.de>; Thu, 27 Aug 2020 23:11:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=K23wCgUMd5yr4tctzdBDMJasLvVqPrbOugitH40+W+M=; b=5N688UzfU+A06no9+BuIGSrjXz
	PhkF3439I6l1vTNfuLbhSX6Fx1Ot/LZEgwgO3qGVrdJKeW5zDPqDGFYqFGGwFDVaXWmDbvza+kpdz
	RGZBL2yRZ/2CwAILIGNgkn8ijmOaHnUDOUOBbo/lFyjWYK5dY+jrbnWCEaR5Lp+pr8gKbLQSfKLns
	9xYY7pTXMFj6NfwB0C0FWa8XFkr4zQci0eoH9Ksa30ZhTImIHxYGdFVIDiEpUmQJJItYeu/94rGEZ
	RuwWuepFrBaf9TFm8mKWw3ImIRIwV30wywAkf6NBVjtQHWa8N+J/WcPRbhO5zui0TnQ9ccIGlQ5+C
	SXdtIUCQ==;
Received: from localhost ([::1]:55752 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kBP9s-000zk8-PM; Thu, 27 Aug 2020 21:10:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29184) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kBP9n-000zjZ-Fn
 for samba-technical@lists.samba.org; Thu, 27 Aug 2020 21:10:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:From:To:CC;
 bh=bankUE8kNCdeDgAr7UkfNY6zJwMi28jxd3E7rfLZM4k=; b=ivAYAVDI60rksl6mj8esh/dz40
 6xFO9jRsVke0wxaM33qj9WArq9miY6IpLH0KToQucJ+DF6D6cb89VhcU8CAsTzQv0eAZ6Lchq1dTk
 7M/KtncLNPcvgbqTEWja+zt2+qZXwf9dlMRbs/dfxrhjWrZN8NgGBNsLZlvu6uXpHOc1jUL6O5oIc
 lCx/SgAutRLOeXf4RPOiW8DCGkkuN4Twy0TXQZGD0pT3RNaDGS7Qj/3M8b9EZta/hk5v22YcFDWVx
 LfKs9QuepxAsfxGUqwg3hgiCh2xSqfvGOGxVSQjny86j0IbuaJ8dNpu8uvtIBalcOQb46jKhep39Z
 b3RtPnhx2jGhZbidevyVWZ8rHihHZ+MAGsXbUke4Xtp48ggHU64w5l/QDcFPzF7T1BN6XYXDfpC4o
 RhcexCm7ktJIx4LwxFBB9zlOUAp4VtUbYzIw0AYz/hV50eZBkPipwlWRyZ2gnnP8rGMjFCTmyyOEl
 0QRue31n6bKQJmLzHyXaPy1p;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kBP9k-0003y7-9n
 for samba-technical@lists.samba.org; Thu, 27 Aug 2020 21:10:00 +0000
Received: from localhost ([::1] helo=hr3.samba.org)
 by hr3.samba.org with esmtp (Exim 4.92)
 (envelope-from <github@samba.org>) id 1kBP9k-006hm3-59
 for samba-technical@lists.samba.org; Thu, 27 Aug 2020 21:10:00 +0000
MIME-Version: 1.0
Subject: Re: [PR PATCH] [Closed]: waf: Prefer libsystemd to deprecated
 libsystemd-*
To: samba-technical@lists.samba.org
In-Reply-To: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-53@samba.org>
References: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-53@samba.org>
Date: Thu, 27 Aug 2020 21:10:00 +0000
Message-Id: <E1kBP9k-006hm3-59@hr3.samba.org>
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
ZXBvc2l0b3J5Cgp3YWY6IFByZWZlciBsaWJzeXN0ZW1kIHRvIGRlcHJlY2F0ZWQgbGlic3lzdGVt
ZC0qCmh0dHBzOi8vZ2l0aHViLmNvbS9zYW1iYS10ZWFtL3NhbWJhL3B1bGwvNTMKRGVzY3JpcHRp
b246IE5vdCBhY3R1YWxseSB0ZXN0ZWQgb24gYSBzeXN0ZW0gdGhhdCBvbmx5IGhhcyB0aGUgZGVw
cmVjYXRlZCBsaWJzLgoK
