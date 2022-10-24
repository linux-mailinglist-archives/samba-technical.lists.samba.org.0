Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0292A60A20E
	for <lists+samba-technical@lfdr.de>; Mon, 24 Oct 2022 13:38:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=lXDEJX+Bmt2in7iUJ20Ic8tj1rGjnK528MrHwsbKkQM=; b=amiIKO9wjQQfKaW1IokVvXvYEv
	NqgZ3k9+NsSDz0xd/mQHp0FCe427hERVo0I932kjhKkCCPf+vnQMvKHTtsXOkBTO3bR6y/swaXKI8
	pbXNnGbb5BHuZKRxFRSuTkb9dMZcIiI4neRa4ZNUvnmtd9329u9j6/zjpRrArymUoZntEGmUAKV25
	8rLK1veUzd2qYzXSlrQNwEQ/zpTntSr+vlmhr1R9f819KLDxyD+7cpkdddYWiazq0EWvCuNBCDcPw
	q7hUP9S1RmZsfY1DDDJQ69Oszyzrel3sFh3dmbyyVlM2i+yp5J5FQu6odFql/QNRisASGMqpCa0OT
	YjkdaNsg==;
Received: from ip6-localhost ([::1]:60772 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1omvmd-005Jyj-9r; Mon, 24 Oct 2022 11:38:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42740) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1omvmY-005JyY-1O
 for samba-technical@lists.samba.org; Mon, 24 Oct 2022 11:38:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=lxUa6UkwjLpNsibrtP8RqENuyuQ1AimnUQ+5tvA6WIo=; b=ZX7anNOwR73uM24xbX5Q4UrTvY
 cH1imzoP/Ge2pbZY8+CsZVDHxmokImLgILYOlP/uFqBu+lqyvZwxylCLjLrKfvBjEj2jHTN6S6XN0
 oIZdomCmxQ4oZelxEGfQAmXgn3a+N22KZJhDp0as+CJew3+t4n8qfqzzSVRkRNNp5JWQfuycdLbOF
 ebw/RLKmsgFCroEIGiEzrPopAYz/ywjGEn5IyL/x09qOSsrFQF/u93TMwNRNwHKuSEKitnggzBiwk
 jsyt2RERJo39C0WtYpJFla9Vyj0Tq9bWuNHmt9nCs3/mGUeRPZXwDJw2fiGxw9WIYi3p4RfYwPHA7
 8pp8ttGLCcAEI8te9ebj2alT/HDbwHqEW+GGDRMdkyprR/oxhRkWR4PLJk4T2dZ1l4INNBH5kXmpC
 mLZSaeIu4+WidarEaACT53UgA96XICx37fGuSFNW7kXBmTX4LI9vmpBIFnUBj6cJaknBeiRTrHhSA
 la9jcchBSLOdo8kvaQ++hWr1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1omvmX-005WQ2-2v
 for samba-technical@lists.samba.org; Mon, 24 Oct 2022 11:38:13 +0000
Message-ID: <8008015e-90e4-1db9-202c-8f3d6582e46c@samba.org>
Date: Mon, 24 Oct 2022 13:38:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: samba-technical@lists.samba.org
Subject: [ANNOUNCE] priv_wrapper initial release 1.0.0 ready for download
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: =?utf-8?q?Pavel_Filipensk=C3=BD_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Pavel_Filipensk=c3=bd?= <pfilipensky@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

The new priv_wrapper library  (version 1.0.0)  is released today.

It can be used to disable resource limits and other privilege dropping 
(allows to disable chroot, prctl, pledge and setrlmit system calls.)

Home page:

https://cwrap.org/priv_wrapper.html

Download link:

https://download.samba.org/pub/cwrap


Thanks to Pavel Filipenský, Nikos Mavrogiannopoulos and Andreas Schneider.


Best regards,
Pavel Filipenský
