Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27540188A4
	for <lists+samba-technical@lfdr.de>; Thu,  9 May 2019 13:06:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=HN2oouAk9p49E0qL6kff559MHkCEaGezxXoBWfq5RXI=; b=fqIFZolgiEBwhiIyQEiAT2v5Wg
	y3cPIDnRevK6lDf09DneLPVF2b3K9b+kTZGaDYdZ5WaQgI65PU0dkZUM4dSggdoTeKCxrj3jFzSsE
	QGAJSUsywkPE5lojy11qAvm9/D007v7FOGrlUThg/AXpNbAZVxYyBICvuOyJxCw47XZmYu3DHGi2t
	GyOjL3hVTh6v0J8V7ugIpf4Pr5zg7YIdB6yxDeknI6BUc7+/cMzpMybTpK8bMdc6UKZn0xLBd7p2j
	ebqfn8hAf6PTrsQYo8MqsFQSL6Q7HmDAdkuE0sWx8oRO0VsI2PG8nBj1H8QM2kXWYna7t5GJoht8J
	4TSp9HxQ==;
Received: from localhost ([::1]:44562 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hOgrD-0034by-VV; Thu, 09 May 2019 11:05:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:53908) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hOgr5-0034br-As
 for samba-technical@lists.samba.org; Thu, 09 May 2019 11:04:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=HN2oouAk9p49E0qL6kff559MHkCEaGezxXoBWfq5RXI=; b=nXd4Epg9CmdAw19yq4j/5CqVZ2
 POpasWtK7yVoaM5izFnOofDvZMQZreFFNn6GXR4uyHH9YKcVHbm8WOoN7tPb+JnQJTUiRTlyVxUjk
 pnpU6KRkTtgaxd9751ShTbXBRgInHoyZCTrVrNnE0UJdm819UOL2hElODqzfdrVBO/JY=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hOgr2-0005lS-Pe; Thu, 09 May 2019 11:04:49 +0000
Date: Thu, 9 May 2019 13:04:47 +0200
To: Jeremy Allison <jra@samba.org>
Subject: recvfile on streams
Message-ID: <20190509110446.dad2siv6vvosl62z@inti>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
User-Agent: NeoMutt/20180716
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Jeremy,

I've just filed <https://bugzilla.samba.org/show_bug.cgi?id=13938>.

What do you think?

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

