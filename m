Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0505DED2
	for <lists+samba-technical@lfdr.de>; Wed,  3 Jul 2019 09:24:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=3y2BHVKSEgobJMTRpHmRCy1KztBYpcvb3NtML1oP5vM=; b=0I/LWgAclaGai3d2GcvJ7dSyXq
	s1UCTw6uBn8sYUbdvxRYBNk1Y+T8Cd0WLk3cAxKEBhvF1/dVCx4PbIu/lHXRURZKyapLtTrC2dwEW
	tEip/E5mhqN/TsVrDPPDAkb6wy7hLEY3Vp0G5EsnWHlSVWNEmjgD9P9vcsk8SpHp6dfOS+jLI9Se+
	f8Tyvs1r57TwmFm5iLJLjymwgkCXYEqERFucQLesHUxdacdCYZFU6NeEOX+wgwYBg1KPAFw3YIYWw
	C/2Z4S/++Y2K0ajOSJ15Sa8jGX6vI5JviJoTZs78rTAAtSVIxP3MeE2DhN3rOYIv5JDjzuGBwD3A6
	5jYx6CBg==;
Received: from localhost ([::1]:39470 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hiZcX-004p6k-Jc; Wed, 03 Jul 2019 07:24:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46452) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hiZcQ-004p6d-KP
 for samba-technical@lists.samba.org; Wed, 03 Jul 2019 07:23:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=3y2BHVKSEgobJMTRpHmRCy1KztBYpcvb3NtML1oP5vM=; b=JUDxCzMiFpTrdh3Ij1EyN+UVa/
 e1PIobft/r2ON84Lx5mSih2uKVRwK92ikfZ0VmAJXuENRBBkVPsU6OWEtg5I6UhtZDxCRDb46h5OG
 uFpnVfdUOt58+sU+7qqDw67yVJ0voVCUyVUz7/S/x1SSPJn1RZ9Mz3JNmOwrsCWmei7M=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hiZcQ-0002Hf-03
 for samba-technical@lists.samba.org; Wed, 03 Jul 2019 07:23:54 +0000
Subject: Re: [Release Planning 4.10] 4.10.6 delayed
To: samba-technical@lists.samba.org
References: <472995f7-9f5c-1001-6e30-20477a51183f@samba.org>
Openpgp: preference=signencrypt
Organization: Samba Team
Message-ID: <0a23838a-c171-c3f3-f038-12933f798d7d@samba.org>
Date: Wed, 3 Jul 2019 09:23:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <472995f7-9f5c-1001-6e30-20477a51183f@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Am 25.06.19 um 09:17 schrieb Karolin Seeger via samba-technical:
> this is just a heads-up that the 4.10 release branch will be frozen
> tomorrow, because Samba 4.10.6 will be released on Wednesday, July 3.

Samba 4.10.6 will be delayed because of
https://bugzilla.samba.org/show_bug.cgi?id=12478

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

