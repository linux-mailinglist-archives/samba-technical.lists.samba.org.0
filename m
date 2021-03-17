Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A031933EEED
	for <lists+samba-technical@lfdr.de>; Wed, 17 Mar 2021 11:58:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=uDy3FOZyNHNKAsq6+pL6FwwcOUQ/SVdflXB09JVlgHM=; b=qYMl4bVZpmXq7H4CcK4+pnGwW0
	6mR0ZfPoza2PsMRkE7rHjbg3pqcGoZny78qhKguN5KGEHioPskqlaefvcxr6WhnI7v678+pDthSuZ
	IB2FKkUNzwG8Spj/0xgajeqUKoBFfQdHGEMeZoF/DyubQaXpre/RCKmkXzremcfHArIqdYLLPOwts
	1sU9ZQ8SRzpwbnFYCld9ekT9Qu2swlP/gJ8D5MYzFktEP0EiN2wAHOqf5y5qp+jAqws5c94z5aQVi
	zG8UwBqo7n0nSZi/0QvfAL8LmTUmt3kAQKuElQzIWUGz1SJzg2yjnV7Ohl4Rd1/ic1pfy46k2oC7+
	QbI1oK3Q==;
Received: from ip6-localhost ([::1]:41518 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lMTrl-005m3t-Q9; Wed, 17 Mar 2021 10:57:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23110) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lMTra-005m3D-Er; Wed, 17 Mar 2021 10:57:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=uDy3FOZyNHNKAsq6+pL6FwwcOUQ/SVdflXB09JVlgHM=; b=mP53rPWNPkLDV8arhozIUJZCY9
 2zibudzcqgczZAKhSeUsqcp10HM2jAmkOUX9Y1HuJZVO8NJsUJBJ7mmTPL5kiJLrmSIpNFj4X7UZK
 sJSvlsmeWjP8oe9o8IdiKGT9Y0D6GEILKQzYU5nu7l/LS6pJOrWvisO1chEBW9cikNVs2GwRSTWVg
 uSTG870WeNsbTh2euVExJno5y/KYiit3VIyZGB7FFtmfZXDEfADyusBkqjYxniW/fq5Ardw6rmREV
 P6anEEl5Wd1BimBxynrFJ1rsJmYDT4Gk22ORIt7ZhbHhrOGSM7+U3RUtAdhWZYNVX0NY8B/BHJpmL
 tYjrIeMLsJHknjHC5IAzR3YaC7KLZ8cHwYb6leGNUT0TbcPpBT5j8OGuukwRYwHqejjBgzCcYeiUb
 rOfJGcWtFzHVd6TV5Fz3nHIVCN8Jx6LUtkDgoQZ6NLcIloZ5S6a6wGMrMcxM6YSuY2akQ4rBE3R+z
 Uqb7F2xsfCPkNRifFRRBqBPR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lMTrZ-0003rF-Fd; Wed, 17 Mar 2021 10:57:17 +0000
To: samba-technical@lists.samba.org, samba@lists.samba.org,
 samba-announce@lists.samba.org
Subject: Heads-up: Security Releases ahead!
Organization: Samba Team
Message-ID: <5b349e1c-b2b3-fe03-0698-bf4291f1aea1@samba.org>
Date: Wed, 17 Mar 2021 11:57:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

this is a heads-up that there will be Samba security updates
on Wednesday, May 24th. Please make sure that your Samba AD DCs
will be updated immediately after the release!

Impacted components:

o AD DC LDAP Server (CVSS 7.5, high)

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

