Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 941EAB4563D
	for <lists+samba-technical@lfdr.de>; Fri,  5 Sep 2025 13:24:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=tWPvJojXYGOCLwvfTHSW3r+5ImkZ2KJNDc9DA+KYkO4=; b=CPOv/DfbbU7RwnesfyN1UfjVXf
	e7c8dt9mDSGBpUdBcxy06vvD531/PWSeFWiYLlbscY2mJHdFSVm+JX8uFohF8wIgAX2s23jI8gkef
	m5QZKyD5GrRBav66IR9k4E+7oBKt7mx1fmEodGqxuVp+DLrNP8g6TFCyna9UqtYVVC8w7yyA3+GpD
	/FatZ93Dmim/jULSgzV9ODXr/PDxFogyV3wC9XYM0iOvcZ4Gj83c5RE5SOfpHUlSEMPWHUMcWzrEK
	/OqUG5O3rqpxCkNh+DJ5uZOvPZTwfoqQ+gx7Xf3Zn66KVD9BtD7us6L3XKfThk0iY2DOnaAWgGG9p
	/bI30fng==;
Received: from ip6-localhost ([::1]:24280 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uuUXO-0036kS-Li; Fri, 05 Sep 2025 11:23:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50046) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uuUXK-0036k6-CS
 for samba-technical@lists.samba.org; Fri, 05 Sep 2025 11:23:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=tWPvJojXYGOCLwvfTHSW3r+5ImkZ2KJNDc9DA+KYkO4=; b=VlItLo9cC4dK3i8sIw5tOe7eEq
 sVoq53YBljHFRUPLcDy9jNUvtIieImkWfSK+0U23QVmZGbZM9fHcW0TqPvaX3GIxv8CRvGndHELLV
 0mvt61bDz/QZr0V90FpLtFC9opOSdsckylgPPwIO3GihRKXh3ZjOH/91jXta5fDdOQh/ojXrmieP9
 MxwdUEO19VSnh48ukyp06SaQFPodWdlDLueqZHwF/EOYgX/3bjvqd442A3K5cgkzA3U+Vvv9eDEzl
 Kb2EE4mLvfzBni7slnoQYy9QcvFHHxYNjAZCM8sbqpA6rlO97vZv8TJ7KVERv0Z8namuIyBIJgqFq
 tqJEP0gL6QOTAq7w/IgFr3LW57aKoXc0CoYmvA++QmI2Hisg8AG6Seo0Lq3fvXsqaiZQLcK7ueisW
 PLrddxpX/t+L+f08Teg82CxUCxnyDckGCZWkgkFuMIcVNj34NWW1o2LYLPRFQYTRpJZ3C2JPMXbo4
 qIzXf0+VCAeIPXf+1I3A0BSD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uuUXK-002Ygn-0L for samba-technical@lists.samba.org;
 Fri, 05 Sep 2025 11:23:22 +0000
Message-ID: <e2979531-bae7-4ef1-b791-db299a6f617b@samba.org>
Date: Fri, 5 Sep 2025 13:23:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.23] Samba 4.23.0
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

Samba 4.23.0 is scheduled for Friday, September 12 2025.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.23
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


