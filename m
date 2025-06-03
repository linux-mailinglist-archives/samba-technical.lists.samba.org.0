Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C486ACC103
	for <lists+samba-technical@lfdr.de>; Tue,  3 Jun 2025 09:13:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=cmi2zhYUgTWJ8I50n/+EKyNH4MuNZpcJL/ms86a6N8k=; b=npGvFsayiqYE9lexuJLacA+tiK
	HoiQX3T19LYQVG0QhK9fUdq+NXoamso30rV65lxkfg5UqqPd7Z0IjOf0CXp+OUa3jYT9x0yoLsARc
	5f3QyO8X8n0PDFuYJq6vefXGCpeH+S4UpZT53Y8zogQ57dYMd0MAFW/uEx4ghXjK5PUUi6F13lWjj
	nhnHhLtI/lcbAAl//+RlFfCbVnYzo4tA4xRjemRFoNodgVCZq8Dkz/oHzkRlwVqlHck5Ubi63mIrK
	wzmj8x7s4CY+Bzt0kBNvUxcRBYiUzjGR8AiS3pgNBc2SzHr9QhrKHN4XUjy+qT9KKePZdZzZb+ygf
	RxXmq0yA==;
Received: from ip6-localhost ([::1]:46680 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uMLpy-006VLo-09; Tue, 03 Jun 2025 07:13:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35144) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uMLps-006VLh-WB
 for samba-technical@lists.samba.org; Tue, 03 Jun 2025 07:13:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=cmi2zhYUgTWJ8I50n/+EKyNH4MuNZpcJL/ms86a6N8k=; b=vzn0kXmwblnCuo3L8QWCfWXoCg
 gnstxVERYiZD6ykgu+mXmDzahmuGTWZvUqeRB4q0IUlVe8XSr4Tt/TQjX2BkJFryKD8deQvQJG43r
 QLV1aYmoOhyZh+GEIJeFoubJxkXNQ4Bemkh4ApnxtzpE1pnBuxEhOdGz+ROSfoRcgAFCyh/ljY4fy
 Rve7TEtQuBNUtC65MSOiHMgPX+KIo05t4SUE3K9W9zHFjDvQjv3mzCUcyMjqk1zq/josKBgybes8b
 SpggooNiNjeRCos3UK4xzr/aCfpJ/WK3xb/UiTXwlHf1HlVfW2/qkc7pJCojnqvnHB3gxzw+nERvu
 RNuTZZB8jEo+keOTbVKHKCEk2/ghSKSlVs4PKSnTMxLjjFehyjE5SpTMGgav3Ux5mAXlRTPJvPTzW
 DA+jbeXMREExY8QIl+MV7zqqHBDymCTP3YWAKWuywQakgjutScbqfezk1xwhs4zpLOgDQEwH2t7ib
 T+v9Ncsq05Pxz+mGwpCr+j58;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uMLps-008fD2-25 for samba-technical@lists.samba.org;
 Tue, 03 Jun 2025 07:13:24 +0000
Message-ID: <9031c630-e89e-49c5-ba8c-6ab85447a737@samba.org>
Date: Tue, 3 Jun 2025 09:13:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.21] Samba 4.21.7
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.21.7 is scheduled for Monday, August 4 2025.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.21
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


