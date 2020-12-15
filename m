Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9692DAD03
	for <lists+samba-technical@lfdr.de>; Tue, 15 Dec 2020 13:23:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=LC+1w9eDRGuL9k4Ouu+QXaJaiB9FNuCWkXCY0XIpS5I=; b=eH7nc+38Ly+Z2sYKs2d//e4JRh
	+JGwlGWYGdRXD8q9sGPuxoAg473I+lO0Juc3PZR4TxRbw8K2ieNkODbw53UYjgmcqdSzxW8fkaLFj
	fml+hQwMp2dw6BYfdukH+LMQABo4u1S3tUO4DJD8X7dWOiQ96PgCQux5Av+CC+1z/9YOvqLV+9gsa
	9Pn1DbPtJl508n9OhcHGl9GvbRDOM95CWj0jpxnSrVeG+Ogur2ysMqtP0xkqlTVgJwSq9w0yXendx
	3chYsPX91Lo7biPD3+X4AQGLPPimxAoB4waGtcOlH9LEPEA1bUXCxO6jmzL/YShuheEnZ1+QS0jBM
	CEbfrZEA==;
Received: from ip6-localhost ([::1]:21972 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kp9Lq-001Meh-QK; Tue, 15 Dec 2020 12:22:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37984) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kp9Ll-001Mea-VI
 for samba-technical@lists.samba.org; Tue, 15 Dec 2020 12:22:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=LC+1w9eDRGuL9k4Ouu+QXaJaiB9FNuCWkXCY0XIpS5I=; b=EF5sqh8Y/EpcDbmLMrH5inKnvZ
 pksA4GQCkLlUpoIz5ntjlcsTFre2BEqRJEnWok/bxQldIhBh56XXtbrexdKkPATeyA2TdG6VmFwP1
 C/bnePhPa9dRdihCViO5tJtYZC/zREGeXnXyH8Y+6cUOefC4X+LYPeQ8BMvIuSGzwcmKeNhRzKJ7S
 AyLCNkPHsh41ej0IXRfoBHZLTxA4WuckTW4/mXmTJVjlvrg9KrRkKNPd8nRmpnrQFxh6JlbA/U6Gq
 30HKqw9u03Ox+2At5FrACgb1Ljf/JVnJ1NoG5eYFTPQ2bcorlMf7DiJJdqV2x2N+n+/H8EeeULraZ
 vpu/A3vzSOpcrkEYG7MwQplIEEtzAUpeVgM4Qn5FnXIQ3hT+mVKlVm33KrXm/nj0Eqm26JvlX45QI
 +5r1/mdELv5Ivxlb4cpDYBzt7yZBP+rsYyDoxzGT6jKQZJEsGi3ccq720uFuucKkdzdmM9TofGjCw
 JTplwkBuAKKakDoNXxbYdMkR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kp9Lk-00024F-TO
 for samba-technical@lists.samba.org; Tue, 15 Dec 2020 12:22:40 +0000
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.13] Samba 4.13.4
Organization: Samba Team
Message-ID: <dbd6d8f6-3ed0-9f09-90c9-a4bcabb1dda3@samba.org>
Date: Tue, 15 Dec 2020 13:22:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
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

Samba 4.13.4 is scheduled for Tuesday, January 26 2021.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.13
has been updated accordingly.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

