Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 18069697F80
	for <lists+samba-technical@lfdr.de>; Wed, 15 Feb 2023 16:26:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=3mbm7sKwrV1gwt4V9EW4T62JhaOKelEmiul9vu/cze8=; b=gGeugbs2rqhuaUVRtg1YsGoGJT
	9qfQy7JzxfTsqOFfLpVexEogWJXEQ6gS1SilbwLc0+XyeYbwSdDnJNQZAlnDanL9aKlDdfDPlzMQv
	+SHdFdeWEdPzu6oYrRZvQSVyvj9tuEPm2DN5ZbeJo1H/u1kO3Pe02Zvqppgq7UToL1bAU3GToq5Z9
	mA+CJJl+I5oeJA2NPhkSoQtGGCNq4ZiHI4rb31nzc+CjNWuifeOGYrNvW/MNMBQeDRmcFACBk3TJj
	TEhnENDKQaLD+X57tJ/2rlZWkZWwJwnSSP25eD/lO9s5NCc8b4uODzdn/mj8EmeEbDHDnxmW0H9Jv
	8B9h90+g==;
Received: from ip6-localhost ([::1]:28542 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pSJfD-00CNtF-Hj; Wed, 15 Feb 2023 15:25:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43664) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pSJf5-00CNsK-4Z
 for samba-technical@lists.samba.org; Wed, 15 Feb 2023 15:25:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=W6Tgom74WRWDappdGMo9YBrnyWYElpneaLNPqjayqbo=; b=ExBdUJTWNRAg1xV/mFV1halfGC
 gVMmxgOIK7U8C7gZXa7Se9n1eoLWMlRyY8aHXUK4Rx4cRqFDOTUJrKqnOeVd8xaLE5gWcXIGUsdb4
 +NKFE01yTuI3izg0k+UIoYuJgiINgFDfij25vHRZFy+h1SDzNUmkFRrW/QGj5uwpyGXs/YdowgBcZ
 L/nhCcTiShbk/VHQ6HXDoW7LqPiDgiqjDTt+52j+s9Z4aj16DJr9INuAlQHD5IPIUPjE1ibClV/Ql
 XynCI1TccxO24Z1hZchzuL9FcsTW9aNUf5Kn2GqDbSicSTaB24ccMKB16YyXuhZsWcE1gancPd/VL
 Cl2W+w+dExETaWoueiGgMKvrEH4G6YyLlQG9llE/rkLEq4/LRuIoyyMY8Ha/Z6BbPjj1ipnw8OAhL
 ZKvoUC13DRQO+41MD1RGpvpG2GMThoelJk6EG+J+tp7i7xz9sQaavZZINDFuv3AW7w+SUlRNL+Y50
 SoJG5YfjoOmkZrlH9L7CCi16;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pSJf4-00Dtmx-CL
 for samba-technical@lists.samba.org; Wed, 15 Feb 2023 15:25:34 +0000
Message-ID: <aff6a21a-f241-7c9b-a1d7-cb7ec2e5c67c@samba.org>
Date: Wed, 15 Feb 2023 16:25:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.18] Samba 4.18.0rc4
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

Samba 4.18.0rc4 is scheduled for Wednesday, March 1 2023.


https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.18
has been updated accordingly.	


Jule

-- 
Jule Anger
Release Manager Samba Teamhttps://samba.org
SerNet Samba Teamhttps://sernet.de
