Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6CC718738
	for <lists+samba-technical@lfdr.de>; Wed, 31 May 2023 18:21:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=fg+B6xJ6ZOBEWJaaTJpT//WtIAjEWnjJJr7/qFHTQh4=; b=MA3daNenUgEWUkCgJ36/fkQDDs
	eFSJ/JfVskoamnqTJLwkh/LbrEHZLpS7jleoCoyxn1IgjwTxgvss0tsFI4o8wT+pdy5TbakSfmE5g
	qXoDZxzE+kCuhQxDIdre2y9QvpJs5CNYxTIHYiPVR6G5s9t7pNJqw8wuwezTd9wyAUoW5ejp9cCGP
	WRoLwT71C7GiNGIwJBniTqJ8Rov4WixdyROXjOyEJCBpzEGZiSCu17efxSTz1fmrHAJN7XUivjSQL
	IkalqVuYTehGxuCq+SVnPcb14VvXOHUxafBqhcexgvbfFzjw017pm+QvxTFBbA74a360TZACbF2BZ
	bMJvb/Aw==;
Received: from ip6-localhost ([::1]:36584 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q4OZe-00Dg6g-BM; Wed, 31 May 2023 16:21:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28734) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q4OZZ-00Dg5q-ID
 for samba-technical@lists.samba.org; Wed, 31 May 2023 16:21:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=fg+B6xJ6ZOBEWJaaTJpT//WtIAjEWnjJJr7/qFHTQh4=; b=d5JmplvPZCBey+Sl5x8IgXuS0q
 B1RNH6EMEqwfmCoOM5QQaSxFrG9ZxDNIic6lIffzniQ/NKB4r+0xMMUjuWa64XyR7caXWIRgbDWpE
 FwiSlSZUinBVbd10SXB+/TadyCN7TAj8pDBP0dM01hjF3idf8cAqh3urEGimUYlWsq/vu1ckiEZy6
 Uv4S85/bhyuPwtexDJVOeizORc0hA+ERSfAnZvkDVbmmEUaMsyybYNUdg8No+keolXjh4jkdHtPDG
 RjNEstw676ru1V5F8J8C2J51JU5IHGD60lRpexlxeyAz2g++S6Ce5DDahad4R9MehZS5VaxCwUgtF
 HujI0pOzkzTwmX4oRUQPPKLJNJqEckE8kNv+5DY4LLglsium6Fk1Q96w/+jfITFbIWevthgXNluxv
 zmdr0KCKmbyYPz5XGFwC25df/qJIlps6q/U3hlcS/zzFwWJg0yFRkbQWlhX07jXwiqewPcvKnWPwQ
 MLs8aFKyEAaASfClw0P1meqT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1q4OZY-000tG1-1n for samba-technical@lists.samba.org;
 Wed, 31 May 2023 16:21:16 +0000
Message-ID: <486dd9f6-805c-60ef-0f24-7d138c350c9a@samba.org>
Date: Wed, 31 May 2023 18:21:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.18] Samba 4.18.4
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.18.4 is scheduled for Wednesday, July 12 2023.


https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.18
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  https://samba.org
SerNet Samba Team           sernet.de


