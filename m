Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D744A17F60
	for <lists+samba-technical@lfdr.de>; Tue, 21 Jan 2025 15:04:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=Qy4M0R+EZEgcS8C2TTlvQpBBLO5AZ+BW8cgwjaE5Ldk=; b=IbQqFLlsHm7iqZtRd0Ro2kJuUu
	9AyqZNotjR7x1ffD4vPrHZwHd3UnOdM+L/INJEvSnwR59xjZiQl8mEH6hTCHxlXsFI1D3PJxU6lPi
	G5YG1V4tZjLLmAFT7qyGY0trmnQWiQ+FetRGMX/whpjieYCpMge74lCvWOA0k3GjvQVb4F/dglz1R
	DHvbmt5/aGI/W80HQzz/+R8aphFbNAx3FI2k1cdhL8CoUdJBnz/YX1BULpKJp1SPqfNC7tDejNjA/
	BoF8WFeCQ8iplBujwDaJTZjfIiXe1oRsazue74/mmKkVkr7v50ll6B/21C6tW8dwruy5w1cF2hfQh
	xCsKsrtg==;
Received: from ip6-localhost ([::1]:48496 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1taErZ-008y65-1X; Tue, 21 Jan 2025 14:04:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12796) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1taErG-008y4h-T2
 for samba-technical@lists.samba.org; Tue, 21 Jan 2025 14:04:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=Qy4M0R+EZEgcS8C2TTlvQpBBLO5AZ+BW8cgwjaE5Ldk=; b=QoPfsch9nQicjqlC9CDaoAD/CK
 JoE8D4P9FfvZIgihkVgpHNVIEe56bkeS0Ab3u2PAZecfsmbMtGcLJDJCMu/kAkx/Kwj4hzbCjKxmQ
 qxJ3zmTlbl5DsJU83SlS/55bBuBh9jZDS4iDbugXk8AMcN+0NPxqq2P0SS/cbFFxnXKv/BlSTEa2I
 maq1jePHpaenNyDDzhsC/2jxXxqjqdIyEPQZLPpHbapcKK0UmznhFBRaTCNPJkjmDYwXTEkp3yII5
 cB+JwCSow49wZPmcCW8+VrCqmqAPJ52PZyNydV/e4a0jOxr3Yp5yqjcsxju+azZ8CSJ3gl4iKlNgA
 WtuBPkWXBXudfG9oT3gez2j+uLeGbKIlFsYKsdUj3YrUQIDJIF+XgjHK1HwpJ3fi/Go3Vb2cvHZBB
 D208vRt0KFsUJVQtNqD6TvKKRhJ/Tf/7TqJ5ih3VTD9+RpDaU+MxTyAKSwUvgiYiYK4FZYIeLlNlU
 tP8mQ1f9E8IHArCraJaweEVr;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1taErF-001GF8-2N for samba-technical@lists.samba.org;
 Tue, 21 Jan 2025 14:03:57 +0000
Message-ID: <6d915894-ea81-4225-a875-19b1354523fd@samba.org>
Date: Tue, 21 Jan 2025 15:03:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE, en-US
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.20] Samba 4.20.8
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

Samba 4.20.8 is scheduled for Tuesday, March 25 2025.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.20
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


