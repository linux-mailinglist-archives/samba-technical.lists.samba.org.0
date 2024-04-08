Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CF489B8B0
	for <lists+samba-technical@lfdr.de>; Mon,  8 Apr 2024 09:42:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=T6NQz2gkIV2aALsasuh4eE09j1RFSADYdEf01A+bPnE=; b=Zk80cGWUT4mKABOma9yIH/ZgMP
	hbX1wzS4Av7OoJTqXaa62L/kl26RStohZGfbLe7aX4XVop5a/sH3fgU5c1mraiUUTdvy1AgVUBnZL
	BvltimvcvWr8ovELZU342dY72dnAvA79FkctoD26CgzKXVEyZYPD1AAGKT0T6jy4P/rhfAomrwD25
	dc2tSoHSafW9iHgNy430W+ATBWDIEK3pTJV+ImPSyTdlM6fY5Zx/Ja3w9XvjPPcZ4YvodNYn34wNB
	pUQxDVr/LjqrxKGwoO2XoWgVXQU5FIi9jDx/TDvRknpDRT9VVAezqPgqFUfjgs5szgfsHq78MQ23S
	s7sxdtwg==;
Received: from ip6-localhost ([::1]:55406 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rtjdO-004HEY-7K; Mon, 08 Apr 2024 07:41:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61678) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rtjdE-004HDx-2R
 for samba-technical@lists.samba.org; Mon, 08 Apr 2024 07:41:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=T6NQz2gkIV2aALsasuh4eE09j1RFSADYdEf01A+bPnE=; b=TlcQqbe1PmzEaVWju7cIW8pmJ1
 /XinVPcWoU9UOgigmtEMB9djGCpOjtTaqA5+aWlLY1fyFblTqySh1lPnZISQLrDWwaA0mfkf6t616
 pCAvVBQxQBHPjFTr9Vn2HBVnmO7r2kI7BeKfRenB9nma+q0nG7QsXUBkFnBNZoV0GFEj99XsuoO1h
 sdNvhiQFjmTA7PiqpUEt4jGfZNNz/06xHiKNR9ZP6cJFu+aUNKouyFjl8qeGA8mOXxyQOyAauR/TJ
 YCRLGsOZ9Lda/wBQuQIzVE35J/0h+l8N/x/SDZmPGo/cmZqbypaY4VRklZ9kxfXrEj+CWQJIk2W7u
 Sp26hYI6brkXUpmZLzqecpltkSludlG1qk0Jfj3Y9hqkxU2udtQhHnN6nl2hJyK6wgXBbHkzfzICR
 bZk2a7XsV4s4jsvNDTCN3wBRHMZOppfafDyBZR9VpsMBCNb8WfoPv6I8eE98NCiBbiuLJiqZiudDg
 g/oqklwUZDkSNP5GPg7dSXRg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rtjdD-005JCr-2N for samba-technical@lists.samba.org;
 Mon, 08 Apr 2024 07:41:31 +0000
Message-ID: <d2c7f45b-9cc9-4114-9f1a-4c822be592c1@samba.org>
Date: Mon, 8 Apr 2024 09:41:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.19] Samba 4.19.7
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

Samba 4.19.7 is scheduled for Monday, June 10 2024.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.19
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


