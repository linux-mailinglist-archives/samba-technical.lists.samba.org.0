Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A84E17F9F8B
	for <lists+samba-technical@lfdr.de>; Mon, 27 Nov 2023 13:28:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=rL3WysA8Xo912/OJVUjedF3JwKsiVr4JJvRfWhMJY/w=; b=0SA4qxchaf9C4zsa8JQuaZ/apH
	sunZGYREnEFYtSRWLwN/zAuVg1gpKF39CKhA9pN49xNytqYjkt67aEH8NuhjcQy8jWNtisQ7sDRcx
	x61cEp+kxuO62AioRFzCYDfkaSQ7GDSYvTl2McvvUF+sYW52pH0C7IZ0sOc3MIxMXTbIHoPuDWzAd
	pyvTK+5U6UI0L9DBdTuskmK2i1brPlQFHuq72CNxMxUoYphRsVI0DYzitKLCth35XLkRFKBoaZPsV
	AkTwcdrWZDOJk10Qw3X3WwI/Yp8x3XUu10wyAJmHMRZp5v5aRAiLa8h7dKvXxXQobSc93mYLB2a9S
	dwSRYrbw==;
Received: from ip6-localhost ([::1]:33258 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r7aiW-000oCH-7p; Mon, 27 Nov 2023 12:28:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47342) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r7aiR-000oB7-16
 for samba-technical@lists.samba.org; Mon, 27 Nov 2023 12:27:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=rL3WysA8Xo912/OJVUjedF3JwKsiVr4JJvRfWhMJY/w=; b=2m8jIzbnT3lO5W5XWiJTuKltdz
 APK7zMi34V2spS+IP6jQsNTfXz2Lu5jTWzwFQ94cfcH7lDmLiUUz/aL7QT5xhbn9YzvqwCnE9ez5A
 vsPv0TBmI+OMhcot2F2pOr4gAB0Oi4LteDxG16m6FER213NtGVJgB9Af3a9JsctaXx6Ek07K8it7F
 fZ1nce9X3UNGfakqwrWHAaqVNHJygkQQYJ1HqVGpxjB4ocDdNOf+g9P9cnHR8f8wUoHISbyyrkUxV
 zP+CvoszGNknsddnMkb1M7Oa26oUa0mEzVOKoD31edDOuw8PxTN4oSxnqRmFPJ+X0Al4dETwe5VzV
 Zs6OqUShyiBE+5mhk+ENPquBWnZZ7H1CLAn7Muk18GbwW7JCa2Si6ZagnEknufSzUm9rVvqvW0I1r
 uozumUi16I/VQjrMOsldUlfYFI9AV4Q4TI9pMy8HRZ1JqgO5xK+vh8tbmXJP4XwBphs/MnLCS/7Rz
 mXNh2ACwOn+iJt+z4k0EAqMY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r7aiQ-000jIV-2b for samba-technical@lists.samba.org;
 Mon, 27 Nov 2023 12:27:54 +0000
Message-ID: <4b0c3f87-8e36-445d-b7fc-87a6277fe4b1@samba.org>
Date: Mon, 27 Nov 2023 13:27:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.19] Samba 4.19.4
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.19.4 is scheduled for Monday, January 8 2024.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.19
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


