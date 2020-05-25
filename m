Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 883F71E09FA
	for <lists+samba-technical@lfdr.de>; Mon, 25 May 2020 11:17:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=dyYjf9IBMeuGYCUb13+qtLtzHaprO4y7XACMBbT6EMU=; b=J0Au7fvGK0kl4gNb8PJaE3H8e7
	J3GMyHtYZOKrVQbzXT0RX6dpYpnGyV3YqQGiSbD4opjWpJz27YKB+/cFQ1ZaItwcYrDNPRGa1nmKI
	AlnSF5mmpQWP65AK4gW3GiNSZcgwJwi9OAjbsJZhq7WoZdW5/LSQZq8DsVO1zKW8CAd6Z4wrEXNj2
	cY6+JyGrqB6MjYJsJK16pUEPg0+8bkrVNBQps8ylrnFtGi7M0JcfUzlXlIlrMnHIYTMrjJAKdxrZc
	iWlY4mURp5GY55U0xLYkSI0Sk9wnX/JMM3GTFQXOwCwCnETo2pq/d2iHaQeKiBC3rvutOqtK3lJ5G
	zQ256O0w==;
Received: from localhost ([::1]:63898 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jd9Ea-005ilH-UC; Mon, 25 May 2020 09:17:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39212) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jd9EV-005ikk-Rf
 for samba-technical@lists.samba.org; Mon, 25 May 2020 09:17:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=dyYjf9IBMeuGYCUb13+qtLtzHaprO4y7XACMBbT6EMU=; b=zpgknLj5JEMzKYmYEOYECcTrRe
 SGDRVy+dYX8vEwv6cFkEZcSu/y8N/MtLv+eFMkGj3Lqe0ujkt18kP8gUoGHi6kCdm3rZlJFZypcVV
 IrT6ar7wWZYD72s/1s8LHjpqFyYfU+jGHMUW+q7pEo9XwNSowAkGO1sk1xjrhXYjfl0eNA4NKoqvA
 T8iahFpj9b64xRTfA0ucsfljfhV0zSUSRlovnlNKMdIsL7SIAeaWs5D/438+Xa7E8sJXGl4OCvliq
 QDeqSZyGx3Ts80tkLszgUc7Vz9/5zuEbLkk/ENBTNTO3u8kZbQs42Y1soRwLoz70hypmjhecBK8Sh
 ZrmCRfQxIiws3sx3FgUinDnbEY8e/5PWqRgPZSQtwF2R86K1VBzc1gkZi5/mTesdX7/9QAtjaOWMM
 301dsZYlqpV1LgY34KHwO9kn7TD8PP5pYiKCGOKTDFprO+mynN133Y0pHMkRpEYuV1ejLReNTcq2v
 H48uUw8YjGvWdSPuKrf+q0Rw;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jd9EV-0006k6-Js
 for samba-technical@lists.samba.org; Mon, 25 May 2020 09:17:19 +0000
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.12] Samba 4.12.4
Organization: Samba Team
Message-ID: <509a2e2b-1220-142d-fa12-1974d88daccb@samba.org>
Date: Mon, 25 May 2020 11:17:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
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

Samba 4.12.4 is scheduled for Thursday, July 2 2020.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.12
has been updated accordingly.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

