Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC5213A33D
	for <lists+samba-technical@lfdr.de>; Tue, 14 Jan 2020 09:51:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=TMdWr0p1ZqbLnWb67Z1UE2OWyWrXXhGgd7Czya6mI7Q=; b=dtvNJFeKIHUyFpLQErp2E+MU4Y
	SJfXzPR6y9ug/+WmewwxR+RRjcOr9OTc98B1wOT2Q+Vgdt92rujwrI9WMhoEw6KIkEOtAG6oczEss
	B+qPQuNGzVDit9lD4wikG6PUBSwQmfVWiLbzmrWIWbcuhJnaeSqq2/gvia1sESQrkutgsAvbLI/SV
	KuwQbz83taKgBxHKpsVKUU6lwUHLRGx/O6mNkXJErZMpCri5mwM0E088nPxc3kbNbxHAfhB+oZQDe
	ZcWVEK6EVDrHRKkNrlEeZvFCXusy5nLtGjeqsEomLZJYCrJlzUI73cyLJHtPvc0eyPvwVbwXGdi5J
	sTa3PQqQ==;
Received: from localhost ([::1]:21326 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1irHut-003Kms-40; Tue, 14 Jan 2020 08:51:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40092) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1irHuo-003Kml-EY
 for samba-technical@lists.samba.org; Tue, 14 Jan 2020 08:51:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=TMdWr0p1ZqbLnWb67Z1UE2OWyWrXXhGgd7Czya6mI7Q=; b=sGf+NsquNp+qdQJBPxHVtJjc54
 KTx7jiKrTLulyzhEcC5+THL/ZS9WKbX1RzEPf7B5XaYNtg+gIyyjqC6sMueR9MnFtqz9k0AWQV89j
 CAbS0g7bKoA3lIj2WGRK89DfFiGEnYky1kDciHOjyaKJh9iU93JHCqPRKAovypuP6r4J3yRxjSSXe
 Q5WOWrE953rLgJhByBHgd2qjN4pQSiNDRmnp4pV6qZ/IEwGPZwFwdp3Sl68ZemCcd0S5+MSgyZacU
 kny4dFBYW1n/pfh3hYMtunqbb8fEVBuVnschLWf8we+HHKJf6WrHg/5fMwKtaTpcpiVRdo41SgQ7x
 HRGAYa7+Ufgcc53FAVNIvvcchCnDPk6o8Pyjsum/GdVw1eFJzM4g7STAx8mr/dtcZUfPmA/mwbg1z
 YTdK4//5bZig8Mudp5gnbkqkxIErLPioEGgKT7LnXQR3yGY4lIdbgoiCZYuu67PSDFOb/Wq240KEO
 zdn1XMX9mP6CaNWmI9LdAIEF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1irHum-0007e7-AO
 for samba-technical@lists.samba.org; Tue, 14 Jan 2020 08:51:08 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: [Release Planning 4.10] Samba 4.10.12
Organization: Samba Team
Message-ID: <97641253-1ab3-c841-7d0b-e70a1336bd60@samba.org>
Date: Tue, 14 Jan 2020 09:51:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
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

the new planned release date for Samba 4.10.12 is Thursday, January 23 2020.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.10
has been updated accordingly.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

