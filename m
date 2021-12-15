Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E4689475BB3
	for <lists+samba-technical@lfdr.de>; Wed, 15 Dec 2021 16:18:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=WV/ya5wu7qn4q10IUiFExIfp0vGY5AYreW7hx6gaw1A=; b=zvykbZ0c2nTO8WCscfHOngNC0R
	F6HHZ+xI0os6DGs3fiM1ceLLdttG10dyWp/GcpTh/ONe3g2LXs8RqtvOCxQoCKjPA/Acb+88LntTd
	reDUfK6q0oBLMcpHzZNlwyX6mzX5Ex1Q2dLebeqKwBGEjDAJVwpvq3Rxz1derDEt65d+rtgpzlCj7
	Z8y2GkpkfUs6qJfHjbpEo3zLYMw9FNKB2GGnLUAa2ohlDE22OXT3p9JWesg3h17O7ZTEEi7BKO+TQ
	kz24jeNyaRqE++VbEUIsPpiBBJ2txHJBNGHP94tlDrWfTk0q8Emo11FWvP8mL8lV8W3jOdfhF6JlJ
	9l/AkYuQ==;
Received: from ip6-localhost ([::1]:41096 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mxW34-000lAb-PH; Wed, 15 Dec 2021 15:18:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54550) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mxW30-000lAR-8I
 for samba-technical@lists.samba.org; Wed, 15 Dec 2021 15:18:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:To:From:CC;
 bh=WV/ya5wu7qn4q10IUiFExIfp0vGY5AYreW7hx6gaw1A=; b=Zeens0Hiik+Klc/uG22NOrrOeg
 OVM9N32biSFH3DpbGnkgXo4D+e2+V0yQXxRbELS4Je7dggDookd+enFr6McZiLTtCY/jHhfFGj6f6
 nhyKDH/6a8lSn8dnAtuR1clapifJMaGuWEga1DezNKlYbSNFiBu+8mkR+TmXl41iUVYz+Jw9JD3lz
 H/vcduJ+aTK2z82BWRF5+wvK/gCYx23JRT6CWp2afLE23fl4qAaPrjDxKuCthQfuAiMah6RJHfauZ
 MU8NSuhVe/ypVkFfKc0vmwz8Z0SEADMp3cukmwM0EU8RB39gNHYKbE1R4IZj6ZdES5MTazYvKBGQj
 ReENgkOd4yoJhjfyA+OisUdnLQCbrkMURD7UXRiqlpxkUjzRGfHbhm6Y4xxbkwg3SNTvWz0jnNsWX
 lkFZkD+bPaOBEjc9y2VjpuOEFOIHV5AqNbUoUrlsxLlToyrJmwhHQqvTTSRcvF1hU7Dqui2MocKOD
 rCjdmFOiRK6J5HrYR62ZWfcg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mxW2z-00316h-JR
 for samba-technical@lists.samba.org; Wed, 15 Dec 2021 15:18:25 +0000
Subject: [Release Planning 4.14 and 4.13] Samba 4.14.12
To: samba-technical@lists.samba.org
Message-ID: <fd350ce2-8084-858f-fc6f-76d697c8d411@samba.org>
Date: Wed, 15 Dec 2021 16:18:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

because of some regressions in the last security releases the 4.14.11 
release was brought forward to today.
Samba 4.14.12 is now scheduled for Wednesday, February 16 2021.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.14
has been updated accordingly.


Also, because of these regressions, an unscheduled release for 4.13 was 
made today.


Best,
Jule

-- 
Jule Anger
Release Manager Samba Team      https://samba.org
SerNet Samba Team               https://sernet.de


