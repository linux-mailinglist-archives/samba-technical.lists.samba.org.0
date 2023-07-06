Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B54E6749E9B
	for <lists+samba-technical@lfdr.de>; Thu,  6 Jul 2023 16:07:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=gWnb3NeWMCoRY44EbxteeenRbqjRjg+tNCYRUGzkxKI=; b=seFivjFNp2bx4GOhuRJHM4sAVK
	kFd77cZcpn4mLJFmvP+ZojUP449M4Eug7mSiZhxjOySP7ANlV8ojzWIct1r63zw9LE5sziLJXqfvb
	i3g3vJtJjvlj3a4dGWs8aMKjsjsszjAuTuY+WDmV00P/qmjoBkxIq8Z+6UDTMKqsmRaPpfxVHudhI
	mE1LLp9SbNJopfcrKX+yem+deogSSOgbBwvgpv+ODiTeHDVZlfe0vP8apPO+D61vpBcsR1mqvwfBx
	jfP/xdpF81x6BL5RH7L9hiYHV5hhqskvI/bRU+nKhNrDUfIQBjK8kNzJd5ZdGoDrZ9KwAlfcAJijj
	7BHFxUnA==;
Received: from ip6-localhost ([::1]:27184 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qHPe3-000Z6S-0g; Thu, 06 Jul 2023 14:07:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37138) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qHPdw-000Z3D-MR
 for samba-technical@lists.samba.org; Thu, 06 Jul 2023 14:07:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=1Dsa7njyLHkOhWw0Cm+FHNKxzMhskk6w4nepcWaYhzs=; b=IUd98BUU+m/HZygWLQCCirjSz/
 tGng9Ei17YHk/+xTd/mPPoSKmGBEKxlPLyuWUAE05IpJDsuMAknEP4I26423msbiHWjvbIp9PEHpw
 Ygms4K4dpuO2/Bt7fgOik6fEOR00UeH9/giqUdRouezxQyraxZRjqbvU0pb82qLu+O03lcgK5xOhE
 vivLH22VgZAJWv6PoT/4TJ45csw3X5JjOYGFKCiY9a7uhFQLmVvHDJAKOR+CvErvdDuBZXV5VPfho
 UG2soeAbzHBD4u0YRNQTwQJVQW0MVfRoYDKVZHBs1jnftfixM5BEOC1D7ZYxPX2uNPI76H5C5npOe
 jNpZeNPbIbTJs6a/69FQ83LbPu6csphUfwR+mrQUN/22S7vTSFXrncfGO55dAdKOA7Ld5isSl57Vn
 aNFmcL/Xnu4WCkUfGN1lYGmt3gnrSrajvrwgaFXthG7kX9DacXsCv0ZGCrivEZaLAB7gxKdH8BaAB
 u3m/rSPfd2yHt09OM/+mSzSa;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qHPdw-000T0K-0u for samba-technical@lists.samba.org;
 Thu, 06 Jul 2023 14:07:36 +0000
Message-ID: <1fa34999-5fbe-79d8-60d9-137551865cce@samba.org>
Date: Thu, 6 Jul 2023 16:07:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: de-DE, en-US
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.17] Samba 4.17.10
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

Samba 4.17.10 is scheduled for Thursday, September 7 2023.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.17
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de
