Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 030EE330D33
	for <lists+samba-technical@lfdr.de>; Mon,  8 Mar 2021 13:18:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=q5hEBcRgK3CbDVxnVvt1czzDpnXcVkWV7G+YsVwX7TE=; b=k+Oj4hRGNnDYpS1Oiyf9JPjP3y
	tuIuUxjb4YsE+KBUWt56EYoMd68jsFkO2VUKL8ZoLnXRuyS3WP9xJXudm1+s3mLEsNXEuTU7ecnoH
	lfA72j0bWuOw8writ6l4CNrC14IlPwv8W0/fIXQJour2PnvxwEocyM4nCtDNDcbWeZgAfz/XhCHMd
	eooo+WHIVNjMMA2rG5y0qcjbSyEJASaE/OdkvPEBC2wQieL6lJbT9YLb51R5L+jiB3uK4/8Dlwhsi
	OCitvXtjOWZUP2YFzeo6l3eHVrq+34umPErGa4rCJFuwefRYZlkZ6OhcYWUQt/tesk6JR03HeIqQZ
	2KYRWIKw==;
Received: from ip6-localhost ([::1]:37720 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lJEq1-004Uj1-NL; Mon, 08 Mar 2021 12:18:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24224) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lJEpx-004Uiu-B6
 for samba-technical@lists.samba.org; Mon, 08 Mar 2021 12:18:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=q5hEBcRgK3CbDVxnVvt1czzDpnXcVkWV7G+YsVwX7TE=; b=AOhmHE8Tce9T+tCxu48faKo4Wz
 4kmjNYr1WrO9IKd3XKoxJLY5ovuWB52lPShoIaHvMLwTp/IrKiK3ROQJmPtc82h2Kv6s7Y0hCeh58
 oQxH9W52vf6X+tb1U66YPtmFDDEJy/iGmfnpI08oJkMz1rxMbZdgMjANrtDXCa9iLiqA+9AZUs9nY
 8U8rm4XWH8zEz0oa1sgCF0/jgLcSBaiKlYCJmkcygi6TjtOJdt2IwKsgL1IRWfv2zeQt9JWWXJQNd
 dumaUE41VOhoyEfH9HCdr++L6CwLxOHlueRpdIyRu9SVaG8qJ0DrVxaRibcn8DFXy1wmIxOF5GBWx
 AjWbYlfXlE5y1FujR86cmR3rDjkZrOWLSH/eRM+xdtjYp0rDt+QzCrv0N5etHNhlcPaToTpEHOvA0
 t/rZ3Em7r2ewzwnYZmqy/lRgTKgaEoB5DZoJDn+YKruNa5aPqfEZqhQ+yo7LfricFO385YL8Tl/t0
 yLwpLNPipjALwEjTONIWUQZ1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lJEpw-0000p4-KF
 for samba-technical@lists.samba.org; Mon, 08 Mar 2021 12:18:12 +0000
Subject: Re: [Release Planning 4.14] Samba 4.14.0
To: samba-technical@lists.samba.org
References: <a34d500e-e976-9cbf-08ce-83f1a32623da@samba.org>
 <16640afb-9456-4d37-3529-7e33eaef709b@samba.org>
 <d3740600-3604-d65b-9804-81e1739dd924@samba.org>
Organization: Samba Team
Message-ID: <6e09b1a4-9c18-5893-d717-d5fb1f358141@samba.org>
Date: Mon, 8 Mar 2021 13:18:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d3740600-3604-d65b-9804-81e1739dd924@samba.org>
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

Am 26.02.21 um 13:28 schrieb Karolin Seeger via samba-technical:
> Hi,
> 
> Am 03.02.21 um 13:04 schrieb Karolin Seeger via samba-technical:
>> Samba 4.14.0 is scheduled for March 1.
> 
> there will be another release candidate on Monday.
> 
> The final release is delayed until Monday, March 8.
> 
> https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.14
> has been updated accordingly.

Samba 4.14.0 will be delayed because of bug #14288.

Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

