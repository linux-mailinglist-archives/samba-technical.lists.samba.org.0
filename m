Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CF20E22B75A
	for <lists+samba-technical@lfdr.de>; Thu, 23 Jul 2020 22:15:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=iDrGYH7RahRJTCi5jKl5xxz6RlZxIohCf62fhN75OgM=; b=DUYx88AadGRU3y+oY1VXyAb3Tx
	jpPTc1BxaWR+0IPkrBALiVppn8nyjqrRbWMzuoKFmcNFOdtxxZd1Y3wz2JAwj/ie1B+0KE0TG+v+K
	K+Kh9ILKbeC33ef/idQHyX/7zz30aPfy3CHaVzoiIZt36tqyeqfhT/YwIFlbv+yD7DlHntYnMbu9W
	czPmWWXr4yfeCDowTz8yWAGJCR/AeReTcBF8Da93+ET0ZeI4x51zIuWdAiYahs1rWMMQT6kmoA7uD
	LOFLQE6/a0olqlhu0bMB3Mc5iBQcgByZlMBz8SzW+VIJdPIPQeqp0SiHWPl8lcOI9hdf56QXMLiXM
	tYF1Q6Pg==;
Received: from localhost ([::1]:53318 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jyhcw-009ZXh-Lu; Thu, 23 Jul 2020 20:15:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63828) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jyhcq-009ZXa-9K
 for samba-technical@lists.samba.org; Thu, 23 Jul 2020 20:15:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=iDrGYH7RahRJTCi5jKl5xxz6RlZxIohCf62fhN75OgM=; b=YECBU8cZhQet1ENrBYA+UsJNwt
 XvSh/gSkGFmg9wPipSNyGcZ3RXH1KVmDPBBL6SeN37Yun85AORj/a0xC8Jc4rjfcuSmNuSaunh/jR
 sWxDkS3ujL4fn8I2SBNv6oNq/2uTX7R6OouuDcQSx9yguUlI381AjwaWLtk16+HV+TN2AeW2Samns
 h/lIjFuiYEkeQDjxbZHzaoN1+1ED+8ymdKbccLkH+HZoZBZzZ6zX9+j5nxL31Fwt4eNjJX1/5Jegy
 FdkwwtDOq3cORQm9pWtVig1JcxdZU9/WF3n0UAuV+02EWgzAQr4ll7d4JEj6UG+QOoPsYONSw71ND
 Kk5qPMeHInpY1qsffzf7+5v6mygG7Ei1WdortHQw8fHc8pLOuZVSPWwqRx5wWZAvoquYHRE0/1dnx
 c/jm5Sxs4RvICNwxLW8MPzMnknDn5dpp0K0/tMNM3OpUyKE/vTztd6EnpREkV1S24j3nq2e7dtmUb
 HD8bRb+fVK779sPULwGcsiiM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jyhcp-0000Pt-4V; Thu, 23 Jul 2020 20:15:31 +0000
Message-ID: <6f85bf165b32005113ebb1b59f7f253031187f78.camel@samba.org>
Subject: Re: Samba 4.12.5 Windows AD 2012R2 integration
To: Izzet =?UTF-8?Q?Ayd=C4=B1n?= <izzet.aydin@pardus.org.tr>, 
 samba-technical@lists.samba.org
Date: Fri, 24 Jul 2020 08:15:27 +1200
In-Reply-To: <94a49801-479f-6693-b6c5-603697c798a5@pardus.org.tr>
References: <94a49801-479f-6693-b6c5-603697c798a5@pardus.org.tr>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2020-07-23 at 22:49 +0300, Izzet Aydın via samba-technical
wrote:
> We want to show to a customer possibility of using Samba instead of 
> Windows AD, therefore first we need to add a samba dc beside windows 
> 2012 dc.
> 

I think a better approach would be to create a Samba LAB domain
https://wiki.samba.org/index.php/Create_a_samba_lab-domain

This will allow you to demonstrate that without changing the production
domain.  Hopefully this will bypass that check, as we won't be creating
domain controller objects in the target domain.

If it fails, it will then be on the Samba side and we can patch around
that.

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




