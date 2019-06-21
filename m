Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 671354E370
	for <lists+samba-technical@lfdr.de>; Fri, 21 Jun 2019 11:24:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=hzNHbgc5Q2upWhbmpkha1Ek+DOHNwrJl/bgTqkomyr8=; b=YjIX0WmS9id8M3e9nuvMdBrJ98
	4NGR/N2Unp09Y84E+O7RU1+tZRP8DEST8GyUktcNMaXlP/jztyKmjK68s3ie11oxRELxKDUDngW3+
	ecJBBy+wq3+M0dHZajU+k4diCtJ+fk8O+Ab0ZSY4QSPuNbvjonoDe7vtwIVBCzSrHZl4eLo1ms3LV
	kbTQM/DJb+JWZdjT3eVBX1zt4JuQoGeNmY3YpX6hUHDarG9nR6VAODpo2hfEHSRb35c0sZJt9qKGQ
	NOFtxO1KY4jD/FiuSrHYMD+3RuDuWQ2XEGS9vVnEm8nzkWDfhue4G30a0QJx2Xu+Z/JTPRt2Y9WEV
	AgNtkPjw==;
Received: from localhost ([::1]:21376 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1heFlo-000uqX-FJ; Fri, 21 Jun 2019 09:23:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54746) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1heFlj-000uqQ-IW
 for samba-technical@lists.samba.org; Fri, 21 Jun 2019 09:23:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=hzNHbgc5Q2upWhbmpkha1Ek+DOHNwrJl/bgTqkomyr8=; b=MsPcL2cEP6UHohekZTM+bK0p4e
 XYCZktCcHJMcrE+teLBkUYuEIufN+VMWHzWl03DXNOpIZtZv0/akmJLj+mDD5EltH4KhjkNFdjLzd
 lLA9HNCh6febrPtXxcb2Ya7fX4xRfOrBpXXCfPnMT92Iq2dopCXEjiToRhjWDWD51tD4=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1heFlj-0001aL-88
 for samba-technical@lists.samba.org; Fri, 21 Jun 2019 09:23:39 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: [Release Planning 4.11] release notes !PLEASE READ!
Openpgp: preference=signencrypt
Organization: Samba Team
Message-ID: <7d897a6a-fb3c-a8fc-8ea5-5199153ab3b1@samba.org>
Date: Fri, 21 Jun 2019 11:23:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 8bit
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

as Samba 4.11.0rc1 is scheduled for July 9, we need to fill in release
notes. So, please describe what improvements/new features you have
introduced since 4.10. Please remember that this is very important
a) for your own visibilty :-),
b) Samba's reputation,
c) users/admins using Samba.

If you don't want to add the changes yourself, please send me either
your text or at least a few bullet points.

Thanks a lot!

Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

