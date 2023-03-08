Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D32416B07C2
	for <lists+samba-technical@lfdr.de>; Wed,  8 Mar 2023 14:01:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=RJAC/VM5xFtMMSllWa5zwNxvm+T1UfpKhSVqP4O0p/Y=; b=CAoBc8PCSfMcOTbL12IEbamuxa
	kXh944r3Waf0zI/fHo5OGYEOx8dm83c079Y53XhXV4+EwRy2uVU+no1c1JBrrPrwWOViKc/TcGagR
	VQ1hAVtJiz0o51/yr/KBu5UpSSEUvyGkvy1vqllLHALEQnMqq6JIKBPqnpOhxm+eBVUe3EOpqRSZS
	jOn1VY0tSZy/zVwJVu5NMNPCapE5zjU0znEnNUurmuyeSnN20e/JbVnMmvvyXDrHTRKeQFvM7e4bo
	bDQxbzcTuJulz3irSW5dZMULoT8yUXNGkX6VHxrXF7pqTHuh+k991K8J/oiQGmMhbpEnd9qYBCRtH
	DScThipw==;
Received: from ip6-localhost ([::1]:24754 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pZtQH-000Dlg-HN; Wed, 08 Mar 2023 13:01:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59660) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pZtQB-000DlW-S4
 for samba-technical@lists.samba.org; Wed, 08 Mar 2023 13:01:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=ZqnzYxxOlAXNUVxWLzIxdGtIDw+6Nn3gfDCW1jtlQro=; b=sh594K44I7OVr3QgFpZ6T5LVgQ
 mXrogFAGzMeefgfAFOTTnBZpmbexmprimPkzvTQc0K5KZVaCSHrVKAWKtw9IwkEyA2dWZX2HMpNQh
 borQM9RGEdgwdT9svkCCfOqwo5EtG86FkJhrsTzZaia1eXc1YRzFpKqBH5TL0IH5yf/mVap3/t//z
 XfVsWV33VPC9OqeOV1PtJinPKYSmh9JeUKbgkUMNvvGToIFQNbLw2uXIxGYF7fQkzH8kNiymIxZsd
 l4BZGIjDR4UZstCy3YUCohFdckx4CGuCs5pw0Sr0ks85u99SgReSj2F5l79OShbouzN498P7uSzPK
 ygu4c+MXar34Wo2tDNcRNvFZ8oAgyy32IuzZDjYovKaqkT04FXUbjiUJJD1wy70XbDsHhdNN8g3C7
 WpTi0RXuwteRuarKotuswlcsxHBbcuUNb2mB2kEaHB/QyWKQc+Xgki7fCxMlJNOiRxP5GP+MOJdBs
 mr0bEqdVeQeRaEMhgLnQJd1Q;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pZtQB-001SGJ-HV
 for samba-technical@lists.samba.org; Wed, 08 Mar 2023 13:01:31 +0000
Message-ID: <3e0c7e3f-ba23-67ff-85d9-b74ba028735f@samba.org>
Date: Wed, 8 Mar 2023 14:01:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.18] Samba 4.18.1
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

with today's release of Samba 4.18.0,
- Samba 4.17 has been turned into the *maintenance mode* and
- Samba 4.16 into the *security fixes only mode*.
- Samba 4.15 is end of life now.

Samba 4.18.1 is scheduled for Wednesday, April 19 2023.
https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.18 
<https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.14>
has been updated accordingly.


Best,
Jule

-- 
Jule Anger
Release Manager Samba Teamhttps://samba.org
SerNet Samba Teamhttps://sernet.de
