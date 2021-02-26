Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E33973262B4
	for <lists+samba-technical@lfdr.de>; Fri, 26 Feb 2021 13:28:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=m2Bij8JRgUHqlGE2L/R7G9hmTw6A88JA4fUTZN1bQvU=; b=gZ00hVzdRMbyGaVYXVtBg/Bu46
	XU9PD3A3e7CvxFolNmfjAoFprFDx3XAAVdvuAKpYFGEuaJu+nsZujcOUASTUBSjWKb8vpQ5i6yVia
	PPvCK/OoHRCrQVeSDORGkr2hhbNbpYhbGF0Ry00xwFhdV/MxEWTT7/DzaX7hMRi50ykvEAIp+eSxH
	Syj46P+MIxvCclN+gqITdbtbo3OcBLMZncsKLHyG+WpCTie1QohOhT3inL4+sfTJHP83G9Fusjnei
	eXRcOScbcujXvmVhY9FciKRoOh1hUm+j7pzppjjl8iy3IyNhUdsuzAXvXuWqnRwEYxXnFcPrO2EVt
	xaHqi9kw==;
Received: from ip6-localhost ([::1]:41620 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lFcEB-001ZkK-Oe; Fri, 26 Feb 2021 12:28:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35750) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lFcE5-001ZkC-VK
 for samba-technical@lists.samba.org; Fri, 26 Feb 2021 12:28:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=m2Bij8JRgUHqlGE2L/R7G9hmTw6A88JA4fUTZN1bQvU=; b=SZ51hW+eLlc8ddEw6+clK+QaV2
 T9LPyMaC8XYXVI/w7eWt9UMChCCP9BkCi3Ra1AbZ0nX9tFidQHYFdo1LSXifXmmha5BH/jZ7Aw8Ej
 MXjnNJrppvhbwuB41+m2xl3qdAnumbfKPdCUk4WfvrogxO1TiSnCC6Ufy7vEt0YGwmIWmXNGBOW02
 11nbTsq5m4VjD5WQH78w5LXGHdT6trw0OP+UHZkos5ko6khoXavWs+zJD+OXnUdKHDw4BR+RXrR48
 wYHYCMdjy2vdurs1xg23vrHiAqW/4wmRygq8BUbYe73mpgy9JqOnvYkjZIG2CRfNjlWI3PvfwIm0P
 KdDOBvaeqTvZQRgtSK8RkAFaGq0uKRs34PmprMX/5RXjuyLrgyS7SX5qzq63sQA7ynktl7DlLPcGY
 7dp7ZqXpSJ+qS5kUNOOD2NaXit0T11my0a4ys6QAk6hEf9l6ZVDwdjnYawJ++ubkDrOMFPxjHryz+
 CM9KBJgXTb9euJr2IZZgAdJZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lFcE5-0006z3-9R
 for samba-technical@lists.samba.org; Fri, 26 Feb 2021 12:28:09 +0000
Subject: Re: [Release Planning 4.14] Samba 4.14.0
To: samba-technical@lists.samba.org
References: <a34d500e-e976-9cbf-08ce-83f1a32623da@samba.org>
 <16640afb-9456-4d37-3529-7e33eaef709b@samba.org>
Organization: Samba Team
Message-ID: <d3740600-3604-d65b-9804-81e1739dd924@samba.org>
Date: Fri, 26 Feb 2021 13:28:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <16640afb-9456-4d37-3529-7e33eaef709b@samba.org>
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

Am 03.02.21 um 13:04 schrieb Karolin Seeger via samba-technical:
> Samba 4.14.0 is scheduled for March 1.

there will be another release candidate on Monday.

The final release is delayed until Monday, March 8.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.14
has been updated accordingly.

Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

