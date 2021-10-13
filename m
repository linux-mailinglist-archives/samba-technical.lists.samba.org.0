Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D5542CAA5
	for <lists+samba-technical@lfdr.de>; Wed, 13 Oct 2021 22:05:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=STPhPEhIOBPHQy2Mr4EvZQLGyKVOligtmLQunwJWPRo=; b=ugq0ERvogsRpe7NpVcoRYmhwM9
	/S7A4okK/A1DpCSOAcXTHKXLamyYv5ZlUSNFdljWLv/L+IcugDl0fLaeb7p1qLSy1ubgW2ry2WurF
	r9pZ5qBaAqvnzAE00nhnmG8wCKPBPBxiyYzuAy6MiKJvxi4ZKDW7S/NqtawlL/lBW6uIrWkL4LU87
	8X4SFfkbBUOQpgELR6nSViNNIoIQ0dB8dtRDS17+3lkQM3uK/ILVTsAXJIsaeSxtqLJADRYsuZc4f
	CFsNXb5wWbJ46ELiujXvFyT88ZOxtpQQ1wr1rUo6n7yPPZsM0sGdSf5n2B+19k7dAfakiXkpzDU6E
	mgXHliJQ==;
Received: from ip6-localhost ([::1]:50324 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1makVX-007OgJ-46; Wed, 13 Oct 2021 20:05:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56394) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1makVQ-007Og9-My
 for samba-technical@lists.samba.org; Wed, 13 Oct 2021 20:05:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=STPhPEhIOBPHQy2Mr4EvZQLGyKVOligtmLQunwJWPRo=; b=PBxdEUyf6NyG55dOwUdQSFu7hq
 sXjz18slU2Kmte4uL0t9Thh+r0h6JAJl79UBDZeFNxWqKkmK2FnVYIJgISkZMdnnOwnh0TbxrX8e0
 o1XBXMXlQgLh/ENbLYvxUu84oFwR9LW3zIH+NDHafC80iu50zO8j5+S9mRE7o4lbBo+dWf4oCe6Zg
 JMTt0sKS0Hk20B43NdwMTqrhiWkarpXXMJrILiJdCgZUYx5XZzM/a0pXgZl56ZvnreW9fGw0TGKnm
 7iixEE3Dc6/AeRuqxSyGCWTV0QDq2tyqN/p/EJSdENtGHr+vSFgVKekGYsyhSLFyLBusHoi/KcfY9
 pwhJNAEX7oUGY8hzwjtrJln9ANmf7f4CJHvNTq43DMJZ975dh+/5jYQPRRm8DxJTb+J6lGn3zFdHR
 4nKBRLI3zTsfyPjcAvzTMKAEJD1R8tKpWHUcGLOHga5ldedyrXozWbXrbJwvkLtLZh/brZYdiESI1
 Mp2ibScaSlalxCeUm7bf54Dj;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1makVP-001DPK-KL
 for samba-technical@lists.samba.org; Wed, 13 Oct 2021 20:05:40 +0000
Message-ID: <14627109fc3286b82e9b1c057cd09062b3bab5b5.camel@samba.org>
Subject: GitLab runner updated
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Thu, 14 Oct 2021 09:05:36 +1300
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

I've rebuilt our gitlab runners.  The old rig is 'paused' while I
confirm no more trouble, but this should make 'private' jobs 20mins
faster as the runner VMs were spending the first 20mins installing
updates before they started work.

The updated runners use newer 18.04 images with more software pre-
updated, so will be much faster at the 'preparing docker+machine'
stage.

Let me know any more gremlins you see please.

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


