Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C618C9D28ED
	for <lists+samba-technical@lfdr.de>; Tue, 19 Nov 2024 16:02:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=pW/PKxdwC6UpzLztUREOgeERW29/B52C7awv2Zy3OQU=; b=oukqDAKvubQmHxBETPuR6noWeq
	xUVSgdQcrvCptfPzXHp70cTf1NAKb7Cp2AHv30W4/loV2+lY+78cQ0BQGG4nUBSjRUPmJWVpEx6Aw
	gydpUuteh1JCI6eJAcE9vFfURk0jQCK8/SncFEVQtFf/Eomr5Xis0v9UGKWBxjJ9GQxNPW/LHktUp
	VMpZpP6xZevRJvM4Ku1lvHNZISKtebo9giq8ph+nk23x4CNE/o6NI7uJl03Sf+JoAQJK+ti1PqoQs
	3jyvCwda1mvbyRiRnIzdGTSoxpuYLxliydzHClo6FNjDAXE6Kzl5rpr85BJX+YErzTVSCX4fxY2TW
	Ec5OKHNw==;
Received: from ip6-localhost ([::1]:48778 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tDPkE-000FFU-6F; Tue, 19 Nov 2024 15:02:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56084) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tDPjx-000FEX-CG
 for samba-technical@lists.samba.org; Tue, 19 Nov 2024 15:02:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=pW/PKxdwC6UpzLztUREOgeERW29/B52C7awv2Zy3OQU=; b=SJTLCZun+GFl/lAL+/NUn9Yjmq
 BKQJV/hgkSi39g1S/BCGk8aM4Z1mXa8JfqUu1WdEvLd0Dv3itHQULWtpc4LbUuA9/X2imjez7v/vK
 YDkIEeExpy9UzHFB08iqKRGsO6Iwu7U+NUnJTP4kHxUSPiC2hJncRBtW4K1jWyfzctBV1sFqoOrKb
 GXa7du6D53N3EYz2ZDVzI9WTSTbl8g9p4TQ2Qwsg62N5e2yTbQXVRDFWGDR1pJAMu05ateOKeZIdj
 iA8rCSfGYLMQTrXlbKEwPhaCWidrT9fc4emPBhSXcOiq6LwdRfbBwZ5N7W/oUfRFZSVlgUi/wN3jm
 UjrKqURj+UBHpnGb2Z3W+oGnk1TEfhmODuJ0/kCHbP3BMJOUPhZ+7fgwa4gq7c/QFsw6CyTvchw78
 E06EiREGlftJcbQeyZqTuxRYgqEYpmL/KotROpKyF40C+nuAkM0PhjJB9jWf55DCOB5KMPUC8eKj9
 Q2hJHvo3ACoxzJGpj3qJqBVL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tDPjw-000W46-2a for samba-technical@lists.samba.org;
 Tue, 19 Nov 2024 15:02:04 +0000
Message-ID: <31089a68-8b0c-4df8-be39-40ab708c4ab7@samba.org>
Date: Tue, 19 Nov 2024 16:02:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE, en-US
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.20] Samba 4.20.7
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

Samba 4.20.7 is scheduled for Tuesday, January 21 2025.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.20
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


