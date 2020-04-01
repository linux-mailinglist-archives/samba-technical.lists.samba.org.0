Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 112C019A4B0
	for <lists+samba-technical@lfdr.de>; Wed,  1 Apr 2020 07:23:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=wgh4ViwHIAayP/tZSkPpkZ5qdXZi2hEcbuJUeK0E8U4=; b=glVazkamWhkvIirn9ANKeyeygB
	3W//yxVojdFzLSOXswizCgvQ237cF/16ONgjaYAzVt0y+OEaNBsYn9Z/XKWR0/+cQxxuwcSyDJ3rf
	/qIo/5PVBzJ/5a/Zyy16Qyhqw/7nteFX7eozxr9TqvIVotD1R/s6WnT7MzxoYWivNDOD30UbjyBJe
	RZeFRjxpw5cFtHODB7OExBWrrZbdqAELkMp5GqgDXJXWNNvwrEp7JUeI9vOvtWwXNbCgF1fFqSRht
	OyWp6dwO5AdxR+ha5C2RWSNfeDAU/cARk6PbjPbdAcUgg+VQHSO6Fues36bdKJU6tFiz8IaNb9jdF
	roRVGKGQ==;
Received: from localhost ([::1]:61478 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jJVpt-002x0f-5I; Wed, 01 Apr 2020 05:22:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12112) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jJVpo-002x0Y-2W
 for samba-technical@lists.samba.org; Wed, 01 Apr 2020 05:22:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=wgh4ViwHIAayP/tZSkPpkZ5qdXZi2hEcbuJUeK0E8U4=; b=Y9ReV5uI21v1PjBwVY+pNJ0aLF
 dWMtQ9QFq9qi/tcNo+7jsHkrnln17EAUZA1xE6jdNeJQYhPQlDPur+0NikyQ2ig3S4s7bgkg/TRni
 boMv4DRoorowyM3Vi2vcivv7fEGNFbnXdt3x84xl4twSiqflOUyk8BaZ3gDBWG6clmn0r2eDlAwwE
 rcDKKkX1dKIMrfyQ+pXjcfzq9dmpCYBaWrIqWh+t45nq55/djbpqPgcsevWJwM/fQcEbcIaRqMrLb
 ig1JxkuYAnPJUDgAJX/dstFYlp8QRu1KdSJLuV7aKMWqd2RtJD1Vvueew0EuIc24lN8LDiyEL0d8i
 wv/6O4MRRT/L5bHNJplwOkOAaoYXlQN/STZmocPMGAYNB5XNBygZNPdjhahis9sisoC+xbfmECoBQ
 UqaNoZ4Dasfu0SR8+G/9MDakH10XLGxg6UNt1EcMmo1AOhxDegsw0orC61OFpRObSojOfhV3xMOBF
 nfm0t/5Y65h3FNZNSuAbmrdf;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jJVpm-00037O-1N
 for samba-technical@lists.samba.org; Wed, 01 Apr 2020 05:22:38 +0000
Message-ID: <ff467d0c1bca19cb97d0668beb144888a21860e7.camel@samba.org>
Subject: GitLab CI outage
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Wed, 01 Apr 2020 18:22:34 +1300
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

G'Day folks,

Rackspace have again removed the disc image we boot our GitLab runners
from so I need to rebuild.  This is fully automated but will take up to
a couple of hours.

Apr 01 05:12:58 gitlab-runner-rackspace-0223 gitlab-runner[13699]:
ERROR: {"forbidden": {"message": "Not allowed to boot from requested
image", "code": 403}}  driver=rackspace name=runner-lmzam-uz-1585717
Apr 01 05:12:58 gitlab-runner-rackspace-0223 gitlab-runner[13699]:
ERROR: {"forbidden": {"message": "Not allowed to boot from requested
image", "code": 403}}  driver=rackspace name=runner-lmzam-uz-1585717

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




