Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FD0B2FE90
	for <lists+samba-technical@lfdr.de>; Thu, 21 Aug 2025 17:37:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=HFrFyySChNzdmdg3uVhediDIhIy3J+7JcO9bBs7/BPY=; b=PCvbjMHV3XA5OuYpF47cEm8Bi5
	sQ5ZK5UVGtxRzj2oFhDW2CflaHBeI8EC3e5/NAoKMQeeGq+mKWnbxRvXb4bh3/TP4jEnS0Aj4A6qG
	M05Wz6jNBk+e5EeSM/l3B5qIqrImwMZz90BaAv60smIMdj2wd025DmphwAG9l6NV6rlIuXhE+PbjG
	EzRRDYskuw2iGYeb7EuHT23O7T5qAsHYKwvqVaxxPOq4uHi6dNThqOYNB5ofZz2Vte9Xxe4H7QTbf
	haoalN8GIUj3YrLflmdjnFcqhZZO0nUslJoBD5h/vX+sOItE3ZRXCiqf/QHDhfwPlpEk8rmLrjo/k
	2RMC7fXQ==;
Received: from ip6-localhost ([::1]:48622 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1up7M2-0003Rf-OW; Thu, 21 Aug 2025 15:37:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43720) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1up7Ly-0003RY-Dh
 for samba-technical@lists.samba.org; Thu, 21 Aug 2025 15:37:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=HFrFyySChNzdmdg3uVhediDIhIy3J+7JcO9bBs7/BPY=; b=04Iglu6a4qLKOBAJIJsG4aDirB
 OMG4dX1wv1iXYFAzivF8FqOy2HsgXo2tL6tWEKwsADJnt9olVyr5AI7mDjlelhGy7Pz/zCm5hO015
 WIPdeaIZ59VLmkWBLlqwxupUBjZ4oc7BqmyG2/WZI0rOrDT3MpMi/uRi0N3OYcXyg3TH3FikmJtGR
 1t8+ovabJnRnbyzN6ntFMzrFX6S/KBqsM3X3lNQXLW+w5WIeUmTpa2Ck+g+HbGF5s1TE0gDT43LAa
 O3UgYKnLxqancvgW2jG7A9aecOnsm5BgVF9bCRn85yn5vD9mwdRmuXcJ4ywTNYB2zp9YFCqZX2EVt
 2ZKETk0EzzF7nyENnTvPE+S+llqA0+eJ6YxpVmVr1bOZK7okZkXZvypHJ1NjyEvdckMCcNhhRnUt9
 0nscPjg05ZUcj94sc5hW170Yj4sk7GUhMHtbfTg19UCpfm5nRo7piks6oI/gpS6cAC6DQGxaRMs8U
 uKgcWPFYdz3INqyQzfXAn39V;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1up7Ly-00074m-0I for samba-technical@lists.samba.org;
 Thu, 21 Aug 2025 15:37:26 +0000
Message-ID: <542cd1c0-9233-4076-a9cb-04a1072849da@samba.org>
Date: Thu, 21 Aug 2025 17:37:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.22] Samba 4.22.5
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.22.5 is scheduled for Thursday, October 2 2025.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.22
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


