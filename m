Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5E04D9C63
	for <lists+samba-technical@lfdr.de>; Tue, 15 Mar 2022 14:38:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=jgT2DoxyMfWJuoWbIvSr3hBvCvPabUf8zw+pZ/0Rp8k=; b=QKK9/KPDxZx42QhdpLTU/uaX7q
	4m8gmitTBmtmGDUl4r3OdYcrJyRzlwzYRePCSLbnnSMBp2BqpRk5EUwjsuSCWVx1KSx3Xr2FU1XnV
	4w3l4kKboUTmtEzO2v6RG3oB5ICXnP6NsrHQ3d1LXgyoVKC0TLJzV+Y1fsqa3KPNZCWyFN6nCMbts
	5uXY0uPDiAsS0k7Yr/6xO6MXOjAWS4tSLvYEOgI4AacUJOwqtGzM11UxGNryhmlnypAcLU93D/gCS
	1BclIgiOtXy6aEv1Z+uCrMiQ0j6x5AOwp1z0nz+HiFPwe1sq91EGOyPBquMnWrnYB+0uxnTSGMlr8
	FEkR4RWQ==;
Received: from ip6-localhost ([::1]:40608 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nU7NC-002Yga-KF; Tue, 15 Mar 2022 13:38:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37578) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nU7N6-002Yei-VR
 for samba-technical@lists.samba.org; Tue, 15 Mar 2022 13:37:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=Ed/Xq7BXUlxmuQqIERB/vprzQIgBfsEGd4nDTnOslqg=; b=mup2xb19Ty0EopSoVUJFkeiwnp
 PDl9PHq8doxBXOmLUZP9Pb8YWT5ic+oOrqzVBzyncLUfMx13lfHVlvnvNzKZZLe6EumP+VO3LrXbP
 z7Tp4OQ/a8BDVaf8Qf9PkP2cYU327Dbf2WV+/LKCevUzHL28zoPZX3E8MwzCGS0o6GmBnEYWYiMkc
 GLT60sdpCUTqMU7yNexn0y+lJT2wZe9yBS48cxdxbqj9r9PRO55j73cYdWAwDTdMJy5CpSUp7Zlvl
 OXvjqooxHlwuMPTKbFDPoW/XcGYZuWDsA86xE+D50LmmunCIeBXQdKNeYahzqZ7lwi1C7+UZm/pQJ
 YmVnZ7oJLCtNpwaLEfj6LkxuFOnafUGhAcfUW9Y9FY/tyaudwDrirNqrjo3N0nhISZuKAMKrd5afG
 Tw4aD0yG9CUZKtA2lTwwSvgx8tZzD4KT1g4DI5ll3R3ZgJpZWRO3RnDKR/j4kdsO2CqB4gM3ZRc4E
 hsn0Eow0wsC5+XTVs6KdUMwz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nU7N6-001XXC-D1
 for samba-technical@lists.samba.org; Tue, 15 Mar 2022 13:37:56 +0000
Message-ID: <cbf2004a-5da1-c81e-292d-866f3fad269b@samba.org>
Date: Tue, 15 Mar 2022 14:37:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.15] Samba 4.15.7
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

Samba 4.15.7 is scheduled for Tuesday, April 26 2022.


https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.15
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Teamhttps://samba.org  
SerNet Samba Teamhttps://sernet.de
