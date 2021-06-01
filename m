Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C798A396E61
	for <lists+samba-technical@lfdr.de>; Tue,  1 Jun 2021 09:57:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=XwGKH/utsxmsiv1YldXb0Cek/YwMemUT80lvCtFVeQc=; b=Jui3fEoG4Bi1vBuvrEESzndPkn
	n2mvi27HTsdhY5unbCg6OLWm9uHZj6PNVCvFGX8E7dgl2UL8C/Y2DQn/7Dn2JMSXhMg5jsyT5lHxE
	+CI4qbx8LQkvGNBYJaMFECWq7XWWiSKUoL/CC7orUE6xC0fBXQ67ccsVQ8nmOPK+dE+ZjW0FQpWa9
	2pPKHX6YWk87gWzDKVvohqgDpKGPyLHPC/o1PZAPhysPE7Tiy5T+1Xutp9+1GYJ5d8praSK5xdspO
	r/w7Px2p8oRqNT88vuv9hQkGYu4dmw1YFlq1LQTC8QYMse288oYFZarwBRInRGTKAVsmkUVg+lD2c
	Ll8ekdHw==;
Received: from ip6-localhost ([::1]:46604 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lnzHO-002A5n-IV; Tue, 01 Jun 2021 07:57:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45996) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lnzHJ-002A4m-7F
 for samba-technical@lists.samba.org; Tue, 01 Jun 2021 07:57:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=XwGKH/utsxmsiv1YldXb0Cek/YwMemUT80lvCtFVeQc=; b=fp3+iSLMXkrlK91G1GSWrmd1C/
 Hm8eX5zriSDsHEcOACCziLoo+Guq2wuPdv6mqU/xu5AHREZ9sRDo2GexzAiwVeESPT+dfO32ibtiG
 yewgLYjwg/+iKAjKBPthShVV7tTxCUYAi3/pOOV2qLrjTFkOKppBdIPJ6/VyJrcvIv+I4eQMvRDuE
 4DFeDYU8HC8oY6obrIyz4nRIFFDO3TYiJwHOaFOerMoJK4rYX8WP4XqDEDmTgOcWJO4BnvWqvkeeO
 HFDfnkx6q3Rz6iPXwZv6f9/SJPYyCcBqvDh1LbDlAeuwR0GFCYuYG6YoZJ4iMk+IJ0NAKv8f/JK2T
 3Ukcxg6F+TGQbhhVzFFfAoxd0S9AbTRtzHtY9jyITr7to+5362qyxwe2eTVTPN0wDBl8SAYxoHouT
 /dYuQoKaF9Acskg2PH+w5FwCsYwijmC8J1LGsF2ErZNzJ/djVS4IZ3DNU26S9en9d16YE/cSnWdZW
 C6ig5NHRch4uuDcNoSUhXUcm;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lnzHI-0001CW-O7
 for samba-technical@lists.samba.org; Tue, 01 Jun 2021 07:57:32 +0000
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.14] Samba 4.14.6
Organization: Samba Team
Message-ID: <d49cc62a-5a2d-87cf-e17f-a91a891bacd9@samba.org>
Date: Tue, 1 Jun 2021 09:57:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
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

Samba 4.14.6 is scheduled for Tuesday July 13, 2021.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.14
has been updated accordingly.

Thanks!

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

