Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 923CB6A6CBD
	for <lists+samba-technical@lfdr.de>; Wed,  1 Mar 2023 14:02:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Lzb4P78GfboTrm4SGWmokupR9SYgSDf7uvQUwZxZnl8=; b=Im9/qhN1yXlKDWsPS7oIYGrwuk
	Exi7V5/UIu/rp+VFVAxzF8rT9a+fCyijuSODKXS8jZsp3FArJt3uVCvmiGyetRkEwHgTgXl6kuGDA
	ZB0O8UX6nO5xJapWLyoq020QhU74eGxEROyBmsvpEU6CTU9xaq8fdQDcqE769qqJ3gKSDki71JXzm
	gnhuPIx6OZQhYoQCpEgWew7BTa6xWYJrMH8skrk2guIFVfuyg87wgh8gfA8717fJxopgyM/uO1hko
	4GOKwv74lh/7FzDCnBaKTOlsHltS+R+APey0E127ce3a+ff34NozKCkO6H5OIc6FE+gh7DH+PDXyt
	+RUpG+hA==;
Received: from ip6-localhost ([::1]:38248 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pXM64-00GaRc-16; Wed, 01 Mar 2023 13:02:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26786) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pXM5w-00GaJ5-8d
 for samba-technical@lists.samba.org; Wed, 01 Mar 2023 13:02:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=To:From:Date:Message-ID:CC;
 bh=Lzb4P78GfboTrm4SGWmokupR9SYgSDf7uvQUwZxZnl8=; b=AE9USaAqAOyQGY3rR5/T+P1ws0
 xBy8WW15ZXysg7Fko+7hPXhMS4Niw/W8A73OLAISKp0Hpyq6TQg3tHiV95lMCP8wyM8VE7e4pgKjZ
 7PQc9NxcIWzkS+MXF5uC186lvVq32pptjN/WmCw3Sgg/z07pUMe3TQHu4VQXQzBVwk2UzEbbUK7Th
 31NymNj8n/t6zLGtq54GIk7I9DZDBKSvCmsftPJIDdI0iaWBGqlkJ+AX6Z3sgSjl2cczlFe6CGrnK
 Xh/2ps+h5bG2UNUOzlMKdpCe2OePhgtW5by9IYmN2JNmk5y1CFofUFLd9bEThTYOf4ToWdbZuBQKq
 pltx6hIYBp6XKOiYQg8iiOVr7cmi1THE7gqyd5hCEg6TR0FxoigR3EvtURVjAahI+h3qIqUBf86ga
 qfoLUmEBREpWpKrMPIX4SQwUbjxIzpf2RIXfotnzO7P4Bgdb1a+xDqb00QyTkyRxztffiZw1HJ266
 GSmNZ7eVp4uxl0KGJxGk2GQD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pXM5v-00HCHF-Rs
 for samba-technical@lists.samba.org; Wed, 01 Mar 2023 13:02:07 +0000
Message-ID: <d2d857fa-a6c5-8134-0b8d-3e809deb42be@samba.org>
Date: Wed, 1 Mar 2023 14:02:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: de-DE, en-US
Subject: [Release Planning 4.18] Samba 4.18.0
To: samba-technical@lists.samba.org
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

Samba 4.18.0 is scheduled for Wednesday, March 8 2023.


https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.18
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  https://samba.org
SerNet Samba Team           https://sernet.de


