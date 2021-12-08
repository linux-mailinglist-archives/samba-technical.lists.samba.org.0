Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7A646D63F
	for <lists+samba-technical@lfdr.de>; Wed,  8 Dec 2021 15:58:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=XHhTNA1Y8/iL0WjzG9sLzCBYSejWP69J9S4xkBTdJyg=; b=UfCKeV+ha5iOjtOUu8j2G9DLk5
	JSFon17HGg+vjqnUAYRLje2jq8Q7WSe2xxa8unocv1LkYVuIBS5hIy8hdYsEZdS52RRF7cmoAexUR
	Aer2EdvP05dnLSXvqL0rXLnpPd66zJI1WIUqnnP1UJWT0+tnppVH/4gxeoeBBb08v4jDdEm565Fkk
	S1HAAf/eUOXceC+mPZG+yJdKlo+PPai0LmjSlW0ABrB9ZiIhNeYPgsxVe9dBe0dTTJzPEhhtDphtN
	lQ3p54ZnfaR/wQICXsUQP5cFevg2oGuZWvZJUbq0lFoz+apxYrZjP3t1+/JH2DH7w4LTHHnk+dC/z
	eKFaKBPg==;
Received: from ip6-localhost ([::1]:27126 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1muyOn-004GDK-R8; Wed, 08 Dec 2021 14:58:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54340) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1muyOg-004GCl-Kl
 for samba-technical@lists.samba.org; Wed, 08 Dec 2021 14:58:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=noIp+FeJGfpjoh9X5xjLKVlIlduVuXpk55fKIhOgA3w=; b=VVH1nIq8ThGnsBXgMzXmQN1i2k
 GC1Ur1wEEZhPA+2ilVnOp4GVmPbOm9/g7KqB0zUnAp5JK5DbxPbj/pHprW1HKLFvOjmBQt4luN+xy
 zzX6y0eOirPOKqeLuozp/wD3loDRh9B/aBP53QQrQZ5whmwZZ+H5EOPELFs6fKPYLq/bUZmf3V+HZ
 kADuGaQUDgfN7GuOOFLxe4bVPs0SxNV7c/OvZ+O/t3wtmPOJ7ybykMCxr4sC2Kqmfx0pLvr3VE5cD
 Jdo2UW/vS6ahM2N6CuYKAUxBmzm0VbQTPj+aubF3HY3woCuQDUz+8bS/Iuz6Hl3tNSDpti9ToHB3x
 +s3fKoRJtzcERkzzIXEJK22fqqCTsLFh7KtrmgJbpFcesQFEfuUy7JxYbKHEPrjdbla0QTxJLy1Wq
 R4IEQz1Qu4rizJU2eKcyEcJ2vlkTu6jLS9tkMpX/C59z/xeVEJ7lZw+I6LHjmg/Y+BAQClvoabSrK
 Gx+ttgvFumrZnHmKI8WH77SB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1muyOg-001oKD-8q
 for samba-technical@lists.samba.org; Wed, 08 Dec 2021 14:58:18 +0000
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.15] Samba 4.15.4
Message-ID: <a43053c0-0f30-4123-4b74-66e8abd44aa5@samba.org>
Date: Wed, 8 Dec 2021 15:58:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Language: de-DE
Content-Type: text/plain; charset=utf-8; format=flowed
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

Samba 4.15.4 is scheduled for Wednesday, January 19 2022.


https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.15
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team      https://samba.org
SerNet Samba Team               https://sernet.de

