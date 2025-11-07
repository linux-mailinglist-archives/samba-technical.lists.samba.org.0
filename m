Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B673C4027C
	for <lists+samba-technical@lfdr.de>; Fri, 07 Nov 2025 14:39:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=DuiP+zulgjUZFFxKfI2FTtqI4WiNVkNjWcYkHD+1CLk=; b=dVBFWwVtNcyBe+Y/e58FW7XL0z
	gd9UisFe4STTd6ZSsgnaDy01Z8f6MLTGTBTEoeJKAjy7uKDbEXO2lMZ7GD4H+K1zcSmO7txxl5OLm
	6TM7xt1cLX/i1jx7LCKEPb4vniGDDomZeWPhFKv7z5IxnWpP1HiqYIIF13pPEcapuzeuVFwdiJ0wb
	ZaVfHJ3jcVApy7wXHo20udkZe6Gg3hjMI3yZuFIA9xcynFSVEaapmFd3kKxYQuXyzb76KBUPt7MgS
	A853Bc/QDA5tPOb8Utsfvp1LnxlHXyVnMi1kH6RV5bdKhpwkJKBb2V2wYJmuhEaCDngAYChJ812N7
	sih39lQA==;
Received: from ip6-localhost ([::1]:55422 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vHMgL-00BivD-Om; Fri, 07 Nov 2025 13:39:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11084) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vHMg7-00Bird-SY
 for samba-technical@lists.samba.org; Fri, 07 Nov 2025 13:39:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=DuiP+zulgjUZFFxKfI2FTtqI4WiNVkNjWcYkHD+1CLk=; b=WAKdybo0G1beQl5UmKJiGBDliw
 63dUBuvRD5/skPOX2xh3q8JTF+JznqMatvJC9U4IHFepB1kwG0A8Djv0QBRIj+cS1p3wfgFlypLlO
 j4o73gTvwBJfvXXFEiJS1KImaoOmaWqNzCat9GvysYaS21GLz4Uqe/guLmVdEloHHGfpBQCmiggQ2
 nvSgZrX8EUAW2I/1vv9VtSga4AM++62s2WsmetJfkv9hReV7tGXZt1FRkJwcZ8kPFpRgd2k5+CDCG
 tvYG11+dpFfw0H+zNY310yHO2/caV0KFw+gWmwN3mC98AiDxKNVCIYd03dLHqHLr44WGNcm1IHJ9j
 E+lBOgE9DQXh5ZlyjAJA6WABYZEGQvPET3WLYvymQ7H2ihTzCrRQxKb6aR2z0xtRM/iSEfzZDrKzD
 2KNSsvJpULhQroBfpPTKzKsU6guyw3mYHH7vIwo384a1kkHuM0p6YdiNMXoMxYG2mBFyTvxL5GkdM
 ITtC0ngE3UY61+fWXZjksl2T;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vHMg6-00D7OJ-0q for samba-technical@lists.samba.org;
 Fri, 07 Nov 2025 13:38:58 +0000
Message-ID: <8ad3b642-0f77-4610-b08a-5ef63927b292@samba.org>
Date: Fri, 7 Nov 2025 14:38:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.23] Samba 4.23.4
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

Samba 4.23.4 is scheduled for Friday, December 12 2025.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.23
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org


