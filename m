Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C42E47AFE4A
	for <lists+samba-technical@lfdr.de>; Wed, 27 Sep 2023 10:26:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=kZialFshpnGiQJuZFZrddtpxz97zkmsNPgfmE6BgQ30=; b=AGeRb1ztDE9Kugr3pY9qGP9Vgx
	kMLMLndOqie6iLo73y3n3CBzwjb9OlCQmfjJoNkjsgAqg8ChaFoRHJdqxkK2fQo0PNyoJwJhaZLrc
	4mQ1/Rl6MsfNWZNDavYQ8gWn5/m4b1IBGQUmKltiJaGnWmFITOACxPvF9eCyYgdXMYsESoDniGvxY
	7pJHA/OS2JWIK9D2xGYq/GuTgxh+bMwRtMsolQPJSBEbzKYDALcJep0Bf29cYECua8h/yQUnQAefr
	eqSbDhd8EU7L44YUtqYieyg7LkNWgBzkASrob0MBMTLVFpF9GJw6GIb/YGHf7t6gMXULmFaSB1p5U
	jp25NY1g==;
Received: from ip6-localhost ([::1]:58984 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qlPs2-006Yc8-VP; Wed, 27 Sep 2023 08:26:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33786) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qlPrs-006Ybc-MD
 for samba-technical@lists.samba.org; Wed, 27 Sep 2023 08:26:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=kZialFshpnGiQJuZFZrddtpxz97zkmsNPgfmE6BgQ30=; b=eulCbRpDNkVyWJGhOhbwk+o0QE
 l19IHEst/3LLVLQCjzuPILWKBce95AO/5q/V9Dnnl49F5nQNCqAIhGzps3FpAOijdeC1YhtwSFls1
 F+Yc5u2B59pniCtHzL0qAKL+gZ9YE3G1mNOYf3tP8Y9F+v4hAuXErl/ncivWmGcC8DxnsrUJjYOyn
 65OIxP6u0i1NYA+ttvObxRg9jWDjgdlaYAbRaX8Fy2EGPg9ndIXOBXz3pGTmx/pN6TOZRuK0CizRq
 yjOhllFSoXYBdtAQzLbV6fT4jcsrb1W0Tslzq0jVw84sN9wzQlWJq0RZTvbZalQxQIhHqRyNnOlhT
 JMmGI6MBIJg5PGCsScGcgx6ch1XvvZEFfAb4R6P+fB1/uv8swdGapl2YsErGgiCoVxaq2fXUWZhMI
 jtbt+P9JzNJ/ARxTqyMB1/vBVi7xKaVC+h/zRMF5Xgm1W4nvdaeaL0bpKLVRJb33SMg6QJEqyPuq7
 7T1N8DmsFWJPbwcnhLoWmxwX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qlPrs-00FbFH-1b for samba-technical@lists.samba.org;
 Wed, 27 Sep 2023 08:26:00 +0000
Message-ID: <3279e516-1755-8336-3ff8-0f8016b13d13@samba.org>
Date: Wed, 27 Sep 2023 10:26:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.18] Samba 4.18.8
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

Samba 4.18.8 is scheduled for Wednesday, November 29 2023.


https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.18
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


