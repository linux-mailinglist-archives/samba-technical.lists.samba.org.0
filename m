Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 507DBB4A3F
	for <lists+samba-technical@lfdr.de>; Tue, 17 Sep 2019 11:20:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=9QLJH4ndFFHLqPYvdwheNhSmNzvpNpPi7eNPQCTE77w=; b=QW8st7S51fI5PQ726JkjjfRNv9
	6LedoPsgQ2S8dmmPt8Rpc70ORLhUamtGCx/yRE386ibJ3XthbyBOX3Jto5Txft7+O5Mjih8V3mBmL
	aSo5wZ1vKnph13Ab7uJdmIiwI2Gq2ue7m43VxU+R3K33jpfZuU+2BrrsHz8zNK3vsEZXfSn739ul3
	NMdGad8vNgXdijVTFiYFmjs5C3DJdU7ka5RTB8RKaOt1iV7k5er7LrtH5GgWDKVuylDmWQUrDVRB1
	oryUUwYxpE98barjJ261mcRvmMvnAsBjOns0d2RACFp1v/7XgKMFPR8B17Rg1agTuUKIYAWCIBZjO
	AuJbNNKg==;
Received: from localhost ([::1]:26256 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iA9eO-006AM3-ES; Tue, 17 Sep 2019 09:19:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56178) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iA9eJ-006ALw-Go
 for samba-technical@lists.samba.org; Tue, 17 Sep 2019 09:19:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=9QLJH4ndFFHLqPYvdwheNhSmNzvpNpPi7eNPQCTE77w=; b=hDqHUqMMKSkB2A9wyI8mHgCz/2
 LeYU9D+WRtHBLqd5K/rR/H8ze1086UJ32nB5+sR2Kzt4aV0MyiszXVgifAnAhNwUfB2UFOzLgYVeY
 Su1nQhzDIyS9LSv8wyJ4ZOyHfx/+owIE9mNj4ZHhabKTNLTYlIoMSFOFui3Xmcidklvg=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iA9eJ-0001oj-AK
 for samba-technical@lists.samba.org; Tue, 17 Sep 2019 09:19:51 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: [Release Planning]
Openpgp: preference=signencrypt
Organization: Samba Team
Message-ID: <886b0e4f-3392-5a94-1a00-0354e5c6a2bd@samba.org>
Date: Tue, 17 Sep 2019 11:19:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

with today's release of Samba 4.11.0,
- the Samba 4.10 release series has been turned into the maintenance mode,
- the Samba 4.9 releases series has been turned into the security fixes
only mode and
- the Samba 4.8 release series has been marked end of life.

For more details on Samba's release planning and the meaning of the
different modes, please see

  https://wiki.samba.org/index.php/Samba_Release_Planning

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

