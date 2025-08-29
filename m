Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C5721B3BB44
	for <lists+samba-technical@lfdr.de>; Fri, 29 Aug 2025 14:26:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=431KtZnx7YkzpZGFCshL1kI83Td30IXQ2P22Xsbm948=; b=a/+cudTtnKrnHRj1Il+I5yiMBg
	O/xgcAt5NdFO7xrkmmlNafFOU0kO7Yshkui0mqkin4HNTwUHT7KyqtbOKuJnUYhJB5wWPGPlLiEPh
	W+VpLC0rMkwWZbE5qqmib3LjxYAgzGrCk5MSnQO58uDac5TQGmpcJvmntBMSAI1pYtp7yICIPnlL0
	0y3dv3bkOB7U4LrlKfqP9PRuvhScaFyR5GBDwaiDcoXkQNCE3suN+UKUffN/v6fuBIgdwKjnkmnHO
	bK/TbLbuE8OGcezfyNKY9sADS1MPqFG+1KT2tg3bPSxHo4+Q1ABQYpqTcwP6vLe2dyV0PZQIZbK79
	Gys7gpzQ==;
Received: from ip6-localhost ([::1]:59140 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uryBm-000l0h-SH; Fri, 29 Aug 2025 12:26:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33402) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uryBh-000kzW-KL
 for samba-technical@lists.samba.org; Fri, 29 Aug 2025 12:26:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=431KtZnx7YkzpZGFCshL1kI83Td30IXQ2P22Xsbm948=; b=BtBwaydHA+fl8yzCWDnaGEZm+L
 xbayzCyEnlBtqgAqijadgdPymQIJR+yh5nrn+TeHyuuTfU1c6oDyUZi885rn6y8OY3ZOydxBgc0Y3
 4m4NueodxZb4GP4muBksDXrR3Nn6GLHIAHiaw+8XP6tZa3u1cBvxmVO3K/GxVHtk6eINSUwgPdJdg
 L32oT/tuTKYeHOimpxEDly4zxaEuc+GOok6C7relWGQRT/GMBND6spFJ/2SHhueuzHCv1YBEgNTkZ
 xvaHI04fWCH0OqS5grxXaOWZVMC/i0OvzRY+J6lB1TWcchi1crmcHiEa6lR1efp7iTzjN6YijYmhn
 reqDcpHi0CjewdMOKL26aukNdDEH2WWfNhqjauwYUQOKwS8967jttjYlDM/SfYoi9evW3NWWwR5yn
 U8Q5S8wcc0isZCLyaktefFAqYDihsM1YZ05Rdgb+dznJS1zdw60QjbGjk/s0IMR3JZ41GWuJ3DHva
 YOsjN9kXT4IZtkNGysnmqiJI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uryBh-001Qi9-1D for samba-technical@lists.samba.org;
 Fri, 29 Aug 2025 12:26:37 +0000
Message-ID: <dbd4704e-1e6b-4fe3-993a-e81613632350@samba.org>
Date: Fri, 29 Aug 2025 14:26:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.23] Samba 4.23.0rc4
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

Samba 4.23.0rc4 is scheduled for Friday, September 5 2025.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.23
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


