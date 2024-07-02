Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 487069238BA
	for <lists+samba-technical@lfdr.de>; Tue,  2 Jul 2024 10:48:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=dwed57eW9ZUVwDeM7bPoihVOGTRdC5eIRNOU28VkiYI=; b=ImiAl32czveadNMWwFbbPq74nM
	DlI2kiAOAaiageL1RgLG1w4KzOwGF91zmKQucG3gGjMIhsP+yYF+lL6mddlEzwqOH1ZoBIjQxpok3
	xN54IMv/R6xGqSYRjegrEJHz+WqGP+eQjF6W/nFL0oQ+2BQY7IXM70n203NkVob4USew1o6PtAywB
	GSzcTRx9USR3mXTWbLweMtipDHEfHuIeNTXWaJFXQaDsK8IZCWfKUj6AkHu37ZyPyP4OT7wStyFTQ
	AN/Aw9PTlUfNKz03xSEheSERj3zOutJF6eRUQpVbjrA8cgjPtxpOACMBgmtZWBW+wCsNmoL+qwAVZ
	qQHleHuQ==;
Received: from ip6-localhost ([::1]:26500 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sOZBL-0033un-AI; Tue, 02 Jul 2024 08:48:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56746) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sOZBC-0033uI-GB
 for samba-technical@lists.samba.org; Tue, 02 Jul 2024 08:48:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=dwed57eW9ZUVwDeM7bPoihVOGTRdC5eIRNOU28VkiYI=; b=gTzWi03QzuF6cwwYNfwX/WLLTx
 N6WY0DhjuKpAf59Y8objF7u8rNpwH9qHDkPFwulaosPvgJFsbESR6LnytyCweLr++lRB1rJBkzMjx
 /0TYnhGFjOMnpJ0LfTTRJ1f28mNZVzgmH4OFFBtq0rOjT2NSG/Hkr5R9Cux6YtgclMNtbHRMA1U//
 1/ghWpwT/CEga6YlCKX4nHYDy+WwDc4PlhCfUVLL+r5tOYS/W3yHbE3G0S3wpVXMOQlU0yJo85E9W
 4gBTxYZEiPMhSDAk5NPZ5+ooM9/0kXtScI9DwMhhq3CBI9ODsTcmIIVi5OLZ/6mjdKAmzO5gRxjO7
 ppa8tw/J5xpPdwdpfVQkogT0wANZKWDtund3TtS02yT/RfQ+mheDO3QdJkUs23mBI7KBqQ4cFjnhi
 amcd/QBwwTk2bYO2pty1EA3ZgfKnoS5JiMZAu4FisrJvOzy9hNCmAkwcpooz1GTNBUsU41nfgcG88
 7OwM/sEDh/qGQOGB8aK0jhRY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sOZBA-0020Rx-1Z for samba-technical@lists.samba.org;
 Tue, 02 Jul 2024 08:48:01 +0000
Message-ID: <04685481-5185-49a9-9865-64bf34a926e3@samba.org>
Date: Tue, 2 Jul 2024 10:47:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.21] Samba 4.21.0rc1
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

Samba 4.21.0rc1 is scheduled for Monday, July 29 2024.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.21
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


