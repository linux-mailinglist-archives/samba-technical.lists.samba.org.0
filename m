Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD77968735
	for <lists+samba-technical@lfdr.de>; Mon,  2 Sep 2024 14:11:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=lLVPDNWgry7YTD2gNaj11cW/+Snr0khDiL63VeEeGVI=; b=toSavGj9Jgbfq5cVVHbVJdOltQ
	EK8Qn5fltvbExGk8KT+t1Qf6HkEZVNiecpy3NCSX6S23bBdMdaNe/562QH8zMHhjwafHIg2MEbTQl
	Z6he825gcHbK8ENG5kJvrNIWeDQIuTUuHDzWtQQkfY5vLxquGi/Qr4TA9vSgj07Y55A4jhRcNcgFE
	YkwZ7z3/GDuE5fnjUqCk1y5OIgmRP3+pzQxgK+Wzrvu89iztp3GuJu27s3QOsb6fMIBa0ahacoEug
	Rnu6k+cGmfDAsnHx+KGUURe0iINllRf5WCdMUzY+yEipVYtLCevamJb//QsvTAUwAjrOYMWezJ2CW
	89hMmrFg==;
Received: from ip6-localhost ([::1]:19194 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sl5td-007pKw-AP; Mon, 02 Sep 2024 12:11:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61492) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sl5tZ-007pKp-0o
 for samba-technical@lists.samba.org; Mon, 02 Sep 2024 12:10:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=uzfCrfW/atUBW1ATct1OmHbSzU2fWFlUCk+2eYZSUBw=; b=nPPEhXmH7BF46FmkVG6G3FUpek
 lc6KoEQ3DARF1F641waR/+C9L8yv38j27oLDoX51QpvnrVjxsT5Ejufq+XHLSJEMizMrB68wZU5GT
 PMyjRgtCgF1cBeOOr4L+En591LgWMLpHkannGvAbulz9UTABninLsVhp7UViKmMzb0U4Ep1h8cE44
 xYjHz++ox3x4ATj828RwpbjDCFlQSzg4JFc/2PkpAPQbSewBV/4cj4m+pTRdFbjmA9zIHHFL7tR76
 7pxvwaHKOEyODn2LNuDwuuhh2+rwi8YEZMm89GCR030zlItHzlblceHxGH7wvLZe74ZNI9XYUBxSx
 61X2ISuEgNe6WVEG04o8ZGbrW2FltrK0+kZax/5KM1i6tNsjvwKxdIPI9ZKyAw83aemulSu2XhJVu
 Ul/6KCbT8YW3dT6dcR07M7Dx2AuYZyZYM61wWUijJ7KtR3BKgyf2f8ILlzF9oNZJzkX9UWy71k7Pm
 sT2aCSWxJMZ8H4TL4dlCDTwn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sl5tY-009dnI-0K for samba-technical@lists.samba.org;
 Mon, 02 Sep 2024 12:10:56 +0000
Message-ID: <cde07380-47b5-4d2d-a0ac-8885555cbb9f@samba.org>
Date: Mon, 2 Sep 2024 14:10:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE, en-US
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.21] Samba 4.21.1
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

with today's release of Samba 4.21.0,
- Samba 4.20 has been turned into the *maintenance mode* and
- Samba 4.19 into the *security fixes only mode* (there will be a last 
bugfix release in October).
- Samba 4.18 is end of life now.


Samba 4.21.1 is scheduled for Monday, October 14 2024.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.21
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de
