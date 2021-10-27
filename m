Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2583343CAEF
	for <lists+samba-technical@lfdr.de>; Wed, 27 Oct 2021 15:43:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=0s1pWXubd6WUg8MXQxWST0mgNiRpdF3Zma3ve9TtPL8=; b=i2Ta9zwz2rlAblSo/ZJKs951+/
	TdguumTAxgu2Slnydr+lfLAu8ZYpSHzT8z3Dyjz/b9N1do9bMU86mwNwA691IXXpwJyqckD5zEuRR
	RnGc0fB+t86metwLb6zQn21wN1Lxa/azrZy6MU11uE7Qtwc6132Ro3n6L+YTtg4hidyLVxOtRRudY
	1bXXTC5BnSIhegAplvxod5HjN8JuGutG/7VkK6xRGMT7OrIZEbGAevAMXJ6P3ahWUZS7oX9NUGQlR
	qEJ68VKhoV4QUHBYSCWbMVwuFKYf5nYX9P3Pn3jJhGLjjYVC0AgfheVJYX72/QY0tG6qHsRV9kWxc
	vLAI2WWg==;
Received: from ip6-localhost ([::1]:18206 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mfjCr-0013vX-Sn; Wed, 27 Oct 2021 13:43:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56814) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mfjCl-0013vO-C0
 for samba-technical@lists.samba.org; Wed, 27 Oct 2021 13:43:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:To:From:CC;
 bh=0s1pWXubd6WUg8MXQxWST0mgNiRpdF3Zma3ve9TtPL8=; b=aBYtVIHPizvuSMQC1KfCuHwdFS
 qRcZvw++pTB7zjJmbKDDsCYX8cujUkUOwfv70MvFwwAuK8VW8exdVko3lFd4HIDioUHMwoHdYCvmI
 bnikhXIS4sI76kyBbTYcN3ht6xF3w2Cg+Ir0jRaMqTm8oGedn4FbH59us/2KVSQnuHNoDQlr/rBjR
 61kd2gzxO9OGO9d8P9GYQge1EZ5bCnuZyckufHhDdRtB/wehk+6/F6sJ2SdJZuz9+5ITdpMIgchVM
 4Fe1h0vVN+6a43hVp/DbFBbcZpueXWiVUedXS+EMp9B1tYdNq9mUnYcfvEOzBnhh9VmO6znEOV0vG
 p4m8skTA9oqPoGZG2LXdI6uhQgusQpY8i+MosJox8SDD9ZJU37tbWz/tY3tMuhVXUd8CpdfpE7OPh
 k1kunK/jRa+IkkwD95Sh6d6yLm92KrjzXpW1StttRVLMMQwGtbxkNOOOf9xIxOBp0GTVcOtLP+Ttr
 CDebvKerfeLz4Cq3rup6Ityu;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mfjCk-003W9A-JH
 for samba-technical@lists.samba.org; Wed, 27 Oct 2021 13:42:58 +0000
Subject: [Release Planning 4.14 and 4.15] Samba 4.14.10 and Samba 4.15.2
To: samba-technical@lists.samba.org
Message-ID: <c46f6982-5d32-de04-adca-621132fa23d6@samba.org>
Date: Wed, 27 Oct 2021 15:42:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
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

Samba 4.15.2 is scheduled for Wednesday, December 8 2021.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.15
has been updated accordingly.


Because of some important patches the 4.14.9 release was brought forward 
to today.
Samba 4.14.10 is scheduled for Wednesday, December 22 2021.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.14
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team      https://samba.org
SerNet Samba Team               https://sernet.de


