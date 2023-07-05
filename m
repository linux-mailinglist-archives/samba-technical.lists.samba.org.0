Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BC27074831C
	for <lists+samba-technical@lfdr.de>; Wed,  5 Jul 2023 13:44:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=yUFfsH1hOXIEg/7Y1vC7g3niaViJiH0nuxNczQItpH0=; b=XfW2qdcHeqPmKarDeLFL2woUt+
	FDRhz1FacGolqFpD8tFLzAJ6EvArLYDk0QxW9RmLbgexxSDOzElsliH+ULMgq4LB+u4cR+9ZsrkZf
	3DKPhkGYOz0nQOdol7Co+f8lr01uddpgzfQdzcKRYUtcizMqtoGGQU+lYflbO01tQ7/06/AUmNjPo
	IVZ13MrCijGLImCsgnt+56bTuXeHn/5WBtULoyR4LoTTCCjmm/5t2fa13W0Jf0/GsD9c4PIJ4EfhV
	tVEzQC2rs8h9UmEz/fWDxfxD7FZlBTFfIK47JUHX1KvFvPSa8efiSGS9HOYqvuGPsAgGMBSN80/yK
	CIx52Ojw==;
Received: from ip6-localhost ([::1]:26136 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qH0vH-000HsM-V9; Wed, 05 Jul 2023 11:43:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19204) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qH0vC-000HsD-7h
 for samba-technical@lists.samba.org; Wed, 05 Jul 2023 11:43:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=yUFfsH1hOXIEg/7Y1vC7g3niaViJiH0nuxNczQItpH0=; b=dyjL7PvT4cO7geSjRfxCDYhyox
 bO3003IX0thLKpCg6qUaPdOaGQcXfQTGpSEKQAlpSa3VzVC+2rJKIXT6iAYtDmVFTBn16pj8tINQ0
 6ST5v7DA6ZLbWbsrRjZPUpsQQRFZvNd343qRCjuPhcmweEjYYp937HDWtCwVY37Rgi80RpLgRRqFS
 vGrCmmncM6fTpEEBpr6omUvgoWXRx/88gzCwBIwQUVE5xuHNbKr1P7uof9SImB6XvKVQXjatI5kac
 eX2HnwsvxbnureNab6sRsFr0TDa2SX/1H+OAXmnloZ6nOyH3Q/NGq0jvlGA3gQlo4FjEMU43JoZt+
 AtP98CkfIEtBOHkPYgrLmtNRXOYNMjNZvIn0k+5HEc/SCmQN5N41hoj5DztiZJevFYh2gF8mGr8ZF
 24yy4cWsLIl7sCHM9MjsDwBQCbdqblwvQ+iK9oNJ0Rmw8merHPt8EbqbXleJW87Pi4xGWBVwWeLyD
 rZULR5PplLLN2iV/UGsms07A;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qH0vB-000EGb-2H for samba-technical@lists.samba.org;
 Wed, 05 Jul 2023 11:43:45 +0000
Message-ID: <09aaec5b-2eb0-deb5-1e11-ec0e5b0ce689@samba.org>
Date: Wed, 5 Jul 2023 13:43:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.18] Samba 4.18.5
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

Samba 4.18.5 is scheduled for Wednesday, August 16 2023.


https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.18
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


