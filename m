Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCC1548025
	for <lists+samba-technical@lfdr.de>; Mon, 13 Jun 2022 09:07:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=NZdeqV17OvUm77z2X2ooOJ0E23i4ebCOXDRlSzBJrG8=; b=s0TdxDb0XUpqGJF14ljDfM7yuB
	i5NDOsaCHfTPkl4u1oxf7fbQ4RWyzvURUnSQzXj9umLI85r+mzx7Ct1lblu0npWMUagDzpuctLT+v
	gj6sQ1enUBUgNpxVhQDtm/d8nidEvW80FY8/Pn2X1WCZ35iF0P6vVbLMV03G/jQz1Zp3jX6Dcte2z
	tiN6FvfKeS2H2u+MksDcdOx6MM0CO+dOVvS0Ss68bbIgICGTrB7H+Gto0YS98TW1sH/sMkupw4EaA
	d63jg9s9OfoVC38gKQJAA39ndq2kQStkimR5cf0ZIhWSzwSz0KUYX6dB8bqZ0uFPXJqqtW25oAnuJ
	89NuPOBg==;
Received: from ip6-localhost ([::1]:42454 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1o0eAX-009sH4-MI; Mon, 13 Jun 2022 07:07:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62284) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1o0e9e-009sAx-FJ
 for samba-technical@lists.samba.org; Mon, 13 Jun 2022 07:06:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=w5NpXZmdsuDCLnHdvApWZVLxD7XWgNtqXGVvnmQEWT0=; b=hzgLqWK7lCbHEJz+rg+wH0kB7o
 rUZuBewNjauAnwUqTDWc6nyWnarfkaFKstVXjO/9twaW7h403H1PlU3gQ6mMFJpsU/sBAzHBzGBs2
 Qcbjj2C+DjgDzFP/pqJYBHxlgwDcCmMovPus2VJfXZxwPu5XYOFVIZLe1QNg2v3+h85dXbxrgSMf5
 yPzKWcll+xBIeFXOTDcXAuAyMh3rkSYN6yuIQEQS2W+cFJpmPSwFT90uQ/Gfdd+LXzGMVXmnyBa1z
 jv+/NyDDJ/FBje4+DvmQNo11QYxf4MC3mP31KV9PukFoAJRKhjw4j7TJ+eR3GRjKh1fOgh9p58K0h
 cKsZREMa2Kq2MinfrtHILCLG/GSX7GVRFclzPxkHgDgQIwinUQYlBa/kVTbBYxtlMZorWzYEwsXVU
 18ur7dUgsP9lfrodYAZFmK1ur+7Ly0y0OoVqLRJUkbgaw8deAC4xuJ8pNSoezV45TkizQu+u8oeXf
 HGetvUTd9VM9o3tl+8R/VAh+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1o0e9e-005QTu-1W
 for samba-technical@lists.samba.org; Mon, 13 Jun 2022 07:06:30 +0000
Message-ID: <75a053d7-b4de-995a-115a-11969446627a@samba.org>
Date: Mon, 13 Jun 2022 09:06:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.16] Samba 4.16.3
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

Samba 4.16.3 is scheduled for Monday, July 25 2022.


https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.16
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Teamhttps://samba.org  
SerNet Samba Teamhttps://sernet.de
