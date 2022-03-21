Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AC34E26C9
	for <lists+samba-technical@lfdr.de>; Mon, 21 Mar 2022 13:43:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=qDc5Df0cUPiLdMKwYVThOqjPmTV/nNpYR38Pr2nJbiQ=; b=hIpyCFA9xWxWEaHs/4Gqm5PgLJ
	xP+z8mTh4bRMexp5y9J9e3/v9xxM5zysXK36kxLygTl+sOC9g7X2vboAVHVPcGlragow+B1JaaFvY
	hL0YIoeFXTbH9yy7+rH0a4gAEAex6Uzphr14Tb/H6IyXB2F1rBVMNhIHfWb2N1Xz86hP1jwAgoFhq
	R1gTtUAH8VAzF5x5+2ZG4LqJ9tjVByuz/bCHICHgDsWs+T2sIjA6Yc2SHleRLlJO/XiNG7gBPolUp
	Ben69AniSPrrKhPn4dUaHQ7ODQAmZlqURhJVJ5KyEZCTBR/5oH9Uz6zs0yDFrAu7nBE77QokojUSM
	NXTBFAgA==;
Received: from ip6-localhost ([::1]:24250 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nWHO3-003xKy-Ac; Mon, 21 Mar 2022 12:43:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37748) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nWHNw-003xJu-St
 for samba-technical@lists.samba.org; Mon, 21 Mar 2022 12:43:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=To:From:Date:Message-ID:CC;
 bh=G5gklf5wd36QIxrFSymLPeQXmyWZxYHABoZuZCzPKlc=; b=2MhYKgikrBlwqMsFzjY+GMF1h9
 uQFapym6Epxgq+NTYT2rHvK5VIAMkBvJJA2TpMEmO6kpwDr3yGDqkAWD36SyVWCm906JFPF3Biqjt
 pNfdA4h5tlXswqKrnLyYdXyrGT2x3yH8uOIWjvRJ4UEPHp53jU0NH1ebdDwqBxg5Q+sfaaaqM/A2U
 i22m38WV+xwlYuhmuCJEps/5xXV6Jx4AZ1zN/nf8PVw8PNlSZO1AtqaFCE0S5O+P8g1pdR/3nYxM/
 tqv+GRuSyoQa7pvKgZwOC7VrXrD2fyztbBFjH4RRuAQsPs1vGiuEhyLMjzA3nd9MfW/kUQCYGOaOE
 UbExozbrU6H05oDahW8Q3SdfY/GSYCmwkkcw8RiaZu7BxGQQSR0sUxZnbsxR25MAYpoN8FKXAkR4q
 ls+MgSyXdg1F9R7aziANwhSKjFtwiZtgBHy6NbJ9uRXcwpVxpz3861O9hxiHCNXEDBOWCZl+4Vjfy
 dif6M9+vVrCCuqO03s2x04tO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nWHNw-002dHn-Hm
 for samba-technical@lists.samba.org; Mon, 21 Mar 2022 12:43:44 +0000
Message-ID: <ab263e7e-1fbd-4bd3-1755-f71bb2151d67@samba.org>
Date: Mon, 21 Mar 2022 13:43:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: de-DE
Subject: [Release Planning 4.16] Samba 4.16.1
To: samba-technical@lists.samba.org
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

with today's release of Samba 4.16.0,
- Samba 4.15 has been turned into the *maintenance mode* and
- Samba 4.14 into the *security fixes only mode* (there will be a last 
bugfix release in two weeks).
- Samba 4.13 is end of life now.

Samba 4.16.1 is scheduled for Monday, May 02 2022.
https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.16 
<https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.14>
has been updated accordingly.


Best,
Jule

-- 
Jule Anger
Release Manager Samba Teamhttps://samba.org  
SerNet Samba Teamhttps://sernet.de
