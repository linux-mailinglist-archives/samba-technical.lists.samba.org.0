Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD1320A643
	for <lists+samba-technical@lfdr.de>; Thu, 25 Jun 2020 21:59:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=yReZgJXeQqIC8MkX8Ji1G2INERKufi9vkLefKHj8kDU=; b=X2SIWIX8cyoUlWfPN0Fhebx6Wr
	0CXeV8BGHT4sFs8uhw9F26cCfB4XsZPNYynPht8yyAb3O6OcJJhI31TT71OEl1kkHrv4fb5mw8sLL
	PoOQOS8zpbHBm75C/cZc54EVg1xJnO/iG1pbPFzEgXSEmJnKS//LoenowVoSLcF+DLBXvigMgjD/D
	OohFfJLINl6FDnpQn+OzxxoxuS/265Qn+9cM9tP67yjVUvG+g3uidqo8skC3+LZs8JGF3x+BATya9
	07ZfgGu2re4NQxNoWTshJYck7K3eKbDhj1lUZtjbP00K3SXiK6LWpMgFZKoU6vRryrrhpjShkrUVY
	GCvwR/bA==;
Received: from localhost ([::1]:36660 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1joY13-002J3j-0T; Thu, 25 Jun 2020 19:58:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33962) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1joY0s-002J3I-GR; Thu, 25 Jun 2020 19:58:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=yReZgJXeQqIC8MkX8Ji1G2INERKufi9vkLefKHj8kDU=; b=B9+Ek4KPdmJ07byI+15cMOEM2s
 TXvRkZRulSDESOAZ0naM9LDH8fgruCO0tPNnh1U+7LDLUCLGf1X9DEs79GCkyoiLVDogWNZbNjxlU
 q2jshCnhnASCihBEAcG4M0L8HgVXO3v4KSQrlrbMr7tyuXHXqZ7kje2RmJoD6u4EpXNEQTj0pUbR4
 7D03afmQMS/pbYJ+EQoK6zFY6o/BlfhWwuGbippm7/jrKYpi163shtxy2uJ5l0aQAk5cDAnKk1INI
 qtCLDfzu51pq5g7afQT1hMsUUOWbVwRLAVUtk3YhLrm7x4bRqVCNl/LdqpuJcNyX06HpHhHlZKxpy
 vAVVD3DYMxjvG8wXQTopgM+G3vaBg3+5wGZOB6e+USapnq/GD2g3hY7CAze9e0gkzC4h38M42SdaK
 g031zDInzZfrRQ9BdyC/0DDEiHapUCvp72ueImJXZ4LyfJKvrnbb7BcpG+txOxA7YOdVbxh89cmbD
 xav6IG4PG8ImxNi5C26vzyNo;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1joY0q-0005mE-TY; Thu, 25 Jun 2020 19:58:21 +0000
Message-ID: <bf6f2a89ad649de64d8ffd4e8ca97aab71eee68b.camel@samba.org>
Subject: Heads-up: Security Releases ahead!
To: samba-announce@lists.samba.org
Date: Fri, 26 Jun 2020 07:58:16 +1200
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: samba@lists.samba.org,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

This is a heads-up that there will be Samba security updates on
Thursday, July 2 2020. Please make sure that your Samba
servers will be updated soon after the release!

Impacted components:
 - AD DC (CVSS 7.5, Medium)
 - File server (CVSS 7.5, Medium)

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




