Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 020A01583F8
	for <lists+samba-technical@lfdr.de>; Mon, 10 Feb 2020 20:58:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=OzDWtZ8WmSlMfqraDi2jm8rCYDseu+MFtRpulQ7a36s=; b=PbaQhru4vyEbdt4RKFVROB4JqP
	+LHj6lnMrhgprLq3Q3GUkMUe/yBddZXq6y4HBo/v4C5Re7NOgLASbD9B0U5CER2LhpLjeQIrihoQS
	7gFQyTUTZN3BBmcD4B3A5jMCxtxXrlOZVECDK4VyDz/s3Y5s6/H1kaxFS/mkWgetpNPGz9XNwwO+j
	8k4vurKAJOVBeE34JG5qMZjNVH8jmX05aoQA/92isK/fpmpdYgO+ze8WgaIzK73j6lFA5zLLd93Xj
	rKHE+8yX9+TN8oycsYuv2B5Wz3ahTEAiTFqXUY7738UjS0yIkn5o3xyNxgxkCqKzO6aEidiOoAT9l
	6K/+O+MA==;
Received: from localhost ([::1]:22158 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j1FBb-009G1T-Se; Mon, 10 Feb 2020 19:57:39 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:59669) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j1FBW-009G1M-G2
 for samba-technical@lists.samba.org; Mon, 10 Feb 2020 19:57:37 +0000
Received: from intern.SerNet.DE by mail.SerNet.DE with esmtps (Exim 4.92 #3)
 for samba-technical@lists.samba.org
 id 1j1FBT-0003Fu-LB; Mon, 10 Feb 2020 20:57:31 +0100
Received: by intern.sernet.de
 id 1j1FBT-0001lm-IX; Mon, 10 Feb 2020 20:57:31 +0100
To: samba-technical@lists.samba.org
References: <B14B9A04-A84E-4DCB-95BE-E029378E49C6@gmail.com>
 <20171105085753.axk2m5lsdjns6u37@kazak>
 <CALdFvJGSw9WSm9UtAB32Nqgt=4qA_whai15Fo9C6ypspdKQt5A@mail.gmail.com>
 <20171106094708.ku75kutkm3s6i23c@kazak>
 <441FAF42-21F1-444D-BECB-843F2CF4A73A@gmail.com>
Organization: SerNet GmbH
Subject: Re: [Proposal] Remove dns_sd API
Message-ID: <509e99ca-dfed-e09a-1da5-f1b0c1238d5a@sernet.de>
Date: Mon, 10 Feb 2020 20:57:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <441FAF42-21F1-444D-BECB-843F2CF4A73A@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
From: =?utf-8?q?Bj=C3=B6rn_Baumbach_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Bj=c3=b6rn_Baumbach?= <bb@sernet.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi!

now, some years later, nobody requested the dns-sd functionality.

I've created a merge request which removes the code, which is not used
since a lot of years:

https://gitlab.com/samba-team/samba/-/merge_requests/1134

Best regards,
Björn

-- 
SerNet GmbH, Bahnhofsallee 1b, 37081 Göttingen
phone: 0551-370000-0, mailto:kontakt@sernet.de
Gesch.F.: Dr. Johannes Loxen und Reinhild Jung
AG Göttingen: HR-B 2816 - http://www.sernet.de

SerNet Hausmesse - am 12. Februar 2020
im Göttinger "COWORKING" (Pro-Office)
Anmeldung: http://sernet.de/hausmesse

Besuchen Sie die verinice.XP 2020 in Berlin!
Anwenderkonferenz für Informationssicherheit
25.-27. Februar 2020 - im Hotel Radisson Blu
Info & Anmeldung hier: http://veriniceXP.org

