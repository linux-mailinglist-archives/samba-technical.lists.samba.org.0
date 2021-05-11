Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C8337A4B1
	for <lists+samba-technical@lfdr.de>; Tue, 11 May 2021 12:36:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=dYy7liJykeix0L+8Bh/o6328eqSg263ugaEReXG19P0=; b=OSCWP/JDJ0hNnT56SQOP3tqI7o
	t9qbjVrLgdx1TW1xr3o1dGLlt03ADdj5cb8fn8y7/WwQsWEcF4sVXtLOrQosymPZFmDyZ4vqUQdjJ
	P5Bg1jNyKPPZ1aNM3kf+XfSo0yzjj0PI4rQT8/yws3J4EAVnznwQ7PTdTu477p8hgr4hU5/gT+kaF
	vTcjS9x0QVrsbRaTefEKTrZXhYUsEpiMvP3sVB3bIvkMj34qnvPQeqo7XVs6mGBsh85LsCnbaCst6
	NoTfbmZ1Ny5kI1mg1ivwlUIb44j8iqc8wd1zjG6/5nnOqQ8vN9Qn16P1oyxSKHViaNan5TXZIr/Vm
	kS7ilbJA==;
Received: from ip6-localhost ([::1]:63898 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lgPkq-00Gvyq-Tu; Tue, 11 May 2021 10:36:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63644) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lgPkm-00Gvyh-0Q
 for samba-technical@lists.samba.org; Tue, 11 May 2021 10:36:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=dYy7liJykeix0L+8Bh/o6328eqSg263ugaEReXG19P0=; b=vtoV40G8BkkzTHmIoLEJvJHKnW
 MkNdwrLoy8r2BrNWH19cdL8UUWp+aLUF0ydBWIXMNPQPuziNw2Io+FZy1braobzr1uOsYpN0iUJKo
 XFpqaNPQXbpk9KXvwnyzl6VKnuz/tj71T1n7qpUCrmBmvggAwPqRKqjQv44vxWybp2zzllwGW9RAF
 +h2TMdhB8L9P3PWp15RevCDOvVb/lB1PNik+FsDbxU0KJCkW9e9/GCPjjM3hG6fyYGOgCPWAbKaXr
 ay6sNDSIcSti/8TDu+jW6PR0GAP5uHh/nIO0u9pQFvb+HwDdRMRm7Uq/vkvz61Q6Lp6mdDbxUAm7v
 nkXrfqtuGf0ZSPJfTQdMcmnQ7gV1oNSXqlo4pCOWEOzcJHnrb6cPJvz2HFFuqcS7hExr7FIqGEXNE
 EtjQQVndleM8fSsIJ+MMke6cG+95lyLp21iEczlPpGDrwxderKjzkUzqQQIZiaRGzNRNzDdUEVBv8
 fCx5BqqrAiFKsREhOQXwfifO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lgPkl-0002SG-Do
 for samba-technical@lists.samba.org; Tue, 11 May 2021 10:36:39 +0000
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.13] Samba 4.13.10
Organization: Samba Team
Message-ID: <3c8a74cd-f738-3a5d-ce95-08c22a557cf4@samba.org>
Date: Tue, 11 May 2021 12:36:39 +0200
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

Samba 4.13.10 is scheduled for Tuesday, July 6 2021.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.13
has been updated accordingly.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

