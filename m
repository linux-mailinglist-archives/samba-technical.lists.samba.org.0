Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A245333756
	for <lists+samba-technical@lfdr.de>; Wed, 10 Mar 2021 09:33:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=X2piDRcbJWvPPye0IA3+gexwiCRixLmo4viqVuByC7s=; b=2GAtMLu1L3AWhd4DouYxjSHrdC
	Wnre/soutFsAKBLbpAlDD2C6ySujVvVB2Gn5M7PprukxGq4Ya0OdgViYt6E6uSlewN52mbqO+pBSp
	doYYFKqK+aROVtPPj92Y3Dc0NDDBoPR+az6/+w7uH6Df8FvoP1Qz1UqNTPluY8oJWzLn7EpwI+MG2
	vsqsmtx4BXQo8qQr/LUa0grb2Ymk/0F3MJ8McTQ4BFbbZZFJwzKtJBz+zhLdOn0WEND7u1dk500I3
	ShdjxGQ/lwOX4m3g3/9eWRA4X9yxp7qcsGP4DN42KYU6c9DnYPPmzTd0vDj7fFwln5UqKH88z3Ds1
	X5YHdELg==;
Received: from ip6-localhost ([::1]:29720 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lJuGN-004jqX-Hq; Wed, 10 Mar 2021 08:32:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53260) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lJuGJ-004jqQ-3K
 for samba-technical@lists.samba.org; Wed, 10 Mar 2021 08:32:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=X2piDRcbJWvPPye0IA3+gexwiCRixLmo4viqVuByC7s=; b=I7aBL7pLPtI9z38uAFDLwF5x7t
 EnoXf16gAECZPYWpzwDj97G4PkncWPPxVHWW36oztdVxUdmfPuL93pSDcl7jBtiOhlm9wnarB9iPz
 yLcba0TKmejxD/qxtBGhbZUr7QAAH+NeUoXEItvHVX93ZKgZof+kojf8DsixTdrf2sDiImbMZh8p5
 xzYBrB2NMfRorWNLqa0xJq8E5a9gteYCpucFs4PhTIvFURCTXn4TVQuFoB77wwziIMhfobsJpSZ0B
 SC1fOOJcDSdj697Ic7Lr7qNbfq6SZy7lwMfBltbtyjZ8u23rTJcELvFQOkP9L916t6L5AFFaEAoMc
 FdGy6HMiyNOfTzqB7tIfieIwJSnvUki1S3IWamP1FrZz96Lw116UccYXsFQcLr9r6l2GeSLefEO4J
 RCmPEyCpK3qUiS79Wgx5n5p332b5wk85OZ8zzm88m96muOwPO0zxpWpb+f8olPWsuACw25yvRSK6A
 nGBOZkqXmzXB2iOqsnl9k8nQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lJuGI-0004Y5-6Z
 for samba-technical@lists.samba.org; Wed, 10 Mar 2021 08:32:10 +0000
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.13/4.14] Samba 4.14.1 and 4.13.6
Organization: Samba Team
Message-ID: <9b499410-8769-33fc-a7d9-c23b6f8b65fe@samba.org>
Date: Wed, 10 Mar 2021 09:32:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

with yesterday's release of Samba 4.14.0,
- Samba 4.13 has been turned into the *maintenance mode* and
- Samba 4.12 into the *security fixes only mode* (there will be a last
  bugfix release tomorrow).
- Samba 4.11 is end of life now.

Samba 4.14.1 is scheduled for Tuesday, April 20 2021.
https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.14
has been updated accordingly.

Samba 4.13.6 is scheduled for Tuesday, May 11 2021.
https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.13
has been updated accordingly.

Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

