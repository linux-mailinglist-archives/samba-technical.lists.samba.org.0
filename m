Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7610F99C94A
	for <lists+samba-technical@lfdr.de>; Mon, 14 Oct 2024 13:47:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=sKVO5qo8bhjcu4wKCs1AoxN381jaTXq008XICKFuceI=; b=aAIPksiH5RfM2sI+qck2f3Pvja
	Ybc9EcGiruNWYvdEve4t3n1vrzX/A9FfO+XNBoR1U8ZanLzq0sR+OhdeeLZzB2aSh500lZ0JV085N
	O073ds0exaMMgd6weSOobMISaKlLIAA7fZ2hm197pLD9PoFTFpW+k5zXz3PzgGiyP42JQ7jymxb7I
	aZRLPUdDX4NUR7rIHLS818ZTBCXfJJmEqDNS3lMQZWHXRBwwANMZmpFl4WHMMSHVyTl2xjZCyk/yy
	fTOM2yu2V+DunOGTsUXDwcMaa0EdpFLPVIt9yxyH0jwCqh1toW1h1UMEXMnHGMMQjBV3lzc31+4GL
	lPx8XPRA==;
Received: from ip6-localhost ([::1]:59128 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t0JXU-003rgg-96; Mon, 14 Oct 2024 11:47:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45018) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t0JXC-003rfV-Je
 for samba-technical@lists.samba.org; Mon, 14 Oct 2024 11:46:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=sKVO5qo8bhjcu4wKCs1AoxN381jaTXq008XICKFuceI=; b=mA0kCEa6yaDSQ0HJ3Gbrs/8BtM
 djyEFRxWDH5ep5JUEzr/dttby4z4yblRfISqq9XoWdSs97Z+oj0yGrm/9NGeDVfsOnsRoa7S525BD
 zKqL+9FrVuEKKvN5GidIFQCt4DBKcwF5SJXfXp0dTXZCmSSV144b9GyMl6wRGGz7A2m/liWfZoY8Q
 DjJUOBvrOyza6mUr8uW3Shcg/t9J+sGkQkSmLrLZDoooFTcYF7gFb1lYF32dowatv1CsGlvmcn48g
 EQFMJIFmww6OSEgrc2IpBZm3jrdNCqYikEron8ynG0DV7+Znt3JnraoiWIeYqFQmPfr+CsXRAaAVj
 VE91edhylsNTscu30/kt+hirVoER7F62H+ZkpAOKdle+70ljRNk4FwqFQC9kqqr7O57+mVRSOVV+P
 eXJcBgmwPftcWLAn3pdX8hlYkcdWijICdMTesENrPI4iqGc3B9PAvk8fv26xK5mcFXP+S/afwsxmg
 xYTh9zr2fRhszZ8FIYm8Uvv8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t0JXB-004lFt-2t for samba-technical@lists.samba.org;
 Mon, 14 Oct 2024 11:46:45 +0000
Message-ID: <389056e5-3832-4278-82d1-f4d9e9c88554@samba.org>
Date: Mon, 14 Oct 2024 13:46:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.21] Samba 4.21.2
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

Samba 4.21.2 is scheduled for Monday, November 25 2024.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.21
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


