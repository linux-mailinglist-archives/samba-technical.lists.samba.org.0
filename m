Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D27498004
	for <lists+samba-technical@lfdr.de>; Mon, 24 Jan 2022 13:57:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=Kc31jzBg3MgOzWEx7bOENvPP2YlcdI5RncmDpQB4DBo=; b=5F6dLeyr+rnMNKqzEnif1/1ZC/
	7Us4nHW0a15UJJYFbWw+19OYd1uhHJB+Fexh7ocZ8WN/IODjiKxSJ1JO7oZ5j9uHXnoHsdXL/cH2C
	yA71ft/1phQCK55BpD5zaC3AEMQ8S8Lheno7bh/UU3fpkkRjt6/3M8nUFXvih1PjIDES6Dh1T/L4i
	Biy/V3rZEX1yI+uQEosTxjtMJp/FKOPghUJa6AQUb8Q57MIKGJmyzFULBExsx3on0koExDkDF6Ejo
	d3yRpmwCLRnd7kSt33OmJ9Lpm7lQdfi6JxhE9g2SJBznPPOgX2JFKaCJWsth9Xa3antmFHavqWBHC
	PjDGTbGA==;
Received: from ip6-localhost ([::1]:41522 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nByuW-000FWS-5e; Mon, 24 Jan 2022 12:57:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48212) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nByuQ-000FVf-8o
 for samba-technical@lists.samba.org; Mon, 24 Jan 2022 12:57:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=7quSmjlwwc9e3q22KV4P0dkE8F36NllvOVaSiLiTwQA=; b=0oLIOXP1rgjdAczyc0vMBYABxo
 vEh7IojIuwDvJ3sQEAa9zPU+BVuKL1NG6jRFxqs/DaIZ4uA56hobBDAuJothN2FVt43XUT9h1tiyF
 s245Nm4hi4V+/hACsfWsAYBd0F8xaHQim/IJp6lGv3HBLcEOZlNe5S7s+WPL2JtIvcHQxgycwH1RD
 jRhWqcwsylNtjgbRGoHjEFaYtECRDfhvrE6OUi5oYYDlE6dVPT4lc35soPzdbiVX0PIsG5mONfOWm
 PvtvIzJtxQ3U1xzQ6O7Y3VbwXb4HTLDxuTyIKdjty0EzpAGc4k9xoW5+mlybT/AhYv8hia4KE5yn9
 Ch6nFYGaYZJDdRvAFPk+0B6DI/cYNhVidCWQWzxXjjCGS8aMEbJioZuNLKHmmnwqEEADto/YwfbdC
 acow6j5Ucz6lRKZzysj8Ai7g790hx05++T/PDvDdh/+pwhy0bnIca7iaclLvjNC9Fv6oqFZh4hvNQ
 X5S63nCgDW5L7KrD3MViSltn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nByuP-000JeI-V7
 for samba-technical@lists.samba.org; Mon, 24 Jan 2022 12:57:22 +0000
To: samba-technical@lists.samba.org
Subject: Release Planning 4.16] Samba 4.16.0rc2
Message-ID: <f8131f1d-6185-a4a2-d2e7-1f67805790a9@samba.org>
Date: Mon, 24 Jan 2022 13:57:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Language: de-DE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.16.0rc2 is scheduled for Monday, February 7 2022.


https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.16
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team      https://samba.org
SerNet Samba Team               https://sernet.de

