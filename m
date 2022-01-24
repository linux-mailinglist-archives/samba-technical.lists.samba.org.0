Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D8972498134
	for <lists+samba-technical@lfdr.de>; Mon, 24 Jan 2022 14:33:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=xmsmpbtaTnysQgZdHEPiOLQVrsfBRRLqfUhKFsgPqU4=; b=I53Ke4hqZMnawWje3sYEKU4skm
	uiM8xMrZPBF/gxz5m/SfYqXoOTJqcALbkw69+XPxAryP2pOynFV90WJPTf39iWUZscoeXXtxXCGiq
	KVPlGrzmEWDbGARD6oSNKmBNxhV2PnKRVRHKRYIhYiXdVqgNjgQ8FTy8sDHz2t10TW+kPoAth0UGt
	yUu9jp1a+vc+eNdklEPx4ypK/tPR1EAqDe6MfX04dCXTUvv6NLedqVnabp9NNOglJhYagtvQJKNwo
	esjmMSi9X/8TlZuzCuXuysc6Jm/04srOY38pEDzDO/3flNRiGJUkv95FjLYDLRd3eKV/MnjqJAbp8
	3oujnTkA==;
Received: from ip6-localhost ([::1]:46688 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nBzTD-000HY2-VD; Mon, 24 Jan 2022 13:33:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48220) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nBzT3-000HXO-A7; Mon, 24 Jan 2022 13:33:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:Cc:To:From;
 bh=xmsmpbtaTnysQgZdHEPiOLQVrsfBRRLqfUhKFsgPqU4=; b=Sk0S/NLzsg4i8/7bzoSiVwVBv+
 Ztv0uHzuEkDB5FJnzb+nYwJIT4UZcZa6Cl8keBr69AvjsnjGjKGDaM5Kn+eSmqIZYP8pb1DgeUkgj
 CSmNBJnwvxQGPvXmwWUYbe4tGjzXAYNku3NCR/g/0pU2q8TOXE9OlPkSqkoLbYmf7CnC0U4yJO8qx
 ENqhWi/zlc082K2JVR5FWquPgNJIFEA+EQbN1IhcXDmkWhVIOWg3o0f5cZ7qW1KpZCyFA/jrK2EEY
 eWB2wv096uMTYgbrOVC6VLgHokoLzP+NfatxvagUkDdvaHbidCwwXptn4JcdNZtq+E/9wtEqUBok6
 QcPdAoFvp8nL9i89F2MLb+e0ZblYJ8HxewUMifOomZtRrj088zTq3AqAQYARj/a13HyAVZXgm6fvz
 wkQdMr9cGwylY9whs2eO0QbZQKzc8IEnO9UqcqE4CZ2C4wB3a+Y7sTWGeALzJG5tjTVgi4dZP1Rhr
 r2ZvQSK+PZSa75lXnyslqrrE;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nBzT2-000KDu-PG; Mon, 24 Jan 2022 13:33:08 +0000
Subject: Heads-up: Upcoming Samba security releases
To: samba-announce@lists.samba.org
Message-ID: <2db9ca74-047c-5d98-af70-ae2427f220e0@samba.org>
Date: Mon, 24 Jan 2022 14:33:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
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
Cc: samba@lists.samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

this is a heads-up that there will be Samba security updates for 4.13 , 
4.14 and 4.15 on Monday, January 31 2022. Please make sure that your 
Samba servers will be updated soon after the release!

Impacted components:
  - File server (CVSS 4.2, Medium)
  - AD DC (CVSS 8.8, High)
  - VFS Modules (CVSS 9.9, Critical)

Cheers,
Jule Anger

-- 
Jule Anger
Release Manager Samba Team      https://samba.org
SerNet Samba Team               https://sernet.de


