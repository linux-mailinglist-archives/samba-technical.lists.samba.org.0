Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1380C603B78
	for <lists+samba-technical@lfdr.de>; Wed, 19 Oct 2022 10:29:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=CVDETRc68jTeR83V9cjrqWSkhxoIDJBtglR+7sL3BXo=; b=wEIQLD9X7F3yQsNnN9pvc1V6fz
	1iwNchjKUZVIknM3aqampmy0uIl3/3U5rkWsM8wCJE6L2XN6GLzWSBr0Ui7tjXAgdmwEhZADmtr4V
	p/t8R/TZmM/9cha0lS7TcSFu9xbZdZTEnslajgNn0GzOZ5x0sAvhyt8z/h4urm4IyhiLWBoeaGbHu
	eV+2XYxB1j0qu5nFUBU51ZKfHCi08OlSQxX4WIpGD7P2v49Lqta5hXBa+xW1S37KEB2zAcwQ4PtCG
	Euej7PwF3OFIBJGLFCbN/TuyoOQwpI5xtK8eydc6tO3Kd5lVuneRaB+1oDJrTklPkts53tOvS9Xz+
	eXXyVy4g==;
Received: from ip6-localhost ([::1]:49428 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ol4Rj-003SOC-8X; Wed, 19 Oct 2022 08:29:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42120) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ol4Rc-003SNb-49; Wed, 19 Oct 2022 08:28:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Cc:To:From:Date:Message-ID;
 bh=CVDETRc68jTeR83V9cjrqWSkhxoIDJBtglR+7sL3BXo=; b=ql1T8DLq86Z2VSJIfLXPsfLOO3
 N6KAxsFuEp6jt47/fL4fKxClbgYxEOh4z2dqpQK/vralUWbn+Mxigre2Kd1jjiNYslRrLx7ZUfXsp
 oSTNLAjsKiMTuasyOU9L0z8o3whennq76f/uWgR36oBd4RWpDngeN/wbjQIAVNPGb+0yMcPyh9ap0
 uR2UgEISp5uSZ5yp6XjpRnNLIc5tmV9g146EmVdCNmKap94IKOijL6NDLkUL4Bi3r2KdjVY64RXTc
 QDTjcSC57eo0idjYUA0ckGLDrybalaGVijIPIFu38MDoI6ikGhuu631PBh/eIknM0+N3aCR7ik82L
 biWdcz9tZ0WBc4n2xpdL5w/yeh9842t986UoqzIFkU+8/YHxKbehfGdSnbxkBUByhJCG4LsQLQxMo
 hHuJwvh5w/IhP184+GBbM2+00OvBcJ/bSLrvhGMl+LMoei6dQYYMW/5IfkZdWjEnkKYjMg4KaQv1a
 vsZAq6UysgmxRtiNVx3O/ccA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ol4Rb-004qm2-HF; Wed, 19 Oct 2022 08:28:55 +0000
Message-ID: <c1276c62-82a8-9f76-15ee-1639d4ee4d30@samba.org>
Date: Wed, 19 Oct 2022 10:28:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Heads-up: Upcoming Samba security releases
Content-Language: de-DE
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

this is a heads-up that there will be Samba security updates for 4.15, 
4.16 and 4.17 on Tuesday, October  25 2022. Please make sure that your 
Samba servers will be updated soon after the release!

Impacted components:
  - AD DC (CVSS 5.9, Medium)
  - Fileserver (CVSS 5.4, Medium)


Cheers,
Jule Anger

-- 
Jule Anger
Release Manager Samba Teamhttps://samba.org  
SerNet Samba Teamhttps://sernet.de


