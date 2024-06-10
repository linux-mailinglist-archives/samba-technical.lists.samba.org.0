Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D2B9025E4
	for <lists+samba-technical@lfdr.de>; Mon, 10 Jun 2024 17:45:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=QkQQqek4SqiPogya+azcCGMEWExf8EZC5VOMNQucsVg=; b=vvvxVKkjCCGsGJmN/HpJQPHqBN
	J7DvRjoxPUE9UZrjTbNbHjuLeKehgOrl1+3E6Hjv6HjpOZVF9i7frPoHvKsICgLeBX1R0/oYpEh2h
	nYTQCrlhpdiC+1fQjuVbfr5n0fEUwjQAlRnZkyF7/b66fo4RtMJSsSLYYhyQ3JnpJNDJUkdLjw+Q+
	eLySa51PiazmAvYzwxD64tdqpvK5FwiK01WpnTjoFWCV9Zz3RnkEZjxqcQUK8r9DPKyrykajA6RLo
	/c0Yqe5F3IQT9IGPQJ9ao1QGML3Kwd22ugmxM4DfCvP4fUFe+DmK1bpfGPHJqqNeizANFhH8AG3pB
	SpRartow==;
Received: from ip6-localhost ([::1]:58752 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sGhCV-00DNoa-Jn; Mon, 10 Jun 2024 15:44:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36544) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sGhCO-00DNny-H4
 for samba-technical@lists.samba.org; Mon, 10 Jun 2024 15:44:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=QkQQqek4SqiPogya+azcCGMEWExf8EZC5VOMNQucsVg=; b=MqLdpC+7OZ/anKT/U9tC51fm5i
 uGrJkjU+bTHpcZm0SHg0j7+qMChhUCu8L1kfmb5d4Sw1tHYjWC0vOgSct0xnCy9lDGZtItn235GoA
 cDOee4mTPwqKaCUckb2SRSLbe+HgfL1nIelHUIIDDoUKDkzVOwJqqBljDOCd3daY9Kxjsw9crdlKM
 W3Ych9A9Ox2p4AfpvkUkU25G4ncaYSLMkgJh5cFDsC4WNNjvP+zbmJiKioZ92eCK6hHCvDw/em1h6
 nAsPRVctZYGfKmK2kl2JqyVjSlMBpz512Q4I/8uxvtbxyZWUoswrbe3uBa/EXjdgfiWnH0s19c4ig
 /yNzxcRyde8gmm7TIl790c/Ta2bjZp4MyZrXEduzvGM6tob6ro7s8AvWbAjHIwCdcvoz85H2mGIc1
 Kxz0oswC6pVDRkzcolfqpJtc4dV+66iyrnD+2AfvKC0wiJ23a6Q4R2Z+2NwI2v5IIhbMv224M6eXq
 QnE2ibiOFL5uas8pxIFu/Lx4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sGhCO-00FzVU-0e for samba-technical@lists.samba.org;
 Mon, 10 Jun 2024 15:44:44 +0000
Message-ID: <d980bea9-5040-4b8f-97e9-3261f7ed7751@samba.org>
Date: Mon, 10 Jun 2024 17:44:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.19] Samba 4.19.8
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

Samba 4.19.8 is scheduled for Monday, August 12 2024.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.19
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


