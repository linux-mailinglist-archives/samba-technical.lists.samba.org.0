Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE92669498
	for <lists+samba-technical@lfdr.de>; Fri, 13 Jan 2023 11:47:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=au4xZ59YmWCcDgGztZiIVNk3Wwv+T2Z8PxFVc+PzCuI=; b=gGXptd4IHwtoU/KaF4p8wkdb/K
	MXODYjvXpODuWSGS/H3P+YMFsWpsG+ElP76wUtttdXJ1WMoQXO6i95fJiowiRDkTO/RR7FqHHx3yb
	TmT9mu+cEErfuEUTYVSOUr52p/dXtiOBthuUCUy/umdDOWuZuwXUqKzLDQOrwzSEHDvxsTn1OR3Pp
	TUQQOcaEVdmLkq+p8xVhD9Yw0wEvTT7ACS0hCickXBQIR+kFPqjpseNNnCt8n8R7u7Am3+Ag5TYLo
	EhjUaO8ndKV26smoPPwY1HsnlkZ9+JHzIK0z1xaeTTkm1SBqudoVa3BacY8OMDAk5Iv0n0kKAbpzZ
	fl12g2tw==;
Received: from ip6-localhost ([::1]:21652 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pGHaO-00GrZH-2x; Fri, 13 Jan 2023 10:47:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16066) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pGHaJ-00GrZ8-4w
 for samba-technical@lists.samba.org; Fri, 13 Jan 2023 10:46:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=4idhuV1k2KJOV0KOjUSJ1yQAfJ9iJVLEiGuzA8KbkbQ=; b=dTZHoHvCSeu2CPsNOjDfjc94GS
 GjGLLDPVvFGD0/JlzdvZRpj2ioAChrTjUYmxw6jkGZrZV+MSe9iwiYt/BCE/cTIx/rIt9XYBRThuN
 uksE3fgOO3mEk9J3ysG/L/iHRZLgIE1t2Mz9iApgNu9mrHgXTz9l571u6JAqYSLdzd9src89mXy2V
 VehZDjBEN44+VdsJ4UP4T3MJP1KRwVYcTbs2tS9t7TV7FkBOPvRcgJyr2p2MAjsFURRsreY/Hc6He
 TvFSDfGHksOQzC8cMwDBmqJ2wtQO/LbiI3/jFK33YOQa5ga5PrOavdXNu3AmhUme0d8nXRw3OYl7c
 Ux9fV9I6rxfL0y5tNItRYZvjDhk6dmaCUqG9DD/db0Sd0vJ9PghVQdqJKmBgz6olJnZ79fg1Rg0Kw
 /LQTvNFA0nWozE+7pJA5WOGpFz5ODyvK9/CJXtIkH7sKaF0L2MvOdSSULRPy53xhf94SYH6H3AhSX
 o+NyyccilE00Nab96hjEgN+f;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pGHaI-00839N-Ik
 for samba-technical@lists.samba.org; Fri, 13 Jan 2023 10:46:54 +0000
Message-ID: <8ce2af3a-b295-1f79-b524-33685ca95adc@samba.org>
Date: Fri, 13 Jan 2023 11:46:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: de-DE, en-US
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.18] Samba 4.18.0rc1
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

Samba 4.18.0rc1 is scheduled for Wednesday, January 18 2023.


https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.18
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Teamhttps://samba.org
SerNet Samba Teamhttps://sernet.de
