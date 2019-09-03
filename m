Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EF798A6775
	for <lists+samba-technical@lfdr.de>; Tue,  3 Sep 2019 13:36:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=ncn699Pbq5dfUDgro3zws2Rbk+nyKM58EQyAsBsjhQw=; b=2OMvwr4oU3E8DhWYlpoutaW4zB
	ag23xkAT0kLDGi+vj17cTFLIrmJrwxngm2EYXxLKBAsmsCXo+a2rDHfosnJJjQl5mhHTz1iqX7QOj
	HPfy3gRZrHkLGwF+v4bnpZ4FbaJ0OAo9XjAmSfEqW1Y3BPKEPJlXlDePw5KmwxlgUb1Z2d6lp04qt
	9EvaBbeivCSCnsxRhLh6xoOgs6/6EoVjUlyYJ5qU+2OBOoIVw680mruOzUimIPVyewVjRKo/4jbH+
	dV7ro9GkmmgttU/mit54IcHs9zUFJ8T2p2Vtmo2Y8vTZc7N4fDzkVOdWiIK1wkYlmN6GzWRhpcYBS
	htGsbhkA==;
Received: from localhost ([::1]:40304 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i5766-003BW1-Ch; Tue, 03 Sep 2019 11:35:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60180) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5761-003BVu-Em
 for samba-technical@lists.samba.org; Tue, 03 Sep 2019 11:35:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=ncn699Pbq5dfUDgro3zws2Rbk+nyKM58EQyAsBsjhQw=; b=iIPrM3kOxvm4KMCF25Jp/qW84L
 +2igVuMxJ2UhjIVrnb4augjMM3OgYvITcxksst/Ot6JoaIWUL74BuB044bc1A6+eHyFfT7UT+Lfvw
 RJB1FKj0+htC/+GqZhWdUTzx5eTWp0kSJSk0uBHp9mIpJknLODpA80k16T4+M6Opje8Q=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5760-0000YJ-46
 for samba-technical@lists.samba.org; Tue, 03 Sep 2019 11:35:36 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: [Release Planning 4.11] Samba 4.11.0rc4 / final
Openpgp: preference=signencrypt
Organization: Samba Team
Message-ID: <3043a28a-25e2-459e-4943-c19f15f131f7@samba.org>
Date: Tue, 3 Sep 2019 13:35:35 +0200
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

Samba 4.11.0rc3 is out now. There are some fixes available, so we need
another release candidate.

Samba 4.11.0rc4 is scheduled for Tuesday, September 10.
Samba 4.11.0 final is scheduled for Tuesday, September 17.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.11

has been updated accordingly.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

