Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0B35B7697
	for <lists+samba-technical@lfdr.de>; Tue, 13 Sep 2022 18:38:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=UjztJdC38Pblrip3m/lPQdAjmB3cTrte0IjHx9ymvTI=; b=AUU00VKCR2j3HHOS1juf5C7MAH
	z5dbtXQtgfviTLXJB4yCCIphFp9b+mcgMMSRtIezHKQOD7nVxksbsMdUSG8qXuqCYjfamZwBuMLJe
	yoGy4jMRIx1+IbRLX8uU5oxbeoPsmEUJsvloumt/ELhZ99LYNoTDXdeQxdJvahXmP+nKLjDARPOun
	2DO2oUBHZlCbmxL8YEAGqseWXBapTjb0Kq1uJ5pyBjflg5kQGahvJq/dANsUA+udIjYh9cn8McaZf
	sXfiGGad3LX/pIOJ6d9RcyAzxaegyRV9Mm55Squ+1g6K2T5Lea6Zk/SRoVM4siN4vmvG1EWwb7IUU
	rRxv9Xcw==;
Received: from ip6-localhost ([::1]:54512 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oY8vE-000TBz-Ja; Tue, 13 Sep 2022 16:38:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48168) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oY8v6-000T78-9B
 for samba-technical@lists.samba.org; Tue, 13 Sep 2022 16:37:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=XQd2b5Dv2aUCjBBPKg4H/n8ef155OtGtlXj8oVae6d8=; b=WhuU/bxEaIGRPOYf9z0efdwPOR
 kr49pCmvdmkVUOjSL66Wmo6gmTjWL+AAuUsMi7nd43cFuTbAP36+STG+e97fEGG2K8dLMzsF9kTVf
 7/GOthmRQAKqBtp1VbA9OFHHg3BZsZwPbI1m+ew6Snstvnfxh+acPXxmuOwwiTg60WebPoH0BfYMD
 YXge7IR9fEjGCqFdmmXYiukQMU4OFevrR3rOT93gMTA2UbZURlb3tJ5CpNIVwjCVGFve5ipjXYFWB
 y0zUk6UB5qTz2HL5/YFL+KpAjgd0qv23TJ7HmSQ8GoSGZ4v/uXlz0R0MAFMpO1bGaTfE6Z8/N5CCW
 Qm1SReUXqyBKKAYE+GNb7oL2tI2VIX9dpiZwh1FQEBqWxHxhn0SZrMtjPhvQzjPR3Aifh68sKoNko
 hEzuA/Py9XR6AlHUAeDkjTKPE8OAGYjRLozWb9CJWeBA2EU2mozVz2OzvLBDL5PRX5VWunM+1SxMP
 soUkRvFPYgOniyzcCzuZDHJk;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oY8v5-000EiV-Ff
 for samba-technical@lists.samba.org; Tue, 13 Sep 2022 16:37:55 +0000
Message-ID: <9767c3fe-8e23-6e46-daa7-9a3f63a497fe@samba.org>
Date: Tue, 13 Sep 2022 18:37:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.17] Samba 4.17.1
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

with today's release of Samba 4.17.0,
- Samba 4.16 has been turned into the *maintenance mode* and
- Samba 4.15 into the *security fixes only mode* (there will be a last 
bugfix release in two weeks).
- Samba 4.14 is end of life now.

Samba 4.17.1 is scheduled for Tuesday, October 25 2022.
https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.17 
<https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.14>
has been updated accordingly.


Best,
Jule

-- 
Jule Anger
Release Manager Samba Teamhttps://samba.org  
SerNet Samba Teamhttps://sernet.de
