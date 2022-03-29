Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BFED84EAFCC
	for <lists+samba-technical@lfdr.de>; Tue, 29 Mar 2022 17:07:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=Zcyzc4xKLs2P9FXr8IwYgK///el9Cf/S5TS0frUesCo=; b=Kbv9J+IiCLvkQrOuLQkfj9lWwM
	mGtfKi1cGCur8+CKZrjafqVNfiLpQa3SpOtnFd5gqPkHwIoCB8l2wj9P41X4kcU1dO/zjqIKZ2Kr6
	z3hEnBU9KiJ7MRfcrPDSVWes3LtdWjlcoTuuJBXp7GOjHCOC/pg/59rIL6W2PdQ67REYZCA4KLL+k
	5xRwtalLKvDBSCwg+azRrHGH40TELKBeE9U78qwDPezwahV/zrQXrWtBgyqxWg82mARJQMUp5sSQ3
	nyk4mNvfggTSrkTpHNS4AbDcrRVqpMBvWhc/9q5XRUFyeQKPyk8/lIV1AAkMCmdxqT+yKxLGy0S3C
	K0X6r7uA==;
Received: from ip6-localhost ([::1]:49596 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nZDQ6-006OWY-4o; Tue, 29 Mar 2022 15:06:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38002) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nZDQ0-006OWP-VA
 for samba-technical@lists.samba.org; Tue, 29 Mar 2022 15:06:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=ds6vFt8LqO/gsjKviSTi5vZ2VtZqcXFhvbmgSlmVGw4=; b=u11yeuNBJP7dTafi7D9mOerGqn
 k5tzI7xWWJZ+wpGbY4CL6e2c1gFpqxLo6aooSGyiVu1zgEFwh2rj36w0UHcC2hGPpsgBUowyZIzs9
 7iG7WQ7N4VW33cPfeXk9ianx+WexaB5k9Ufnpikvkicyff6umYydNwlv8Z3iWW9jTHvOc4LxdZ2g2
 9oURErpiA3Z6vftyF9JRSBR4bV/neK2km/qpwOEe4kQ1AXj3FHWJ+DXIdJroruN9tfXv0YdWe5fKq
 yyeGOZpeCsy9DZGHtYd8yAxZc31G0PHN331lDig7Yr9gElwFE64jKaY6lBmm0lPAADZlL3+MDoi6d
 46XYrufE0GksECnAJG0gWhUGadeKr60eytUWYah+YaNouD7/mk7Qua5CEY6ywmlX3Y7dosFvo+Aj2
 z8C83A8WN3JJlxYauMXUBc1jDymkIWnAAPHKUB3CV8U+VCIH1w7zIR/rnTzMNIauTR5snZvLnxNsq
 y/s2hJhklkWJ7V0EVpEqPkGc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nZDQ0-004Dw5-4X
 for samba-technical@lists.samba.org; Tue, 29 Mar 2022 15:06:00 +0000
Message-ID: <7dc59386-beae-d875-4587-d9c8c5b24d25@samba.org>
Date: Tue, 29 Mar 2022 17:05:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.14] Last bug fix release
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

this is just a heads-up that the last bug fix release of 4.14 will be on Monday.
So if anyone still has a patch that should be applied in 4.14, assign it to me by Friday.

Cheers,
Jule

-- 
Jule Anger
Release Manager Samba Teamhttps://samba.org  
SerNet Samba Teamhttps://sernet.de
