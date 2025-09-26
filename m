Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D87BA4050
	for <lists+samba-technical@lfdr.de>; Fri, 26 Sep 2025 16:03:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=4GbWnMkSNtdcbdAlv5AZXofZX+iT9Pl4pPMSLDobTu0=; b=uHtku8osWBuqGqr3/6cvtq16yq
	WHM6N0MCkKoqrU2wUqUZq0h+qw/EiJWOSf7iAvW6JStaPlPjCKfTLy/GCUcdwiRwxyUjLFvN27A5q
	jdNEkwmO13Z70KlJy7yTq/aZutb/MIoJ3FoH1BolJQiYP3VS9mRqCA3RSVlN7awky4ZvDwY+GTdc/
	5CUJCWnGuj2uvCkTmShYgXunAPbqrex70Iu3+4SGtreEfWjkjLEtdx0/q9T1WcTA0k+1p5H41RX1h
	zHqtwc3QPbpYBFe4m54POUvBIzpQVgkcFlMogBRcF+Ycp0Z3qWA7UzajzIXCSjxO0A0dePb6kGxoj
	rqcQHdAQ==;
Received: from ip6-localhost ([::1]:19414 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v292x-004otf-9u; Fri, 26 Sep 2025 14:03:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43504) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v292r-004ose-OF
 for samba-technical@lists.samba.org; Fri, 26 Sep 2025 14:03:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=4GbWnMkSNtdcbdAlv5AZXofZX+iT9Pl4pPMSLDobTu0=; b=YywLDkBhswefGi3YWPF1zaWc3W
 UK/gN0/R5gocA87DW+kxUAQX2Nvp3khGn6h/pygYSmrv1y26TXpINmShCnJ/NIxP3yWPxoq+rKu9C
 PEV2QhzzVeqo1qulT1v/LwI0qgO0jGR2RWw7s4qSgvwMSBOsm6Xh4hnSVi4/ifawAX1jkrFkP4nkd
 TiZwlnZJ0mrTuqBGAopqSsjDARf91H+0XmvzOnJIC8f/tELa/WIJnXigXQMiuIVvJK6kQCuZ5WcU3
 l5udxYaraH8iPlTUGOB4t3atqfvEFNJt++VMh3F54q9CGqF7v9G4BB03zHWesKtHEdQfBgfTY3QFx
 8pDOR1txVtjvbvOW0SAHkNOt/wReNbx4CKBjYOmU3vEoSCJMEf/am5PDy9y89zc/JNoM/b+vPuv/v
 fHCuWuOzArQLvKP8k7bYuARAssAwW8ywhEiOsB5iSAvGYXadnkWGVG6JrKP3E65Fejx6A1GEk4iMB
 sz13a177J+d2+BDK5H7SUbDR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v292r-0068jz-1B for samba-technical@lists.samba.org;
 Fri, 26 Sep 2025 14:03:33 +0000
Message-ID: <6d333823-4440-4f95-b63a-34514dd3423a@samba.org>
Date: Fri, 26 Sep 2025 16:03:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.23] Samba 4.23.2
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

after the early release of Samba 4.23.1, Samba 4.23.2 is scheduled for 
Friday, November 7 2025.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.23
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


