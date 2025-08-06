Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDF5B1CB2E
	for <lists+samba-technical@lfdr.de>; Wed,  6 Aug 2025 19:41:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=IDE666TOfSG+Sr5tn6AUZeUJhjCPlMz+FaSL9DeB+es=; b=AR94KZOQeUv5MDFHQSlt0GJEIi
	+hV/99g6jYkQnouyRL7JCog/mdJ9FulN3pI+jwxDfkRA2tosU8gL60Jon32AOtK9pGhHBMC7lC5O6
	eX8XM3LhIq/uZFgrp4vd8pznvj0b1s8AOF1Xu4GIsBne9sktAA5gLHieMRsQOUWOz2njtFKi+7lbu
	IUPHuxjjX20INRuPC3Zo9gE/EHbkY9xVX2Ol+WzGELBIqHq4lMaiBh2W3SYlUg0dJZgfPJ2r+/YDD
	U315muMJdAbfWX/svNX4yTZDTbDo5bJ2ECRI7kNVhpCy8tEUG4Kzw/+CJGWQj6R+xiE7Itk0It5/R
	ey0pd3nw==;
Received: from ip6-localhost ([::1]:53670 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uji8j-00EStd-Ua; Wed, 06 Aug 2025 17:41:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61642) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uji8f-00EStW-D0
 for samba-technical@lists.samba.org; Wed, 06 Aug 2025 17:41:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=IDE666TOfSG+Sr5tn6AUZeUJhjCPlMz+FaSL9DeB+es=; b=XwBbOVV4VzYlba78gR1M5dcAeV
 tdKY34z6R9VmUACnouUj4vCP2nWNNrDJR/41epEOf9CNDSsMcXlJKJZoTLFjGmNlcswglyTj3CrIW
 2Z2Gr06wmvafcXeEAOtinPU7vjPjTqsD0SpB2xFkiYLPZd8rmlFlZT2B4KNQ0iwJ9gkOYz47hZkAq
 Ou2RX3izz9dJmjOccxFHElE7JnY4nsLRQLZtDamAaoTdIMYyWcyvkaFe3p+I2Fj6C8JHvWp4gJFSB
 HUr53FTsocuVajZC2qlvYNNR3SsGpSD4u4Um1/3ro9+fJNvX4WS2GGqlCo/BGzsXqVQ3KmABBXcCX
 GmUYzfrkeiRDtPpY3PmlgapHdD45cWVX8AeYNRIH3e7MXU2xmMFE97G4apUevnvEiruu11Bhi1Fsw
 Zu2+Ej0qanCxLe5HDZtov7k7rfyLxJ85JaXoOyVJo64ab9WdBIBIuJvXBvd+JlVMlTj5vOLrJpt/w
 +7R7YA7nbTJKM9nS/u2L4yOx;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uji8e-001PHv-1n; Wed, 06 Aug 2025 17:41:20 +0000
Message-ID: <ea27f558-ab35-4607-b8a3-480c9ca4c6c3@samba.org>
Date: Wed, 6 Aug 2025 19:41:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/18] smb: smbdirect: more use of common structures e.g.
 smbdirect_send_io
To: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org
References: <cover.1754501401.git.metze@samba.org>
Content-Language: en-US
In-Reply-To: <cover.1754501401.git.metze@samba.org>
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Tom Talpey <tom@talpey.com>, Steve French <smfrench@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 06.08.25 um 19:35 schrieb Stefan Metzmacher via samba-technical:
> Hi,
> 
> this is the next step towards a common smbdirect layer
> between cifs.ko and ksmbd.ko, with the aim to provide
> a socket layer for userspace usage at the end of the road.
> 
> This patchset focuses on the usage of a common
> smbdirect_send_io and related structures in smbdirect_socket.send_io.
> 
> Note only patches 01-08 are intended to be merged soon,

Sorry it's just 01-07.

metze

