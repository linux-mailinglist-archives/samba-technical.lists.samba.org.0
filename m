Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E02AD686D6A
	for <lists+samba-technical@lfdr.de>; Wed,  1 Feb 2023 18:52:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=wHyHNPfMzTlduPe/vkDnIRnxra/J8s5RFdQHLS3I9l0=; b=swKygRH2yWBkKE7+gJVuqOSi3X
	ljsTn1N0e8UFf6r+XSpCmYoPq95puBq4YuBfmrIbclVFVl4uQCrs7jAXKgmr7fP41GkxJgcAYy0H3
	urf9tk8TN/GbyjfFJMS3Plm4vL7vABa6oEZVi6kIKIcGLsbFNBmUt0OOBjf0KCzuIrdO4fHpBcaeB
	468IScrJq/JWp6BHsY2Q4D2e2ADfh5YqOQfcUrJUGJzEg8w1WJA5fSWB3XtNwONP7n3qno5mVVg7x
	WzE1eTGVpQE+9Tw0k/z8njX6K9pqSmfcI+3eEf29+BW1oxbKmXEWTZMgKMtv+mQzHvI1Bq8ztx5ab
	9rdJHPEQ==;
Received: from ip6-localhost ([::1]:49640 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pNHHo-007eu8-0E; Wed, 01 Feb 2023 17:52:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57424) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pNHHi-007est-EN
 for samba-technical@lists.samba.org; Wed, 01 Feb 2023 17:52:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=RSCn+vkgLdKyvhPVXKVbqtIaWGiqn9Addpjj4RoNVEU=; b=qcJ6JdYj+gah+1pYK6wKeNsegK
 yBQS0zYjfTKPsVtz/j2cP23WVMAGvJ94UHseyIQ3pxNXrTUPGjE2JOw0bVqKyY3ayvGmEGiTCvNhz
 SoiDCOpzYwmIdXyvL5bTSObuGowkMVCMwUYDuLbRVWL6Yo1/jjSYbrLf2t9U2h6ogAOIz7n16INWu
 omTW25+Jsyuf+5PCnZWf2gdmqc8LVqyCbcrrYTUcwmvnVzL0kdCbY5ehLL8CK2eEJKn0y1sIbxhGY
 IhiDV210zwG1B2KlR/Txu4HlqWvGxNozyMXb26nW04AK2IHz45pSfPa4xA6chDg9PWBf3rGsrCrTC
 w6D46YYUrKx1Ms2M0c5XHs/obTFbfv0tWSwdQrjLkp1rxQlyGlUSqwznzHn/d4LN/oyuTyeZcQoJu
 phFBiBCka4LL0No9QfsAnIZiqwL8LKjoJcYLYVJdJo3muXHXRNaW4u3WiUEaJ2lz2u9+CJw4HPCgH
 BAwkuJxs5Qc55gyYRi75m8O2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pNHHi-00BGb1-4F
 for samba-technical@lists.samba.org; Wed, 01 Feb 2023 17:52:38 +0000
Message-ID: <4e1f071f-ae70-e868-de77-5f72ac847ea7@samba.org>
Date: Wed, 1 Feb 2023 18:52:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.18] Samba 4.18.0rc3
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

Samba 4.18.0rc3 is scheduled for Wednesday, February 15 2023.


https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.18
has been updated accordingly.	


Jule

-- 
Jule Anger
Release Manager Samba Teamhttps://samba.org
SerNet Samba Teamhttps://sernet.de
