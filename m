Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5FA5AED5C
	for <lists+samba-technical@lfdr.de>; Tue,  6 Sep 2022 16:31:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=sT3mf2mE6q2pf1QoYNFW0Ruca9qs46fvEnDDl+pA4CQ=; b=Kv2zcR/Bh2pxrj4SqQyYeua305
	tKm2OFDEWttUVr2Ot0YhkWlUgW/3P67BCZXTEjawMlkwzDgLhdZ/B1hHukl5iPZDMNQe4nRLcv6o1
	H1Euv6qpJ/UjhkVOQeH1Z1Nqita7+Mny5f4FFEgeMOE3RsHwtnWoKSvUj8HD/49hqJfRHSYG7GARo
	1Yuj9B9gOo/HFGdS5pdXcSAEDMzYJGEjmeXHGunbNlofKDPMExREOgdXuHTeLccOHpu0v8BDnvZh0
	kyaHaTXJf0GuzLvym/H+3vUXetdcTJrg+anPm/YEf6bCX3TBfs1JjqukMX/PNU9lS764wsNshnKJ6
	nJMZfQPA==;
Received: from ip6-localhost ([::1]:38340 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oVZcG-005kZ8-OP; Tue, 06 Sep 2022 14:31:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23628) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oVZc9-005kU5-Bt
 for samba-technical@lists.samba.org; Tue, 06 Sep 2022 14:31:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=5PiKxrFhEVpblVCSj8Hpq0Vi4URVsa/lR8jlTjami84=; b=QKFcJOnMTkzrBWeO17xOpSLNA7
 iAW5LZ4saWRBUTF+mxs6SU7vs/lpDVHEkGJjEm2gkTuX4EWjrZI+fqbxnXKverB1qwdeRFLgFgINY
 ZTdsZm4bmREg3vo35+GtXvgsNumQpCNCQQsgsL1g+CCUIJGpk6xAa4qEFDkyeAd85YJGnJjPssETV
 En8pkC4z6LGNgjU4pZaFlzqmFug5UpHpBzXNX/iG3Htv7uONhPgd4KsX8QGu3FK7DxEyKuIQgA//D
 15Vrc6TrlxI1+bDQLz0mwLonmhCaHLO1XsKMcfOmBPjwmsC1KEEoxg7HsbRkSZvN2CMnMUJ2UCARc
 bwFj6CKb42rQJX5BNmGgi8aNSE3UiEDpcqeuDx66wVBz6jtNlzxQvMLbD5okcfLdr4MZF/dXRZILW
 17FC/V/Xyip0uTXUhW+jSYfiUY27NH4pia+dRFZ0jP1v3kYPHyiObaUWP8ubrhqe+6gzDkAoZS2jL
 lj6ZkknONu7+Vcd8uwpcgz51;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oVZc8-003MVt-Tq
 for samba-technical@lists.samba.org; Tue, 06 Sep 2022 14:31:45 +0000
Message-ID: <ebc7b774-6556-b7e8-fa22-7c82c3100611@samba.org>
Date: Tue, 6 Sep 2022 16:31:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.17] Samba 4.17.0
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

Samba 4.17.0 is scheduled for Tuesday, September 13 2022.


https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.17
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Teamhttps://samba.org  
SerNet Samba Teamhttps://sernet.de
