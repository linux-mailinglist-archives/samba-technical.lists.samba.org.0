Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B935A780B2C
	for <lists+samba-technical@lfdr.de>; Fri, 18 Aug 2023 13:32:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=dylTs+gF6BYYxzIK3LsKMYMXoF8Bzm6Z83M8SAzlVHw=; b=a+AYVbM3zmzeGC8Pz457MZoVUO
	qWBlWW4+MbyfqGo5J4WFnXWMj2G/UPPtVHyN1gNhjN84EZOB2OQQZUh4BIod0RmIsQaMbmHN+I3OS
	6D+Sj4PQ3wWOymekKhs02C0Ii5zgGBmcuX6QUP+c4EySGoiwuAH/jKVSkNePPwmYbW+2ojcFin9IB
	s56Q5+n/konYXc2DiHjn5njnF2Bz6XY2brUqrO12hCHjb+kCQAXcYo016QghrWuiyPWo6KgOVFoTd
	n29W7i3uCfBuMYfUBMEQsAnp/xskCDogUBKK+bTSw6aAAEuIuZUTu0d6W0w6rFbx9CRbzJZo7sBL7
	QpdieKJg==;
Received: from ip6-localhost ([::1]:51850 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qWxid-00D4GA-60; Fri, 18 Aug 2023 11:32:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53642) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qWxiW-00D4ET-0U
 for samba-technical@lists.samba.org; Fri, 18 Aug 2023 11:32:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=dylTs+gF6BYYxzIK3LsKMYMXoF8Bzm6Z83M8SAzlVHw=; b=ZHVBl3Ydz1EF2c3GvmeCS5qiPO
 SG5s+59Uh4rlxfm3Vsh7XAoZBAB4oTHzf0o6EsxnaOEFS2UcEJCeuZ7YngWYdBvB8xdH0zTJBfOQx
 ynObzr2FMxNXnIN4/7hIo46kCGl/j4qXA8vCLxip8PHE1bUXz7M7CVcru7bUBi9xteNE3YyaTYp9/
 C/emjKrX8kwYBEtPs2BqkdFiaEFeIUyZNWHMadwGPNcVoiZvfg21oHcPltlEpVujchoYV/kupenjr
 YAAsTEGkunJ7sEy8ofWo7BXJLdCJdgSBRFWOU5nK7DbbyzQqVr3PG4I+xPZ/1p8kWmDjhhrn3LbF+
 6WdenHW5uFPAF5Ccw1JBp2b1q/fNFMEDkE+PLkvF6COn7FMGEUcS+veKpoSwUODRP2ChcROqjqfGk
 sNp9twbCRERFRO8sVBaOwe6emGb+ApKEzLel3zj6v5jEV/UXrucOwSRapRNtNT/psQbvYDwQzCtVE
 3XBEvTYFX/gLr+82M6bzZPk/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qWxiV-008kIf-2I for samba-technical@lists.samba.org;
 Fri, 18 Aug 2023 11:32:35 +0000
Message-ID: <bf0c6d71-bf20-e4d3-32c5-f80fb9c2f2d1@samba.org>
Date: Fri, 18 Aug 2023 13:32:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.19] Samba 4.19.0rc4
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

Samba 4.19.0rc4 is scheduled for Monday, August 28 2023.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.19
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


