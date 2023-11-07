Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FCD7E3692
	for <lists+samba-technical@lfdr.de>; Tue,  7 Nov 2023 09:25:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=1blmEs+jMsHelxRleCofdqTlbv575+m0BdyhYPq5cM4=; b=5aVt2cqhjq9fmN4lW+7YAf2liC
	gY2ZuQ5x00gWySa818fcefP0E3fUMInf2fWhBa37vJqVRUaRxERPsR1NqDH9G1xLAEp+oml/WNi9Q
	PpLmBSoRBVp/Rr2f5CcJIvkK4py9X2SVOltE4CYIFQR4VKS3B0LAiMZKvf4w4B6VOLDkZH3gX9Yj4
	NtM2Ra9Lk/1OpWN8bgDCLP8ytDc77VifW60fVnUlJYfhTS4ggoxnoQEZY2hlLJZegQfIx2nOULhZs
	OjWWGGwLLWxS2+6FBNMZe7uiQi/HKqG6tizqu3YTxmZJM8q1JkTwxB74nSNNrlS93y6/rJ0amyjnm
	4QVoSGKA==;
Received: from ip6-localhost ([::1]:33060 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r0HOT-006tod-DI; Tue, 07 Nov 2023 08:25:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56870) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r0HOG-006toT-BZ
 for samba-technical@lists.samba.org; Tue, 07 Nov 2023 08:24:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=s/1v+4aWQPoH0hxW+es5NSPmhVqM+NaW0FvVEFxtwmU=; b=YEWMwLuTppCNmVVUNXtHlwEwgF
 9yXaJdIM/52sr7yTDTtrMLcla/b8fnBd52IGiuEiBz29m29FDo0T+VMLa3ABbDjlrACyPXmcwYP5L
 Pc5cgOAXin+UUf2OCyuKigNykoGFyztVwtGm3pqN6i+oDUSF7hemnaR0VqGfIU6cGTru/Gkg5o3TI
 vCRI28Dpjopuzevmqzlqivtc7/OpFK2EG8pFgJ5BkKW1rb5y70OGOvtM6N+6v+kipCbOK7dvlsV3+
 k2/KELAzJZgFJ0Csra9x7TkprjYHw7lXVMWqsY37ASLen1gMqUtTml6mugBTdnPkV6r38rewAhGqQ
 OyuEGiZiM0DeBqXCJx2bhZe1W7C/9pVVwL67a3meT03mpRqkrZ0F+OHPCQJM896EAI4vJYc/NqOMM
 yekQo6ZNLItX7KJfRFMxYhEBBrcJ8RFHa5HDltu48OWanAT88v9/Xtl7SJ1WVXPBO3K3YQ9XO+Ty4
 LN0YLktPlj+EV/Kh2VrerP+s;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r0HOB-004nqU-0n for samba-technical@lists.samba.org;
 Tue, 07 Nov 2023 08:24:48 +0000
Message-ID: <2e3c82031407ccfa2fcd96e4e374903fefebb4e4.camel@samba.org>
Subject: The Evolution of Windows Authentication: Microsoft's plan to end
 NTLM (eventually)
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Tue, 07 Nov 2023 21:24:42 +1300
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is worth a watch: https://www.youtube.com/watch?v=SEtARCtGP0Y

We need to think about getting Samba to implement IAKerb
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead                https://catalyst.net.nz/services/sambaCatalyst.Net Ltd
Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company
Samba Development and Support: https://catalyst.net.nz/services/samba
Catalyst IT - Expert Open Source Solutions
