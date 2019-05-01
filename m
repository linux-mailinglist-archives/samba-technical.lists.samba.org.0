Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9299510573
	for <lists+samba-technical@lfdr.de>; Wed,  1 May 2019 08:24:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=vbNHruFYDT1BkbpThZx7u60/n4M49iV+SNXtUrJCt98=; b=RyllP5sIUkeXRyCBmGRtG4p5eU
	IDyIxEVwIODUOWLPyFQd2wOGfMqL9orQx3bOk+2w6haV2QmErdildQvzDqidTbelxbDyVC1fRj+TO
	Ns682pe8WhPI21CnmrJ4MB3FR8x0GhucLazxlVGc8/rZudNb+QSTKA0pww/mWyRVxaocmfS8njDw/
	dlhcIWcsN0kus83brrzzrA8992ZldHbrBa5ER1E8D54ivybDI5mt5OuESe9GW7u4dOPbEDSPdj4tD
	QhcrpRXoB5dl1OdmEmfXNdzRkOz2sQvSVmmWfJ9mxUiI6yETr5O0HcBPE6+gMeGdn7vZjQf93jbkv
	KMFx6PiA==;
Received: from localhost ([::1]:45446 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLiev-001lux-IO; Wed, 01 May 2019 06:24:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:32226) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLiep-001ltr-WB
 for samba-technical@lists.samba.org; Wed, 01 May 2019 06:23:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=vbNHruFYDT1BkbpThZx7u60/n4M49iV+SNXtUrJCt98=; b=f04QkrjribIA3VrTtgKA1ZvMaJ
 m89jMpG3kf/4nr4szb+qb2+ECPds0sU6eyE7BWghbpEftMivuH+MY/LcynfM9hjDkfONVLrqSjN12
 vYx6e1b5Js0C2kVMZ70+bq8dOPVB6j4LqGA/y+U/bIWUhAMvBjoGoHVN3gkzruVH5A9s=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hLiep-0004ap-Oq
 for samba-technical@lists.samba.org; Wed, 01 May 2019 06:23:55 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: [Release Planning 4.9] Samba 4.9.8
Openpgp: preference=signencrypt
Organization: Samba Team
Message-ID: <cd13fd42-fdbd-41c0-498d-a1ab68976eb8@samba.org>
Date: Wed, 1 May 2019 08:23:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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

Samba 4.9.8 is scheduled for Tuesday, July 2 2019.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.9
has been updated accordingly.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

