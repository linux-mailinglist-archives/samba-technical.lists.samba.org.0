Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E390436B1A4
	for <lists+samba-technical@lfdr.de>; Mon, 26 Apr 2021 12:29:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=6vBJLPWIlOesfyGUogbJiC6pCSjyG29G/sGqLjJyY9g=; b=Se1gG04Ez3M1bOy6G8kLgqVwJ6
	4tZczbs93nFeygtfwN5bxtSMzqRTHWneZLLWSwlPb9GThh472hXP7Ul+3gLWdqHuULjOMOBbOWn+4
	XVbu1SdVUvZ0OLS25d5nznrjphQjH3CvoUoJL0eaUzliuN58V8fM+DohccNCZftyAE5FIOB4cfSNq
	ubSw3+q2rXHUXJCjR9hcD7CXVdIiLkWwqmO55B/kzBcX5IaZ/Cv7ShsK9fBO9TPsasniWEEbZOgrM
	l+tgv/JX9ABWlX+mgfw5A1W9f+6tocQjzmysXbyUCxfczGg9knoLCz+RXI/F/fTWwsRZ1rbwjHm4N
	0aYYIp6Q==;
Received: from ip6-localhost ([::1]:48964 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1layTE-00CSzR-O3; Mon, 26 Apr 2021 10:28:04 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:46374) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1layT8-00CSzJ-ES
 for samba-technical@lists.samba.org; Mon, 26 Apr 2021 10:28:02 +0000
Received: from [192.168.1.110] (unknown [114.23.142.188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id D074F80A70
 for <samba-technical@lists.samba.org>; Mon, 26 Apr 2021 22:27:24 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1619432845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6vBJLPWIlOesfyGUogbJiC6pCSjyG29G/sGqLjJyY9g=;
 b=MEKicWGnYGMt15EVAbB2fNGWMTZfaqFrviqCiGmw0gee0jmiKRx0aIBRm8kqkoxcNfmVZD
 jWJO5YF8mVzj5TsFZi8NsYkESPbVwgul3Mbdi8piNkdJwGGXHDIIzJS9tMjzXxpkXwjavr
 DUse/n65067a8K/6IQmePvO18MDUYpO3B2/GMZfuBrbkKmwVsdvH0jw6dfxwdK9xx3FbRm
 Q3SJCXCXWd30yJKHqfvCgYzrQDDyin4brwWH0ORAPvxkFw4mveocpBeVAek5eSABPQCTqY
 wg7Yt1XPDRW7gDn2uqJbXBOZhbrk501hnTlm+wJ8EQ3s/K7kd5wCT12bJQ84Yg==
Subject: Ubuntu's ADSys
To: samba-technical <samba-technical@lists.samba.org>
Message-ID: <cb13856c-400b-7670-03d3-4db23248baca@catalyst.net.nz>
Date: Mon, 26 Apr 2021 22:27:23 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.10 / 15.00]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 MIME_GOOD(-0.10)[text/plain]; MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:56030, ipnet:114.23.0.0/16, country:NZ];
 MID_RHS_MATCH_FROM(0.00)[]
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=douglasb@catalyst.net.nz
 smtp.mailfrom=douglas.bagnall@catalyst.net.nz
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I noticed that Ubuntu 21.04 was announced with "native Microsoft Active
Directory integration":

https://ubuntu.com/blog/ubuntu-21-04-is-here

It looks like this is based on a project called "ADSys" (GPLv3, written in
Go), that works as a GPO client.

https://github.com/ubuntu/adsys

They use Samba in their tests, as far as I can tell.


Douglas


