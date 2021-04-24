Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BC0369EF4
	for <lists+samba-technical@lfdr.de>; Sat, 24 Apr 2021 07:31:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=M/c+cFMpqmLW2jMSBvl6FEIqxh0eR8ZlNMNsUXvbE2I=; b=URZRRSJRcKtmy1VrzNjbhOgeBc
	GQXY8tuTUzdFaSvDfw2dKX1ZG+ZvCYsq4ENcJDg1wp4jmQZ5ZSRgMu6HxHQpfAJBNGaepz2MA0x6h
	bnaFBV+3ZbFdJ0z3OtmsuYA0jpOEFNOPDYkAtmKxrSO+zQAF2XOVcI/8/1g1G7NenqxhXKDVOCqrv
	xU3c/eRv03e03HICbAVk2Wcd2LVPoEIJyH8eD96g/qJ27au6Ryv3gh6OGMFnMkAidPlz/M0JlKdoU
	OmFWA1S1lgGvAavayF1TN6Vb4u4gks/58cVL6eXifszQbrw5Ogk9myzQb8eHdaELpt7wieKL1bwK1
	RyBhFBvA==;
Received: from ip6-localhost ([::1]:27156 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1laAsD-00CIbX-Na; Sat, 24 Apr 2021 05:30:33 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:41742) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1laAs7-00CIbO-6s
 for samba-technical@lists.samba.org; Sat, 24 Apr 2021 05:30:30 +0000
Received: from [192.168.43.151] (unknown [118.149.78.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 5F8CA808B2
 for <samba-technical@lists.samba.org>; Sat, 24 Apr 2021 17:30:11 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1619242212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=M/c+cFMpqmLW2jMSBvl6FEIqxh0eR8ZlNMNsUXvbE2I=;
 b=nAtmZhPu9r/W7jE7lF8a0hBTLb/FkJQUvXQZxUnviAFJudNGozuzCIlNvesWSsP6Qnff+t
 7G73NHgk1QOMt6TKlPq73KuuJHN4YxXiTxdRj6rm1hTt7NQySvVMuV/Cex+Hi/JQL/yJ0S
 ROo5C5uMXUyvdP5Ye1iWJYOaZbBQw+iJCPsyxJH79QDNfROzpS5bFresBwadkpluh2NfBY
 Ds+1+389YhEq3fetKMazGbd9b43NAYyKb97bfk5M1gUoeoBmMyHHqZuaNCl5wrLVKyo+FV
 JxKZ+bbXJqoIVHpo9WKYAzc0tvIbJq/ZxJn7qMEw6YI/9csnxQyJ8Lbqaeeh0Q==
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Drop Bind 9.8, 9.9 DLZ support -- too soon?
Message-ID: <57be70ea-e109-595f-ad9a-f28eead330d9@catalyst.net.nz>
Date: Sat, 24 Apr 2021 17:30:10 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.10 / 15.00]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 MIME_GOOD(-0.10)[text/plain]; MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:23655, ipnet:118.149.78.0/23, country:NZ];
 MID_RHS_MATCH_FROM(0.00)[]
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=douglasb@catalyst.net.nz
 smtp.mailfrom=douglas.bagnall@catalyst.net.nz
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I wrote some patches that remove support for Bind versions < 9.10:

https://gitlab.com/samba-team/samba/-/merge_requests/1924

because the API changed, they went EOL years ago, and there are dozens of
lines of ifdefs that bring no pleasure to anyone.

But now I am having second thoughts. Things like RHEL7 are going to be
around for a while, and it seems like they might still have a Bind 9.9, at
least nominally.

In any case, please review the *first* patch there, which updates the
tests to use the new API.

Douglas

