Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D106B2DE0C5
	for <lists+samba-technical@lfdr.de>; Fri, 18 Dec 2020 11:14:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=stw7PkjgPsNbwgR8vW6L6HMg2zyb3jmgKHAjgGjgxJk=; b=MINazU/R50DdEoFzZbHelPOc2z
	ejViL/YRQUYA0M2IaUttSevsnfsd3sdnQacGr5fGe9ogWfBBONxT468VmkuVFyctvE8nhzr3/Sw5n
	ee57pi+Sgsw7fXeD4Gze3FGiiIeqI2/FObmuXdp6SigaUeGNkqFLP7VlLEE7ur/WRwiQOmlSfOcxR
	djsCyzgzJoHGTdE8WXbK8Am6/+Wtoe30IZK7q0k7Z8djpKTz75fs5Rgfk9pTvYUzGMjRDaylzPuel
	dA4b9/AUa1FZnKCmlVtcImRdggPIunc9y40WAwLBZYLW/K1VFmw4EzGohaGv9fuJpz6u2VmWYvJXI
	XCez1ngw==;
Received: from ip6-localhost ([::1]:24550 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kqClU-001wu0-G8; Fri, 18 Dec 2020 10:13:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11196) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kqClN-001wtt-CJ
 for samba-technical@lists.samba.org; Fri, 18 Dec 2020 10:13:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=stw7PkjgPsNbwgR8vW6L6HMg2zyb3jmgKHAjgGjgxJk=; b=f3tmJBMWH00e92cYFZVPj2yinS
 fBzP6pLhfFAkh/n1Ja918DdMqqehbfqxpU64/zAiPILq9yN4c/RW5U7e6jWj8SmgGiTprXlbEw5+H
 Zkj6K2/xxnVxL1sE4+ExBNxzVbK0Q8nqajs0wS1M06EN9dHXesqVoKm7nL8qGuREC1JHKPiEXKPGn
 vi1elf/8oIh8z0jWNbpybA0XT9M5wV74p6CU9anBArmNsl3ZJ1pEChAwZ+HaT+a81VrUYCKwL9L6u
 W+tgSuvP6qCyIDmLOh9u6IQlTAPmFKPSdooOz7DbmFJeVSvZKG6+t3QITWLv6GdCoSSAJRyJbuGLD
 7jlUr6Y7ajsz7hjAAAlfyDKyaol6g0HdvewHIf23ciC5NvuBXE9MOCfl9n3r1Jag/hp1k/Vj9aHLW
 OEfsmXj6/Rr/dbChGtB5T+1Bt+d5shQZFjNn0YeJpXBCkwvD5KFRMKjskV+CGTNoK4HvPQI9CiuKP
 L0QI3wtqkOssjNF5jEsrwlid;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kqClB-0002dl-Hh
 for samba-technical@lists.samba.org; Fri, 18 Dec 2020 10:13:17 +0000
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.14] Samba 4.14.0rc1
Organization: Samba Team
Message-ID: <f6e55f94-210c-df69-6cfc-c79d693e9d32@samba.org>
Date: Fri, 18 Dec 2020 11:13:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
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

Samba 4.14.0rc1 is scheduled for Thursday, January 21 2021.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.14
has been updated accordingly.

Please add your changes / new features / removed features etc.
to the WHATSNEW.txt file in master asap.

Thanks!

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

