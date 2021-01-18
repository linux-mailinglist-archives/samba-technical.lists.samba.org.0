Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C85192FA9A4
	for <lists+samba-technical@lfdr.de>; Mon, 18 Jan 2021 20:08:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=tgPq3ZjF8y8LGI0XsPj/9v/x8K672riaDsM1nEfkyDs=; b=0r3NDB4aELzQo5m7Q7IPqjIjVE
	ZdU7ehjKiBVBvP2ZFykztAX8hIt668UGvikAJwUKuPJ/MLdhNaYryalDCfQkTvhuVYfFWbHBRoJmh
	9JcAgH/wugUgUIcP5/X1SoyflPJve2+H+DJHQCP+wgyq4xYf/m7K1QAEgWDHWdgQIDt5Ynn+7ULdR
	9O++zHGXN6bDUbb2C7qIGW9NtelWjcRqSmfgi1WNZNleKuBpJf/0mhFKfjN1DQxwLhrVQHBJN2uV9
	EnId4Ze/RAnGk/m3ZUkrjbPSieHrmmc2JoB7BU5+sZS9vXGDdSI90tKW6IH3kxYdaxdXd6s5kBb7z
	rV3H7dXg==;
Received: from ip6-localhost ([::1]:55686 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l1Zt9-0065Gz-Bi; Mon, 18 Jan 2021 19:08:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41004) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l1Zt1-0065Gs-38
 for samba-technical@lists.samba.org; Mon, 18 Jan 2021 19:08:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=tgPq3ZjF8y8LGI0XsPj/9v/x8K672riaDsM1nEfkyDs=; b=dvyInNVl9cziwZa59gMpfQiXw4
 40hAczO1FCVS8aaASTtBWlwYTP+kUmyBOR6/dt1JFiGEJRKH2klEiHb9sl3UG/rKwmE3u/zBHr5b9
 QPrBjfpCxvL4Uxix/4Zljnv2RofQRFQtqZ1FNPcUpITEpk32pMWu3Lux1b7tU/BsTmRbSiD05NRK/
 BZOYYFDtyv7+DNyeFWXNZWRRzjaOIrzoBRTG/Z5jS/uTYKMBUUTqghnO+N8BbIgU6k1RCKmhtmGnv
 yom9yhBqZMhmSr3U1Q9GNBcyS33aaTNVZ7OiNsfmBx8hkyvaGg7TSYhXuSEjY0NiWZmd0WUKedQ71
 DKNE1FcXMOtBIBicFuN7TZVzF3CyERj6SZEMrVVNUR8f28ojKubhybmy3ejed3lynZ9p2CuJdH434
 lsDUqvlJ2LXK95VLISQjQHJej9kLZt+qBeBvk9v2D5RnRzHYLIJebCdin8G5j7sh3ldMUW5j0OG1l
 PdcmkiuS8f/ZGpDuMbTvlNzx;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l1Zsz-0005Dx-Cm
 for samba-technical@lists.samba.org; Mon, 18 Jan 2021 19:08:21 +0000
Subject: Re: printer driver type 4
To: samba-technical@lists.samba.org
References: <7781e141-42b9-17c6-278e-9094edf39ee0@kania-online.de>
 <16983374.jckQO7Hm9i@magrathea>
 <1e5edc1f-01be-fea0-d318-ae1ca770c0e3@kania-online.de>
 <814e3b19-2d7a-f5b7-91ab-047678e74139@samba.org>
 <a9b63088-2f93-af5e-440d-25d13d2088f4@kania-online.de>
Message-ID: <998e297f-dc67-0dbd-4227-b6c68697afd9@samba.org>
Date: Mon, 18 Jan 2021 19:08:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <a9b63088-2f93-af5e-440d-25d13d2088f4@kania-online.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 18/01/2021 19:05, Stefan Kania via samba-technical wrote:
>
> Am 18.01.21 um 19:25 schrieb Rowland penny via samba-technical:
>> Can someone give it a good kick (or whatever is needed)
> Have you try turn it off and on again *ggg*

A) This is not Windows

B) You are nearer than myself, so you try 😂

Rowland



