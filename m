Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE41525B73
	for <lists+samba-technical@lfdr.de>; Fri, 13 May 2022 08:23:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=nbHkEuQQpUc/K9mf6ClDrk/Vh4cmEx4BXdOgCCcELWU=; b=ULsu6ZyCyZkw9CF4IBy7Dnt6Ig
	WRiHOQfm25BSDuA2K2ejZb5G5vl+k1HqjKjmV3aA7RW8Nmv6893KxL/6x2PipLE4ze2rvdmnTShSW
	5SppOnVSphIi+G8undQjQA8f6yJpDKBxlr6neS7EReDpwTfsQzZPPbcdM6pSrBEf+cCQsbKlIWUaD
	GpzgofN2hRierjYKeFmVRxzH5EocLV1Zf2NGVmymBjp2SqfTsk1dBF1ZoWeyEjoo74yNgfXk8Gb8K
	WGYZiqmsYukVq4airiMq8RNIRlw8mJwtiNHd6CxONLCzRp6+c7hKvli8aDi0FvdH6QCCixJcoHUNP
	bKzYFoSA==;
Received: from ip6-localhost ([::1]:42888 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1npOh8-0018Qr-2Z; Fri, 13 May 2022 06:22:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61572) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1npOh0-0018Qi-Kv
 for samba-technical@lists.samba.org; Fri, 13 May 2022 06:22:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=nbHkEuQQpUc/K9mf6ClDrk/Vh4cmEx4BXdOgCCcELWU=; b=fffaT/ONg2tBSKa0RuB3zWEB9/
 S0Qct0L4ponEyRwHewsCJgeLg6D/GS6cQmNoYEXLQ1lzKezTgJYDaKLErt3NaFDNodBGmRFBROFpA
 BFHrMXj8RB/ZlY+cpDTt+mTozyf81ZFPwsuCJn6KgZXM9OZtPNv5CmC6nowxJGbzoTJHXe5URTw2w
 FVrGTdv9SNbsxp7hqPgUay3czEqYtdLKZ1k4GM296w315vTIy6z/pHmlcBHvmD8BkK/mj3iMS/X79
 1SxFXKsf516VAkheayik3zUF0iOkE5eDW1URCFJmGoIH0RxMP4TsPJ01kbVQokFNledLBAtm4ZrlM
 lw3GcuQmzc9gqQKENV2gc0T6HYYKk1qiKiXIze9l0hEY2yG7iCx5vKVRy16WCDjMfk9uHYaWBekXW
 9GmvDJPrknFXff/4bNoqg4K61JCttxA19hRV5xzd+wVVfJWgd/NlDTJiof9Z27xlYURX1I+chiTJ9
 coweevMmXch0weNFU0GL+Jxu;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1npOgy-000fWj-HU
 for samba-technical@lists.samba.org; Fri, 13 May 2022 06:22:25 +0000
Message-ID: <527f79427e6de47e8e367596ebf4795dcbb16e36.camel@samba.org>
Subject: A blog about my "Dollar Ticket" attack (Nov 2021 security issue)
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Fri, 13 May 2022 18:22:17 +1200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I wrote up 
https://www.catalyst.net.nz/blog/stay-curious-lessons-doller-ticket-security-issue
to explain a bit of how we got to the big Nov 2021 security issue.

I do want to say again a really big thanks to everyone who stepped up
to help us in the rush up to November last year.

Also, here is the puff-piece we wrote up regarding finding the issue
https://www.catalyst.net.nz/blog/catalyst-samba-team-fixes-critical-microsoft-security-issue

Oh, and one last thing:

https://msrc.microsoft.com/update-guide/vulnerability/CVE-2022-26931

is credited to me.  Fun times!  MS hasn't put as much detail out on
that one, but I'll talk more once that is public. 

Andrew,
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


