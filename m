Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 398227B718D
	for <lists+samba-technical@lfdr.de>; Tue,  3 Oct 2023 21:10:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=pgVkAKfK5yo6jrq/bVXIN/SRFkmrei7KBX5ijsxTR54=; b=Uy8yz9KHRfcOTQu4PyKvK9m6M/
	xZCrtAgO2k/j4QcRHWyPdB8GmO17WStSSVN/ClMcrXnGlZlN7ygY8hxEJEQRQHZTWzvvP/3v3XXft
	bgYT3a0VJFL3k3/xKm1pAF63xvyR7yDjQAopzKS8+ZLA7D67gNQyw42l6FAsJOIvBudNaxkBq2KoY
	bYKDzJjDC+SpO8gNbX/j15sNYhDLF7gxeYDCeN4bU7MDjOb2FG8lIh9mrrXLTeFG2qUfgQWBrtMC8
	owx+Hvs26xxWP3HRmnqlr6bgu0krvNhlkPTSHRQFQIc0Pd2gkRQnMAd8aC3kwOq3WrAejvWolYjCm
	NYFl1wBg==;
Received: from ip6-localhost ([::1]:22568 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qnkmH-000Ena-EK; Tue, 03 Oct 2023 19:09:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35742) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qnkmA-000En8-NW; Tue, 03 Oct 2023 19:09:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Cc:To:From:Date:Message-ID;
 bh=pgVkAKfK5yo6jrq/bVXIN/SRFkmrei7KBX5ijsxTR54=; b=Xc0C3WU6CiJ/v47G4rqgsnfTSo
 VbbBgjBBXcAnWKadS9gX/ioaODmpMg8Tbg72euz+8NcaYi4xlz4UhIR3WeeOpvgmThws4aWQSee/L
 56XYGhgakkGi06vl/zjjNCJkYloNEf5gV6p+kdpkvqyvOKia2QDJXRe5oumVww0d+Y+fdBMGO4EJd
 vByY6L5B33QTtGRaGd/DjuinjqoUDatTB4xVTC1hNtVD2X1RebERwnUxVBQWmATYEvLdNN8nd7XUw
 qqHTXz4Hg1HFaexM/Ez5g8wDmxNx5nON+N2M0aJ9/Ln1RhtKKMX8fY/aBIacMa1Sn9O9P6Y8IyZQ8
 p0Jm8B4MLiqnIf0QVHnCXINASOrthK4shUp99bfoAUWi2ESFfgy9kAh4/+q8I7oKx5fHpqnFLjmXz
 ywmdOYCR1CKsdvzHEudLcrhkI7Z6zUDRh2Lwm+VwxVR533An5k184NJiUHQV+ygKqwiztIUZzV7Tq
 tQon9ci3ntr0jG43JbIJ7WRt;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qnkm8-00GXf1-2j; Tue, 03 Oct 2023 19:09:44 +0000
Message-ID: <f7db1531-3bfb-8ccf-8d25-90b375504d07@samba.org>
Date: Tue, 3 Oct 2023 21:09:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: de-DE
Subject: Heads-up: Upcoming Samba security releases
To: samba-announce@lists.samba.org
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Cc: samba@lists.samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

this is a heads-up that there will be Samba security updates for 4.17, 
4.18 and 4.19 on Tuesday October 10 2023. Please make sure that your 
Samba servers will be updated soon after the release!

Impacted component:
  - Fileserver (CVSS 6.5, Medium)
  - DCE-RPCs and pipes (CVSS 6.8, Medium)
  - AD DC (CVSS 7.5, High; CVSS 6.5, Medium, and CVSS 6.5, Medium)


Jule Anger

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


