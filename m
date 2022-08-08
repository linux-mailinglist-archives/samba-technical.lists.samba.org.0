Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F25C858CB08
	for <lists+samba-technical@lfdr.de>; Mon,  8 Aug 2022 17:10:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=tHj15jGlIci1UUychQ8Ip4sQ2spRfxfID7aPOb6tXJE=; b=V9NVM2xCIXoeWk/O8x21UKKD6t
	gwS1vrJ03mgH1pOWYmGVZ+jaTcojpyhjtYBkeO9xEVUhclYnbTk6NEiP4YRWrDEi6x/wZ/56qMTEy
	bCp13gNrWvvNZTgGdYR6jkkHeGctDUYVkWppFWfDGONuP4o2Mt2ZvVie6aITUV9z0SYNCbPNqi4Ia
	2JQjDsf6fyVIUVU7IPbrNZanwBIYaXOdtu2ozvUVRTb3VIP82bzB93MmzVPwDJq8RNHAvPPbbOjip
	RuK4xzlMXehNbMLfnB77O3zA3P9SkfzIHSCvJ62OU37ydF1QzjnAQnNCpYC0s4ifIq3g6TfPJE9MW
	6cvB68qg==;
Received: from ip6-localhost ([::1]:63068 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oL4OL-006ACF-TJ; Mon, 08 Aug 2022 15:10:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43890) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oL4OH-006AC6-8a
 for samba-technical@lists.samba.org; Mon, 08 Aug 2022 15:10:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=okEkrULFsFLkgkJ9nQu1yNDE6JAabANew/PcD9/howk=; b=n6EebVqDa+u5lNdpbAs0UKcedX
 YwvVQk1CZ91pWrsxmYylsJSRKTh12nJDAFfsxg3AhuU1lP3qbQimUraLJH0ejNsoqf4lnD8FtIJzL
 ng+m+TxfCfmWl0eQ6cUUTHo45pBZq9L5ZligEyIW/RNZn74v2sFAvOxZReVU7KG63fPxaHGapW10V
 5ygVDJYiRGTDu3Znovq5iDJZpV600MVOulmFl8+sSvqkmA2Su4YI/IKapRiTHlYiKmq69RiKEXVX/
 J5SuEy9M7LYlay28t1iuy4HbbvoYY8ucrCN1Z7nH3WoiVcWbmBe9IQLUYeJ6zFfRZTfLDkvv+zGrW
 6vmzVR8Q/D9/Qiwh/3U/WqvMCMJpHMaevK2Ckhzzl0FCGelgMAPmakyyPXURgg0tNYJaZi+iMs+0H
 lTo6pdGje54LTEhIIhL6ZzHYLNk/HkYbm9elxmmae/I+zpsH6hquxWprg8p11r1Oollr216hDi7Fk
 +QrlvSZnC9ZTfNriNEn4R2ll;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oL4OG-008hMP-PJ
 for samba-technical@lists.samba.org; Mon, 08 Aug 2022 15:10:00 +0000
Message-ID: <e283154e-55f4-5576-0914-c9d73271d1de@samba.org>
Date: Mon, 8 Aug 2022 17:10:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.17] Samba 4.17.0rc2
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Samba 4.17.0rc2 is scheduled for Tuesday, August 16 2022.


https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.17
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Teamhttps://samba.org  
SerNet Samba Teamhttps://sernet.de
