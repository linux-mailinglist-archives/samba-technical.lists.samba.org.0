Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5585E23EC7D
	for <lists+samba-technical@lfdr.de>; Fri,  7 Aug 2020 13:29:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=DIqcOGittcfXJz0ZrUBptpsWxfRHL30x9+iqCWhb158=; b=JTYAutsRbxZQPAKupXlnvLkwut
	JAzWaVtWtXpUgJsl9sKc3duiSr/3PPB1dT7eybHVGg0RFZSYb3Rf5bgC6pRmEGLyF2IBSdfCMZJx9
	0Xqtu4aPE//0T6vRl03saeRximFerJv5M9iBD+HNKO+9RSExzZMRuqbpA7O1r1pU2c4J/03PngNJl
	jBPc74zV1EW72jMyDB8NOM2A6AEUC6FUCWwIPBpDgSiyIylg+tZt9XtzlZCo86PJ2viCwyWQyF///
	6358PSiM8+w57RquKt9i2cgPN5m3/L6ySBVVLI+KyC8mIQErAzUXWSvpXSAoNKoKjAboYZcFMCNTF
	ejzzsUpA==;
Received: from localhost ([::1]:49332 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k40Xh-00Cl9Q-PY; Fri, 07 Aug 2020 11:28:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39082) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k40Xb-00Cl9J-Vs
 for samba-technical@lists.samba.org; Fri, 07 Aug 2020 11:28:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=DIqcOGittcfXJz0ZrUBptpsWxfRHL30x9+iqCWhb158=; b=WMHJAqpCVRedFf9/VCxDquzpOY
 y0pJAHfCQYPQGDpqzCfcse+PTGyt1Z4ppbfO8/Yjub8fyhIw6EkCQL0U5/q4+/c0KUYU8b65pViN9
 R4L8Gzkt3Giel2aTbZ4B9kaQMulYTx8wqir8+MszFCIEnYZJ45s0aj70wRvPMJjEnyYkGX4xXOMjt
 kN37WXQQjqa+ueRcvDUQ9ArE8xzApZY+J9WDZmQ5fTGEl+ODM3qNyfoKssBY96GPWcF2IZkptYl5M
 re2sCEQ/jzMty5KIHg5eNZej2ru4ffZky3ykX8IjfPKXzPcfrh2/1czlEtQM90J1R/EQItmtWXmnW
 kS6Y9FSaHywOb4AT77RFZlZwZeMZgXhQtxAm5F7HJK+aYcfl5Kzp4YPkBB+oWllyYvY9S2vE21AdG
 FOJViuKGJENOl+o7wdj/9Nx9iJ4a9sMxDDlS0eVCueCYWmQ05qXtXe7PnbYwMFt0rfL+lhKpMK7+K
 fn6rOHfBwVRk+WkRjRmxcsXd;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k40Xb-0004FU-Eu
 for samba-technical@lists.samba.org; Fri, 07 Aug 2020 11:28:03 +0000
Subject: Re: [Release Planning 4.13] Samba 4.13.0rc2
To: samba-technical@lists.samba.org
References: <8d02b882-e449-dd1c-f9e8-3d28f75c925d@samba.org>
Organization: Samba Team
Message-ID: <8bfa7d90-78a6-5f90-7b15-c4afd051ff5a@samba.org>
Date: Fri, 7 Aug 2020 13:28:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8d02b882-e449-dd1c-f9e8-3d28f75c925d@samba.org>
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

Am 09.07.20 um 11:23 schrieb Karolin Seeger via samba-technical:
> Samba 4.13.0rc2 is scheduled for Thursday, August 6th.

Samba 4.13.rc2 will be delayed. Working on getting stuff through
autobuild...

Will be released as soon as possible.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

