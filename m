Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 520D15100F3
	for <lists+samba-technical@lfdr.de>; Tue, 26 Apr 2022 16:51:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=0fkfPtHuk8qv0t7R2ZiCYJ2b1fxkzzTg7rG4lcB/fjs=; b=Pyei7j51E6Da3BNeIxKCWjwZg5
	QhzMrXKyhL7FVF27WLXV9199wWNYFLw7QEXaom7N9NBtJFHSQ2M/jlvh1/fE7y2DBHbSXbxtmWEPh
	Mp5m/W62F8kApSFcgoXQMxq/nygdb6DDLUylOBtdbMGaV2yZl77FepBATMSVo0hj/G6plvIxNo/ZA
	TU01VBc6nW2WO0hw4gOmUfr7IZ2mCdfEBlSyO02WQmOibrNZIgYrd+Sqd9avRildWzIZv/3tGhbuT
	o+mg9adH4piAPEm1H3R3vJ8fOZy+K87DelClTo7wYq6h+fqA9PEdHxSblJiXKG92pgJaK0uzclKcD
	pHwz6qHw==;
Received: from ip6-localhost ([::1]:46886 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1njMXg-002Mrw-1m; Tue, 26 Apr 2022 14:51:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64100) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1njMXa-002MkF-L9
 for samba-technical@lists.samba.org; Tue, 26 Apr 2022 14:51:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=ipoXH3w99wDmHpQFUMLPf4ZdoSHF0l92HruUbazB7Dk=; b=QgXVbnXxylAgeUlgVGkU6c5ZJA
 d2OTMGMU4YsrN5maOBYlAVzay7Ye9wmFDYYhJPzgHRmT8HPzS5/zhaE4RztTZ9b158U8/iMfAb8+u
 xd4RaB1yoX0VEESj5mNVn1wOZVauBAVmXRGvp737LBJcT0EmEWYv/Cjsto4R5mnhlhK/JPz0tqTN9
 8pWk7fDHw2F+hfJ+eZMzXX5D067HaAzFd3de6g9VQ8eOQzN1sN13Bh+DjXWcq6Wnjoz+7a3jIF/53
 FsUpJhVemaMyDL3xqNl24z8MA39qvnoFN9DLvGnbA+9zVjLRS7slwYzAL8J093YWXvmE2DUHTRVwL
 mSjf94lipc/mOpx09JxFONeS9FVIcSs2/tIcMtI+YWSrvW9s4UERjDas1DsgOcpkSQpzvpx+MpaA6
 Dt/Pi9ZOTLKlWfmsmtUYWUANKeWIPM0/95GtwsHD2YaCP8grmcbhqBjf4KSqXLoutLUKXDuslZr0O
 KhZGLWu0ivwt7e5nHGGAqaIZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1njMXZ-002Ruv-Vz
 for samba-technical@lists.samba.org; Tue, 26 Apr 2022 14:51:46 +0000
Message-ID: <28f03f31-33e7-d194-6f62-87ee8fc96f2e@samba.org>
Date: Tue, 26 Apr 2022 16:51:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.15] Samba 4.15.8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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

Samba 4.15.8 is scheduled for Tuesday, June 28 2022.


https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.15
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Teamhttps://samba.org  
SerNet Samba Teamhttps://sernet.de
