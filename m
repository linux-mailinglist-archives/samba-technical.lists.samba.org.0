Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B305963B5
	for <lists+samba-technical@lfdr.de>; Tue, 16 Aug 2022 22:28:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=dWnVl5unCyBb25ZAm2OLUiqxBsfdWdCFYCRVX8vo+jI=; b=YFaUpFT8PG+V2v07SWPattj4/x
	Vv27R9TvSwlRf5wquUdLLJs3qIwOSrMtOz2DSK+afu+mnt0cVbsgPwaJySs0yNaemKwrQtie0HCvz
	J5rWlwBuihNwk+OAwLvBC//0kgNrs0pMWWOwcl9yjJAuWksQJVIoxvMkK2SOmicTDF74pzuyxyRAn
	75RwtigLBAiz7QMf4yyHecFSq/dBYciCrA9iF9vys+gKSTnJ1OPRNUhGuQPrgMCPn6YwQ19zTqvE3
	wa9phTWuiU8PghGyCJAA0bEe3Z/VexHvMhWwJG+cME5UgJDdsRZGJjWd0Zd49dKEPU3tdHeVbdjBz
	8DYNs3Rg==;
Received: from ip6-localhost ([::1]:61554 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oO3AE-000Fzr-HV; Tue, 16 Aug 2022 20:27:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15000) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oO3A4-000Fyx-G2
 for samba-technical@lists.samba.org; Tue, 16 Aug 2022 20:27:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=411/vcZN3r41kvrjvWtjrQt3zHtesSVZTq2/5zgmytI=; b=ZZz5bf81uzgxWmc4x8U4M4z+u0
 1QMui8Dtzbjw2UVkuputGeY38coKw4qKQq4BXW4GRLrrk0vpq8Y1VSrBT6nvkxC8W2zBKwxgt5oIg
 pp6DZcL1CEueIpvWC5Kucl7SsncApcpuql8WZv80J8nEsJ2HnKrDJQ3nLXUpcIvBYnwQsylhnmxx+
 wUEW0cks4se+p44zyvuTy7oeCEdMExHe76ubxaBh8xbAmks8xem8HmjyBW3WrAm5a33bTruttioLR
 19lGpaavvX+lUTNVBIA0fvcW2Rhqm/Xjg+vG30Dwmdn30CwE+P6WayzefmI6fLY+26iC8bPYfr03w
 daake9DrnXTlP5PecBdNRyC/adOZfWPHWcQ3SIfTvx3D///njtLmPCXroa69+CyXRByl+Kgtc0Ss+
 21hPqOkqIrjXWLsBKBBKKa8tiBRofarp5o0ElpxjVJqArbLZqgcvpNL3RTuyMgflTzG2ou6fxvBu3
 k/evrQ8TY5sfDJxwOdEIIfQQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oO3A4-000RJt-7g
 for samba-technical@lists.samba.org; Tue, 16 Aug 2022 20:27:40 +0000
Message-ID: <6e54e638-1e2c-102e-df41-c40477fcb3a8@samba.org>
Date: Tue, 16 Aug 2022 22:27:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.17] Samba 4.17.0rc3
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

Samba 4.17.0rc3 is scheduled for Tuesday, August 23 2022.


https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.17
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Teamhttps://samba.org  
SerNet Samba Teamhttps://sernet.de
