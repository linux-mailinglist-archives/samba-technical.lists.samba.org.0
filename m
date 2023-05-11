Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7536FECBD
	for <lists+samba-technical@lfdr.de>; Thu, 11 May 2023 09:26:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=bHdVX6sb32xTV/T3+ATLzZIm23GnDgirvkw0K+6e+i8=; b=etmXOHR3ZPoVHhreMdTjAp0kUV
	TfggdIrESDlbxdJ26Ya32Q4kwvgcELzoiO7LJaofyiXcwH2v2W6koEEZsxrv3TFVkM+SOqt4n4RSX
	zOf4Sd/+u6BebVqI9zsMc+AplGpTdm/ZADaskbs1RsKUHd0Ewb1LUNSXGXbz+U/mtj+C4uXbMW8Ng
	J+G3vD4Key5vfwNX4ZZEbf94s6RWIcNkrQY5MpXLaVk1AduzAKVQhVpzpUHQIEEqUuCuppiubGc+U
	9aW5vN1T66Nw+AioQy8k/It2Bnaxn7tpz6MFopqGFJxKu4uQPRMAAjo+uynX3zszhMpCsbK1CQj1v
	Pn7vAI+A==;
Received: from ip6-localhost ([::1]:35224 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1px0gX-009TM1-JV; Thu, 11 May 2023 07:25:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59492) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1px0gD-009TGP-9U
 for samba-technical@lists.samba.org; Thu, 11 May 2023 07:25:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=J7V6ahl+CwcjwWwL/macYh7SILCrjuMHfLH67JJgSHA=; b=Lvlpm7BavF+jREZ+Wi+sN+zUOe
 F4ob2xQOlx7uCnnTzL60fw/ImK0helWHcn3zdRgOAIaFJKokDnXNH+jzSTN9zF5HNc2xXknReTyDt
 bcMR+AQVpPqg921xkWx0EkN1IIw5XpTHzhG2Psl1Hw9wtULEklBXIki2ajqFjxjxZOpdvX6GX4iHp
 L/P5IeqmuTq4qgWQ90rCOuqwCdTa61Kuzg96w+D5/AFR99/05SYJBCjwr0VsZegA5wy0wHfyGSnnS
 qjmfnyj8O8UGrI9iT0jcyG7jWN0c3/Y2t8Wuv/NVs935k41YuNA0aLHvx5IB4wvsuIlWHc2D0L74e
 k7SNFNgxj5c4BBZh1V+e7ShueSQzNA7DaYZIh4jB90jEThu1LE3urBhoehwJWDNguCzc504YHq+XH
 WtCP4Ss8nUTGdEdcxWzQHc7kW1mS9qh1lIm2ScqbPfEPdlm42j4toSo+jWY5qZKMhlT8eS0zQgjRo
 7onkuq8CugVHloMT9Izxa9Hq;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1px0g3-007RSb-CT
 for samba-technical@lists.samba.org; Thu, 11 May 2023 07:25:28 +0000
Message-ID: <c75e3ff4-86a7-5156-0533-d314cb949373@samba.org>
Date: Thu, 11 May 2023 09:25:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.17] Samba 4.17.9
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

Samba 4.17.9 is scheduled for Thursday, July 13 2023.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.17
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Teamhttps://samba.org
SerNet Samba Teamhttps://sernet.de
