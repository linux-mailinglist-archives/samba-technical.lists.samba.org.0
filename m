Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B30F09E534E
	for <lists+samba-technical@lfdr.de>; Thu,  5 Dec 2024 12:05:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=O13NAutHaKHQAp4WRqkw7v8FzJhX+Ak1RJrRwZguWv4=; b=vWNO3hHRjjFgIyd2qerrCKvwT9
	UyOe6FvyM6UuIfBguG+s3/tQxQd+hIXzKw2Ngz2PvmxjjQxLixBlxv2aSnGWBg4jKthypxnp7FL0/
	nWcDalFHFpVschDSTWqWvc9rVWwqCmAt+YutAt2KKkktHNFcT0EsCy2C+yQO73WcXlErgeiEyDEl3
	JXZFpJYIJQks2gNUhoKNL6EPxJCtpYuS+BNDudQ1UaljvN1ewqLic1QCRevqnMwwuXlpRCJE87Y/M
	QooUwz32X+J9Q3VDfT66pCTqml+b+M9ociKkZ3ZLyMl1ySGw1CP5KF1CSQYkKqNuhlYQ8oeAgsuih
	6khfIMYQ==;
Received: from ip6-localhost ([::1]:23890 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tJ9fb-003W0j-HZ; Thu, 05 Dec 2024 11:05:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59898) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tJ9fW-003W0c-Mq
 for samba-technical@lists.samba.org; Thu, 05 Dec 2024 11:05:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=O13NAutHaKHQAp4WRqkw7v8FzJhX+Ak1RJrRwZguWv4=; b=rC5kgy/iK/qWtjJsXdjrr4Kejy
 XYbna47ve6yeTCU/mMwB6F9CTIK1k5za5Sjy1HG01yu46qphWVM5v4vnPANUzJbGLS9Lgmwehvte+
 DAnZksxJdKCeQkoTTSHdhxyUcDUvsyUrVjtEMGlFRkdR+Np6WO+elAvw0NDYRoq3mozDhQu5jKXL+
 XMIgWdWuJeOlsrMRvFovp0cJX/Q3FnwaCeF56iSE3rnnWjja8uwndR/YRzx7LXrDvMbRSC8/P/ku0
 CK9r1o0xooA+RJHx9WG05Mi+XWtf8mRMOjM0ASBDjIZGITkNyky2N6g2UGwjhBHt/RxzUAHDOVfDh
 xb5tWBmWijPSMfRVHiFwyyjj2cYv1Om3x7dvJW8XRm9b9TiUWhzEdrQFtD9M7xPq+/mIX7EPpC8zv
 vaBvbu3flDGNfNeyXMGbnbwy2IpJaZjaXAN9DEzYQaDLiwABTMyr/NLJRQ5msyIpKx6QxTYXNGDzK
 jnTlAkcqH+mgVCPQjHsiWxdW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tJ9fV-000qOw-2y for samba-technical@lists.samba.org;
 Thu, 05 Dec 2024 11:05:14 +0000
Date: Thu, 5 Dec 2024 11:05:11 +0000
To: samba-technical@lists.samba.org
Subject: Re: script enablerecyclebin
Message-ID: <20241205110511.13446bae@devstation.samdom.example.com>
In-Reply-To: <da0dbae1-2fde-45ad-97b7-3b92a48dd9f3@kania-online.de>
References: <da0dbae1-2fde-45ad-97b7-3b92a48dd9f3@kania-online.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 5 Dec 2024 11:19:02 +0100
Stefan Kania via samba-technical <samba-technical@lists.samba.org>
wrote:

> Hi,
> 
> after enabling recyclebin with the script enablerecyclebin from the 
> sources, there are no more deleted object in "cn=deleted objects" it 
> look like the objects will be deleted immediately.
> I'm using Samba 4.21.1 from the Debian bookworm-backports and the
> script from the sources of Samba 4.21.1.
> 
> Any known issue?
> 
> Stefan

Unless something has changed and I missed it, the recycle bin in Samba
AD does not work, there is a bug about it here:

https://bugzilla.samba.org/show_bug.cgi?id=10403

Rowland

