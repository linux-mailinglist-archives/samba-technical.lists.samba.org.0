Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EB05B3630
	for <lists+samba-technical@lfdr.de>; Fri,  9 Sep 2022 13:19:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=6U6vY87Y7I+z8dxyB0vB9k1QFnfJYLzhkzm+ccXskzA=; b=qYkq97Ty4OQMHPT1s1VrO26itJ
	4ZzrQ3UaB8J8td1Qd0lr6kpTsMUBMhJ9O0D+L0dwi/acUyFgyQmhm/q/YyLZ588m+osC0AvEXINxc
	EUOGZAtNUIjmnjSFjY7mc67mJr/1RP3WYA/OQU6TV9LwqF3/wN/o7Uea34/fypd+ZThsLJZnTyeOM
	oTiu7/UXKUYK3Hla/octhGwN7zY0xcIOacKsiu4WGNv5146Qwv2aw0vsRSuu1Zqxj3NDUJEdhYCQS
	SbwYQ7evQ0KYJ5bpdrexusyX5pCXHZSDiM9+uRfq6NA8QpVHXmN/hsmGuJ4t7pDotJfOAryXmeo3m
	FqBsRXHQ==;
Received: from ip6-localhost ([::1]:52616 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oWc2b-0006cQ-0e; Fri, 09 Sep 2022 11:19:21 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:60481) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oWc2V-0006cH-RY
 for samba-technical@lists.samba.org; Fri, 09 Sep 2022 11:19:17 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id CB787408E9
 for <samba-technical@lists.samba.org>; Fri,  9 Sep 2022 14:19:12 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 342A412D
 for <samba-technical@lists.samba.org>; Fri,  9 Sep 2022 14:19:13 +0300 (MSK)
Message-ID: <cc05692a-2a75-a9d8-6f33-88ffb91a9588@msgid.tls.msk.ru>
Date: Fri, 9 Sep 2022 14:19:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
Subject: ldb ABI versions in 4.17: should it include 2.5.1 & 2.5.2 versions
 too?
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I'm not sure if this matter or not (since ldb is tied with samba), but ldb in 4.17.0rc5
lacks versions 2.5.1 and 2.5.2 released within samba 4.16.x series, while previous minor
ldb releases are listed there.

Thanks,

/mjt

