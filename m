Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E82B26532
	for <lists+samba-technical@lfdr.de>; Thu, 14 Aug 2025 14:16:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=DHkM27+T53cJy0V7nKdR0rzqMjnO2eBhPJs/VUhwDdg=; b=0bYyRX6sYlWpLxcU299Pj+dp6n
	XYcKA0LIgiYnv5GWI4e1uJGbxVXv/hIP/EuawOmcmU/IhUMCoCvxH3JMfiweJ1QznHI0lXdLjLWJu
	CdJI9pkDU5Mdax9YmahWrpNGnV8BFqhi3G7wERVRdtwrTmYID4WQIJV1g1zfoNHbMpBxFrqfMnqYD
	goEE6ZlmrQHoqxswWGoTkQOpy0QEZRrVL/oBgn3c2/9alRN/gZzSqB1OUQq7FRPPtWfpdwpKs4kGp
	SKhgyKe6wAgbLD56X0rUyUIeYl3G9kHLoCcZWrZEATgg6s10/TcdkQdFtgJzVASkJF8pyU0Q9MVRL
	Zl5HCfrg==;
Received: from ip6-localhost ([::1]:42678 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1umWs0-00F0nT-7C; Thu, 14 Aug 2025 12:15:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39394) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1umWru-00F0nL-Nr
 for samba-technical@lists.samba.org; Thu, 14 Aug 2025 12:15:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=To:From:Date:Message-ID:CC;
 bh=DHkM27+T53cJy0V7nKdR0rzqMjnO2eBhPJs/VUhwDdg=; b=UOgbSOqVQ+UfFIEgnd+DIS0ews
 pLXIhIA7Hvcad6Vuc72uh4t2GWetIHq5NCwfRYyuT9BHGvycZYHddTt0ZCUHXg7D95xZJqeoy26yB
 KhoxjmTfNXgJES23LsW6MH5q3bLk8ghaG26ZEe3M76SuHoHgdNawKMsYYGt2crNb+ifAm9i7kRQCf
 BUQzBYuV6SzcWD6jQv5wYaNT8H8MkuPvSFo/rwaowFvkQt5ydoYvtDqPkk64Aqv0VW84jhiz0jRsD
 XmLDMEGeZLM/f2JLWNrAVrFrsYFdz7j9hFw6Yz5DF3BzIeqE/f/ZWCmKANUdBCijVXzhRrGTPlcKc
 RLLiSe/RZfvNznwj46vU4fjJyJ7jHBebXp//sVilDEujQIhdduSjPr9hLkw9Gf74D1mpgpD5uemKA
 Sx43JKabTs8XqlDpS3rxL1g39xnW4GRjBcPQCLKjKAU5d8W7x2dAYt73KwV7j4kTk6v8dUU/Iii0s
 1rpgTCdv/dVhU3TexnHL687g;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1umWru-002o8Y-0M for samba-technical@lists.samba.org;
 Thu, 14 Aug 2025 12:15:42 +0000
Message-ID: <5dc99de3-b794-4c97-8321-474b415662f6@samba.org>
Date: Thu, 14 Aug 2025 14:15:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Release Planning 4.23] Samba 4.23.0rc2
To: samba-technical@lists.samba.org
References: <bb3a06b5-0ec5-4c97-b276-3acd6a85caa5@samba.org>
Content-Language: de-DE, en-US
In-Reply-To: <bb3a06b5-0ec5-4c97-b276-3acd6a85caa5@samba.org>
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

since no bug fixes have been added since 4.23.0rc1, the 4.23.0rc2 
release will be postponed until next week, Thursday, August 21.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.23
has been updated accordingly.


Jule


Am 07.08.25 um 17:32 schrieb Jule Anger:
> Hi,
>
> Samba 4.23.0rc2 is scheduled for Thursday, August 14 2025.
>
> https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.23
> has been updated accordingly.
>
>
> Jule
>

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


