Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B1D255081
	for <lists+samba-technical@lfdr.de>; Thu, 27 Aug 2020 23:19:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=OVuK+s+zygl4jI7KQlOMSo8uVQdSqwjZ+KQ4wyiwAKc=; b=Vchm0rq1i959AQX5hSUt0sXnCh
	VZRw2pEmeJf/qC7LXUD5Edvxoqmz62eEpLMg9ThSffsFUpdoeySGhUy5DRRyCoawxxs7rDf7HM/rb
	/qLzJ20KJBtV3ImHeu+EBnECENc8Yz97Nc9YbsbPnIyOYYvzznqgwjs7m/YnHiraHzUpcM1rfJxb2
	VpL0T49H/66CtA2ZILLcVzS9/Kh0j8HQpKuoOoGSMEXj7+qf2iPlUfgQdXYr247GscejKuifyecOw
	9FLQ4mDiAyIU9fcjwR1szNoxfc8sZPtl2fc6aHHkZdviv/Xe3qyt8As2hqYXTLONn/3qoP9PwTXNs
	suXgxE6w==;
Received: from localhost ([::1]:58736 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kBPIl-00108O-9z; Thu, 27 Aug 2020 21:19:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31646) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kBPIg-00108H-Ga
 for samba-technical@lists.samba.org; Thu, 27 Aug 2020 21:19:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:From:To:CC;
 bh=kls4U7QtnQqcsa0CaMOpS+Z9+87rV/US/wLp6BZv3OE=; b=trqr5uEDEZWkYAVTLupnpVA+5I
 X02uGIyJkziIFImxzu71qKAuHNnU4JmfBScRk166mAkqvEx2JTihu8lcnf1S4Nnu2MxSAPJq91tvk
 KhdGiWP6hYEebjy2Bep0uLM6Dc9zhdE8oB9LivtWoBhX6Z+A1D/uBrONJ4PtU3oMBrS04CfUjV8Qu
 suV1u9mJ+B7TAtyYWGfxJ8mOrmzJ66jdybixMI4d5JZCuti0QPGZHTvQ3Vu45sdUd8mzau9ONfUI6
 pfmTELKW73no7jMqqTs+dGhcEuY/DRV8CUViKUEOhfE0Dd9zSVOx0tfLqgVnivihOWiEhqFeePnDT
 aBekt8oT59181H2ZicN9Voh7g7z+Ch28VdPo5Oyt7vW+aSh5d7f0tYRk8QnECcSYTcC+r3gm/1F2K
 a0OBjV5/KUH8wdnwFRWjiYNM2bwxWNDDizAeqKGeGxXhFma/0lwub44EOeaQrVxH1waKkytrR9FNQ
 QQ6n+HJMAGkk5Bw00jFlEPul;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kBPIg-00049Y-2v
 for samba-technical@lists.samba.org; Thu, 27 Aug 2020 21:19:14 +0000
Received: from localhost ([::1] helo=hr3.samba.org)
 by hr3.samba.org with esmtp (Exim 4.92)
 (envelope-from <github@samba.org>) id 1kBPIf-006iL9-Tz
 for samba-technical@lists.samba.org; Thu, 27 Aug 2020 21:19:14 +0000
MIME-Version: 1.0
Subject: Re: Fix compatibility issues with the timespec struct
To: samba-technical@lists.samba.org
In-Reply-To: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-212@samba.org>
References: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-212@samba.org>
Date: Thu, 27 Aug 2020 21:19:13 +0000
Message-Id: <E1kBPIf-006iL9-Tz@hr3.samba.org>
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

TmV3IGNvbW1lbnQgYnkgZG91Z2xhc2JhZ25hbGwgb24gU2FtYmEgR2l0aHViIHJlcG9zaXRvcnkK
Cmh0dHBzOi8vZ2l0aHViLmNvbS9zYW1iYS10ZWFtL3NhbWJhL3B1bGwvMjEyI2lzc3VlY29tbWVu
dC02ODIxOTY2MTUKQ29tbWVudDoKQGpvYW5rYXJhZGltb3YsIFNhbWJhIGRvZXMgbm90IGFjdHVh
bGx5IHVzZSBnaXRodWIsIGFuZCBub3RoaW5nIHdpbGwgY29tZSBvZiB0aGlzIGlmIGl0IGlzIGxl
ZnQgaGVyZS4NCg0KVGhlIHdheXMgdG8gZ2V0IHRoaXMgbm90aWNlZCBhcmUgdG8gdXNlIGh0dHBz
Oi8vZ2l0bGFiLmNvbS9zYW1iYS10ZWFtL3NhbWJhLyBvciBzZW5kIHRoZSBwYXRjaCB0byB0aGUg
c2FtYmEtdGVjaG5pY2FsIGxpc3QuDQoNCih5ZXMsIHdlIGRpZCB0cnkgZ2l0aHViIGZvciBhIHNo
b3J0IHRpbWUgYW5kIHlvdSB3YWxrZWQgcmlnaHQgaW50byB0aGF0IHRyYXAgLS0gbm90IHlvdSBm
YXVsdCwgc29ycnkpLgo=
