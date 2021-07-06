Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 545253BD7EF
	for <lists+samba-technical@lfdr.de>; Tue,  6 Jul 2021 15:41:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=1e/EGZVdDsbs6Op9Mjv0l2hnnp1YGqMwcCKU3/DGQIE=; b=t2GDd9IQh70gej7A4h1jJL4vmP
	EBK8eoNqFU3UywgNLOSlsq3VYY91eWKyS2ZT2NtTiXbEKoeRillI7VVfLXawreJcRqObZbQBxZcTx
	nzaPj4S8s6GDMCzHAGnylLZLB5H++KJZ7JfFozW2JQq6HH/clsSFWXprAas1nEhwrqfobc6SMXm7n
	eFm7hz9/Jjg4qBvrDdSgCew15AhkfOJ3k9rSZtWs+olkVLYF5+2leTl5znlOzvPFwDJews6UVduUE
	FwucPdV8+L+p4ztyKoQM9j8svgXe8wwfuZ06k2rO7uEA7bMGDnRhX+rLAcGGG/IwW2nvmi47+6fKU
	QppXXd1g==;
Received: from ip6-localhost ([::1]:60536 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m0lK3-00CW1z-60; Tue, 06 Jul 2021 13:41:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23612) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m0lJx-00CW1q-2c
 for samba-technical@lists.samba.org; Tue, 06 Jul 2021 13:41:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=1e/EGZVdDsbs6Op9Mjv0l2hnnp1YGqMwcCKU3/DGQIE=; b=fzY0k7tsNl58fsHs/bYrlre6+y
 3dxMjwwsojVg7ljZdADnTLXaVpzVjwwXP3qNSqrDFJDytvZqNHkYJSZv4zmoALqhQODN1j2NZCYD7
 FMQIQ6R/x7tcYQ5V2lipFPNPVuxTbTfI5JXhldQGdZte3vbFLd13m+RgXy0WXEoRGdLj9u/mPiz02
 KHPnFeuJhvz1P4vgqInIOGOmnQDNNehvGxohBk/Wixpwz/pAv38OOaQABcRyZtLkIbEl1ulFypu4h
 hCl/Nl8y1t3dD5up4GAra+hDfVnOnawZpWsgM8pcRX4eKASUIWmZEEX24Cfj3TSyoc8lu73BVKXjT
 y1v9IuyhziQ+p+yK7OWp0mYUs7jOPVwiq5pgRfUAH/2S+s9ab5GfKeDxw7a0lkG+rxEHuTmdQ7TpR
 +9ydIzdNQDQAUE5sBJqevROqvwdXURhmhVjsKVIFpqzIH7WJP69W6WqHOGGBm8LIeFwc1pVfK/Jmg
 VGLzh1kQ90PoPlxA8sIiIgou;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m0lJw-0008ER-QX
 for samba-technical@lists.samba.org; Tue, 06 Jul 2021 13:41:04 +0000
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.15] Samba 4.15.0rc1
Organization: Samba Team
Message-ID: <38d4e381-11d0-e1b9-384a-b7bd7dc85c2e@samba.org>
Date: Tue, 6 Jul 2021 15:41:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.15.0rc1 is scheduled for Thursday, July 15 2021.
Please make sure to update the WHATSNEW.txt file in master before branching.

Thanks!

Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

