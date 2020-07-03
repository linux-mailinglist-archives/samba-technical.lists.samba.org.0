Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B3A213821
	for <lists+samba-technical@lfdr.de>; Fri,  3 Jul 2020 11:52:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=sU6fPed48lxyl05egrFTWlLnYQxGPVHR4ezZ+bWcdQ0=; b=2RO3QJwYzFiLi9EIAMVXdsBGqe
	mDgGekbbkM6ek+r8h8jAATHROzJBy1dWfulginB0fGKLVKfUtzR1edxfdkE0kuZrSTRNMZt2LSDph
	qDsmff/a2fssAfBoSIDESVTjWYB/QHv68Gr1fxS/shb9f0aD7ZdAyLW+BOI8Oc3JBU/uWPCS3giIq
	I1912qMrlfyOggWdNcxaAM2R7/7SrUcYOSrSmXW9IGkdQe5nEXOzeP6P93qgWK3ju5SXbUCSSciXd
	PoE3q3ZSMdNfNxL4qzNOQFWcjmreLlz/BvzWWE/C0XGNWAtIk2lzftuR/ABXHZtp+2lxcwaqcZa0g
	aE6HfKHg==;
Received: from localhost ([::1]:61182 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jrIN1-005FRp-2J; Fri, 03 Jul 2020 09:52:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49402) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jrIMu-005FRi-EK
 for samba-technical@lists.samba.org; Fri, 03 Jul 2020 09:52:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=sU6fPed48lxyl05egrFTWlLnYQxGPVHR4ezZ+bWcdQ0=; b=k23fI3NXomxoOV4wpKLKxgWCAC
 DXA48cP/xXxDNzBdUQzM6jGWKAgytgt95q2pTW9UMe8Ujq8q3n+gdjf7MOKuR5w/RVn/t/k7c09W7
 VVMSQTcxSTy8XdVXVhUz12TAVXSnTkT04ubJCEVyMiKcfKIne1YnMeOQB5HCcspba9Rx4iDqJx9o7
 doGhtWYgTunPYnMVHYmIa2W0zE0Y/NIwW+foCsUbVtMW/4FmCwJX3yEGUMXjho3eDJUBoTK9Zhd9O
 mLAmWevsEqfawy+KwCn2BNxuuqCelwrEf1dxkB6yG/ZIJOHfKaGb9kPnaAB6U8yS2ylX09gBk+KHU
 Bf+QLflzyhrEn8C7dbakMAIlf7iObhy3zrBOwjE+CSdUzGWGiQKytTgPpFx/+yaPG9PFsOcNUfQZq
 uBmgifrq5yo1Hzxek4NF5ugW0FLwW/Q7+7vTBAcgqycWC3WlGmXfhkDt6iMWPqc0/XotOHjzmHLmu
 +mmx5q87SxgwmTt8Tlx0AZxE;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jrIMu-0001Lw-5c
 for samba-technical@lists.samba.org; Fri, 03 Jul 2020 09:52:28 +0000
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.12] Samba 4.12.6
Organization: Samba Team
Message-ID: <71520b81-afe7-f6e4-3abb-7ac42c468594@samba.org>
Date: Fri, 3 Jul 2020 11:52:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.12.6 is scheduled for Thursday, August 13 2020.
The release branch will be frozen on Thursday, August 6.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.12
has been updated accordingly.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

