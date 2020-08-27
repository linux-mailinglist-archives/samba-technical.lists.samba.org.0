Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BF98A255084
	for <lists+samba-technical@lfdr.de>; Thu, 27 Aug 2020 23:20:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=VNarDLgMindr84ZMqjDpGdFvou8WlauxckV3fJM+Ah0=; b=nL6QdkwTrficPHXWdJ79RkdoB9
	OWoqZvDj/l6t0PIAagVznRfnTUbrgitGAVCs2lu0sWzAISnS7rF7IcqoHzEEgtzie7I+rHbgbX/Z5
	OU2y8WZLUqMoikG0BeuR1ljA/cBcRbVi26CiR9v7bnDy4cpTvHBnlwGIbbKtWgfrKp0SnZSyD2LdC
	n/cX7Q1tqaT/8hlnHdCusvEZcpkNhaZIAqKjJJlMBg1Utgim4pQMUk1D6YCIk33njKeDIwxPoMmSC
	NyEliQ1Bp+V1qfLscLgF4jNpKEkdOvk3/+5aQfgh6wQBaSkS2/aXNwm9cldKGPqsUht+FvNp+CSta
	+W6NxVlA==;
Received: from localhost ([::1]:59582 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kBPJr-0010FW-5Q; Thu, 27 Aug 2020 21:20:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31980) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kBPJl-0010EJ-4l
 for samba-technical@lists.samba.org; Thu, 27 Aug 2020 21:20:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:From:To:CC;
 bh=BO2WL5K2oT3BzXGDs2zodVMkw5sTqoUc0OTdco2QkuE=; b=fgmWhTGGcwu7TMA1p8pMuKTMBf
 J58/m9LpRWgFSiWLDwhdpqZM+ShcBMoTUxlYjmVytqpColGY7QlX6/I8Gu6DPySRHzhn1+jJ2U7tC
 P3F2CULL3BNUXOTvd5WoxnEmtpCNZRNdiGSrdO2FLN2FiYoxbOWNy6GkWM1f4+rf+PgryTuDz8EOt
 mNwsLLOpF2i4VY89DYojrKbbZOrCfCxTdYBzWPCX7SOvWujwwRvQs5G3MYtfTz5C1WxI9Bk+MQIp2
 jLV+Tf4vs8lmdewo645ALX0C0jzekNCmHw9PQ2Ah3hRmpSkJznWR2PiK1EoF1TMuKzloIfafUe0Pg
 K1kLnIgJEq9cFtxxmVGQxz98JyQVQIkJwNunA12aL1aolbeacQphCUOj5F5e8sQ52MGG3qll7U5Ql
 7Eeiong5HXMY5PxOFxv4VOXiovbHDV+cusqlkqS1fso+kDs6cGbe73UwNaxzy4rzVjeA3eGvyXlNQ
 vtFvt6l26EAlrVHpr9yzakep;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kBPJf-0004Ce-Do
 for samba-technical@lists.samba.org; Thu, 27 Aug 2020 21:20:15 +0000
Received: from localhost ([::1] helo=hr3.samba.org)
 by hr3.samba.org with esmtp (Exim 4.92)
 (envelope-from <github@samba.org>) id 1kBPJe-006iXL-Jj
 for samba-technical@lists.samba.org; Thu, 27 Aug 2020 21:20:14 +0000
MIME-Version: 1.0
Subject: Re: [PR PATCH] [Closed]: ctdb_mutex_ceph_rados_helper: fix deadlock
 via lock renewals
To: samba-technical@lists.samba.org
In-Reply-To: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-216@samba.org>
References: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-216@samba.org>
Date: Thu, 27 Aug 2020 21:20:14 +0000
Message-Id: <E1kBPJe-006iXL-Jj@hr3.samba.org>
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

VGhlcmUncyBhIGNsb3NlZCBwdWxsIHJlcXVlc3Qgb24gdGhlIFNhbWJhIFNhbWJhIEdpdGh1YiBy
ZXBvc2l0b3J5CgpjdGRiX211dGV4X2NlcGhfcmFkb3NfaGVscGVyOiBmaXggZGVhZGxvY2sgdmlh
IGxvY2sgcmVuZXdhbHMKaHR0cHM6Ly9naXRodWIuY29tL3NhbWJhLXRlYW0vc2FtYmEvcHVsbC8y
MTYKRGVzY3JpcHRpb246IGZpeCBkZWFkbG9jayB2aWEgbG9jayByZW5ld2Fscy4NCmh0dHBzOi8v
YnVnemlsbGEuc2FtYmEub3JnL3Nob3dfYnVnLmNnaT9pZD0xMzU0MAo=
