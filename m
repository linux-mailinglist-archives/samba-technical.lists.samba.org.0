Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 625403EEC7E
	for <lists+samba-technical@lfdr.de>; Tue, 17 Aug 2021 14:33:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=Dje5o93tR2YR92jp+vOKa0R8FZouXgeIGtxUDdJLWk4=; b=JPgqcbmSD96V7gadyiRnhJ350b
	r1PyGsdXLrhikOb1G0DTPwCZYzdU/tu02z0NIYwKn1CJKKAw/tXeKExunuILUyMfI8ycUjJyZGGUt
	6WKctmnjdvZDjZT4bW+AGZWRTKescqI1yf6bRSuvR2G5Le9/+sBVQKp4BX6V7eEmqxu0AdyZvrJVF
	GGx6zyDUab9rvhV3s6jgRWOL+9QLA/qpbDHADb3rz/ucoJVZVFyX4hHYudZLshk23GIpP1D+o4Gy7
	QK7XPDWNkkLqMZJvfYrEU4tcjTJ1MDMHNxaC87X0dXlbAWaCrtCAt+XE4b5Cp4VwGg2gneQGeq78/
	h/v0yFRA==;
Received: from ip6-localhost ([::1]:25572 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mFyGe-006v7h-I3; Tue, 17 Aug 2021 12:32:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14250) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mFyGX-006v7Y-GK
 for samba-technical@lists.samba.org; Tue, 17 Aug 2021 12:32:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=AabKs1F/Nfk5D8MuCLa7EKSJYBd2TuY1kP6HblqErrM=; b=H1pk4jg/FZILWkaUpPpJAEbcVd
 LrSugPFz4VJ9wSlvJsaGdQ/WASHH9J0VFg0clVUqV5sraX88nb/q8Uiw4RFVnZp6IHdtjRq49WeFG
 6x/XYkoRvbk/eG3CruJbqNtt6Ky8QB3g9gZCT7COExZOnkFLVkMjWlae0to6CsHA4Nvm6XEnWQjyh
 TvSFYKmS8ZJfr9nBe56FiJRnZ3B7dX0PFbwxXXw4cJjddrlAVGwWlMbvjlJIBjahCD5SBrR3LTQOQ
 ifMdxEY9GvnfGfRSF5JJkLV4e13itE8Ip50AzMDwZ3R0HKyXejTa5SmsdtW3otucUBW0SoQ5emNlx
 Dq1hhJ6gJ4FUi+ahh8Lm3veKIZonE0XQBD9EfTIaXY1TKqmeeuYCLdiJWXdayo7dLtAwzlktllxyB
 q92Je7EaN2HLOxV0+Niqom4jFxdOHvc+OifybMIh9lnJCmDQW4d4CFOKkQMH3aGcGh6pwclTRvVif
 +JNT8Y756tASHhh8mq1Obppd;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mFyGW-001kKN-VM
 for samba-technical@lists.samba.org; Tue, 17 Aug 2021 12:32:25 +0000
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.14] Freezing release branch today
Message-ID: <e229bc72-e0b6-b28b-3b86-bccb224f0e5c@samba.org>
Date: Tue, 17 Aug 2021 14:32:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset=utf-8; format=flowed
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

this is just a heads-up that the 4.14 branch will be frozen today,
because Samba 4.14.7 will be released on Tuesday, August 24.

Cheers,
Jule

