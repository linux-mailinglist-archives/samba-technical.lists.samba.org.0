Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B03C95CD69
	for <lists+samba-technical@lfdr.de>; Tue,  2 Jul 2019 12:19:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=VQvVRmPANHrI+6w2FJf/5U8qDosJ+wfM3NiQ5tZp3Ng=; b=y8jmVObg3MnJEWjo0G03Av/xot
	g342IZTg2TwPOBrgFueFDbuVmOiUy+mkMyF/LVE3xicfuIPo/LNExr4AaA3bNsOo9u6ZlG3L6Q0tq
	Bbx7Spsw3qG7zkujpYxAUyzdmwdUKY3zRY2B2GfFuT2/7gnMX3H+ITjB4njGI/zOT1W0Yox+ZqV3L
	0TAidQ3u+DfV9DTB80rH+4n1Cftg1OwP/MpkelDrvz22D0L6drPHOV2p+r3GWh7eJph/BDAuFB+nV
	iE9+YsWV4aM5EQI9rwUgc1CPo3dI8Nv9EzI2nlFop/NCzsQyMujEyd5YpRRJhuLeqcfrZvq+MELFO
	j4gCXNsg==;
Received: from localhost ([::1]:27526 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hiFsF-004RTf-Lu; Tue, 02 Jul 2019 10:18:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40104) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hiFsB-004RT1-H3
 for samba-technical@lists.samba.org; Tue, 02 Jul 2019 10:18:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=VQvVRmPANHrI+6w2FJf/5U8qDosJ+wfM3NiQ5tZp3Ng=; b=l+IjXql3qNKxoo0CnxBv/Bmggu
 Dr85DHy6QNIKToyKWFvER4+WtbHFEfVt+cD3K6WLjv1MXRk6sjZL19Sgn1Sn44xeDY64b2MG3hu8g
 UxM8CbU1rB8czReAumlzPG0NzmKiKouHXGm8PrFUSHAda2tuf8Tw8iK8h07PNCIBNPyg=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hiFsB-0005hM-8f
 for samba-technical@lists.samba.org; Tue, 02 Jul 2019 10:18:51 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: [Release Planning 4.9] Samba 4.9.11
Openpgp: preference=signencrypt
Organization: Samba Team
Message-ID: <4c4661df-047e-4cfc-fac4-20299967ab3d@samba.org>
Date: Tue, 2 Jul 2019 12:18:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
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

Samba 4.9.11 is scheduled for Tuesday, August 27.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.9
has been updated accordingly.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

