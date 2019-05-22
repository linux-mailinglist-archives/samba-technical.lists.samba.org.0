Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD0B26298
	for <lists+samba-technical@lfdr.de>; Wed, 22 May 2019 12:56:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=JAHfrdTBemNJJFT8BzimU25fhuXLgkNDtNnQmWBno8o=; b=51G41Dpj751v9sw8nb469q+AJm
	ewXmjlst+Xv4nN3TrKOsQR0uZqxcHA6sfAUDAoNXU0j+09otjYSakQ6ZQGDlf7hR13OYCpCNA+HEt
	WiDMtwZA5+x0RfjEey0pISyKhG0wtWKjBQrF06CKbKJF5akQfUiynp5w8FYJz1HS5/fpH5Wj2vhfO
	A2eW+xAPDFJDxsABGWJjIr17ikx+wTL52tTG2EQyy6jDnmxM7choPZwSqDPIf50bt77oraCt0/+Li
	yjHejrp3Y3S/8/oCY5RZ6ZpKgdUtxSd2jIe4FNzgwJTLoKEPXHqKCTm8dnL/1IRY3Z8cp30+PXpAY
	Vt0cS5zA==;
Received: from localhost ([::1]:58152 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hTOvV-001DdH-U9; Wed, 22 May 2019 10:56:54 +0000
Received: from [2a01:4f8:192:486::147:1] (port=29910 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hTOvS-001Dd9-7F
 for samba-technical@lists.samba.org; Wed, 22 May 2019 10:56:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=JAHfrdTBemNJJFT8BzimU25fhuXLgkNDtNnQmWBno8o=; b=QI1MW6aEPxdI1s7CL/vObx646Y
 dx3dTo6ukN/zKNLm/wnMMf/fHj7Mi3+9hiLMhMdFKqnWEkMBip69gz4LYyLFs/lwVvQF7wjZOWAJf
 auq7AwCn2++yI124dwz8TwqmF6PVse5d3kd1tAdM/zi7WRUnv1lLEJw8HYUlIPJh35BI=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hTOvM-0005Af-W3
 for samba-technical@lists.samba.org; Wed, 22 May 2019 10:56:45 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: [Release Planning 4.10] Samba 4.10.5
Openpgp: preference=signencrypt
Organization: Samba Team
Message-ID: <c9defe7b-b240-ec05-16c7-d73908f03302@samba.org>
Date: Wed, 22 May 2019 12:56:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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

Samba 4.10.5 is scheduled for Wednesday, July 3 2019.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.10
has been updated accordingly.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

