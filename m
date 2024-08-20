Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5A29585E6
	for <lists+samba-technical@lfdr.de>; Tue, 20 Aug 2024 13:34:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=4RfdtRi8269tRfYcVP7gTZEkoDMdQoGeCluTaqoJu3U=; b=GIyE6eaQofT0730QsUHX3g+nDg
	QvhTkcrO0rNMyDkdJCXFeTtBuwZ8fm7+oj2X9vzwkRvUktHGq4tD3yv3dpXGbECajVN/9x0pXe95r
	EYCFhigVW65dhaYKW6ArwHC1H1JaoO9RrEAezT4b7PAgzBO4Lccu9hQgESdROPlMDJCguM8gXdw5o
	L1NAKSgXhMtUzePFDqGQstGpTLHB2dDvr401zqvJUt6AYXLSp0rYuLtfX0EmlNqKBqQIxePgw+7+D
	tPOr8+RuhxJD2NEkl5na5tNaXfOFc8xdj6hsAhVwbx6Kpe2L4cYXTr5afIdY5IH673lUphvVJlcbs
	hSWmcw5w==;
Received: from ip6-localhost ([::1]:41208 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sgN7x-0054Dx-5k; Tue, 20 Aug 2024 11:34:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59232) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sgN7k-0054D5-QR
 for samba-technical@lists.samba.org; Tue, 20 Aug 2024 11:34:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=4RfdtRi8269tRfYcVP7gTZEkoDMdQoGeCluTaqoJu3U=; b=Eb7ZZ9+J1BJiv0pBuZfLuOLxx0
 puUWGfEUhAJdKwxtQ8ItJC5+1UtsRgCOtoaFCkPxzAkbL5C7NSTLPpn6+BAVhYqgNAw9pSTrLySAS
 h/os470eCxRbQ4+KVC2vHb82a1cwlXQ99+wsSCLf5V+HVlqYmMgWZJp/shhzWwANLk5XU7l8skT8o
 hhf18JI17/sdrRn7Jh099uVyq0dIDRTMYHDlYhHlV8/EVIO7K7B0ylfH/86PrO0V8c6+O9j7y9pRP
 X7GwQURlvG7+NGwC/JxjGdLaO9mtKw/rrUmoT9SMBSI28cfslWhJRaPCb5cRO7BGnk5UtFJ2KKo5s
 VahrPjCeRWgKmPfHz6yxC70ytC/nLYm7ycTN/NcjY4VUhNS7NubuYOBnDWYZYREYMqHQetA4MoOq9
 twohcwseOAcqrFZum+WMHtq8Ue1lhaOM2HNDP9kgYQbvUQ99D0eEHtOwyn0jhyGaWOZUO8zrpQ/tu
 lR76enBpZEDok9E4MMZC48IE;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sgN7k-007GNL-1i for samba-technical@lists.samba.org;
 Tue, 20 Aug 2024 11:34:04 +0000
Message-ID: <e7d8fc41-82ab-4361-81e9-024955a37eee@samba.org>
Date: Tue, 20 Aug 2024 13:34:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.21] Samba 4.21.0rc4
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

Samba 4.21.0rc4 is scheduled for Tuesday, August 27 2024.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.21
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


