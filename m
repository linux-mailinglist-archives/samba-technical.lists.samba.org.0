Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FF63C6FA0
	for <lists+samba-technical@lfdr.de>; Tue, 13 Jul 2021 13:22:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=whAvMBetOLyc4g43kpsCEshLwD9psyCRF+NtVRh/cH0=; b=XJQlZU6+AJGZJuTXDKQxgOW2v/
	siAL7g+zqY22t9hHBxnZ2578KhgqL9WaDnDRSLv4VgMvbR/fEYPgB+xPe3PXiY+ZyvkQx7RemVpE/
	HWKPskQ/vd0lNd6UYOIEz6FJI86O+cD90RPD6UEauVfxvo8GKX0owaZV4801IJhc4xUtJl0E5s1Hz
	Eg2GU1DfA93Ol6BUwII+TfkCIuY/ZRnq7B13lFcb1pTkB3TytLIQ234DBqc5vVv5aP1R0DUg96f6n
	5YP/QB0OQOKQeeggAPgmwJK7vtpPjS7TxyaHP8uw1V+aUINhLAafEpubyRxMLpbTv1iJB8aImp43U
	KIQ/xCNw==;
Received: from ip6-localhost ([::1]:36970 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m3GUZ-00DCv7-GL; Tue, 13 Jul 2021 11:22:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60934) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m3GUU-00DCux-Pc
 for samba-technical@lists.samba.org; Tue, 13 Jul 2021 11:22:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=whAvMBetOLyc4g43kpsCEshLwD9psyCRF+NtVRh/cH0=; b=d2uGDhBWasVvDBOBw+OCNoVCcc
 MrP6J5T4RtXNFd4gX9vA1U3MHDhOB6galb81HxunYqZdtWYzkb/UkqqJrSp9mOqb8824qBZS+t6YK
 z7wVBA/fEeaRp7bysD9kxHJRo6KFUCKiRaajwi/mMSX+K64b/0W/Gu04vzYeBkLfXQl28E3Mo0JY9
 hQnsLntAdrvcKD60szMnYmCtYm+QwdibptCeZ2aPQ/RJvLBwD1EZz7CRRtksfJp7SXP6CR3t2MXn9
 hCROaIG4aE/FKdM5YJCu7mXcerbn882L7cvTPbPI9OFEGUFkEubLoHLBMWn+e6kGG8XNaPfgv2xN1
 nIJczl6gz1PAAzhPpF3QtSmIAndDb+KVoP9E35lOtkvTXFUqz3UbrQYz7ytH3exEoKQvlRBxSnZFj
 UfbYn/Z1iWu3aoFHk0L47jj0x4CL/Y+2ONPJgsJ6zlgzErHJ3N5wqeHOrO3ziOm4CSu1kwtPOBipV
 tljVOSo6CsPH/KlxYRyoDgrt;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m3GUU-0002Ww-GD
 for samba-technical@lists.samba.org; Tue, 13 Jul 2021 11:22:18 +0000
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.14] Samba 4.14.7
Organization: Samba Team
Message-ID: <36bbae90-16c2-b286-cddc-42a105b2f85e@samba.org>
Date: Tue, 13 Jul 2021 13:22:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
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

Samba 4.14.7 is scheduled for Tuesday, August 24 2021.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.14
has been updated accordingly.

Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

