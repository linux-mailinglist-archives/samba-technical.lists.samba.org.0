Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CC38B5E5E
	for <lists+samba-technical@lfdr.de>; Mon, 29 Apr 2024 17:59:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=s27R8gwrFG/mrnaPBG3l6iIBcxLXDaNlWBez4h2TG2I=; b=rJNUGzt4gFn4Xn8b0wAVpNtPmS
	xkDJT8X0so/d3GJgcbb8APFBvVzZHAmS7yKoKHSehu6GDjl53CPlsqDhDELYYbDAs49pPYoSZB0X5
	u2YUV9qmf6jCpqYOLsVvBnQbQruunFJp7YID3JBF8nMaVe5OPt/0GBmAJ2UlQyzb8XHD7HsXsDa9J
	uM3hcuc6tP/kUGaj9n+L6RkrhH23XKDDVYqecn1pHJITZF6C/IDt6F41a99Ld5rspcbj8HWYBs9rO
	WzNf6hVN7WiO3FDgghIvNyHDyEYj4H3569bfU5N9+bOw9UJUAsP9jIFUtp6iTIFLKICpf+2APbztD
	R45SiA2Q==;
Received: from ip6-localhost ([::1]:57462 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s1TPx-0060uD-Bi; Mon, 29 Apr 2024 15:59:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15946) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1TPs-0060u6-JI
 for samba-technical@lists.samba.org; Mon, 29 Apr 2024 15:59:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=s27R8gwrFG/mrnaPBG3l6iIBcxLXDaNlWBez4h2TG2I=; b=NH9AuiYysQdWHIDbwlP8Mxs1g3
 zXIBcdIywG6ZioDfLu4m6k9vLi/i6/3Q2rIMbtB82yEtBNwfflIkUYiUgfl0w/WPIFQp+S8dmzJX8
 t+5lYbcEy3IT5B9Vk6ElWmxX6r9AFmZLa4ThS52Ppnmcow20MNqYI7dlpQ0zex9sKg36ibbDsYHFU
 7QokVJKBFAIzHx4xiaj9aAyulA1CkWi5tjH56pZa1Nsv+fDScNuyQgmmftx740bxWhv+GlZBaEDc1
 1wKfoiG9uSrbt/1ctS4NGFzAlxTm8tDKrZKr7MC0R1Yg4d1tYKH9h/b72BF1Ya5G2EuT9p5Mms/vo
 yXdJL/5GFZqjieymOh4SnlsDIvuldk1kkfs7/J5EWgu/0wFwFzxYNy0bEt0Tv4DwdNMn3fG+VO7t4
 pRPJ6BkJXvEtmgQTbIWi9cK9Azxrt5LVCx+zOs4nD2yN1lkZe1sT71VfDjr0flB3vUPI2/mTAmQj4
 GhneWm4lIOfsk7rTO1loFXAP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1TPr-008xOI-2a; Mon, 29 Apr 2024 15:59:43 +0000
Message-ID: <299cecfb-3084-42a4-99de-1970b1b6e2f8@samba.org>
Date: Mon, 29 Apr 2024 17:59:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: samba-gpoupdate
To: David Mulder <dmulder@suse.com>, Guenther Deschner <gd@samba.org>
References: <a41d2cce-e9d5-4322-80f1-e04aae0505c7@samba.org>
 <ca6277a8-4b77-4842-a18d-c10b1e93f810@suse.com>
 <8c63936e-3d09-402f-88e5-3115c32da7e6@samba.org>
Content-Language: en-US, de-DE
In-Reply-To: <8c63936e-3d09-402f-88e5-3115c32da7e6@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi David, hi Günther

is the code in source3/libgpo/gpext/ and libgpo/gpext/ still used or is everything python now?

Thanks!
metze


