Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFC93EB32D
	for <lists+samba-technical@lfdr.de>; Fri, 13 Aug 2021 11:08:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=7HAbxdOODzWTXkvnRRt4IRl/7SbF0xob2odx/6/7X4E=; b=zfcpb6Q52i4+5eXjA9PntumKFH
	DWFkv/Z5sdSKd2lo8y2hyYo9RBIx4D0CmOoNI/vXXFJEq2iHx9MxEVHAlyNm44FgiSiWVktCF6pG5
	xgcxXVwzG/O3tcJxd82RDL+VfJoO+z5U24geJoHmeM4DtMRKY9Dq12HPyUAMiw5Fh8PUQP5Ho7dJL
	U8N9Hjvsydnmqw6V5RSIfR1unqj9vP8BUZffx8A9hY8D7GwmhUjXnATmpF4Eix3K/8gi8Fg5qB4vp
	KundBUZjYQOnvEg0dkO5ycHjfHxKeHsR7Pf275evYDAB0On9RCngi06Soa4qbqhuK0X+VQ+bQtkA4
	/nCR++PQ==;
Received: from ip6-localhost ([::1]:64620 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mETA6-005wX5-TJ; Fri, 13 Aug 2021 09:07:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56918) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mET9z-005wWw-Is
 for samba-technical@lists.samba.org; Fri, 13 Aug 2021 09:07:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=7HAbxdOODzWTXkvnRRt4IRl/7SbF0xob2odx/6/7X4E=; b=iHhuQyCtJfwhPtruV9qtERBQ4X
 ihYJmU7bIDfd4Vc2qcCgIrbGt2Iu0KjwnFnt/7w/BaYjWH3xUcvhNhcJH07Uo+b00bC4kFbv8W4yk
 hyHU2Grzbc/1g9MEifK4u8xbNeQSV/CBqWCvGg7dCZpWWZQORXUWjPeRgQVo3xdYfPQpAXxcJhNHP
 8v5K4FA1MQiWgUEdlryaosf1DoHAQ/BQe9L70/QiH7y/sprBe+A47+jOgfWrG6Ekhx0VpjTiY4OII
 uO/bS7O1oXrwUj+w6Mp3xh7EN5L1OyUaDg9bfmWDnL/SlO2WO7RqCwvGXZS3IT1wlx2XLKLfiE/QJ
 UAWxpOKjnZYPCG4GxeoOegwogsqm5V5fYbQ0PQfkmFGJRe70GCBiE/2P9v34D+aPcrNToycY6Twks
 e5XoNkeHdEt6Ye/xVIcCUrfPAbb6edLiqd1ngUGCt+WPluSGkNJLGL9bHCMeoo51HWjZWA2a4lfsn
 c3+MTkH4v1nJQXKk4VzCyWW4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mET9z-0012cB-22
 for samba-technical@lists.samba.org; Fri, 13 Aug 2021 09:07:27 +0000
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.15] Samba 4.15.0
Message-ID: <a6104d7d-f3be-ca55-cee1-e2ec3528b68a@samba.org>
Date: Fri, 13 Aug 2021 11:07:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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

Samba 4.15.0 is scheduled for Wednesday, September 1st.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.15
has been updated accordingly.

Karolin

-- 
Karolin Seeger                  https://samba.org/~kseeger/ 

Release Manager Samba Team      https://samba.org 

Team Lead Samba SerNet          https://sernet.de

