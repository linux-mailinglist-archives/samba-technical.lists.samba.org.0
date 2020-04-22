Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4241B34E8
	for <lists+samba-technical@lfdr.de>; Wed, 22 Apr 2020 04:15:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=tpw6c0zRUjlus/vlCBIubfLkII0yrhxv+srR3hoCQAI=; b=ZUpUe3TyY8RVwuZTo4A99/1L12
	nKdqw7r/9wGM0HhM4rziqmrso3eCdfL8hXnBXJzjeqYIypy24cY0s8FE6046z8TtKhO0TU1q9LDBj
	u9KcY1YP23m7GYAtRcWnjjNWbo/OW78r8BAYw13VHEJAK/tJztiiM3a2VMsuxvqydPnhyzaKasuG6
	YKWFMBIq5L5UUrbKuGJNvUST35wjn0owYarIOyzWSdQh0WLXLmdea0LlWl1qw5D1VfCYflXnUP59p
	d61lfcGkCe3Xwrq+6qWsWz5Ks9EUKK3DB1Cp/X9QfYaFAZLKzvjeODtI45TdO7owAovE5EHUBFddZ
	8NtSCX8Q==;
Received: from localhost ([::1]:48096 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jR4uN-001RiJ-SH; Wed, 22 Apr 2020 02:14:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17160) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jR4uH-001RiB-HK
 for samba-technical@lists.samba.org; Wed, 22 Apr 2020 02:14:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:From:To:CC;
 bh=jpXfGYvT6oxm/2dk20ZPgyTWy5dUlxk5N7GnXf796O0=; b=FlemYP4GZch8En/TyS3g7JhUZp
 B6JyIx8+1YHcpn086Ea5DPdqk+HN95k9bXEs0Zul53ZFZL5EwFjA9InZ9f/hczXcftTkFsEJRiNS9
 TkGRsGcfgkiAm/filgg7il2NCnKa0aJlDDhD0xi3JRgDgKUAYupGFqd3aiMq5Tq4N3pThIiDW8hPc
 10onNa30vzyaGxuV899mnpNydaMhGYrl8s+lpvSovLb9NpJHYyS9jkHnnMT4PZCQW8rmxqko6PEZD
 Mfkte5JjGvyxtaDKRj80NRMwQadxpz0vyHWDJlIlOCq8xTp5fcrDY9KpJsiHxkm9lvP8WPTqDJWEJ
 LvAKR8lmjHm9fA5+IMAlCk2jdsJGwU6c0qgUBMs5osSMTA/fg2y2+e+AUa0peuVxgxOZGby+V59qR
 S1wI2lnbjGjEV3HYP/4zzNSMicjo9aPQmRX12LvjUhKL5bLy2jMYt2stpn0bbirF9To2tI4IoeoEx
 GTCIqTivzGxE962TdhOyMKSI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jR4uH-0007WN-3J
 for samba-technical@lists.samba.org; Wed, 22 Apr 2020 02:14:33 +0000
Received: from localhost ([::1] helo=hr3.samba.org)
 by hr3.samba.org with esmtp (Exim 4.92)
 (envelope-from <github@samba.org>) id 1jR4uG-001Fv6-Rh
 for samba-technical@lists.samba.org; Wed, 22 Apr 2020 02:14:32 +0000
MIME-Version: 1.0
Subject: Re: Update nfs-ganesha-callout
To: samba-technical@lists.samba.org
In-Reply-To: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-218@samba.org>
References: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-218@samba.org>
Date: Wed, 22 Apr 2020 02:14:32 +0000
Message-Id: <E1jR4uG-001Fv6-Rh@hr3.samba.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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
From: Github bot account via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: github@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

TmV3IGNvbW1lbnQgYnkgYWJhcnRsZXQgb24gU2FtYmEgR2l0aHViIHJlcG9zaXRvcnkKCmh0dHBz
Oi8vZ2l0aHViLmNvbS9zYW1iYS10ZWFtL3NhbWJhL3B1bGwvMjE4I2lzc3VlY29tbWVudC02MTc1
MDYwNDQKQ29tbWVudDoKTW92ZWQgdG8gaHR0cHM6Ly9naXRsYWIuY29tL3NhbWJhLXRlYW0vc2Ft
YmEvLS9tZXJnZV9yZXF1ZXN0cy8xMjg3Cg==
