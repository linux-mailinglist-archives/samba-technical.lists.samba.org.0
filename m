Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D61377EBA8D
	for <lists+samba-technical@lfdr.de>; Wed, 15 Nov 2023 01:23:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=8AX+0oB+Wxg54VUt7Dqxqqw8cmSPeIzIoIbGqLEWwas=; b=UR/VsnEfpnk0o5nBQgQPuqg5ng
	xjO+BVwTLJ3/1cMWtpmf/i/V2rKDC/YbtHtA7pQQ5bcLwePlSQo0uh+GGS5yUyedFDiSDZhrwlHAm
	b4ja2wPBcDoRS37HTh9RDgsjwnzEibkEdL5VALVE18tb/8ri726Ovsma1ecxkNz7hS2IMohhBeLoD
	XWkE6Y+a9v194+9x4L4Sfn8aBWfYo3neVha/cGbzOIQZpkEHs85GXJkmzP+4xlU6pBYNr2vXHD1LW
	QBTFNcUEfc5AdIJubpF0OAw2c/7ARTycwAVEtiEWD0MTR/it9RpaZNgz4HBniWXn7jPpuCd9BE9ex
	BxyEkHUA==;
Received: from ip6-localhost ([::1]:50506 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r33g4-008Mnb-Fr; Wed, 15 Nov 2023 00:22:44 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:54934) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r33fx-008MnS-6H
 for samba-technical@lists.samba.org; Wed, 15 Nov 2023 00:22:42 +0000
Received: from [IPV6:2404:130:0:1000:2225:64ff:fe75:8a7f] (unknown
 [IPv6:2404:130:0:1000:2225:64ff:fe75:8a7f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id B7930821A0
 for <samba-technical@lists.samba.org>; Wed, 15 Nov 2023 13:22:15 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1700007735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
 bh=8AX+0oB+Wxg54VUt7Dqxqqw8cmSPeIzIoIbGqLEWwas=;
 b=x+KnztpI80gjFaqmz7eUYzX6blNPuxPes/jdoELlPfo5ZzWJZQGPYFz//hxDBp5y4rF4ft
 SiSZLNSJyXC1DmY34s0fWQABRnJpWrP856Eds3Gnf/IuOHTD9pxWwbXmYY/qGcjqOPBfj1
 3+0ZL8KJKwYY4aZTiy+EB6xG2iyjjQj6NXn6OJRo4rAKWKvzIuoKQcFI1fg/jJ1MbMOBTx
 6z06Foyu0M1I5llMlsWMYi41VK330DWP9MBbj001v7EN1iHsQQMZKUcJmvMYgwXExE6cSy
 FCMKGEcye93vUBD1EnhFK8U9HRwtZwH1NlGRRyD6hrc/CQXsHEFyVlbyR+Z3mQ==
Message-ID: <eca883c1-c232-499c-b290-fec0978401ae@catalyst.net.nz>
Date: Wed, 15 Nov 2023 13:22:14 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
Subject: autobuild, CI broken by unix epoch > 1700000000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.09 / 15.00]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; ARC_NA(0.00)[];
 DCC_FAIL(0.00)[failed to scan and retransmits exceed];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[]
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

To get a unique OID in a test, we have

governs_id = f'1.3.6.1.4.1.7165.4.6.2.9.{self.timestamp[-8:]}.{suffix}'

which would have been fine for most of the last 90000000 seconds, but it 
turns out that an OID field can't start with zero.

Today at 11:13:20 NZ time the epoch flipped over to 1700000000, which 
means `self.timestamp[-8:]` now starts with a number of zeros.

We will need to backport to 4.19.

Douglas


