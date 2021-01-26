Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BF0303784
	for <lists+samba-technical@lfdr.de>; Tue, 26 Jan 2021 08:54:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=Bs6+cV2gZEtuy26H0e+98donlbf9/Ymwjcu9GIapbkI=; b=MfBrXYA3kVmEMY58ujCQLB8G18
	C7p4tk39vfJ+iVdMQtSKt3zmIH+Jg+T9bxgkPS4yUNEzGyIYMEqgRhIHgm9AOyVAs54mcHNerbC9b
	HB0IlXiqyew8bab71ko5T1aO1Zf4PNATvIyrhhVyxz5+qxhYtVavL7KU7UO8VjPUuE2mjrneT6lSF
	VK3WTG9QK3IwInItW/6qlYGvkhQOYVwwPd5RuX2NVVil2PtQv66LemjHx3v5SA2vjUOpC1cTvDQkW
	cEAvl/+xWsyrnPPq7gYDpMzkoExvWr+L3G98IIhYa+BaKJPkT8rVRLWH0yy7NUZT741lNeNQkgSCv
	GEEm3BWg==;
Received: from ip6-localhost ([::1]:44950 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l4JAy-0079QY-0B; Tue, 26 Jan 2021 07:54:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33974) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l4JA2-0079Aj-2w
 for samba-technical@lists.samba.org; Tue, 26 Jan 2021 07:53:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=Bs6+cV2gZEtuy26H0e+98donlbf9/Ymwjcu9GIapbkI=; b=paufRBEobLSitVZ4KPZqTRyEdc
 ytQIeFQbYoBAqQWgwO3SCGkJXcrcwlAkF/j6WB5/S76xvbqI+PegpYjnlnYW/Fxq2CX56FIMqpw6T
 5KKSz22oDOVsM1IuHT/KKpv1wSTE3YOFX9FWSyIhUx4Pwdi5oE4UYGCkUdzdUa/xlCOjCweYeovWf
 YpQXtaf9fx5kRhA+m00S2eyduVrOHNxOCNTDB+qYSi5DrNcm2OsSaMUOtsu35gF6s0Uvknu/GQShp
 qelCWJy9vdjltXJeCKkbNs92EnoBciH8VpKm31MRauOLLJpoiRuHvG3ycdlNGEYArD8VWfONBkxBm
 xqlDQy0Hxwu0VHKr1aMRsXVU8vBRVRat8YuCi7D5ZzvqrYf99/6zm/CGM1xpEzK8fIJQ6dSqDMCUB
 0PjTPjCFBIbpAD7ZzYSNUgsh465ivrzzshFgB7lwbK+ABQDmChvaDONYjduG0U6YCXI5n7CuyhETI
 VvNeVPN03xGClW+pHRx6z+Ol;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l4JA0-0006cB-T9
 for samba-technical@lists.samba.org; Tue, 26 Jan 2021 07:53:13 +0000
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.13] Samba 4.13.5
Organization: Samba Team
Message-ID: <74a25647-8b16-f87f-aa05-ce9bfcaa690d@samba.org>
Date: Tue, 26 Jan 2021 08:53:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
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

Samba 4.13.5 is scheduled for Tuesday, March 9 2021.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.13
has been updated accordingly.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

