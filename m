Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B06631A07E5
	for <lists+samba-technical@lfdr.de>; Tue,  7 Apr 2020 09:04:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=XruKPjUthVHPyYajHR+UvfWP6YEPr7PvGcn67evxQEQ=; b=UxXt/w+IQCMch682MS575RwUji
	D1DmfzBtlFkCgad6ZdkhpmoMBJ440VSF57aDNwrLhLVt94M3VZD8dYz88x0ajr63zYY4cP6flvioe
	lzK3FLYdDEqtDWEF643yIpRlPAQMbt7wXbzzrWt4UR2AixMRNjCwXkg2TxmNiwVMiPW4Rmqa30LD9
	rICtU9IIUGcmScIeux6fvxUdQdIz3py5rha95d1IGMPwP+fVuXJfc/LFb6Vab9hmPWaixSphQraPE
	U08WnhETbJRJDwXc/05O76eRqpKgMYYM0+R57cfzzE45yv8HOVhsK7Lt6RGO14lcA6365DmX89EnX
	E6Tgh4Kw==;
Received: from localhost ([::1]:31524 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jLiHL-003gaT-Cg; Tue, 07 Apr 2020 07:04:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59724) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jLiHD-003ga8-Ec
 for samba-technical@lists.samba.org; Tue, 07 Apr 2020 07:04:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=XruKPjUthVHPyYajHR+UvfWP6YEPr7PvGcn67evxQEQ=; b=voQbEXnhMNmKK+sG1C5nM7eQmR
 hOEfmzVBPaaR5pVAKP4Q04gzYXR8qcd1btv2EGUjZpUOxviRegFKBdMcGDIpCLSULt0RHvCYrmlsw
 KwkmaGmf66W6wdc4fi0gfUopfrDq25y/urfLYNAshvmGPREnzytnmxexvTe6DuSQqJ75CqNN+/w9h
 SacVAJIElK/v7R34ibf2UVSEdM/hcH7LdAQUg5QAzIWwDu8maEu1KMYb6nYxVOzUGcQK8y1CzRfdy
 XxxW3YKL6Bo4lYnUFMZIVjuQl3ja6QxjeHtHBFuW7OBOWfdSBEhQCUfsgLmT+Okx73CsGxJoMk2hj
 v4mETlNKUOJQ+qJqq3fxoFbi37O77YlN1gQfQ/z8Nucx//cPhf/RQanowCri5ffEJMk79Ow9SE5pv
 hgt0YAJSrvl8bGKt/DkANKPj/fZ9VhwcUjNtfj7hA6kHkNuvo2le+Sh+WpYzMIryaDuyX8th3v9SD
 8vqf7reV3s75fLkwQhVjBlNU;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jLiHC-0001mc-Lb
 for samba-technical@lists.samba.org; Tue, 07 Apr 2020 07:04:02 +0000
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.12] Samba 4.12.2
Organization: Samba Team
Message-ID: <ab621ee2-fd12-8418-415b-bf837af744fd@samba.org>
Date: Tue, 7 Apr 2020 09:04:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
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

Samba 4.12.2 is scheduled for Tuesday, May 19 2020.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.12
has been updated accordingly.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

