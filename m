Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 634F46D62BD
	for <lists+samba-technical@lfdr.de>; Tue,  4 Apr 2023 15:25:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=IFU4xnjDj0COqUBii9Y8mtarIQWoyrROaPx07dWXEQY=; b=r76nl3hpUCviOY0t/amS0Amjs4
	ggtdjcatBgF9Tc8oK+6kp+knXITtl8C5DluLqgSaYKXN1Jfm2hMcHIqn7JZUlSlIccUv3b10I2pH+
	Aw4rErbTPYywkM/GlYaXKFtWu2fOjPn5jCSe7+eW/MO2Ze1bNXfWEsoEFh3/dC7gCwahqq4dRW48R
	41cmnfDikoR2V9MUO+jUGAV612K1pEDbiEaMQWZf7rbuAjBDTImgIddIbjWV69IcY8P6TmVpyHrGT
	GT4i71JAVkcRoUzUvMbVRo0U5Vj5vjaCfDWlqvDDXpoFTBScv7N+hUv0GhczuKWbhZbAyDpKfjFVL
	E0nOt6sA==;
Received: from ip6-localhost ([::1]:36384 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pjgeD-0098Me-1u; Tue, 04 Apr 2023 13:24:29 +0000
Received: from mailserver.zkrd.de ([212.211.154.249]:4223) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1pjge8-0098MT-Jw
 for samba-technical@lists.samba.org; Tue, 04 Apr 2023 13:24:26 +0000
Received: from unknown (HELO ciphermail.zkrd.de) ([192.168.100.44])
 by mailserver.zkrd.de with SMTP; 04 Apr 2023 15:08:43 +0200
Received: from cipher22.zkrd.de (localhost [127.0.0.1])
 by ciphermail.zkrd.de (CipherMail) with ESMTP id 4PrSkg43Yzz7X
 for <samba-technical@lists.samba.org>; Tue,  4 Apr 2023 15:08:43 +0200 (CEST)
Received: from mailgw.zkrd.de (mailgw.zkrd.de [192.168.100.4])
 by ciphermail.zkrd.de (CipherMail) with ESMTP id 4PrSkg24Zhz7X
 for <samba-technical@lists.samba.org>; Tue,  4 Apr 2023 15:08:43 +0200 (CEST)
Received: from mailserver.zkrd.de (mailserver.zkrd.de [192.168.100.13])
 by mailgw.zkrd.de (Postfix) with ESMTPS id 467301403E
 for <samba-technical@lists.samba.org>; Tue,  4 Apr 2023 15:08:43 +0200 (CEST)
Received: from [172.20.54.12] (pxe-h10-sko.zkrd-h10.de [172.20.54.12])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mailserver.zkrd.de (Postfix) with ESMTPSA id 38ED886F
 for <samba-technical@lists.samba.org>; Tue,  4 Apr 2023 15:08:43 +0200 (CEST)
Message-ID: <841f8a01-5e28-8321-2f59-90f8f6a13c07@zkrd.de>
Date: Tue, 4 Apr 2023 15:08:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: samba-technical@lists.samba.org
Content-Language: en-US
Subject: File corruption issues related to an allegedly closed bug report
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
From: ZKRD IT-Services via samba-technical <samba-technical@lists.samba.org>
Reply-To: software-infos@zkrd.de
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Dear fellows,

In our company we used to utilize a samba server to share Windows user 
profiles between two instances of Windows Server 2019 which we switched 
every month after performing the latest updates.
For more than a year we have been experiencing problems in 
synchronization of our Windows user profiles and hence stopped switching.

What happens is that several files are getting corrupted due to 
truncation when copied back from the Samba server to the target Windows 
Server. Although the issue is not reproducible among users, noticeably 
just certain files seem to be repeatedly affected.

We have suspected our issue to be related to
https://bugzilla.samba.org/show_bug.cgi?id=14928

Supposedly this bug should have been fixed in
https://www.samba.org/samba/history/samba-4.15.4.html

We recently upgraded our Samba version to
2:4.15.13+dfsg-0ubuntu1 (Ubuntu LTS 22) but our issue persists.

We would like to ask for access to the bugtracker in order to report our 
issue and share details which hopefully could lead to a solution.

EMail for registration: software-infos@zkrd.de
Name for registration: "ZKRD IT-Support"

Alternatively we would like to discuss this issue on this mailing list 
if that's more appropriate.

thank you kindly and best regards
Stefan

-- 

