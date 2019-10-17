Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B7205DAAB8
	for <lists+samba-technical@lfdr.de>; Thu, 17 Oct 2019 13:00:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=KQ6F32DB2yxwLkwpBPlzz+Xp0Pa5DBTR4TZjcUa944s=; b=VXE/K/9FYbbCU6+2V+oNlJ7qQj
	khRTUpQf1yvZCK9vWi8HhP/HyeBp9UVWIHiLtrBMcj0tdJ2rfPtm5q8dnepKVzh1HaKoCcFGYE/Yy
	QOVbPQ2CyDnm5mZszv1+AbPcjRUNqTA3BSaDEhCye4yBrX0XOoSWb+Zba9GdrgXHnXsOL5r3Nx0N9
	mK1dcjdVyewGLXM/ASfs+qkespb2ABMCArMzmz4UGo/EOjA7QHhBcFOjk+DVRoBQt5ORqr83wtS8n
	BoYKYcd1UMQbzzJVAaANnJK1EW1R8u7bS1CqAW38qHtGsb4uO5z/MnmkuuOcawMmqayP6u8fYIIZV
	IuAN3jMA==;
Received: from localhost ([::1]:35538 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iL3Vk-00017o-CI; Thu, 17 Oct 2019 11:00:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29254) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iL3Vf-00016k-IG
 for samba-technical@lists.samba.org; Thu, 17 Oct 2019 11:00:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=KQ6F32DB2yxwLkwpBPlzz+Xp0Pa5DBTR4TZjcUa944s=; b=m6gztoVbe1DBr+MIUHfoE55w9c
 5QMuGBe1NfVySraJsfGQBKqvnIbYzKl6b/N6Hof0P9WQ5d6J2mE12WWu3plkLKcfWWeoJjhk6Rexn
 0/5/nufslXob09aBvm5p4/aakeBtV7VYR5oCvMeU/RBsk3NUzbqJL7fDhP6VXr3Pe/6bbkaqIoaVM
 O+7p7RLYegC8WYqcimo9W93CeQPlIasokm7WC8oryTkEpvu36p37uKzrDqFD0s627+9uGVy7Uh2kI
 fpyRn7KuPixy8knuzkzcDQzjuRRP95gQknnGNuct/Vj0yQ1rzti3E4cBN3l5oeqhK/FZH2FOnG0rn
 629pE61IwHcoN1tjPshPyA0kb7bY4h/07YXkdynOvyd2uF2UWmEj4+2raHowHsj6vFBbSxK1knVwx
 VpJ6IHZyP3ym/mSUV7bjZIWyAfVNQRGiX4j9DwTfX7nKy1MgdWZvBYNw+HfUSlX9t+HHhZxDhdchX
 As9BMacCFtomX5mgqb6z2/U3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iL3Vf-0000VJ-9p
 for samba-technical@lists.samba.org; Thu, 17 Oct 2019 10:59:59 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: [Release Planning 4.10] Samba 4.10.10
Openpgp: preference=signencrypt
Organization: Samba Team
Message-ID: <18328a97-7ebb-ae0f-7377-af9d24eb7005@samba.org>
Date: Thu, 17 Oct 2019 12:59:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
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

Samba 4.10.10 is scheduled for Thursday, December 12.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.10
has been updated accordingly.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

