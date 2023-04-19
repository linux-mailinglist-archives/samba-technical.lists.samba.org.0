Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDF16E777E
	for <lists+samba-technical@lfdr.de>; Wed, 19 Apr 2023 12:34:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=vjxd2L0RAkv3cEBq2RWw6hZveg8+c/mzvnV/Liyo/bk=; b=5RyxaJXfQZ5oPzrYwGrm2hu/zJ
	8HitXcYY3FrYC8AIauExEPV2+x4fcTpRCGpobL5btnH+ozDGuA9CePXt6mj2eTm5RrGicX2uM/ElA
	S658uMvA1DjYSUU7I+mhG7JIciTvcs0De7TvAKanbtMTQduzDV0uYYuhUbRW5WMl+kPirdaa2AFPs
	S+iMpmt9wS0NyeyfsEIY+N6OfZK/tFfQ4fkPxAyjlF7+pWGb/wmbfnNYOxiVFmJbFv9xiF4MQWH5z
	/euwLG9IaP5oKDBM6W7fK8IL0q1983ncPUfNFWLnsPw5I7lsyMm2LCQzQmr3sfo12OyVHE8EtYtMS
	19wjtUpQ==;
Received: from ip6-localhost ([::1]:63040 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pp58t-002iMS-RN; Wed, 19 Apr 2023 10:34:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29484) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pp58m-002iEy-43
 for samba-technical@lists.samba.org; Wed, 19 Apr 2023 10:34:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=vjxd2L0RAkv3cEBq2RWw6hZveg8+c/mzvnV/Liyo/bk=; b=3Q0bpEra+vg9UtkccErb7P9vyb
 ZEKxF4oxinEPlBXwaV8LVCP3zMECmoXuIRSPDgqkZyeYAzjBzJp1vUNsvbE1Oc6yzVk6GwfDmoivd
 d/zliNeZ/lSJLJbeB8lHstyG7ocukMNnFLt4t4di9Q1LkRHa5oxx16g54RbQcktYctLS9vawkN/+n
 52TkWZUDmERoSQFgkAdwIghp90SmWobs8IKZln9iAK2U0irIG1IyXrynJu2YP2BCgXOEGhXDzEhPR
 HXwm8XzwIVg6+IAQwwlDsYpqwLSCfRGtMMgU83d4LAI5U6P8A+BCyZKWi1GaXa1yXlDsFwjA3GUcI
 LAfllrnwvyEAq1rLaXx5n3O+zQKabwaRfnXEgSiYRF/4ur0eEsi0RBbjyT5bkeuJDxfXRrTG9mp0X
 8FYp6SXNgIfimhqLYefxBqLTYLiPyGJ3XjKdCMShKWmx3l3Y+hzCgbA7bY6XaSs31t2juHpvWAiwJ
 XQDsZmLJdQ9tnlYFFKjppIQ8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pp58l-0020Qw-Pz
 for samba-technical@lists.samba.org; Wed, 19 Apr 2023 10:34:19 +0000
Message-ID: <6d5a08a9-d570-a9fb-1db6-faac67253823@samba.org>
Date: Wed, 19 Apr 2023 12:34:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.18] Samba 4.18.3
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

Samba 4.18.3 is scheduled for Wednesday, May 31 2023.


https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.18
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  https://samba.org
SerNet Samba Team           https://sernet.de


