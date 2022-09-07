Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF855B0CEB
	for <lists+samba-technical@lfdr.de>; Wed,  7 Sep 2022 21:11:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=YBlkqCuDTr+rW33H4ioUE9PaQKdPMMkuVnfSh+PKquI=; b=mtr1p5blyYwgLmiS8Dwo2XN4so
	H9qJxIAfrvsJjai0ODH9n63KxfqHV8gtyAV1eKdy15DLDSL5Jy+h1ohJdbIEvrK4laO2ltNH7X6zO
	Gy4+3VyIGL+OnARyq1AM3qy+gzX37Ain3zzjzOpfcBAApOyoDAl9KoOKic8wRQNFqwIbtVLpT5mQ0
	T8Qt8ICLIzcPn5JaRHTI6csoNOmSrNe7eFQ78ywYG8Rr4TdTZXM5EJBbc8fg+afn2dWQuHYY+gwu/
	tCc6wS8DfdlgDN/mlJvDUEYhZj4B9EsPyYf2ixQP0O9Hj0Sn9uV1QB8OLJl9t0dCZWOexKAggwmPY
	evV87u/Q==;
Received: from ip6-localhost ([::1]:43122 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oW0SF-006DMp-VV; Wed, 07 Sep 2022 19:11:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28696) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oW0SA-006DME-AO
 for samba-technical@lists.samba.org; Wed, 07 Sep 2022 19:11:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=7VkFYxD34jr6IAV/b5Lw3ySTv30Cs1Wd+8yY7grPtS0=; b=ShP3P2nta/0Yb7zfqMhHqTNZ4v
 8Ede+LJEJtHQxE3LBSfd26KnOTu81eEd7Zs0nMnbGCvmeSAb4FBtiqK8JPZUZPxsgp00D2pmeYU0z
 vTZ5WRdFNNVGOinI1CDc/c7ynQSC4vN4gwQNxPtkYL9e9Uu34z8x3I2mVT65Xm/Gcu1hpqrdIxWc4
 LCERoq7GpHLjsZh7y6Mk7kOuv+MQOtOrMSOEtFW/lEgSNzT+NyYHFmgD4pA1VwjlvmcTtRIJ1I74K
 Ke91/SBun8dMnHVeH4a4J61ivu7jZSNOivfOgZqCyJOMQLvIINN/JI0WikpYkVa5XdliF+BkOAOHr
 Z9sOL7LJfCP+IbPvboMPzzGis0zhqeVdErh63ZKQFGCDvjFJ3udyYl9/A4Fuge7JqP07cNvouZTk4
 tmaS//nXY2rvlnxoUpaxnKfHIW8QRr9Cdw/SKwFQs7VgBE0ge09ES+DA8UVOPv0LSkAxRBhZwL8/M
 r+LloQ/J1pJBwC/8k6ZwCoCy;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oW0SA-003XHU-2I
 for samba-technical@lists.samba.org; Wed, 07 Sep 2022 19:11:14 +0000
Message-ID: <8d5cf024-23b8-b761-b5a4-dfa59043226b@samba.org>
Date: Wed, 7 Sep 2022 21:11:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.16] Samba 4.16.6
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

Samba 4.16.6 is scheduled for Wednesday, November 9.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.16
has been updated accordingly.

Cheers,
Jule

-- 
Jule Anger
Release Manager Samba Teamhttps://samba.org  
SerNet Samba Teamhttps://sernet.de
