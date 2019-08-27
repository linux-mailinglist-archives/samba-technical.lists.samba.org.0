Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C61C39E4B0
	for <lists+samba-technical@lfdr.de>; Tue, 27 Aug 2019 11:45:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=xT6sAerCsHkO4ZRoL0TIniZFmx9bLz04FDfSMRHcKkI=; b=Gqw2uuUSkmYz38b2jnMJissB26
	nor2pUtoXYkGOISM2COBxGbGrqdbP/R7KoiysFH/Ahz59jD/nnK4aXmVdkL+888qPCcdGUcClTcD3
	oLhUs6fBfpT0R4Ezfg6eZXwnzcf7T5BmEGQ5v8ZicpA2hwRySqTTAyb3JnC4ez2Mm2c4XDnM2LwTs
	sjoFk9Q+WTl0+rNjfrGwl9lPpBlcukqSSTaot9f8zVTEtlwEwYF9mQVl/nCWWnO6u4AyB7DEPVYZr
	Y7LpAPneeBIq1cCC5a6+6BS+cJUDOH3jc5wZ45WXoiZWEzd/xqX92su2QXZhmtD3qSRvBTpk1nGMJ
	coWc8muQ==;
Received: from localhost ([::1]:38492 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i2Y21-008gDq-A3; Tue, 27 Aug 2019 09:44:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44756) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i2Y1w-008gDj-3M
 for samba-technical@lists.samba.org; Tue, 27 Aug 2019 09:44:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=xT6sAerCsHkO4ZRoL0TIniZFmx9bLz04FDfSMRHcKkI=; b=Ltk2Fq08PZ0UYdH9kGGy0wlLYG
 /wZtUdOL4xJIaRdMioitOwnOc5t6JVubgyyA7yi5Cf95cynoWiLXcTTdFdHMXqLeD4MZ+xiCXhjo+
 t9Jgt8aEEjLO+ugLPoZBUwDvtoRTTXzUodTBkVZX4PMC6AzS2RZFqukttfgFH8SfgkDs=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1i2Y1v-0008V2-7K
 for samba-technical@lists.samba.org; Tue, 27 Aug 2019 09:44:47 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: [Release Planning 4.9] Samba 4.9.13
Openpgp: preference=signencrypt
Organization: Samba Team
Message-ID: <5b8faeac-0d65-9171-9c30-b0ab5d4ea453@samba.org>
Date: Tue, 27 Aug 2019 11:44:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
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

Samba 4.9.13 is scheduled for Tuesday, October 27 2019.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.9
has been updated accordingly.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

