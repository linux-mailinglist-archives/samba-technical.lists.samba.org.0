Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B04BD98E1A
	for <lists+samba-technical@lfdr.de>; Thu, 22 Aug 2019 10:44:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=fEwJCxdwOxKwCGmAdXkwbQJa4RBdvmW18A0R81CskuU=; b=WsVVZqyRnAIG6uePAfTObCO7yc
	3+v2H39ii06Wj/SvWz3BcmvICk1L+ezhtaGkr9L/Kbnud8Db1Br4CxyclyQ0ALan1SbCCbcntb83r
	EqDbjXxfKzsapQBw/3boZc8DByodLCraS5b6ZMDArPlmrtZxU3DjEvdwb7wc8VKewveRcTsaHr/VH
	/WzVVtzTiPVzfbkJm2HPv3cVjIzQap6XD6ln+lNH2HfVSmaUwzqhHAU+8GO1K/9QDaFtFphOUxxpj
	RLP5T52/UurO2DJNoX+zgCHhBrWyMvzKpimfi5NkpHJuVC6BqUWxo/51K3JugtyRCLX9qGtXL4QCG
	daGk1b2Q==;
Received: from localhost ([::1]:32338 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i0ihp-007XYc-Jr; Thu, 22 Aug 2019 08:44:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18556) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i0ihl-007XYV-LB
 for samba-technical@lists.samba.org; Thu, 22 Aug 2019 08:44:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=fEwJCxdwOxKwCGmAdXkwbQJa4RBdvmW18A0R81CskuU=; b=FvNZYaf2AKWXJFhfACyCwXG8ax
 HYAjc0sl2Owvx+C3stvmcVkaCcaTK6BtMZx1Yr6BsaNy4djMUolGogfkxSJJLqcLNh3J8JXuFSHyN
 gIWU9d2K3PBjdwnsJnRP1D10qN7wHO3P7LeANLyUFNzT8RluWQuh4yw6Lo3sYeHDKAvw=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1i0ihl-0004yI-9a
 for samba-technical@lists.samba.org; Thu, 22 Aug 2019 08:44:25 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: [Release Planning 4.10] Samba 4.10.8
Openpgp: preference=signencrypt
Organization: Samba Team
Message-ID: <7764603f-6858-81b3-f69f-d99786de1f28@samba.org>
Date: Thu, 22 Aug 2019 10:44:25 +0200
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

Samba 4.10.8 will be released on Thursday, October 17.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.10
has been updated accordingly.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

