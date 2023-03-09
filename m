Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CE46B201D
	for <lists+samba-technical@lfdr.de>; Thu,  9 Mar 2023 10:32:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=IGtehOv5JXORGnLtR09VaYD4o+YdRNxSNBKTV9dQ0eE=; b=C5KifB9y/jWNJp02YXDaVZuhYL
	cUnDzbQo5TjCHO9HOF8UQ4KQzHrUQcV7zdKt3lfQyMeiP8f+xRkezM4iDcyJBDCuABl7AmSUoPhX6
	CTJLpP2+YFT3fgUZRKf04BfkStDcJDnzKZ44L3JxGwArZSXevoVa12cYDPz4X2JueuMPTWwW42syQ
	t2ykAPLx0NiWQrHZw5HZoNo4hXqmAQCASWugm9NZmhjfui80gqiMf817Wd0llVe2/OWTb57ehKyn0
	CaW3M8kKSqOxk/bYVr3GUV5L3PO3sUpKl5mMkD4ejmVJSjCRNUHHgeZZDiowxCtDSimZkLRZSxpYU
	Ciwmym4w==;
Received: from ip6-localhost ([::1]:21230 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1paCcz-000bn4-O2; Thu, 09 Mar 2023 09:32:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44824) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1paCcu-000bmW-K2
 for samba-technical@lists.samba.org; Thu, 09 Mar 2023 09:31:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=+mqSwGGQoibVtTjGLKBH7svVctjfYz+pJs7KOMvyzhU=; b=KJu71qauZxVpILHHvkHR3b1Mzs
 xAmQixWlYNY4QSD6HpaKwfF1Rk/OSMUjGScRuPdoSFIHnensGXJcZXnbdbQ23lxIOrh/TmGjFE2ZJ
 FWKOuIOHXrQSvgIzirze9Dm+e56kzOH8Og/uzYolEHN5REVsxLIo3h+ePy8OZcuJCin42+LwA4cMI
 JuzmaaTP+P1OowdQDTvLKuTzsCLPQceFTpmt5sdVnOlMGMaPFI5PW9kFce3S72j0ivLOtIvsRar+s
 vRtC2m2qkWztF/XEoF1Nc/sV7zlqbNTbWa3N2XdsZEK+mRihyd1TDhQIQGa+ixBAiErBc53ahTY7o
 giolFbtF28p3neeeo7F4S8sNWTr1f21J0GH41HyYp7bT+8k0v1bl67HsakfsMWHyDK7rYInkVTUyk
 C/Efp2yH713xIggqMPZ0f5+DwZIqtUjRmZ4D3c/Sm/tzeEDk1XOD68RtCkDMnbkBi/5Kqa3eDNrx3
 nGQGvI1FGMA1EsXyg1lW+wph;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1paCcu-001iWl-Ds
 for samba-technical@lists.samba.org; Thu, 09 Mar 2023 09:31:56 +0000
Message-ID: <21e36051-d0bb-e971-d8ca-1cab3dff65a1@samba.org>
Date: Thu, 9 Mar 2023 10:31:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.17] Samba 4.17.7
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

Samba 4.17.7 is scheduled for Thursday, March 9 2023.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.17
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Teamhttps://samba.org
SerNet Samba Teamhttps://sernet.de
