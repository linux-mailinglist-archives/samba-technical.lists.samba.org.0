Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB32D15C06
	for <lists+samba-technical@lfdr.de>; Tue, 13 Jan 2026 00:14:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=La+Vs8XVKbW1QWfE1+tOgtFlCMleyiv8dL6WqzARgNY=; b=OQQXFkAElakzI2Ho3ump+zEyMh
	PjaX7wseUqy3mjWByT6UUgwdBDcOB+26/d0CPcHx7O8xD9PLdA3mqvQ2bbYq4VlFDo3yU64fMC8Xb
	k5AZiNTMB8oEW8/FPW/xWGSmYln1oZlRyF0xVe09tXRo/hvbXftJnR8JKboRJUtmXiVPry5wMHN6A
	gvRyBccyocKQcO2DjZEFow1bnAXcHZV9m+xp3hGBdeZBBfyDvYMyfNf1zEko2FDlt2zTCSAXUx1iM
	Tvndf6SpIZsUkci6kcDaLqvK6SgNXFt/uuSHob/rcVGUATqDBcCjaYAybLio2pqTHPpSrPKvrxyBS
	9VJ/ptyw==;
Received: from ip6-localhost ([::1]:55692 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vfR6d-0001Hl-1t; Mon, 12 Jan 2026 23:13:51 +0000
Received: from postal1.et.byu.edu ([128.187.48.31]:42026) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vfR6Y-0001He-Sw
 for samba-technical@lists.samba.org; Mon, 12 Jan 2026 23:13:49 +0000
Received: from localhost (localhost [127.0.0.1])
 by postal1.et.byu.edu (Postfix) with ESMTP id 4591B5E0C9
 for <samba-technical@lists.samba.org>; Mon, 12 Jan 2026 16:13:42 -0700 (MST)
Received: from postal1.et.byu.edu ([127.0.0.1])
 by localhost (postal1.et.byu.edu [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UAMLXhGsyy1f for <samba-technical@lists.samba.org>;
 Mon, 12 Jan 2026 16:13:42 -0700 (MST)
Received: from [10.35.115.20] (edo.et.byu.edu [10.35.115.20])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by postal1.et.byu.edu (Postfix) with ESMTPSA id C72175E090
 for <samba-technical@lists.samba.org>; Mon, 12 Jan 2026 16:13:41 -0700 (MST)
Message-ID: <0816265e-113d-47c8-9e0c-7aa9e33d0c36@et.byu.edu>
Date: Mon, 12 Jan 2026 16:13:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: samba-technical@lists.samba.org
Subject: Patch enabling reparse-point functionality for mountpoint directories.
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
From: Wesley Campbell via samba-technical <samba-technical@lists.samba.org>
Reply-To: Wesley Campbell <wes@et.byu.edu>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hey, there!

A few years ago we opened a merge request (id 3141: 
https://gitlab.com/samba-team/samba/-/merge_requests/3141) for a patch 
that would expand reparse point functionality to mountpoint directories. 
We have recently reached a development phase where we consider it ready 
for review and submission.

We are sending this email in the hope that we can receive feedback that 
would allow us to finalize development in a way that the patch could be 
accepted.

Thank you for your consideration.


