Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B94034848D
	for <lists+samba-technical@lfdr.de>; Wed, 24 Mar 2021 23:24:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=qRY2CbqV1C6Fo/K+KgolnOS3r3ePr+/rx4K7XCMCP2Q=; b=dh2YCUVE5fBwBCFmt+TDoxFw/l
	1q5U0bMN/qZhwq6HzkGiH2noaRrLxYwIm1bJZodsL+O4Egni7tvsfqjwFIZtqP5vZt6y74QnmSM9N
	rQ2i8zNVmU3qdfnF7BvHnQTiv43L71ZIWnb2Hg3lSOoiQaaCrsI3KpXbU5NNTt9+xtm64fPWmlog4
	7AAu1zlvWXj4mpXV4mrmpVgQ9XC4LnDpXUdtCRpGWJ7XiMf69i+WXfAwm42PnCg8MMCHWA6IYyfnj
	4/a3KgvlbzhpoVISvkWnTT1nTUAIBiz80tO1FLLE2mMjPbTb/QBYpqMO/WTxMENSfvh5NVbGW2CWw
	BTTNjcbw==;
Received: from ip6-localhost ([::1]:62184 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lPBvh-006fsi-Gz; Wed, 24 Mar 2021 22:24:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63348) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lPBvc-006fsb-Ax
 for samba-technical@lists.samba.org; Wed, 24 Mar 2021 22:24:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=qRY2CbqV1C6Fo/K+KgolnOS3r3ePr+/rx4K7XCMCP2Q=; b=Vd1c4bVFvytJhXGULNjGifueyY
 b5IBurAs8LqdXaDh/NzUFKXUqWwghR0c1uKEkOw5rTXl5EMFk6C3IAJx/lrPOy79GO47CzolMs7EP
 iKDNxnIxCLuYwRtK/JBNZigXwWBLOqJJBcGKYFZ3hf2kIhYobxq5MCYlM5WAVYmN8J5WgKzvKXiqj
 ipv89cNVbgSus1TlYxo6ipWG+JnGldkuCN/z/qN8R4K5uEa39GIsIGpsS9VfrlXW689fyD5zQAi8Y
 u2SjZA2Cjud9DauvhtFO0z1Qqh5AYaGkQgZ41l1U1/pSbyqL8SL64CK1lVwJpFYAyTU3XAjoq3b3+
 X0iHFUypDIMsTH0tXzrWGNA7Kv4OujGUXJlOW/LdyQIdwqxvXOo2OltOZiN2YnPJBPAYhiPwrPkB6
 e+jj19XifxMFJHopUjaa8NF+VrBE838IRgbuPvolffbpXGXmPFVAnw3Rko5e4VUyVumNmSg417yKK
 sbiRxiofvAcfZBfsohQg6Zaq;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lPBva-0000s4-SP; Wed, 24 Mar 2021 22:24:39 +0000
Message-ID: <aaf1bedfbba1dde583281c86eaff5f73d8008318.camel@samba.org>
Subject: New Samba Developer: Joseph Sutton
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Thu, 25 Mar 2021 11:24:35 +1300
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
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
Cc: Joseph Sutton <josephsutton@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

G'Day all,

I wanted to introduce Joseph Sutton, who a number of you will have
already noticed has been working in some Samba bugs around the AD DC so
far.

Joseph has joined my team here at Catalyst and I hope you will all make
him welcome in Samba development also.

I've been trying to triage our outstanding issues a little (so much so
that it told me 'too many requests!') and so you will have noticed I've
assigned a few to Joseph to chew over as he learns the art and science
of Samba development.

I'm not promising anything, but if you have a long-standing but small
issue you think would be a good introduction to Samba development
please let us know. 

(Please be kind). 

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions






